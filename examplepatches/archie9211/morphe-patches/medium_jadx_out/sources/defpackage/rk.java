package defpackage;

import androidx.compose.material.AnchoredDragFinishedSignal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rk extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ b55 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ sb2 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rk(b55 b55Var, Object obj, sb2 sb2Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = b55Var;
        this.e = obj;
        this.f = sb2Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new rk(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new rk(this.d, this.e, this.f, n92Var, 1);
            default:
                return new rk(this.d, this.e, this.f, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((rk) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = this.f;
        Object obj2 = this.e;
        b55 b55Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (b55Var.invoke(obj2, this) == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                o7f.m(sb2Var, new AnchoredDragFinishedSignal());
                break;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (b55Var.invoke(obj2, this) == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                o7f.m(sb2Var, new androidx.compose.material3.internal.AnchoredDragFinishedSignal());
                break;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (b55Var.invoke(obj2, this) == tb2Var3) {
                    }
                } else if (i4 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                o7f.m(sb2Var, new androidx.compose.foundation.gestures.AnchoredDragFinishedSignal());
                break;
        }
        return c1eVar;
    }
}
