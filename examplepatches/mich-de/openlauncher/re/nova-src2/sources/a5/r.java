package a5;

import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final /* synthetic */ class r implements h6.y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f353a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f354b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f355c;

    public /* synthetic */ r(int i5, Object obj, Object obj2) {
        this.f353a = i5;
        this.f354b = obj;
        this.f355c = obj2;
    }

    @Override // h6.y
    public final void d(h6.a0 a0Var, h6.s sVar) {
        switch (this.f353a) {
            case 0:
                t tVar = (t) this.f354b;
                u uVar = (u) this.f355c;
                tVar.getClass();
                if (sVar == h6.s.ON_DESTROY) {
                    tVar.b(uVar);
                    return;
                }
                return;
            case 1:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer.f.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer.f) this.f354b, (Function0) this.f355c, a0Var, sVar);
                return;
            default:
                h6.v vVar = (h6.v) this.f354b;
                t70.r1 r1Var = (t70.r1) this.f355c;
                if (a0Var.getLifecycle().b() == h6.t.f59440a) {
                    r1Var.c(null);
                    vVar.a();
                    return;
                }
                h6.t tVarB = a0Var.getLifecycle().b();
                h6.t tVar2 = vVar.f59457b;
                h6.l lVar = vVar.f59458c;
                if (tVarB.compareTo(tVar2) < 0) {
                    lVar.f59403a = true;
                    return;
                } else {
                    if (lVar.f59403a) {
                        if (lVar.f59404b) {
                            throw new IllegalStateException("Cannot resume a finished dispatcher");
                        }
                        lVar.f59403a = false;
                        lVar.b();
                        return;
                    }
                    return;
                }
        }
    }
}
