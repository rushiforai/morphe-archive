package defpackage;

import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class di2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CredentialProviderGetSignInIntentController b;
    public final /* synthetic */ GetCredentialException c;

    public /* synthetic */ di2(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, GetCredentialException getCredentialException, int i) {
        this.a = i;
        this.b = credentialProviderGetSignInIntentController;
        this.c = getCredentialException;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        GetCredentialException getCredentialException = this.c;
        CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController = this.b;
        switch (i) {
            case 0:
                return CredentialProviderGetSignInIntentController.handleResponse$lambda$4(credentialProviderGetSignInIntentController, getCredentialException);
            default:
                return CredentialProviderGetSignInIntentController.invokePlayServices$lambda$3$0(credentialProviderGetSignInIntentController, getCredentialException);
        }
    }
}
