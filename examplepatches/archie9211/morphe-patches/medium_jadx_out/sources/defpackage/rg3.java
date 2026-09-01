package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rg3 extends tg3 implements ub2, n92 {
    public static final /* synthetic */ long h = m80.a.objectFieldOffset(rg3.class.getDeclaredField(JWcjNoweKCnTr.asWyiF));
    private volatile /* synthetic */ Object _reusableCancellableContinuation$volatile;
    public final kb2 d;
    public final p92 e;
    public Object f;
    public final Object g;

    public rg3(kb2 kb2Var, p92 p92Var) {
        super(-1);
        this.d = kb2Var;
        this.e = p92Var;
        this.f = op8.e;
        this.g = gx1.d0(p92Var.getContext());
    }

    @Override // defpackage.tg3
    public final n92 c() {
        return this;
    }

    @Override // defpackage.ub2
    public final ub2 getCallerFrame() {
        return this.e;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return this.e.getContext();
    }

    @Override // defpackage.tg3
    public final Object h() {
        Object obj = this.f;
        this.f = op8.e;
        return obj;
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) throws DispatchException {
        Throwable thB = bjb.b(obj);
        Object cy1Var = thB == null ? obj : new cy1(thB, false);
        p92 p92Var = this.e;
        ib2 context = p92Var.getContext();
        kb2 kb2Var = this.d;
        if (op8.m0(kb2Var, context)) {
            this.f = cy1Var;
            this.c = 0;
            op8.l0(kb2Var, p92Var.getContext(), this);
            return;
        }
        k34 k34VarA = ald.a();
        if (k34VarA.c >= 4294967296L) {
            this.f = cy1Var;
            this.c = 0;
            k34VarA.J0(this);
            return;
        }
        k34VarA.K0(true);
        try {
            ib2 context2 = p92Var.getContext();
            Object objF0 = gx1.f0(context2, this.g);
            try {
                p92Var.resumeWith(obj);
                while (k34VarA.M0()) {
                }
            } finally {
                gx1.Z(context2, objF0);
            }
        } finally {
            try {
            } finally {
            }
        }
    }

    public final String toString() {
        return "DispatchedContinuation[" + this.d + ", " + vv2.Z(this.e) + ']';
    }
}
