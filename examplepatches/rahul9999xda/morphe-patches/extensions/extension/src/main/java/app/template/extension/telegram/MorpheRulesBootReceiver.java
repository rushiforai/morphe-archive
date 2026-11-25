package app.template.extension.telegram;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** Reschedules the app-private daily snapshot alarm after device reboot. */
public final class MorpheRulesBootReceiver extends BroadcastReceiver {
    @Override public void onReceive(Context context, Intent intent) {
        if (intent != null && Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
            MorpheRulesBackup.schedule(context);
        }
    }
}
