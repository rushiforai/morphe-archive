package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import java.lang.reflect.AccessibleObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class r1b {
    public static final r1b a;

    public abstract boolean a(Object obj, AccessibleObject accessibleObject);

    static {
        r1b p1bVar;
        if (ra6.a >= 9) {
            try {
                p1bVar = new p1b(AccessibleObject.class.getDeclaredMethod(JWcjNoweKCnTr.aXKihoXrfGeOBc, Object.class));
            } catch (NoSuchMethodException unused) {
                p1bVar = null;
            }
        } else {
            p1bVar = null;
        }
        if (p1bVar == null) {
            p1bVar = new q1b();
        }
        a = p1bVar;
    }
}
