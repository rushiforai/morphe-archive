/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.messages;
import android.content.*;
import android.net.Uri;

public final class VisibleMessageRead {
    public static void mark(Context context, long message, boolean mms, long thread) {
        ContentValues values = new ContentValues();
        values.put("read", 1); values.put("seen", 1);
        int changed = context.getContentResolver().update(Uri.parse(mms ? "content://mms" : "content://sms"), values,
            "_id=? AND thread_id=?", new String[]{Long.toString(message), Long.toString(thread)});
        if (changed == 0) throw new IllegalStateException("Incoming message no longer matches its thread");
    }
}
