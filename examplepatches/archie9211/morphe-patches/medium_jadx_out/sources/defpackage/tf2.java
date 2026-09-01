package defpackage;

import androidx.credentials.playservices.controllers.identitycredentials.createpasswordcredential.CreatePasswordCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tf2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CreatePasswordCredentialController b;

    public /* synthetic */ tf2(CreatePasswordCredentialController createPasswordCredentialController, int i) {
        this.a = i;
        this.b = createPasswordCredentialController;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        CreatePasswordCredentialController createPasswordCredentialController = this.b;
        switch (i) {
            case 0:
                return CreatePasswordCredentialController.invokePlayServices$lambda$0$0(createPasswordCredentialController);
            default:
                return CreatePasswordCredentialController.handleResponse$lambda$2(createPasswordCredentialController);
        }
    }
}
