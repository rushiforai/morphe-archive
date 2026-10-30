// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.content.*;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;

/** Narrow read-snapshot ingress. It never forwards a command to the car. */
public final class VehicleSampleProvider extends ContentProvider {
    public boolean onCreate(){VehicleEvBridge.attach(getContext());return true;}
    public Bundle call(String method,String arg,Bundle extras){
        // ContentProvider.call does not itself enforce per-call read/write permissions.
        boolean permission=getContext().checkCallingPermission(android.Manifest.permission.DUMP)==PackageManager.PERMISSION_GRANTED;
        if(!VehicleReadingRules.trustedSender(Binder.getCallingUid(),permission))throw new SecurityException("Authorized ADB shell required");
        long identity=Binder.clearCallingIdentity();
        try{
            Bundle result=new Bundle();
            if("begin".equals(method))VehicleDataStore.begin(getContext(),arg);
            else if("renew".equals(method))VehicleDataStore.renew(getContext(),arg);
            else if("sample".equals(method)){
                org.json.JSONObject sample=VehicleSampleCodec.sample(arg);
                if(sample.getInt("schema")==2){
                    org.json.JSONObject source=sample.getJSONObject("source"),settings=VehicleReaderSettings.view(getContext());
                    if(source.getLong("generation")!=settings.getLong("generation")||!source.getString("mode").equals(settings.getString("mode")))throw new IllegalArgumentException("Reader setting changed");
                    if("confirmed".equals(source.getString("confidence"))&&!source.getString("selection").equals(settings.getString("confirmed_selection")))throw new IllegalArgumentException("Reader confirmation changed");
                }
                VehicleDataStore.receive(getContext(),sample.toString());
            }
            else if("reader_options".equals(method))result.putString("options",VehicleReaderSettings.options(getContext(),arg).toString());
            else if("reader_cache".equals(method))VehicleReaderSettings.cache(getContext(),arg);
            else if("end".equals(method))VehicleDataStore.end(getContext(),arg);
            else if("status".equals(method)&&arg==null)result.putString("status",VehicleDataStore.status(getContext()).toString());
            else throw new IllegalArgumentException("Unsupported vehicle method");
            result.putBoolean("accepted",true);return result;
        }catch(Exception e){throw new IllegalArgumentException("Vehicle reader request rejected: "+e.getClass().getSimpleName());}
        finally{Binder.restoreCallingIdentity(identity);}
    }
    public Cursor query(Uri u,String[] p,String s,String[] a,String o){throw new UnsupportedOperationException();}
    public String getType(Uri u){return null;}
    public Uri insert(Uri u,ContentValues v){throw new UnsupportedOperationException();}
    public int delete(Uri u,String s,String[] a){throw new UnsupportedOperationException();}
    public int update(Uri u,ContentValues v,String s,String[] a){throw new UnsupportedOperationException();}
}
