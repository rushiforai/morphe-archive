package io.github.emotionbug.patches.runtime;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.telephony.TelephonyManager;

/** The protected broadcast is only a wakeup signal; never trust its state extras. */
public final class SummaryPhoneReceiver extends BroadcastReceiver {
    @Override public void onReceive(Context context, Intent intent) {
        if (!TelephonyManager.ACTION_PHONE_STATE_CHANGED.equals(intent.getAction())) return;
        PendingResult pending = goAsync();
        new Thread(() -> {
            try {
                if (RecorderBootstrap.readCallState(context) == StartupPermissionPolicy.CallState.IDLE
                        && SummaryModel.available(context)) SummaryScheduler.schedule(context);
            } catch (RuntimeException | LinkageError ignored) {
                // Only optional work is deferred; no telephony operation is issued.
            } finally { pending.finish(); }
        }, "EBPatcher-summary-idle").start();
    }
}
