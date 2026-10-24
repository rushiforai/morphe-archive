/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hxreborn.extension.internetspeedmeter;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public final class NetworkAvailableReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        SmartNotification.onNetworkAvailable(context);
    }

}
