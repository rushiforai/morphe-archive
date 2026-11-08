package dev.jason.gboardpatches.extension.wisprflow;

import android.app.Activity;
import android.app.BroadcastOptions;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class WisprFlowRuntime {
    public static final String PACKAGE = "com.wispr.flowapp";
    public static final String ACTION = "dev.freeteaspoon.wisprflow.KEYBOARD_COMMAND";
    private static boolean busy;

    private WisprFlowRuntime() {}

    public static void activate(Context context) {
        send(context, "toggle");
    }

    public static void send(Context context, String command) {
        if (context == null || busy) return;
        if (Build.VERSION.SDK_INT < 34) {
            message(context, R.string.gboard_wispr_flow_android_required);
            return;
        }
        busy = true;
        try {
            // Sharing the real sending UID lets the Wispr bridge accept only the current IME.
            Bundle options = BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle();
            context.sendOrderedBroadcast(new Intent(ACTION).setPackage(PACKAGE)
                            .putExtra("command", command), null, options,
                    new BroadcastReceiver() {
                        @Override public void onReceive(Context owner, Intent intent) {
                            busy = false;
                            if (getResultCode() != Activity.RESULT_OK) {
                                message(context, R.string.gboard_wispr_flow_bridge_unavailable);
                            } else if (!"toggle".equals(command)) {
                                message(context, R.string.gboard_wispr_flow_mode_updated);
                            }
                        }
                    }, new Handler(Looper.getMainLooper()), Activity.RESULT_CANCELED, null, null);
        } catch (RuntimeException failure) {
            busy = false;
            message(context, R.string.gboard_wispr_flow_bridge_unavailable);
        }
    }

    private static void message(Context context, int resource) {
        Toast.makeText(context, GboardSettingsText.get(context, resource), Toast.LENGTH_LONG).show();
    }
}
