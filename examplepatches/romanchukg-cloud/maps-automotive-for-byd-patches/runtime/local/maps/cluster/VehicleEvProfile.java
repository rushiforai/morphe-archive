// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.*;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;

/** Explicit local owner profile. Capacity and connector compatibility are never measured. */
final class VehicleEvProfile {
    private static final String PREFS="local_vehicle_ev_profile";
    private static final int VERSION=3;
    static final class Profile {
        final String model,connector;final int capacityWh;final VehiclePowertrain powertrain;final boolean typeConfirmed,confirmedBev,enabled;final long epoch;
        /** Legacy callers explicitly supplied a CCS2 BEV profile. */
        Profile(String model,int wh,String connector,boolean enabled,long epoch){this(model,wh,connector,true,enabled,epoch);}
        Profile(String model,int wh,String connector,boolean confirmedBev,boolean enabled,long epoch){
            this(model,wh,connector,confirmedBev?VehiclePowertrain.BEV:VehiclePowertrain.UNKNOWN,confirmedBev,enabled,epoch);
        }
        Profile(String model,int wh,String connector,VehiclePowertrain powertrain,boolean typeConfirmed,boolean enabled,long epoch){
            this.model=validModel(model);
            if(powertrain==null||powertrain==VehiclePowertrain.UNKNOWN&&typeConfirmed)throw new IllegalArgumentException("Select and confirm a known vehicle type");
            this.powertrain=powertrain;this.typeConfirmed=typeConfirmed;this.confirmedBev=typeConfirmed&&powertrain==VehiclePowertrain.BEV;
            VehicleEvConnection connection=VehicleEvConnection.get(connector);
            if(wh<0||wh>300000||(wh>0&&wh<1000)||this.confirmedBev&&wh<1000)
                throw new IllegalArgumentException("Set a battery capacity between 1 and 300 kWh and a supported connection");
            if(typeConfirmed&&(connection==null||!connection.supportsIdentity(powertrain)))throw new IllegalArgumentException(powertrain==VehiclePowertrain.HEV?"Select no external charging for an HEV":"Select the charging connections actually supported by your vehicle");
            capacityWh=wh;this.enabled=this.confirmedBev&&enabled;this.epoch=epoch;
            this.connector=typeConfirmed?connector:VehicleEvConnection.UNKNOWN;
        }
        boolean hasIdentity(){VehicleEvConnection connection=VehicleEvConnection.get(connector);return typeConfirmed&&connection!=null&&connection.supportsIdentity(powertrain);}
        String summary(){
            String name=model.isEmpty()?"Vehicle":model;
            if(!typeConfirmed)return name+" · Vehicle type not confirmed · battery route data off";
            if(powertrain!=VehiclePowertrain.BEV)return name+" · "+powertrain.name()+" · "+(capacityWh==0?"Battery capacity not set":String.format(java.util.Locale.US,"%.1f kWh",capacityWh/1000.0))+" · "+VehicleEvConnection.get(connector).label+" · EV energy routing off";
            return name+" · "+String.format(java.util.Locale.US,"%.1f kWh",capacityWh/1000.0)+" · "+VehicleEvConnection.get(connector).label;
        }
    }
    static String validModel(String value){
        if(value==null||value.length()>80)throw new IllegalArgumentException("Vehicle name must be at most 80 characters");
        for(int i=0;i<value.length();i++)if(Character.isISOControl(value.charAt(i)))throw new IllegalArgumentException("Vehicle name cannot contain control characters");
        return value.trim();
    }
    /** Bounds are checked before conversion, so very large inputs cannot wrap into a valid Wh. */
    static int capacityWh(String value,boolean required){
        String text=value==null?"":value.trim();if(text.isEmpty()&&!required)return 0;
        final double kwh;
        try{kwh=Double.parseDouble(text.replace(',','.'));}catch(RuntimeException invalid){throw new IllegalArgumentException("Enter a battery capacity between 1 and 300 kWh");}
        if(!Double.isFinite(kwh)||kwh<1||kwh>300)throw new IllegalArgumentException("Enter a battery capacity between 1 and 300 kWh");
        return (int)Math.round(kwh*1000);
    }
    private static volatile Profile current;
    private static volatile long epoch;
    private static final Object GUARD=new Object(),WRITES=new Object();
    private static boolean pending,earlyInitialized,hintAllowed;
    static Profile current(){return current;}
    static long epoch(){return epoch;}
    /** A legacy patch-time hint is allowed only for explicitly observed fresh preferences. */
    static boolean buildHintAllowed(){synchronized(GUARD){return earlyInitialized&&!pending&&hintAllowed;}}
    /** Fast revocation at the UI request, before queuing any disk work. */
    static long invalidate(){synchronized(GUARD){++epoch;pending=true;hintAllowed=false;current=null;return epoch;}}
    /** Small stored preferences only, before Maps constructs/caches native vehicle identity.
     * This bootstrap never reads assets, vehicle providers, files or accounts explicitly.
     * Android may load the small preferences file; no native callback performs this work.
     */
    static void initializeEarly(Context c){
        if(c==null)return;
        final long token;synchronized(GUARD){if(earlyInitialized)return;earlyInitialized=true;hintAllowed=false;if(pending)return;token=epoch;}
        try{
            SharedPreferences p=c.getSharedPreferences(PREFS,Context.MODE_PRIVATE);boolean configured=p.getBoolean("configured",false);
            Profile value=stored(p,token);
            synchronized(GUARD){if(epoch==token&&!pending){current=value;hintAllowed=!configured&&value==null;}}
        }catch(RuntimeException invalid){synchronized(GUARD){if(epoch==token&&!pending){current=null;hintAllowed=false;}}}
    }
    private static Profile stored(SharedPreferences p,long token){
        if(!p.getBoolean("configured",false))return null;
        int version=p.getInt("profile_version",1);
        String model=p.getString("model","");int wh=p.getInt("capacity_wh",0);boolean enabled=p.getBoolean("routing_enabled",false);
        if(version==1){
            String connector=p.getString("station_connector","");
            if(!"CCS2".equals(connector))throw new IllegalArgumentException("Unknown legacy vehicle connector");
            return new Profile(model,wh,"CCS2",true,enabled,token);
        }
        if(version==2)return new Profile(model,wh,p.getString("connection_mode",VehicleEvConnection.UNKNOWN),p.getBoolean("confirmed_bev",false),enabled,token);
        if(version!=VERSION)throw new IllegalArgumentException("Unknown vehicle profile version");
        return new Profile(model,wh,p.getString("connection_mode",VehicleEvConnection.UNKNOWN),VehiclePowertrain.valueOf(p.getString("powertrain","UNKNOWN")),p.getBoolean("type_confirmed",false),enabled,token);
    }
    /** Worker-only full load; optional private legacy seed stays outside early bootstrap. */
    static void load(Context c)throws Exception{
        final long token;synchronized(GUARD){if(pending)return;token=epoch;}
        SharedPreferences p;Profile value;
        try{
            p=c.getSharedPreferences(PREFS,Context.MODE_PRIVATE);
            if(p.getBoolean("configured",false))synchronized(GUARD){hintAllowed=false;}
            value=stored(p,token);
        }catch(RuntimeException invalid){synchronized(GUARD){if(epoch==token&&!pending){current=null;hintAllowed=false;}}throw invalid;}
        if(value==null){
            try(InputStream in=c.getAssets().open("local/vehicle-profile.json");ByteArrayOutputStream out=new ByteArrayOutputStream()){
                byte[] bytes=new byte[1024];int n;while((n=in.read(bytes))!=-1){if(out.size()+n>4096)throw new IOException("Profile too large");out.write(bytes,0,n);}
                JSONObject seed=new JSONObject(new String(out.toByteArray(),StandardCharsets.UTF_8));
                // Only the historical, explicitly CCS2 seed format is recognized.
                String connector=seed.getString("station_connector");if(!"CCS2".equals(connector))throw new IllegalArgumentException("Unknown seed connector");
                save(c,seed.getString("model"),seed.getInt("capacity_wh"),connector,true,seed.getBoolean("routing_enabled"),token);return;
            }catch(FileNotFoundException absent){synchronized(GUARD){if(epoch==token&&!pending)current=null;}return;}
            catch(Exception invalid){synchronized(GUARD){if(epoch==token&&!pending){current=null;hintAllowed=false;}}throw invalid;}
        }
        synchronized(GUARD){if(epoch==token&&!pending)current=value;}
    }
    static boolean save(Context c,String model,int wh,String connector,boolean enabled,long expectedEpoch)throws Exception{
        return save(c,model,wh,connector,true,enabled,expectedEpoch);
    }
    /** The token belongs to the UI request, never to the eventual worker start. */
    static boolean save(Context c,String model,int wh,String connector,boolean confirmedBev,boolean enabled,long expectedEpoch)throws Exception{
        return save(c,model,wh,connector,confirmedBev?VehiclePowertrain.BEV:VehiclePowertrain.UNKNOWN,confirmedBev,enabled,expectedEpoch);
    }
    static boolean save(Context c,String model,int wh,String connector,VehiclePowertrain powertrain,boolean typeConfirmed,boolean enabled,long expectedEpoch)throws Exception{
        synchronized(GUARD){hintAllowed=false;}
        Profile value=new Profile(model,wh,connector,powertrain,typeConfirmed,enabled,expectedEpoch);
        synchronized(WRITES){
            synchronized(GUARD){if(epoch!=expectedEpoch)return false;}
            SharedPreferences preferences=c.getSharedPreferences(PREFS,Context.MODE_PRIVATE);
            synchronized(GUARD){if(epoch!=expectedEpoch)return false;}
            if(!preferences.edit().putBoolean("configured",true).putInt("profile_version",VERSION).putString("model",value.model)
                .putInt("capacity_wh",value.capacityWh).putString("connection_mode",value.connector).putString("station_connector",value.connector)
                .putString("powertrain",value.powertrain.name()).putBoolean("type_confirmed",value.typeConfirmed)
                .putBoolean("confirmed_bev",value.confirmedBev).putBoolean("routing_enabled",value.enabled).commit())throw new IOException("Profile not saved");
            synchronized(GUARD){if(epoch!=expectedEpoch)return false;current=value;pending=false;return true;}
        }
    }
}
