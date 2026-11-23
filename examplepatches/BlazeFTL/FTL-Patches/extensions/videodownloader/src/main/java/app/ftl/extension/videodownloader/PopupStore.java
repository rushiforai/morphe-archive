package app.ftl.extension.videodownloader;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Locale;

final class PopupStore {
    static final String REDIRECT = "popup_block";
    static final String WINDOW = "popup_window_block2";
    static final int BLOCK = 1;
    static final int ALLOW = 2;

    private PopupStore() {
    }

    static int get(Context ctx, String file, String host) {
        if (host == null) {
            return 0;
        }
        SharedPreferences sp = ctx.getSharedPreferences(file, 0);
        String raw = host.toLowerCase(Locale.ROOT);
        int v = sp.getInt(raw, 0);
        if (v != 0) {
            return v;
        }
        String cur = PopupUtil.norm(raw);
        while (true) {
            v = sp.getInt(cur, 0);
            if (v != 0) {
                return v;
            }
            int dot = cur.indexOf('.');
            if (dot < 0) {
                return 0;
            }
            String next = cur.substring(dot + 1);
            if (next.indexOf('.') < 0) {
                return 0;
            }
            cur = next;
        }
    }

    static void put(Context ctx, String file, String key, int value) {
        String k = PopupUtil.norm(key);
        if (k == null || k.length() == 0) {
            return;
        }
        ctx.getSharedPreferences(file, 0).edit().putInt(k, value).apply();
    }

    static void remove(Context ctx, String file, String key) {
        ctx.getSharedPreferences(file, 0).edit().remove(key).apply();
    }
}
