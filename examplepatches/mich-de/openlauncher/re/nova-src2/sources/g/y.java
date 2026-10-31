package g;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class y implements h6.y, c {

    /* renamed from: a, reason: collision with root package name */
    public final h6.u f56444a;

    /* renamed from: b, reason: collision with root package name */
    public final s f56445b;

    /* renamed from: c, reason: collision with root package name */
    public z f56446c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ a0 f56447d;

    public y(a0 a0Var, h6.u uVar, s onBackPressedCallback) {
        Intrinsics.g(onBackPressedCallback, "onBackPressedCallback");
        this.f56447d = a0Var;
        this.f56444a = uVar;
        this.f56445b = onBackPressedCallback;
        uVar.a(this);
    }

    @Override // g.c
    public final void cancel() {
        this.f56444a.c(this);
        this.f56445b.removeCancellable(this);
        z zVar = this.f56446c;
        if (zVar != null) {
            zVar.cancel();
        }
        this.f56446c = null;
    }

    @Override // h6.y
    public final void d(h6.a0 a0Var, h6.s sVar) {
        if (sVar == h6.s.ON_START) {
            this.f56446c = this.f56447d.b(this.f56445b);
            return;
        }
        if (sVar != h6.s.ON_STOP) {
            if (sVar == h6.s.ON_DESTROY) {
                cancel();
            }
        } else {
            z zVar = this.f56446c;
            if (zVar != null) {
                zVar.cancel();
            }
        }
    }
}
