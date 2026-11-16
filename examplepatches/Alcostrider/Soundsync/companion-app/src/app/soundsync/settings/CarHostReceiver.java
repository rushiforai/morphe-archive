package app.soundsync.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * DriveDeck (or another car app) says a car session started or ended. Only changes whether
 * "Only while connected to Android Auto" counts as connected; anyone sending it can at most
 * switch the delay on or off.
 */
public class CarHostReceiver extends BroadcastReceiver {
    static final String ACTION = "app.soundsync.action.CAR_HOST";

    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent == null || !ACTION.equals(intent.getAction())) return;
        String host = intent.getStringExtra("host");
        if (host == null || host.trim().isEmpty()) host = "Car app";
        if (host.length() > 40) host = host.substring(0, 40);
        Settings.setCarHost(context, intent.getBooleanExtra("connected", false), host);
    }
}
