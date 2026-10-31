package n1;

import ab.e0;
import androidx.compose.ui.node.DelegatingNode;
import c3.z1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import p1.m2;
import p6.u;
import t70.m0;
import y3.r;

/* loaded from: classes2.dex */
public final class n extends DelegatingNode implements b3.m, u2.a {

    /* renamed from: a, reason: collision with root package name */
    public boolean f77669a;

    /* renamed from: b, reason: collision with root package name */
    public Function0 f77670b;

    /* renamed from: d, reason: collision with root package name */
    public o f77672d;

    /* renamed from: e, reason: collision with root package name */
    public float f77673e;

    /* renamed from: c, reason: collision with root package name */
    public boolean f77671c = true;

    /* renamed from: f, reason: collision with root package name */
    public final u2.f f77674f = new u2.f(this, null);

    /* renamed from: g, reason: collision with root package name */
    public final m2 f77675g = androidx.compose.runtime.d.f(0.0f);

    /* renamed from: h, reason: collision with root package name */
    public final m2 f77676h = androidx.compose.runtime.d.f(0.0f);

    public n(boolean z11, Function0 function0, o oVar, float f11) {
        this.f77669a = z11;
        this.f77670b = function0;
        this.f77672d = oVar;
        this.f77673e = f11;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object B(ContinuationImpl continuationImpl) {
        i iVar;
        n nVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f77653w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f77653w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        i iVar2 = iVar;
        Object obj = iVar2.f77651u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = iVar2.f77653w;
        if (i11 == 0) {
            ResultKt.b(obj);
            o oVar = this.f77672d;
            iVar2.f77650t = this;
            iVar2.f77653w = 1;
            Object objD = c0.e.d(((q) oVar).f77679a, new Float(0.0f), null, null, iVar2, 14);
            if (objD != obj2) {
                objD = Unit.f71706a;
            }
            if (objD == obj2) {
                return obj2;
            }
            nVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nVar = iVar2.f77650t;
            ResultKt.b(obj);
        }
        nVar.f77676h.p(0.0f);
        nVar.f77675g.p(0.0f);
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object D(ContinuationImpl continuationImpl) {
        j jVar;
        n nVar;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f77657w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f77657w = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        j jVar2 = jVar;
        Object obj = jVar2.f77655u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = jVar2.f77657w;
        if (i11 == 0) {
            ResultKt.b(obj);
            o oVar = this.f77672d;
            jVar2.f77654t = this;
            jVar2.f77657w = 1;
            Object objD = c0.e.d(((q) oVar).f77679a, new Float(1.0f), null, null, jVar2, 14);
            if (objD != obj2) {
                objD = Unit.f71706a;
            }
            if (objD == obj2) {
                return obj2;
            }
            nVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nVar = jVar2.f77654t;
            ResultKt.b(obj);
        }
        nVar.f77676h.p(nVar.F());
        nVar.f77675g.p(nVar.F());
        return Unit.f71706a;
    }

    public final long E(long j11) {
        float fM;
        float F;
        if (this.f77669a) {
            fM = 0.0f;
        } else {
            m2 m2Var = this.f77676h;
            float fE = h2.b.e(j11) + m2Var.m();
            if (fE < 0.0f) {
                fE = 0.0f;
            }
            fM = fE - m2Var.m();
            m2Var.p(fE);
            if (m2Var.m() * 0.5f <= F()) {
                F = m2Var.m() * 0.5f;
            } else {
                float fD0 = kotlin.ranges.a.d0(Math.abs((m2Var.m() * 0.5f) / F()) - 1.0f, 0.0f, 2.0f);
                F = F() + (F() * (fD0 - (((float) Math.pow(fD0, 2)) / 4)));
            }
            this.f77675g.p(F);
        }
        return e0.h(0.0f, fM);
    }

    public final int F() {
        return ((y3.c) b3.g.c(this, z1.f19497h)).mo96roundToPx0680j_4(this.f77673e);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object H(float f11, ContinuationImpl continuationImpl) {
        m mVar;
        n nVar;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f77668x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f77668x = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object obj = mVar.f77666v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f77668x;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (this.f77669a) {
                return new Float(0.0f);
            }
            if (this.f77676h.m() * 0.5f > F()) {
                mVar.f77664t = this;
                mVar.f77665u = f11;
                mVar.f77668x = 1;
                if (D(mVar) != coroutineSingletons) {
                    nVar = this;
                    nVar.f77670b.invoke();
                }
            } else {
                mVar.f77664t = this;
                mVar.f77665u = f11;
                mVar.f77668x = 2;
                if (B(mVar) != coroutineSingletons) {
                    nVar = this;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            f11 = mVar.f77665u;
            nVar = mVar.f77664t;
            ResultKt.b(obj);
            nVar.f77670b.invoke();
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            f11 = mVar.f77665u;
            nVar = mVar.f77664t;
            ResultKt.b(obj);
        }
        if (nVar.f77676h.m() == 0.0f || f11 < 0.0f) {
            f11 = 0.0f;
        }
        nVar.f77676h.p(0.0f);
        return new Float(f11);
    }

    @Override // u2.a
    public final long g(int i5, long j11) {
        if (!((q) this.f77672d).f77679a.f() && this.f77671c && i5 == 1 && h2.b.e(j11) < 0.0f) {
            return E(j11);
        }
        return 0L;
    }

    @Override // u2.a
    public final long m(int i5, long j11, long j12) {
        if (((q) this.f77672d).f77679a.f() || !this.f77671c || i5 != 1) {
            return 0L;
        }
        long jE = E(j12);
        m0.t(getCoroutineScope(), null, null, new k(this, null, 1), 3);
        return jE;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        delegate(this.f77674f);
        m0.t(getCoroutineScope(), null, null, new k(this, null, 0), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // u2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object t(long j11, Continuation continuation) {
        l lVar;
        if (continuation instanceof l) {
            lVar = (l) continuation;
            int i5 = lVar.f77663v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f77663v = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, (ContinuationImpl) continuation);
            }
        }
        Object objH = lVar.f77661t;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = lVar.f77663v;
        if (i11 == 0) {
            ResultKt.b(objH);
            float fE = r.e(j11);
            lVar.f77663v = 1;
            objH = H(fE, lVar);
            if (objH == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objH);
        }
        return new r(u.c(0.0f, ((Number) objH).floatValue()));
    }
}
