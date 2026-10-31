package m1;

import c0.h2;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public abstract class u {

    /* renamed from: a, reason: collision with root package name */
    public static final h2 f75776a;

    /* renamed from: b, reason: collision with root package name */
    public static final h2 f75777b;

    /* renamed from: c, reason: collision with root package name */
    public static final h2 f75778c;

    static {
        c0.w wVar = new c0.w(0.4f, 0.0f, 0.6f, 1.0f);
        f75776a = new h2(120, c0.b0.f18710a, 2);
        f75777b = new h2(PerAppFeatureCatalog.MAX_TOOLS, wVar, 2);
        f75778c = new h2(120, wVar, 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x0009 A[PHI: r1
      0x0009: PHI (r1v3 c0.h2) = (r1v0 c0.h2), (r1v0 c0.h2), (r1v0 c0.h2), (r1v4 c0.h2), (r1v4 c0.h2), (r1v4 c0.h2), (r1v4 c0.h2) binds: [B:19:0x0022, B:22:0x0027, B:28:0x0033, B:5:0x0007, B:8:0x000d, B:11:0x0012, B:14:0x0017] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(c0.e eVar, float f11, i0.h hVar, i0.h hVar2, ContinuationImpl continuationImpl) {
        h2 h2Var;
        h2 h2Var2 = null;
        if (hVar2 != null) {
            boolean z11 = hVar2 instanceof i0.k;
            h2Var = f75776a;
            if (z11 || (hVar2 instanceof i0.b) || (hVar2 instanceof i0.f) || (hVar2 instanceof i0.d)) {
                h2Var2 = h2Var;
            }
        } else if (hVar != null) {
            boolean z12 = hVar instanceof i0.k;
            h2Var = f75777b;
            if (!z12 && !(hVar instanceof i0.b)) {
                if (hVar instanceof i0.f) {
                    h2Var2 = f75778c;
                } else if (hVar instanceof i0.d) {
                }
            }
        }
        h2 h2Var3 = h2Var2;
        if (h2Var3 != null) {
            Object objD = c0.e.d(eVar, new y3.f(f11), h2Var3, null, continuationImpl, 12);
            return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
        }
        Object objG = eVar.g(new y3.f(f11), continuationImpl);
        return objG == CoroutineSingletons.f71806a ? objG : Unit.f71706a;
    }
}
