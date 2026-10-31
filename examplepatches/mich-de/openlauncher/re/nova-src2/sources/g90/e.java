package g90;

import org.conscrypt.Conscrypt;

/* loaded from: classes5.dex */
public abstract class e {
    public static boolean a() {
        Conscrypt.Version version = Conscrypt.version();
        if (version.major() != 2) {
            if (version.major() <= 2) {
                return false;
            }
        } else if (version.minor() != 1) {
            if (version.minor() <= 1) {
                return false;
            }
        } else if (version.patch() < 0) {
            return false;
        }
        return true;
    }

    public static g b() {
        if (g.f57257d) {
            return new g();
        }
        return null;
    }

    public static boolean c() {
        return g.f57257d;
    }
}
