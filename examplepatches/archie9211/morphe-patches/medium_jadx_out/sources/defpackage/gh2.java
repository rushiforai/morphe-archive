package defpackage;

import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gh2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CredentialProviderBeginSignInController b;
    public final /* synthetic */ GetCredentialException c;

    public /* synthetic */ gh2(CredentialProviderBeginSignInController credentialProviderBeginSignInController, GetCredentialException getCredentialException, int i) {
        this.a = i;
        this.b = credentialProviderBeginSignInController;
        this.c = getCredentialException;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        GetCredentialException getCredentialException = this.c;
        CredentialProviderBeginSignInController credentialProviderBeginSignInController = this.b;
        switch (i) {
            case 0:
                return CredentialProviderBeginSignInController.handleResponse$lambda$4(credentialProviderBeginSignInController, getCredentialException);
            default:
                return CredentialProviderBeginSignInController.invokePlayServices$lambda$2$0(credentialProviderBeginSignInController, getCredentialException);
        }
    }
}
