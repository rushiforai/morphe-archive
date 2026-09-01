package defpackage;

import android.os.CancellationSignal;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ii2 implements br8 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ ah2 b;
    public final /* synthetic */ Executor c;
    public final /* synthetic */ CancellationSignal d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ ii2(i95 i95Var, GetCredentialController getCredentialController, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal) {
        this.e = i95Var;
        this.f = getCredentialController;
        this.b = ah2Var;
        this.c = executor;
        this.d = cancellationSignal;
    }

    @Override // defpackage.br8
    public final void onFailure(Exception exc) {
        int i = this.a;
        Object obj = this.f;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$6((CredentialProviderPlayServicesImpl) obj2, (jo1) obj, this.d, this.c, this.b, exc);
                break;
            default:
                GetCredentialController.invokePlayServices$lambda$2((i95) obj2, (GetCredentialController) obj, this.b, this.c, this.d, exc);
                break;
        }
    }

    public /* synthetic */ ii2(CredentialProviderPlayServicesImpl credentialProviderPlayServicesImpl, jo1 jo1Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var) {
        this.e = credentialProviderPlayServicesImpl;
        this.f = jo1Var;
        this.d = cancellationSignal;
        this.c = executor;
        this.b = ah2Var;
    }
}
