package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.Context;
import android.os.SystemClock;
import android.util.Log;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * The Reddit accounts signed in on the device, read from Android's account list (the app sees its own accounts
 * without a permission), for telling one's own profile from another's.
 */
final class Accounts {

    private static final long REFRESH_MS = 60_000;
    private static volatile Set<String> names = Collections.emptySet();
    private static volatile long readAt = -REFRESH_MS;

    private Accounts() {
    }

    static Set<String> names() {
        long now = SystemClock.elapsedRealtime();
        if (now - readAt < REFRESH_MS) return names;
        readAt = now;
        try {
            Context context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (context == null) return names;
            Set<String> found = new HashSet<>();
            for (Account account : AccountManager.get(context).getAccounts()) {
                if (account.type != null && account.type.toLowerCase(Locale.ROOT).contains("reddit")) {
                    found.add(account.name.toLowerCase(Locale.ROOT));
                }
            }
            names = found;
        } catch (Exception ex) {
            Log.e(TAG, "Could not read the device's Reddit accounts", ex);
        }
        return names;
    }

    /**
     * Whether any of the authors given is an account signed in on the device.
     */
    static boolean ownsAny(List<String> authors) {
        Set<String> own = names();
        if (own.isEmpty()) return false;
        for (String author : authors) {
            String name = author.toLowerCase(Locale.ROOT);
            if (name.startsWith("u/")) name = name.substring(2);
            if (own.contains(name)) return true;
        }
        return false;
    }
}
