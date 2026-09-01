package defpackage;

import android.os.CancellationSignal;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ai2 implements br8 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CancellationSignal b;
    public final /* synthetic */ Executor c;
    public final /* synthetic */ ah2 d;

    public /* synthetic */ ai2(CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var, int i) {
        this.a = i;
        this.b = cancellationSignal;
        this.c = executor;
        this.d = ah2Var;
    }

    @Override // defpackage.br8
    public final void onFailure(Exception exc) {
        int i = this.a;
        ah2 ah2Var = this.d;
        Executor executor = this.c;
        CancellationSignal cancellationSignal = this.b;
        switch (i) {
            case 0:
                CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$2(cancellationSignal, executor, ah2Var, exc);
                break;
            default:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$3(cancellationSignal, executor, ah2Var, exc);
                break;
        }
    }
}
