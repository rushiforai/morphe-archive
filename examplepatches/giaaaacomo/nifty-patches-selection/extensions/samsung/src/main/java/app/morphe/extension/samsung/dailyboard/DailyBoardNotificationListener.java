/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.service.notification.NotificationListenerService;

public final class DailyBoardNotificationListener extends NotificationListenerService {
    @Override
    public void onListenerConnected() {
        MediaSessionPatch.onNotificationListenerConnected();
    }

    @Override
    public void onListenerDisconnected() {
        MediaSessionPatch.onNotificationListenerDisconnected(this);
    }
}
