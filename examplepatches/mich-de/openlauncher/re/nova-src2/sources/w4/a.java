package w4;

import a5.k1;
import android.os.Build;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class a {
    static {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 30) {
            k1.d(30);
        }
        if (i5 >= 30) {
            k1.d(31);
        }
        if (i5 >= 30) {
            k1.d(33);
        }
        if (i5 >= 30) {
            k1.d(1000000);
        }
    }

    public static final boolean a(String str) {
        String buildCodename = Build.VERSION.CODENAME;
        Intrinsics.g(buildCodename, "buildCodename");
        if ("REL".equals(buildCodename)) {
            return false;
        }
        Locale locale = Locale.ROOT;
        String upperCase = buildCodename.toUpperCase(locale);
        Intrinsics.f(upperCase, "this as java.lang.String).toUpperCase(Locale.ROOT)");
        String upperCase2 = str.toUpperCase(locale);
        Intrinsics.f(upperCase2, "this as java.lang.String).toUpperCase(Locale.ROOT)");
        return upperCase.compareTo(upperCase2) >= 0;
    }

    public static final boolean b() {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 34) {
            return true;
        }
        if (i5 < 33) {
            return false;
        }
        String CODENAME = Build.VERSION.CODENAME;
        Intrinsics.f(CODENAME, "CODENAME");
        return a("UpsideDownCake");
    }

    public static final boolean c() {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 35) {
            return true;
        }
        if (i5 < 34) {
            return false;
        }
        String CODENAME = Build.VERSION.CODENAME;
        Intrinsics.f(CODENAME, "CODENAME");
        return a("VanillaIceCream");
    }
}
