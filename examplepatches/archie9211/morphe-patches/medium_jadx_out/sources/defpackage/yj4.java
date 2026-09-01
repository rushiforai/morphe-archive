package defpackage;

import com.google.android.gms.common.api.Status;
import com.google.firebase.auth.FirebaseAuth;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yj4 implements ovf, cag {
    public final /* synthetic */ int a;
    public final /* synthetic */ FirebaseAuth b;

    public /* synthetic */ yj4(FirebaseAuth firebaseAuth, int i) {
        this.a = i;
        this.b = firebaseAuth;
    }

    @Override // defpackage.cag
    public final void a(zpf zpfVar, xmf xmfVar) {
        int i = this.a;
        FirebaseAuth firebaseAuth = this.b;
        switch (i) {
            case 0:
                vp7.p(zpfVar);
                vp7.p(xmfVar);
                xmfVar.a = zpfVar;
                FirebaseAuth.h(firebaseAuth, xmfVar, zpfVar, true, true);
                break;
            default:
                FirebaseAuth.h(firebaseAuth, xmfVar, zpfVar, true, true);
                break;
        }
    }

    @Override // defpackage.ovf
    public final void b(Status status) {
        int i = this.a;
        FirebaseAuth firebaseAuth = this.b;
        switch (i) {
            case 0:
                int i2 = status.a;
                if (i2 == 17011 || i2 == 17021 || i2 == 17005 || i2 == 17091) {
                    firebaseAuth.e();
                }
                break;
            default:
                int i3 = status.a;
                if (i3 == 17011 || i3 == 17021 || i3 == 17005) {
                    firebaseAuth.e();
                }
                break;
        }
    }
}
