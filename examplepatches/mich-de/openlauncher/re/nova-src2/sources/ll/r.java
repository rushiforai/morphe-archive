package ll;

import com.google.crypto.tink.internal.TinkBugException;
import x7.u;

/* loaded from: classes.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public static final m f75031a;

    /* renamed from: b, reason: collision with root package name */
    public static final m f75032b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f75033c;

    static {
        k kVar = k.f75020f;
        k kVar2 = k.f75018d;
        l lVar = l.f75022b;
        try {
            x7.h hVarB = m.b();
            hVarB.f95137b = 32;
            hVarB.f95138c = 16;
            hVarB.f95140e = lVar;
            hVarB.f95139d = kVar2;
            f75031a = hVarB.e();
            try {
                x7.h hVarB2 = m.b();
                hVarB2.f95137b = 32;
                hVarB2.f95138c = 32;
                hVarB2.f95140e = lVar;
                hVarB2.f95139d = kVar2;
                hVarB2.e();
                try {
                    x7.h hVarB3 = m.b();
                    hVarB3.f95137b = 64;
                    hVarB3.f95138c = 32;
                    hVarB3.f95140e = lVar;
                    hVarB3.f95139d = kVar;
                    hVarB3.e();
                    try {
                        x7.h hVarB4 = m.b();
                        hVarB4.f95137b = 64;
                        hVarB4.f95138c = 64;
                        hVarB4.f95140e = lVar;
                        hVarB4.f95139d = kVar;
                        f75032b = hVarB4.e();
                        try {
                            u uVarB = d.b();
                            uVarB.w(32);
                            uVarB.x(16);
                            uVarB.f95210c = c.f74993b;
                            f75033c = uVarB.c();
                        } catch (Exception e3) {
                            throw new TinkBugException(e3);
                        }
                    } catch (Exception e11) {
                        throw new TinkBugException(e11);
                    }
                } catch (Exception e12) {
                    throw new TinkBugException(e12);
                }
            } catch (Exception e13) {
                throw new TinkBugException(e13);
            }
        } catch (Exception e14) {
            throw new TinkBugException(e14);
        }
    }
}
