package defpackage;

import androidx.credentials.exceptions.GetCredentialException;
import retrofit2.HttpException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zg2 implements ah2, i41, br8, xq8 {
    public final /* synthetic */ x51 a;

    public /* synthetic */ zg2(x51 x51Var) {
        this.a = x51Var;
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        Exception excH = jrgVar.h();
        if (excH != null) {
            this.a.resumeWith(new ajb(excH));
            return;
        }
        boolean z = jrgVar.d;
        x51 x51Var = this.a;
        if (z) {
            x51Var.l(null);
        } else {
            x51Var.resumeWith(jrgVar.i());
        }
    }

    @Override // defpackage.ah2
    public void a(Object obj) {
        GetCredentialException getCredentialException = (GetCredentialException) obj;
        getCredentialException.getClass();
        x51 x51Var = this.a;
        if (x51Var.r() instanceof ai8) {
            x51Var.resumeWith(new ajb(getCredentialException));
        }
    }

    @Override // defpackage.i41
    public void f(v31 v31Var, zcb zcbVar) {
        boolean z = zcbVar.a.q;
        x51 x51Var = this.a;
        if (z) {
            x51Var.resumeWith(zcbVar.b);
        } else {
            x51Var.resumeWith(new ajb(new HttpException(zcbVar)));
        }
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        this.a.resumeWith(new ajb(exc));
    }

    @Override // defpackage.ah2
    public void onResult(Object obj) {
        k95 k95Var = (k95) obj;
        k95Var.getClass();
        x51 x51Var = this.a;
        if (x51Var.r() instanceof ai8) {
            x51Var.resumeWith(k95Var);
        }
    }

    @Override // defpackage.i41
    public void w(v31 v31Var, Throwable th) {
        v31Var.getClass();
        this.a.resumeWith(new ajb(th));
    }
}
