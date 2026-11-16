package app.onlynazril.extension.tiktok;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;

import java.util.Locale;

/** The locale the app is currently using, including TikTok's in-app language. */
public final class AppLocale {
    private AppLocale() {}

    @SuppressWarnings("deprecation")
    public static Locale of(Context context) {
        if (context == null) return Locale.getDefault();
        Configuration configuration = context.getResources().getConfiguration();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            if (!configuration.getLocales().isEmpty()) return configuration.getLocales().get(0);
        }
        Locale locale = configuration.locale;
        return locale != null ? locale : Locale.getDefault();
    }
}
