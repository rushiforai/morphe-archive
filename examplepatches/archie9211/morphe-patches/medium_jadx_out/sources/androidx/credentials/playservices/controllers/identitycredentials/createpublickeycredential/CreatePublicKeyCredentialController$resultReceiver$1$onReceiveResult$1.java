package androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import defpackage.b55;
import defpackage.x55;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
public final /* synthetic */ class CreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1 extends x55 implements b55 {
    public CreatePublicKeyCredentialController$resultReceiver$1$onReceiveResult$1(Object obj) {
        super(2, 0, CredentialProviderBaseController.Companion.class, obj, "createCredentialExceptionTypeToException", "createCredentialExceptionTypeToException$credentials_play_services_auth(Ljava/lang/String;Ljava/lang/String;)Landroidx/credentials/exceptions/CreateCredentialException;");
    }

    @Override // defpackage.b55
    public final CreateCredentialException invoke(String str, String str2) {
        return ((CredentialProviderBaseController.Companion) this.receiver).createCredentialExceptionTypeToException$credentials_play_services_auth(str, str2);
    }
}
