package m;

import android.os.PowerManager;
import java.util.Locale;

/* loaded from: classes2.dex */
public abstract class x {
    public static boolean a(PowerManager powerManager) {
        return powerManager.isPowerSaveMode();
    }

    public static String b(Locale locale) {
        return locale.toLanguageTag();
    }
}
