package defpackage;

import com.medium.android.unsplash.ui.UnsplashPickerFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b3e implements pub {
    public final /* synthetic */ qlb a;
    public final /* synthetic */ k3e b;

    public b3e(qlb qlbVar, k3e k3eVar) {
        this.a = qlbVar;
        this.b = k3eVar;
    }

    @Override // defpackage.pub
    public final void a() {
        k40.X((UnsplashPickerFragment) this.a.a).f();
    }

    @Override // defpackage.pub
    public final void b(uid uidVar) {
        k3e k3eVar = this.b;
        atb atbVarE = k3eVar.e();
        atbVarE.getClass();
        atb atbVarA = atb.a(atbVarE, uidVar, false, false, 6);
        k3eVar.e.setValue(atbVarA);
        xpc xpcVar = k3eVar.f;
        xpcVar.getClass();
        xpcVar.m(null, atbVarA);
    }

    @Override // defpackage.pub
    public final void c() {
        k3e k3eVar = this.b;
        atb atbVarE = k3eVar.e();
        atbVarE.getClass();
        atb atbVarA = atb.a(atbVarE, new uid((String) null, 7, 0L), false, false, 6);
        k3eVar.e.setValue(atbVarA);
        xpc xpcVar = k3eVar.f;
        xpcVar.getClass();
        xpcVar.m(null, atbVarA);
    }

    @Override // defpackage.pub
    public final void e() {
        k3e k3eVar = this.b;
        atb atbVarE = k3eVar.e();
        atbVarE.getClass();
        atb atbVarA = atb.a(atbVarE, null, false, false, 3);
        k3eVar.e.setValue(atbVarA);
        xpc xpcVar = k3eVar.f;
        xpcVar.getClass();
        xpcVar.m(null, atbVarA);
    }

    public final void f() {
        k3e k3eVar = this.b;
        vx0.c0(f76.F(k3eVar), null, null, new i3e(k3eVar, null, 1), 3);
    }

    @Override // defpackage.pub
    public final void d(boolean z) {
    }
}
