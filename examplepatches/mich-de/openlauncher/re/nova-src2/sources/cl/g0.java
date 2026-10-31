package cl;

import com.google.android.gms.internal.measurement.l6;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
public final class g0 extends i0 {

    /* renamed from: e, reason: collision with root package name */
    public final l6 f20006e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ j0 f20007f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(j0 j0Var, l6 l6Var, Executor executor) {
        super(j0Var, executor);
        this.f20007f = j0Var;
        this.f20006e = l6Var;
    }

    @Override // cl.c1
    public final Object e() {
        return this.f20006e.call();
    }

    @Override // cl.c1
    public final String f() {
        return this.f20006e.toString();
    }

    @Override // cl.i0
    public final void h(Object obj) {
        this.f20007f.p((ListenableFuture) obj);
    }
}
