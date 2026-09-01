package defpackage;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cg2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CreatePublicKeyCredentialController b;
    public final /* synthetic */ CreateCredentialException c;

    public /* synthetic */ cg2(CreatePublicKeyCredentialController createPublicKeyCredentialController, CreateCredentialException createCredentialException, int i) {
        this.a = i;
        this.b = createPublicKeyCredentialController;
        this.c = createCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        CreateCredentialException createCredentialException = this.c;
        CreatePublicKeyCredentialController createPublicKeyCredentialController = this.b;
        switch (i) {
            case 0:
                CreatePublicKeyCredentialController.handleResponse$lambda$1$0(createPublicKeyCredentialController, createCredentialException);
                break;
            default:
                CreatePublicKeyCredentialController.handleResponse$lambda$4$0(createPublicKeyCredentialController, createCredentialException);
                break;
        }
    }
}
