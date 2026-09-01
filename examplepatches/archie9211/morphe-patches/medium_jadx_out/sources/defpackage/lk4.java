package defpackage;

import com.google.firebase.messaging.FirebaseMessaging;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lk4 implements kr8 {
    public final /* synthetic */ int a;
    public final /* synthetic */ FirebaseMessaging b;

    public /* synthetic */ lk4(FirebaseMessaging firebaseMessaging, int i) {
        this.a = i;
        this.b = firebaseMessaging;
    }

    @Override // defpackage.kr8
    public final void i(Object obj) {
        boolean z;
        int i = this.a;
        FirebaseMessaging firebaseMessaging = this.b;
        switch (i) {
            case 0:
                ppd ppdVar = (ppd) obj;
                if (!firebaseMessaging.e.i() || ppdVar.h.a() == null) {
                    return;
                }
                synchronized (ppdVar) {
                    z = ppdVar.g;
                }
                if (z) {
                    return;
                }
                ppdVar.g(0L);
                return;
            default:
                ip1 ip1Var = (ip1) obj;
                if (ip1Var != null) {
                    ep7.w(ip1Var.a);
                    firebaseMessaging.f();
                    return;
                }
                return;
        }
    }
}
