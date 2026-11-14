package app.soundsync.settings;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;

/** Asks Android Auto whether it's connected, the same way the patched apps do. */
final class CarStatus {
    private static final Uri CAR_CONNECTION = Uri.parse("content://androidx.car.app.connection");
    private static final String STATE = "CarConnectionState";

    private CarStatus() {
    }

    static String describe(Context ctx) {
        Cursor c = null;
        try {
            c = ctx.getContentResolver().query(CAR_CONNECTION, new String[]{STATE}, null, null, null);
            if (c == null) return "Android Auto right now: couldn't check (no answer from Android Auto)";
            int col = c.getColumnIndex(STATE);
            if ((col < 0) || !c.moveToFirst()) return "Android Auto right now: couldn't check (empty answer)";
            int s = c.getInt(col);
            if (s == 2) return "Android Auto right now: connected ✓";
            if (s == 1) return "Android Auto right now: built-in car system connected ✓";
            return "Android Auto right now: not connected";
        } catch (Exception e) {
            return "Android Auto right now: couldn't check (" + e.getClass().getSimpleName() + ")";
        } finally {
            if (c != null) c.close();
        }
    }
}
