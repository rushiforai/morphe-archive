package com.stremio.morphe;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public final class AccountSlotReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        if (context == null || intent == null) return;
        String action = intent.getAction();
        if ("com.stremio.morphe.GET_ACCOUNT_SLOT".equals(action)) {
            String slot = MorpheIsolation.activeSlot(context, "account_a");
            setResultData(slot);
            Log.i("MorpheAccounts", slot);
            return;
        }
        if ("com.stremio.morphe.SET_ACCOUNT_SLOT".equals(action)) {
            setResultData("use_profile_chooser");
            Log.w("MorpheAccounts",
                    "Direct account mutation is disabled; use ProfileChooserActivity");
        }
    }
}
