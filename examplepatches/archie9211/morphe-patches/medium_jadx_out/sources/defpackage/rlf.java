package defpackage;

import android.text.TextUtils;
import android.util.Log;
import com.google.firebase.auth.FirebaseAuth;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rlf extends br7 {
    public final /* synthetic */ String f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ xmf h;
    public final /* synthetic */ String i;
    public final /* synthetic */ String j;
    public final /* synthetic */ FirebaseAuth k;

    public rlf(FirebaseAuth firebaseAuth, String str, boolean z, xmf xmfVar, String str2, String str3) {
        this.f = str;
        this.g = z;
        this.h = xmfVar;
        this.i = str2;
        this.j = str3;
        this.k = firebaseAuth;
    }

    @Override // defpackage.br7
    public final jrg E(String str) {
        FirebaseAuth firebaseAuth = this.k;
        xj4 xj4Var = firebaseAuth.a;
        boolean zIsEmpty = TextUtils.isEmpty(str);
        String str2 = this.f;
        if (zIsEmpty) {
            Log.i("FirebaseAuth", "Logging in as " + str2 + " with empty reCAPTCHA token");
        } else {
            Log.i("FirebaseAuth", "Got reCAPTCHA token for login with email " + str2);
        }
        d2f d2fVar = firebaseAuth.e;
        String str3 = this.j;
        String str4 = this.i;
        if (!this.g) {
            zj4 zj4Var = new zj4(firebaseAuth);
            d2fVar.getClass();
            tmf tmfVar = new tmf(1, str2, str4, str3, str);
            tmfVar.b(xj4Var);
            tmfVar.e = zj4Var;
            return d2fVar.D0(tmfVar);
        }
        xmf xmfVar = this.h;
        vp7.p(xmfVar);
        yj4 yj4Var = new yj4(firebaseAuth, 0);
        d2fVar.getClass();
        tmf tmfVar2 = new tmf(0, str2, str4, str3, str);
        tmfVar2.b(xj4Var);
        tmfVar2.d = xmfVar;
        tmfVar2.e = yj4Var;
        tmfVar2.f = yj4Var;
        return d2fVar.D0(tmfVar2);
    }
}
