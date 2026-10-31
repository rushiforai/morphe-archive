package ads_mobile_sdk;

import b.e1;
import b.i;
import b.n;
import cl.d0;
import cl.m0;
import cl.r0;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes2.dex */
public final class ca3 implements d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ da3 f1758a;

    public ca3(da3 da3Var) {
        this.f1758a = da3Var;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) {
        n nVar = (n) obj;
        if (nVar != null) {
            return w0.b(nVar);
        }
        da3 da3Var = this.f1758a;
        da3Var.f2246f.b(yk0.EVENT_ID_INIT_FALLBACK_TO_DEFAULT_COLLECTOR);
        return w0.f(r0.r(w0.d(new i(1, da3Var, da3Var.f2247g), da3Var.f2245e)), new e1(), m0.f20038a);
    }
}
