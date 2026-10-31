package ads_mobile_sdk;

import b.x3;
import java.lang.reflect.Method;

/* loaded from: classes.dex */
public final class zi1 extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public static volatile Long f12541f;

    /* renamed from: g, reason: collision with root package name */
    public static final Object f12542g = new Object();

    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) {
        if (f12541f == null) {
            synchronized (f12542g) {
                try {
                    if (f12541f == null) {
                        Long l9 = (Long) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
                        l9.getClass();
                        f12541f = l9;
                    }
                } finally {
                }
            }
        }
        synchronized (x3Var) {
            try {
                if (f12541f != null) {
                    x3Var.q(f12541f.longValue());
                }
            } finally {
            }
        }
    }
}
