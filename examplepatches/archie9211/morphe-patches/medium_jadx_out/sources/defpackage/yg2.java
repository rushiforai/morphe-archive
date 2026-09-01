package defpackage;

import androidx.credentials.exceptions.ClearCredentialException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yg2 implements ah2, i41 {
    public final /* synthetic */ x51 a;

    public /* synthetic */ yg2(x51 x51Var) {
        this.a = x51Var;
    }

    @Override // defpackage.ah2
    public void a(Object obj) {
        ClearCredentialException clearCredentialException = (ClearCredentialException) obj;
        clearCredentialException.getClass();
        x51 x51Var = this.a;
        if (x51Var.r() instanceof ai8) {
            x51Var.resumeWith(new ajb(clearCredentialException));
        }
    }

    @Override // defpackage.i41
    public void f(v31 v31Var, zcb zcbVar) {
        this.a.resumeWith(zcbVar);
    }

    @Override // defpackage.ah2
    public void onResult(Object obj) {
        x51 x51Var = this.a;
        if (x51Var.r() instanceof ai8) {
            x51Var.resumeWith(c1e.a);
        }
    }

    @Override // defpackage.i41
    public void w(v31 v31Var, Throwable th) {
        v31Var.getClass();
        this.a.resumeWith(new ajb(th));
    }
}
