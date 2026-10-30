// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.os.*;
import java.lang.reflect.*;
import java.util.*;
import org.json.*;

/** Narrow Binder adapter: firmware-selected read-only getters, always shell UID2000. */
final class VehicleBinderReader {
    private static String session,contextKey;
    private static JSONObject options;
    private static VehicleFirmwarePlan.Selection selection;
    private VehicleBinderReader(){}
    static synchronized JSONObject read(String currentSession)throws Exception{
        if(android.os.Process.myUid()!=2000)throw new SecurityException("ADB shell reader required");
        String ro=property("ro.car.protocol"),sys=property("sys.car.protocol");
        String protocol=VehicleFirmwarePlan.protocol(ro,sys),firmware=VehicleSampleCodec.digest(Build.FINGERPRINT==null?"unknown-firmware":Build.FINGERPRINT);
        if(!currentSession.equals(session)||options==null){
            options=VehicleShellSampler.options(new JSONObject().put("session",currentSession).put("firmware",firmware).put("protocol",protocol));
            VehicleSampleCodec.keys(options,"mode","generation","confirmed_selection","cache");
            Object confirmed=options.get("confirmed_selection");
            if(!(options.get("mode") instanceof String)||!(confirmed instanceof String)||!((String)confirmed).matches("|[a-f0-9]{64}")||!(options.get("cache") instanceof JSONObject))throw new IllegalArgumentException("Invalid reader settings");
            session=currentSession;selection=null;contextKey=null;
        }
        String mode=options.getString("mode");if(!"auto".equals(mode)&&!"legacy".equals(mode))throw new IllegalArgumentException("Invalid reader mode");
        long generation=VehicleSampleCodec.integer(options,"generation");
        VehicleFirmwarePlan.Context source=new VehicleFirmwarePlan.Context(firmware,ro,sys,Build.VERSION.SDK_INT,"legacy".equals(mode)?VehicleFirmwarePlan.Mode.LEGACY:VehicleFirmwarePlan.Mode.AUTO,generation);
        String key=VehicleFirmwarePlan.contextKey(source);if(!key.equals(contextKey)){selection=null;contextKey=key;}
        // Unknown AUTO protocol must not even acquire autoservice. Legacy is an explicit opt-in.
        IBinder binder=source.mode==VehicleFirmwarePlan.Mode.AUTO&&"UNKNOWN".equals(protocol)?null:service();
        VehicleFirmwarePlan.Getter getter=address->read(binder,address);
        VehicleFirmwarePlan.Catalog catalog=source.mode==VehicleFirmwarePlan.Mode.LEGACY?VehicleFirmwarePlan.Catalog.reflect(VehicleBinderReader.class.getClassLoader()):new VehicleFirmwarePlan.Catalog(Collections.emptyMap());
        if(selection==null){
            JSONObject cached=options.getJSONObject("cache");
            try{selection=restore(source,catalog,cached);}catch(Exception badCache){selection=null;}
            if(selection==null)selection=VehicleFirmwarePlan.select(source,catalog,getter);
            // Keep only winning addresses. A missing service at boot is retried next time.
            if(!selection.addresses.isEmpty())try{VehicleShellSampler.cache(new JSONObject().put("session",currentSession).put("generation",generation).put("cache",cache(selection)));}catch(Exception noCache){}
        }
        VehicleFirmwarePlan.Selection current=selection;
        long captured=SystemClock.elapsedRealtime();
        Map<String,VehicleFirmwarePlan.Reading> readings=VehicleFirmwarePlan.read(current,getter,options.optString("confirmed_selection",""));
        JSONObject values=new JSONObject();
        for(String field:VehicleFirmwarePlan.FIELDS){VehicleFirmwarePlan.Reading value=readings.get(field);JSONObject row=new JSONObject().put("status",value.status);if(value.raw!=null)row.put("raw",value.raw);values.put(field,row);}
        String confidence=confidence(current,options.optString("confirmed_selection",""));
        JSONObject provenance=new JSONObject().put("firmware",firmware).put("mode",mode).put("generation",generation).put("selection",current.hash).put("confidence",confidence)
            .put("identity",VehicleSampleCodec.digest(firmware+"\n"+protocol+"\n"+mode+"\n"+generation+"\n"+current.hash));
        JSONObject packet=new JSONObject().put("schema",2).put("session",currentSession).put("uid",2000).put("protocol",protocol).put("captured_elapsed_ms",captured).put("source",provenance).put("values",values);
        if(source.mode==VehicleFirmwarePlan.Mode.LEGACY&&current.addresses.isEmpty())selection=null;
        return VehicleSampleCodec.sample(packet.toString());
    }
    private static String confidence(VehicleFirmwarePlan.Selection s,String confirmed){
        if(s.addresses.isEmpty())return "unsupported";
        boolean candidate=false;
        for(String field:new String[]{"soc","range"}){VehicleFirmwarePlan.Address a=s.addresses.get(field);if(a!=null&&a.confidence()==VehicleFirmwarePlan.Confidence.NEEDS_CONFIRMATION)candidate=true;}
        if(candidate)return s.hash.equals(confirmed)?"confirmed":"candidate";
        return s.context.mode==VehicleFirmwarePlan.Mode.AUTO?"documented":"firmware";
    }
    private static IBinder service(){
        try{IBinder binder=(IBinder)Class.forName("android.os.ServiceManager").getMethod("getService",String.class).invoke(null,"autoservice");return binder!=null&&binder.isBinderAlive()?binder:null;}catch(Exception unavailable){return null;}
    }
    private static String property(String key){try{return (String)Class.forName("android.os.SystemProperties").getMethod("get",String.class).invoke(null,key);}catch(Exception denied){return "";}}
    private static VehicleFirmwarePlan.Reading read(IBinder binder,VehicleFirmwarePlan.Address address){
        if(binder==null)return VehicleFirmwarePlan.Reading.unavailable("error");
        Parcel request=Parcel.obtain(),reply=Parcel.obtain();
        try{
            request.writeInterfaceToken("android.gui.BYDAutoServer");request.writeInt(address.device);request.writeInt(address.fid);
            if(!binder.transact(address.transaction,request,reply,0)||reply.dataSize()<4)return VehicleFirmwarePlan.Reading.unavailable("error");
            int status=reply.readInt();if(status==-2147482644)return VehicleFirmwarePlan.Reading.unavailable("denied");
            if(status!=0||reply.dataAvail()!=4)return VehicleFirmwarePlan.Reading.unavailable("error");
            double raw=address.transaction==7?reply.readFloat():reply.readInt();return Double.isFinite(raw)?VehicleFirmwarePlan.Reading.value(raw):VehicleFirmwarePlan.Reading.unavailable("unknown");
        }catch(SecurityException denied){return VehicleFirmwarePlan.Reading.unavailable("denied");}
        catch(Exception unavailable){return VehicleFirmwarePlan.Reading.unavailable("error");}
        finally{reply.recycle();request.recycle();}
    }
    static JSONObject cache(VehicleFirmwarePlan.Selection s)throws Exception{
        JSONArray addresses=new JSONArray();for(VehicleFirmwarePlan.Address a:s.addresses.values())addresses.put(new JSONObject().put("field",a.field).put("tx",a.transaction).put("device",a.device).put("fid",a.fid).put("origin",origin(a.origin)));
        return new JSONObject().put("firmware",s.context.firmware).put("protocol",s.context.protocol).put("mode",s.context.mode==VehicleFirmwarePlan.Mode.AUTO?"auto":"legacy").put("selection",s.hash).put("addresses",addresses);
    }
    private static VehicleFirmwarePlan.Selection restore(VehicleFirmwarePlan.Context source,VehicleFirmwarePlan.Catalog catalog,JSONObject cache)throws Exception{
        VehicleSampleCodec.keys(cache,"firmware","protocol","mode","selection","addresses");String expectedMode=source.mode==VehicleFirmwarePlan.Mode.AUTO?"auto":"legacy";
        if(!source.firmware.equals(cache.getString("firmware"))||!source.protocol.equals(cache.getString("protocol"))||!expectedMode.equals(cache.getString("mode")))throw new IllegalArgumentException("Stale addresses");
        JSONArray rows=cache.getJSONArray("addresses");if(rows.length()>VehicleFirmwarePlan.FIELDS.size())throw new IllegalArgumentException();List<VehicleFirmwarePlan.Address> saved=new ArrayList<>();
        for(int i=0;i<rows.length();i++){JSONObject a=rows.getJSONObject(i);VehicleSampleCodec.keys(a,"field","tx","device","fid","origin");saved.add(new VehicleFirmwarePlan.Address(a.getString("field"),exactInt(a,"tx"),exactInt(a,"device"),exactInt(a,"fid"),origin(a.getString("origin"),source)));}
        VehicleFirmwarePlan.Selection selected=VehicleFirmwarePlan.restore(source,catalog,VehicleFirmwarePlan.contextKey(source),saved);if(!selected.hash.equals(cache.getString("selection")))throw new IllegalArgumentException("Address identity mismatch");return selected;
    }
    private static int exactInt(JSONObject object,String key)throws Exception{long value=VehicleSampleCodec.integer(object,key);if(value>Integer.MAX_VALUE)throw new IllegalArgumentException("Invalid address number");return (int)value;}
    private static String origin(VehicleFirmwarePlan.Origin origin){switch(origin){case AUTO_CAN:case AUTO_CANFD:return "documented";case FIRMWARE:return "firmware";case CONTROLLER_13:return "controller13";default:return "canfd-fallback";}}
    private static VehicleFirmwarePlan.Origin origin(String name,VehicleFirmwarePlan.Context c){switch(name){case "documented":return "CAN".equals(c.protocol)?VehicleFirmwarePlan.Origin.AUTO_CAN:VehicleFirmwarePlan.Origin.AUTO_CANFD;case "firmware":return VehicleFirmwarePlan.Origin.FIRMWARE;case "controller13":return VehicleFirmwarePlan.Origin.CONTROLLER_13;case "canfd-fallback":return VehicleFirmwarePlan.Origin.CANFD_FALLBACK;default:throw new IllegalArgumentException("Unknown origin");}}
}
