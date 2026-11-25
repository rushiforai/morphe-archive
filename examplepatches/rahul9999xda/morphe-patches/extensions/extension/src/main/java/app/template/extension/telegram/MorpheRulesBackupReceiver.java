package app.template.extension.telegram;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public final class MorpheRulesBackupReceiver extends BroadcastReceiver {
    public static final String ACTION_DAILY = "app.template.extension.telegram.DAILY_RULE_BACKUP";
    @Override public void onReceive(Context context, Intent intent) {
        if (intent == null) return;
        String action = intent.getAction();
        if (ACTION_DAILY.equals(action)) {
            MorpheRulesBackup.runDaily(context);
        }
    }
}
