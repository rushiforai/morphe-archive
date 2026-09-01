package defpackage;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class df2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ CreateDigitalCredentialController b;
    public final /* synthetic */ CreateCredentialException c;

    public /* synthetic */ df2(CreateDigitalCredentialController createDigitalCredentialController, CreateCredentialException createCredentialException, int i) {
        this.a = i;
        this.b = createDigitalCredentialController;
        this.c = createCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        CreateCredentialException createCredentialException = this.c;
        CreateDigitalCredentialController createDigitalCredentialController = this.b;
        switch (i) {
            case 0:
                CreateDigitalCredentialController.handleResponse$lambda$3$0(createDigitalCredentialController, createCredentialException);
                break;
            default:
                CreateDigitalCredentialController.handleResponse$lambda$1$0(createDigitalCredentialController, createCredentialException);
                break;
        }
    }
}
