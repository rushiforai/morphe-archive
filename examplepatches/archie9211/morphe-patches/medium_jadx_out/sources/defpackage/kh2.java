package defpackage;

import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kh2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CredentialProviderCreatePublicKeyCredentialController b;
    public final /* synthetic */ JSONException c;

    public /* synthetic */ kh2(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, JSONException jSONException, int i) {
        this.a = i;
        this.b = credentialProviderCreatePublicKeyCredentialController;
        this.c = jSONException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        JSONException jSONException = this.c;
        CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController = this.b;
        switch (i) {
            case 0:
                CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$5$0(credentialProviderCreatePublicKeyCredentialController, jSONException);
                break;
            default:
                CredentialProviderCreatePublicKeyCredentialController.invokePlayServices$lambda$0$0(credentialProviderCreatePublicKeyCredentialController, jSONException);
                break;
        }
    }
}
