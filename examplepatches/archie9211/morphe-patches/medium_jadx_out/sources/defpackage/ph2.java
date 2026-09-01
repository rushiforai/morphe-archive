package defpackage;

import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ph2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CredentialProviderCreatePublicKeyCredentialController b;
    public final /* synthetic */ Throwable c;

    public /* synthetic */ ph2(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, Throwable th, int i) {
        this.a = i;
        this.b = credentialProviderCreatePublicKeyCredentialController;
        this.c = th;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Throwable th = this.c;
        CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController = this.b;
        switch (i) {
            case 0:
                CredentialProviderCreatePublicKeyCredentialController.invokePlayServices$lambda$1$0(credentialProviderCreatePublicKeyCredentialController, th);
                break;
            default:
                CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$6$0(credentialProviderCreatePublicKeyCredentialController, th);
                break;
        }
    }
}
