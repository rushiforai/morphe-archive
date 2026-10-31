package g0;

import androidx.compose.ui.node.DelegatingNode;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class g0 extends DelegatingNode implements b3.l2 {

    /* renamed from: a, reason: collision with root package name */
    public d1 f56533a;

    /* renamed from: b, reason: collision with root package name */
    public Function1 f56534b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f56535c;

    /* renamed from: d, reason: collision with root package name */
    public i0.i f56536d;

    /* renamed from: e, reason: collision with root package name */
    public v70.i f56537e;

    /* renamed from: f, reason: collision with root package name */
    public i0.b f56538f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f56539g;

    /* renamed from: h, reason: collision with root package name */
    public long f56540h = 0;

    /* renamed from: i, reason: collision with root package name */
    public v2.l0 f56541i;

    public g0(Function1 function1, boolean z11, i0.i iVar, d1 d1Var) {
        this.f56533a = d1Var;
        this.f56534b = function1;
        this.f56535c = z11;
        this.f56536d = iVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object B(g0 g0Var, ContinuationImpl continuationImpl) {
        b0 b0Var;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f56467v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f56467v = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(g0Var, continuationImpl);
            }
        }
        Object obj = b0Var.f56465t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f56467v;
        if (i11 == 0) {
            ResultKt.b(obj);
            i0.b bVar = g0Var.f56538f;
            if (bVar != null) {
                i0.i iVar = g0Var.f56536d;
                if (iVar != null) {
                    i0.a aVar = new i0.a(bVar);
                    b0Var.f56467v = 1;
                    if (iVar.a(aVar, b0Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
            }
            g0Var.M(0L);
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        g0Var.f56538f = null;
        g0Var.M(0L);
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object D(g0 g0Var, o oVar, ContinuationImpl continuationImpl) {
        c0 c0Var;
        i0.i iVar;
        i0.b bVar;
        o oVar2;
        i0.b bVar2;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i5 = c0Var.f56476x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.f56476x = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(g0Var, continuationImpl);
            }
        }
        Object obj = c0Var.f56474v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var.f56476x;
        if (i11 == 0) {
            ResultKt.b(obj);
            i0.b bVar3 = g0Var.f56538f;
            if (bVar3 != null && (iVar = g0Var.f56536d) != null) {
                i0.a aVar = new i0.a(bVar3);
                c0Var.f56472t = oVar;
                c0Var.f56476x = 1;
                if (iVar.a(aVar, c0Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            g0Var.f56538f = bVar;
            g0Var.I(oVar.a());
            return Unit.f71706a;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            bVar2 = c0Var.f56473u;
            oVar2 = c0Var.f56472t;
            ResultKt.b(obj);
            bVar = bVar2;
            oVar = oVar2;
            g0Var.f56538f = bVar;
            g0Var.I(oVar.a());
            return Unit.f71706a;
        }
        oVar = c0Var.f56472t;
        ResultKt.b(obj);
        bVar = new i0.b();
        i0.i iVar2 = g0Var.f56536d;
        if (iVar2 != null) {
            c0Var.f56472t = oVar;
            c0Var.f56473u = bVar;
            c0Var.f56476x = 2;
            if (iVar2.a(bVar, c0Var) != coroutineSingletons) {
                oVar2 = oVar;
                bVar2 = bVar;
                bVar = bVar2;
                oVar = oVar2;
            }
            return coroutineSingletons;
        }
        g0Var.f56538f = bVar;
        g0Var.I(oVar.a());
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object E(g0 g0Var, p pVar, ContinuationImpl continuationImpl) {
        d0 d0Var;
        if (continuationImpl instanceof d0) {
            d0Var = (d0) continuationImpl;
            int i5 = d0Var.f56492w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d0Var.f56492w = i5 - Integer.MIN_VALUE;
            } else {
                d0Var = new d0(g0Var, continuationImpl);
            }
        }
        Object obj = d0Var.f56490u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d0Var.f56492w;
        if (i11 == 0) {
            ResultKt.b(obj);
            i0.b bVar = g0Var.f56538f;
            if (bVar != null) {
                i0.i iVar = g0Var.f56536d;
                if (iVar != null) {
                    i0.c cVar = new i0.c(bVar);
                    d0Var.f56489t = pVar;
                    d0Var.f56492w = 1;
                    if (iVar.a(cVar, d0Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
            }
            g0Var.M(pVar.a());
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        pVar = d0Var.f56489t;
        ResultKt.b(obj);
        g0Var.f56538f = null;
        g0Var.M(pVar.a());
        return Unit.f71706a;
    }

    public final void F() {
        i0.b bVar = this.f56538f;
        if (bVar != null) {
            i0.i iVar = this.f56536d;
            if (iVar != null) {
                iVar.b(new i0.a(bVar));
            }
            this.f56538f = null;
        }
    }

    public abstract Object H(e0 e0Var, f0 f0Var);

    public abstract void I(long j11);

    public abstract void M(long j11);

    public abstract boolean N();

    public final void O(Function1 function1, boolean z11, i0.i iVar, d1 d1Var, boolean z12) {
        v2.l0 l0Var;
        this.f56534b = function1;
        boolean z13 = true;
        if (this.f56535c != z11) {
            this.f56535c = z11;
            if (!z11) {
                F();
                v2.l0 l0Var2 = this.f56541i;
                if (l0Var2 != null) {
                    undelegate(l0Var2);
                }
                this.f56541i = null;
            }
            z12 = true;
        }
        if (!Intrinsics.b(this.f56536d, iVar)) {
            F();
            this.f56536d = iVar;
        }
        if (this.f56533a != d1Var) {
            this.f56533a = d1Var;
        } else {
            z13 = z12;
        }
        if (!z13 || (l0Var = this.f56541i) == null) {
            return;
        }
        l0Var.F();
    }

    @Override // b3.l2
    public final void onCancelPointerInput() {
        v2.l0 l0Var = this.f56541i;
        if (l0Var != null) {
            l0Var.onCancelPointerInput();
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        this.f56539g = false;
        F();
        this.f56540h = 0L;
    }

    /* renamed from: onPointerEvent-H0pRuoY */
    public void mo26onPointerEventH0pRuoY(v2.m mVar, v2.n nVar, long j11) {
        if (this.f56535c && this.f56541i == null) {
            a0 a0Var = new a0(this);
            v2.m mVar2 = v2.f0.f91929a;
            this.f56541i = (v2.l0) delegate(new v2.l0(null, null, a0Var));
        }
        v2.l0 l0Var = this.f56541i;
        if (l0Var != null) {
            l0Var.mo26onPointerEventH0pRuoY(mVar, nVar, j11);
        }
    }
}
