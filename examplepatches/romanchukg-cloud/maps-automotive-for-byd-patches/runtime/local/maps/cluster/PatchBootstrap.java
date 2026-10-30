// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;
import android.app.Application;
import android.content.Context;
/** Startup hooks for the clean AAOS input; no account provider or signature proxy. */
public final class PatchBootstrap {
    public static void attach(Context context){
        long at=android.os.SystemClock.uptimeMillis();
        try{VehicleEvProfile.initializeEarly(context);VehicleEvBridge.initializeIdentity();MainUiScale.init(context);MicrogProvider.attach(context);MicrogWakeup.early(context);Navatars.installEarly(context);}
        finally{android.util.Log.i("MapsNavStartup","bootstrapAttach ms="+(android.os.SystemClock.uptimeMillis()-at));}
    }
    public static void install(Application app){
        if(!app.getPackageName().equals(Application.getProcessName()))return;
        MicrogProvider.install(app);
        MicrogWakeup.install(app);
        VehicleEvBridge.attach(app);
        ClusterHost.install(app);
        WheelServiceSetup.init(app);
    }
}
