package xyz.urro.activityspoof;
import android.content.*;
/** Invoked only with an app-owned immutable recovery PendingIntent. */
public final class RecoveryReceiver extends BroadcastReceiver {
 public void onReceive(Context c,Intent intent){ReceiverRuntime.init(c);ReceiverRuntime.restore(intent.getBundleExtra("subscription"));}
}
