package defpackage;

import androidx.credentials.playservices.controllers.identitycredentials.createpasswordcredential.CreatePasswordCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vf2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CreatePasswordCredentialController b;

    public /* synthetic */ vf2(CreatePasswordCredentialController createPasswordCredentialController, int i) {
        this.a = i;
        this.b = createPasswordCredentialController;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        CreatePasswordCredentialController createPasswordCredentialController = this.b;
        switch (i) {
            case 0:
                CreatePasswordCredentialController.invokePlayServices$lambda$0$0$0(createPasswordCredentialController);
                break;
            default:
                CreatePasswordCredentialController.handleResponse$lambda$2$0(createPasswordCredentialController);
                break;
        }
    }
}
