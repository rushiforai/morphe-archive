package defpackage;

import android.text.TextUtils;
import android.util.Log;
import com.google.firebase.auth.FirebaseAuth;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class clf extends br7 {
    public final /* synthetic */ boolean f;
    public final /* synthetic */ xmf g;
    public final /* synthetic */ qw3 h;
    public final /* synthetic */ FirebaseAuth i;

    public clf(FirebaseAuth firebaseAuth, boolean z, xmf xmfVar, qw3 qw3Var) {
        this.f = z;
        this.g = xmfVar;
        this.h = qw3Var;
        this.i = firebaseAuth;
    }

    @Override // defpackage.br7
    public final jrg E(String str) {
        FirebaseAuth firebaseAuth = this.i;
        xj4 xj4Var = firebaseAuth.a;
        if (TextUtils.isEmpty(str)) {
            Log.i("FirebaseAuth", "Email link login/reauth with empty reCAPTCHA token");
        } else {
            Log.i("FirebaseAuth", "Got reCAPTCHA token for login/reauth with email link");
        }
        d2f d2fVar = firebaseAuth.e;
        qw3 qw3Var = this.h;
        if (!this.f) {
            zj4 zj4Var = new zj4(firebaseAuth);
            d2fVar.getClass();
            qmf qmfVar = new qmf(qw3Var, str, 1);
            qmfVar.b(xj4Var);
            qmfVar.e = zj4Var;
            return d2fVar.D0(qmfVar);
        }
        xmf xmfVar = this.g;
        vp7.p(xmfVar);
        yj4 yj4Var = new yj4(firebaseAuth, 0);
        d2fVar.getClass();
        qmf qmfVar2 = new qmf(qw3Var, str, 0);
        qmfVar2.b(xj4Var);
        qmfVar2.d = xmfVar;
        qmfVar2.e = yj4Var;
        qmfVar2.f = yj4Var;
        return d2fVar.D0(qmfVar2);
    }
}
