package local.maps.cluster;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** Non-exported callback target for our explicit PackageInstaller PendingIntent. */
public final class UpdateResultReceiver extends BroadcastReceiver {
    public void onReceive(Context context,Intent intent){
        PendingResult pending=goAsync();
        try{AppUpdater.result(context,intent,pending::finish);}catch(RuntimeException e){pending.finish();}
    }
}
