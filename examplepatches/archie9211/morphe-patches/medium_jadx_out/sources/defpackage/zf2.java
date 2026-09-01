package defpackage;

import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.ResponseUtils;
import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.signalcredentialstate.SignalCredentialStateController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zf2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ ah2 b;

    public /* synthetic */ zf2(ah2 ah2Var, int i) {
        this.a = i;
        this.b = ah2Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        ah2 ah2Var = this.b;
        switch (i) {
            case 0:
                CreatePublicKeyCredentialController.invokePlayServices$lambda$0$0$0(ah2Var);
                break;
            case 1:
                CreatePublicKeyCredentialController.invokePlayServices$lambda$0$3$0(ah2Var);
                break;
            case 2:
                CredentialProviderPlayServicesImpl.onGetCredential$lambda$1$0(ah2Var);
                break;
            case 3:
                CredentialProviderPlayServicesImpl.onGetCredential$lambda$0$0(ah2Var);
                break;
            case 4:
                ah2Var.onResult(null);
                break;
            case 5:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$0$0(ah2Var);
                break;
            case 6:
                CredentialProviderPlayServicesImpl.onCreateCredential$lambda$0$0(ah2Var);
                break;
            case 7:
                ah2Var.onResult(null);
                break;
            case 8:
                ah2Var.onResult(null);
                break;
            case 9:
                GetCredentialController.invokePlayServices$lambda$0$0$0(ah2Var);
                break;
            case 10:
                ResponseUtils.Companion.handleGetCredentialResponse$lambda$2$0(ah2Var);
                break;
            default:
                SignalCredentialStateController.invokePlayServices$lambda$0$0(ah2Var);
                break;
        }
    }
}
