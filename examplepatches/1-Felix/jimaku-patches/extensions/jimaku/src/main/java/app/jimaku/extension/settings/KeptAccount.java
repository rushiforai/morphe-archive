package app.jimaku.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.function.Supplier;

import app.jimaku.extension.session.AccountState;

/** The account last read, kept beside the settings as the extension's {@code lastMe}, so a menu opens with the minutes. */
public final class KeptAccount implements AccountState.Store {
    private static final String KEY = "last_me";

    private final Supplier<SharedPreferences> prefs;

    /** {@code context} gives the app's context once YouTube has one, or null before. */
    public static KeptAccount of(Supplier<Context> context) {
        return new KeptAccount(() -> {
            Context found = context.get();
            return found == null ? null : found.getSharedPreferences("jimaku", Context.MODE_PRIVATE);
        });
    }

    KeptAccount(Supplier<SharedPreferences> prefs) {
        this.prefs = prefs;
    }

    @Override
    public String load() {
        SharedPreferences kept = prefs.get();
        return kept == null ? null : kept.getString(KEY, "");
    }

    @Override
    public void save(String json) {
        SharedPreferences kept = prefs.get();
        if (kept != null) kept.edit().putString(KEY, json).apply();
    }
}
