package gx;

import com.teslacoilsw.ads.internal.runtime.AdErrorException;
import java.util.List;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58148a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b0 f58149b;

    public /* synthetic */ p(b0 b0Var, int i5) {
        this.f58148a = i5;
        this.f58149b = b0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        List<dx.f> list;
        switch (this.f58148a) {
            case 0:
                String p11 = ((dx.t) obj).f49792a;
                Intrinsics.g(p11, "p");
                dx.q0 q0Var = (dx.q0) ((dx.h) this.f58149b.f58030e.getValue()).f49705a.get(new dx.t(p11));
                if (q0Var != null) {
                    return q0Var;
                }
                throw new AdErrorException(dx.i.f49709a);
            default:
                String placement = ((dx.t) obj).f49792a;
                Intrinsics.g(placement, "placement");
                dx.q0 q0Var2 = (dx.q0) ((dx.h) this.f58149b.f58030e.getValue()).f49705a.get(new dx.t(placement));
                if (q0Var2 == null || (list = q0Var2.f49763b) == null) {
                    return null;
                }
                for (dx.f fVar : list) {
                    dx.e eVar = fVar instanceof dx.e ? (dx.e) fVar : null;
                    if (eVar != null) {
                        return eVar;
                    }
                }
                return null;
        }
    }
}
