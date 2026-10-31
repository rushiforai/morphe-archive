package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f31275a;

    public d(i1 i1Var) {
        this.f31275a = i1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        i iVar = this.f31275a;
        if (iVar.f31313k) {
            IAlog.a("No user web action detected for : %s blocking.", iVar.f31314l);
            i iVar2 = this.f31275a;
            String strC = iVar2.f31314l.c();
            String strA = this.f31275a.f31314l.a();
            j1 j1Var = iVar2.f31309g;
            if (j1Var != null) {
                j1Var.a(strC, strA);
            }
            IAlog.d("AD_AUTO_CLICK_DETECTED", new Object[0]);
            this.f31275a.f31314l.b();
            this.f31275a.i();
        } else {
            IAlog.a("User web action detected for: %s", iVar.f31314l);
            this.f31275a.f31314l.d();
        }
        this.f31275a.f31314l = null;
    }
}
