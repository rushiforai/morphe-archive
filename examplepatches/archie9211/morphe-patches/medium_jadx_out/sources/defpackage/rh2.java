package defpackage;

import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.blockstore.createrestorecredential.CredentialProviderCreateRestoreCredentialController;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.signalcredentialstate.SignalCredentialStateController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rh2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ ah2 b;
    public final /* synthetic */ rya c;

    public /* synthetic */ rh2(ah2 ah2Var, rya ryaVar, int i) {
        this.a = i;
        this.b = ah2Var;
        this.c = ryaVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        rya ryaVar = this.c;
        ah2 ah2Var = this.b;
        switch (i) {
            case 0:
                CredentialProviderCreateRestoreCredentialController.invokePlayServices$lambda$2$0$0(ah2Var, ryaVar);
                break;
            case 1:
                CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$2$0$0(ah2Var, ryaVar);
                break;
            case 2:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$3$0$0(ah2Var, ryaVar);
                break;
            default:
                SignalCredentialStateController.invokePlayServices$lambda$2$0(ah2Var, ryaVar);
                break;
        }
    }
}
