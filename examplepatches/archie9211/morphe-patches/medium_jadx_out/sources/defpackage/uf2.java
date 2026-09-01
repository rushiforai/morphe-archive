package defpackage;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.playservices.controllers.identitycredentials.createpasswordcredential.CreatePasswordCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class uf2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CreatePasswordCredentialController b;
    public final /* synthetic */ CreateCredentialException c;

    public /* synthetic */ uf2(CreatePasswordCredentialController createPasswordCredentialController, CreateCredentialException createCredentialException, int i) {
        this.a = i;
        this.b = createPasswordCredentialController;
        this.c = createCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        CreateCredentialException createCredentialException = this.c;
        CreatePasswordCredentialController createPasswordCredentialController = this.b;
        switch (i) {
            case 0:
                CreatePasswordCredentialController.handleResponse$lambda$1$0(createPasswordCredentialController, createCredentialException);
                break;
            default:
                CreatePasswordCredentialController.handleResponse$lambda$4$0(createPasswordCredentialController, createCredentialException);
                break;
        }
    }
}
