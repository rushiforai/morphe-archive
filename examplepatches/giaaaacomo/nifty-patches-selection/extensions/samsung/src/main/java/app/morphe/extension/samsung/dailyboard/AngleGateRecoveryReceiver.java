/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public final class AngleGateRecoveryReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        DreamSettingsPatch.recoverIfSuspended(context);
    }
}
