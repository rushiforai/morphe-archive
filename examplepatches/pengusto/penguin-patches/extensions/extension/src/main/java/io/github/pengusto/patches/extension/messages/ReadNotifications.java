/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.messages;

import android.app.NotificationManager;
import android.content.Context;

/** Called only after the selected conversation was successfully marked read. */
public final class ReadNotifications {
    public static void cancel(Context context, long threadId) {
        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        manager.cancel(Long.hashCode(threadId));
    }
}
