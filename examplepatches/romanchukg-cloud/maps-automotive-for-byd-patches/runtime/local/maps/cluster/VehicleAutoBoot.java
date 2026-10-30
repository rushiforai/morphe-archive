// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/** Queues opt-in checks only; a boot broadcast never authorizes an ADB key. */
public final class VehicleAutoBoot extends BroadcastReceiver {
    @Override public void onReceive(Context context,Intent intent){
        if(context==null||intent==null)return;
        String action=intent.getAction();
        if(!Intent.ACTION_BOOT_COMPLETED.equals(action)&&!Intent.ACTION_MY_PACKAGE_REPLACED.equals(action))return;
        try{VehicleAutoReader.trigger(context,false);}
        catch(RuntimeException failure){Log.w("MapsVehicleAuto","Startup request unavailable: "+failure.getClass().getSimpleName());}
    }
}
