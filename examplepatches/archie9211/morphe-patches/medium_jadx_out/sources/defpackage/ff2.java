package defpackage;

import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.blockstore.createrestorecredential.CredentialProviderCreateRestoreCredentialController;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ff2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ ah2 b;
    public final /* synthetic */ Exception c;

    public /* synthetic */ ff2(ah2 ah2Var, Exception exc, int i) {
        this.a = i;
        this.b = ah2Var;
        this.c = exc;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.a) {
            case 0:
                CreateDigitalCredentialController.invokePlayServices$lambda$2$0$0(this.b, this.c);
                break;
            case 1:
                CredentialProviderCreateRestoreCredentialController.invokePlayServices$lambda$0$1$0(this.b, this.c);
                break;
            case 2:
                CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$0$1$0(this.b, this.c);
                break;
            default:
                CredentialProviderPlayServicesImpl.runFallbackClearCredFlow$lambda$2$0$0$0(this.b, this.c);
                break;
        }
    }
}
