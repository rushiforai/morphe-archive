package e10;

import android.os.Bundle;

/* loaded from: classes4.dex */
public final /* synthetic */ class w3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51858a;

    public /* synthetic */ w3(int i5) {
        this.f51858a = i5;
    }

    public final void a(p6.t tVar, p6.e0 e0Var) {
        Bundle bundleA;
        switch (this.f51858a) {
            case 0:
                p6.n nVarJ = tVar.j();
                if (nVarJ != null && (bundleA = nVarJ.a()) != null) {
                    bundleA.remove("searchKey");
                    break;
                }
                break;
            default:
                mc0.d.f76206a.m(b.c0.l("NovaSettings nav '", e0Var.f82158g, "'"), new Object[0]);
                break;
        }
    }
}
