package defpackage;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.playservices.controllers.identityauth.createpassword.CredentialProviderCreatePasswordController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jh2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CredentialProviderCreatePasswordController b;
    public final /* synthetic */ CreateCredentialException c;

    public /* synthetic */ jh2(CredentialProviderCreatePasswordController credentialProviderCreatePasswordController, CreateCredentialException createCredentialException, int i) {
        this.a = i;
        this.b = credentialProviderCreatePasswordController;
        this.c = createCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        CreateCredentialException createCredentialException = this.c;
        CredentialProviderCreatePasswordController credentialProviderCreatePasswordController = this.b;
        switch (i) {
            case 0:
                CredentialProviderCreatePasswordController.invokePlayServices$lambda$2$0$0(credentialProviderCreatePasswordController, createCredentialException);
                break;
            default:
                CredentialProviderCreatePasswordController.handleResponse$lambda$1$0(credentialProviderCreatePasswordController, createCredentialException);
                break;
        }
    }
}
