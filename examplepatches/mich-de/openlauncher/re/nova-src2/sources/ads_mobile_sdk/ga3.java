package ads_mobile_sdk;

import b.a0;
import b.f1;
import cl.m0;
import cl.r0;
import cl.u0;
import cl.v;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class ga3 implements b.v1 {

    /* renamed from: a, reason: collision with root package name */
    public final j7 f3747a;

    /* renamed from: b, reason: collision with root package name */
    public final da3 f3748b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f3749c;

    /* renamed from: d, reason: collision with root package name */
    public final ExecutorService f3750d;

    /* renamed from: e, reason: collision with root package name */
    public final vi3 f3751e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicReference f3752f = new AtomicReference();

    public ga3(j7 j7Var, da3 da3Var, a0 a0Var, ExecutorService executorService, vi3 vi3Var) {
        this.f3747a = j7Var;
        this.f3748b = da3Var;
        this.f3749c = a0Var;
        this.f3750d = executorService;
        this.f3751e = vi3Var;
    }

    @Override // b.v1
    public final ListenableFuture a() {
        j7 j7Var = this.f3747a;
        v vVarE = w0.e(r0.r(this.f3748b.a(j7Var.M(), j7Var.o())), new f1(this, 1), m0.f20038a);
        vVarE.b(new u0(0, vVarE, new c7(this, 7)), this.f3750d);
        return vVarE;
    }
}
