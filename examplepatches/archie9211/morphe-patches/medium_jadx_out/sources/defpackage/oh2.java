package defpackage;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oh2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CredentialProviderCreatePublicKeyCredentialController b;
    public final /* synthetic */ CreateCredentialException c;

    public /* synthetic */ oh2(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialException createCredentialException, int i) {
        this.a = i;
        this.b = credentialProviderCreatePublicKeyCredentialController;
        this.c = createCredentialException;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        CreateCredentialException createCredentialException = this.c;
        CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController = this.b;
        switch (i) {
            case 0:
                return CredentialProviderCreatePublicKeyCredentialController.invokePlayServices$lambda$4$0(credentialProviderCreatePublicKeyCredentialController, createCredentialException);
            default:
                return CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$3(credentialProviderCreatePublicKeyCredentialController, createCredentialException);
        }
    }
}
