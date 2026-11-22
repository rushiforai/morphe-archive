package app.jofslash.extension.googlehealth;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

/**
 * Used by the GmsCore support patch. Signing in goes through MicroG-RE,
 * so tell the user when it is missing.
 */
@SuppressWarnings("unused")
public final class GmsCoreCheck {
    private static final String GMS_CORE_PACKAGE = "app.revanced.android.gms";

    private GmsCoreCheck() {
    }

    public static void check(Context context) {
        try {
            context.getPackageManager().getPackageInfo(GMS_CORE_PACKAGE, 0);
        } catch (PackageManager.NameNotFoundException e) {
            final Context app = context.getApplicationContext() != null
                    ? context.getApplicationContext() : context;
            new Handler(Looper.getMainLooper()).postDelayed(() -> Toast.makeText(app,
                    "Install MicroG-RE to sign in to Google Health.",
                    Toast.LENGTH_LONG).show(), 3000);
        } catch (Throwable ignored) {
            // Never break the app start.
        }
    }
}
