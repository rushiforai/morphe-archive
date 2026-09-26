package app.morphe.ather;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * Brings the ride service back after a reboot, so a ride taken before the app is next opened is
 * still recorded as its own session.
 */
public final class RideBootReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            if (intent != null && Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
                RideService.apply(context);
            }
        } catch (Throwable t) {
            // Nothing to do: the service is started again when the app is opened.
        }
    }
}
