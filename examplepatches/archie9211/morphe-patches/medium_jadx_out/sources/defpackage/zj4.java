package defpackage;

import com.google.firebase.auth.FirebaseAuth;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zj4 implements cag {
    public final /* synthetic */ FirebaseAuth a;

    public zj4(FirebaseAuth firebaseAuth) {
        this.a = firebaseAuth;
    }

    @Override // defpackage.cag
    public final void a(zpf zpfVar, xmf xmfVar) {
        vp7.p(zpfVar);
        vp7.p(xmfVar);
        xmfVar.a = zpfVar;
        FirebaseAuth.h(this.a, xmfVar, zpfVar, true, false);
    }
}
