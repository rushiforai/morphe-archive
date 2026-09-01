package defpackage;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lh2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CredentialProviderCreatePublicKeyCredentialController b;
    public final /* synthetic */ CreateCredentialException c;

    public /* synthetic */ lh2(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException, int i) {
        this.a = i;
        this.b = credentialProviderCreatePublicKeyCredentialController;
        this.c = createCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        CreateCredentialException createCredentialException = this.c;
        CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController = this.b;
        switch (i) {
            case 0:
                CredentialProviderCreatePublicKeyCredentialController.invokePlayServices$lambda$4$0$0(credentialProviderCreatePublicKeyCredentialController, createCredentialException);
                break;
            case 1:
                CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$3$0(credentialProviderCreatePublicKeyCredentialController, createCredentialException);
                break;
            default:
                CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$1$0(credentialProviderCreatePublicKeyCredentialController, createCredentialException);
                break;
        }
    }
}
