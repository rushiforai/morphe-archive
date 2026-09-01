package defpackage;

import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bg2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CreatePublicKeyCredentialController b;

    public /* synthetic */ bg2(CreatePublicKeyCredentialController createPublicKeyCredentialController, int i) {
        this.a = i;
        this.b = createPublicKeyCredentialController;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        CreatePublicKeyCredentialController createPublicKeyCredentialController = this.b;
        switch (i) {
            case 0:
                return CreatePublicKeyCredentialController.handleResponse$lambda$2(createPublicKeyCredentialController);
            default:
                return CreatePublicKeyCredentialController.invokePlayServices$lambda$0$1(createPublicKeyCredentialController);
        }
    }
}
