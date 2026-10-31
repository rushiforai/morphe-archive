package x8;

import h6.a0;
import h6.z;
import java.util.concurrent.CancellationException;
import t70.r1;

/* loaded from: classes.dex */
public final class t implements q {

    /* renamed from: a, reason: collision with root package name */
    public final m8.k f95376a;

    /* renamed from: b, reason: collision with root package name */
    public final k f95377b;

    /* renamed from: c, reason: collision with root package name */
    public final z8.c f95378c;

    /* renamed from: d, reason: collision with root package name */
    public final h6.u f95379d;

    /* renamed from: e, reason: collision with root package name */
    public final r1 f95380e;

    public t(m8.k kVar, k kVar2, z8.c cVar, h6.u uVar, r1 r1Var) {
        this.f95376a = kVar;
        this.f95377b = kVar2;
        this.f95378c = cVar;
        this.f95379d = uVar;
        this.f95380e = r1Var;
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onDestroy(a0 a0Var) {
        c9.g.c(this.f95378c.c()).a();
    }

    @Override // x8.q
    public final void p() {
        z8.c cVar = this.f95378c;
        if (cVar.c().isAttachedToWindow()) {
            return;
        }
        u uVarC = c9.g.c(cVar.c());
        t tVar = uVarC.f95384d;
        if (tVar != null) {
            h6.u uVar = tVar.f95379d;
            tVar.f95380e.c(null);
            z8.c cVar2 = tVar.f95378c;
            if (cVar2 instanceof z) {
                uVar.c((z) cVar2);
            }
            uVar.c(tVar);
        }
        uVarC.f95384d = this;
        throw new CancellationException("'ViewTarget.view' must be attached to a window.");
    }

    @Override // x8.q
    public final void start() {
        h6.u uVar = this.f95379d;
        uVar.a(this);
        z8.c cVar = this.f95378c;
        if (cVar instanceof z) {
            z zVar = (z) cVar;
            uVar.c(zVar);
            uVar.a(zVar);
        }
        u uVarC = c9.g.c(cVar.c());
        t tVar = uVarC.f95384d;
        if (tVar != null) {
            h6.u uVar2 = tVar.f95379d;
            tVar.f95380e.c(null);
            z8.c cVar2 = tVar.f95378c;
            if (cVar2 instanceof z) {
                uVar2.c((z) cVar2);
            }
            uVar2.c(tVar);
        }
        uVarC.f95384d = this;
    }
}
