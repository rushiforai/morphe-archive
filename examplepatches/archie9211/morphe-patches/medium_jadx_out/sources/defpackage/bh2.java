package defpackage;

import android.content.Context;
import android.os.CancellationSignal;
import androidx.credentials.exceptions.ClearCredentialProviderConfigurationException;
import androidx.credentials.exceptions.GetCredentialProviderConfigurationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bh2 {
    public final Context a;

    public bh2(Context context) {
        context.getClass();
        this.a = context;
    }

    public final Object a(jo1 jo1Var, nz2 nz2Var) {
        x51 x51Var = new x51(1, pwd.Q(nz2Var));
        x51Var.s();
        CancellationSignal cancellationSignal = new CancellationSignal();
        x51Var.v(new xg2(cancellationSignal, 0));
        yg2 yg2Var = new yg2(x51Var);
        b70 b70Var = new b70(1);
        eh2 eh2VarA = sh2.a(new sh2(this.a, 0), jo1Var.a);
        if (eh2VarA == null) {
            yg2Var.a(new ClearCredentialProviderConfigurationException());
        } else {
            eh2VarA.onClearCredential(jo1Var, cancellationSignal, b70Var, yg2Var);
        }
        Object objQ = x51Var.q();
        return objQ == tb2.COROUTINE_SUSPENDED ? objQ : c1e.a;
    }

    public final Object b(Context context, i95 i95Var, p4d p4dVar) {
        x51 x51Var = new x51(1, pwd.Q(p4dVar));
        x51Var.s();
        CancellationSignal cancellationSignal = new CancellationSignal();
        x51Var.v(new xg2(cancellationSignal, 1));
        zg2 zg2Var = new zg2(x51Var);
        b70 b70Var = new b70(1);
        context.getClass();
        eh2 eh2VarA = sh2.a(new sh2(context, 0), i95Var);
        if (eh2VarA == null) {
            zg2Var.a(new GetCredentialProviderConfigurationException("getCredentialAsync no provider dependencies found - please ensure the desired provider dependencies are added"));
        } else {
            eh2VarA.onGetCredential(context, i95Var, cancellationSignal, b70Var, zg2Var);
        }
        return x51Var.q();
    }
}
