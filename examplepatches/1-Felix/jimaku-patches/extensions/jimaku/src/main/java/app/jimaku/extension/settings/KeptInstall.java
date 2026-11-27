package app.jimaku.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.function.Supplier;

import app.jimaku.extension.gateway.Install;
import app.jimaku.extension.gateway.InstallStore;

/**
 * The install, kept in Jimaku's own preferences file beside the settings, so it survives
 * repatching as they do. Read once there is a context to read it from; one made before then stays
 * in memory, and is written once there is.
 */
public final class KeptInstall implements InstallStore {
    private static final String ID = "install", SECRET = "install_secret";

    private final Supplier<SharedPreferences> prefs;
    private Install memory;
    private boolean read;

    /** {@code context} gives the app's context once YouTube has one, or null before. */
    public static KeptInstall of(Supplier<Context> context) {
        return new KeptInstall(() -> {
            Context found = context.get();
            return found == null ? null : found.getSharedPreferences("jimaku", Context.MODE_PRIVATE);
        });
    }

    KeptInstall(Supplier<SharedPreferences> prefs) {
        this.prefs = prefs;
    }

    @Override
    public synchronized Install load() {
        if (!read) {
            SharedPreferences kept = prefs.get();
            if (kept != null) {
                read = true;
                // One made before there was a context is the one the gateway now knows.
                if (memory != null) write(kept, memory);
                String id = kept.getString(ID, null), secret = kept.getString(SECRET, null);
                if (memory == null && id != null && secret != null) memory = new Install(id, secret);
            }
        }
        return memory;
    }

    @Override
    public synchronized void save(Install install) {
        memory = install;
        SharedPreferences kept = prefs.get();
        if (kept == null) return;
        read = true;
        write(kept, install);
    }

    private static void write(SharedPreferences kept, Install install) {
        SharedPreferences.Editor edit = kept.edit();
        if (install == null) edit.remove(ID).remove(SECRET);
        else edit.putString(ID, install.install).putString(SECRET, install.secret);
        edit.apply();
    }
}
