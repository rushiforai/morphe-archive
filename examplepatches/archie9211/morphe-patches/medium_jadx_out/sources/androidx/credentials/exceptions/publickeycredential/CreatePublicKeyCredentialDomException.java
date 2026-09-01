package androidx.credentials.exceptions.publickeycredential;

import defpackage.ay0;
import defpackage.k;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Landroidx/credentials/exceptions/publickeycredential/CreatePublicKeyCredentialDomException;", "Landroidx/credentials/exceptions/publickeycredential/CreatePublicKeyCredentialException;", "hlg", "credentials"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CreatePublicKeyCredentialDomException extends CreatePublicKeyCredentialException {
    public static final /* synthetic */ int c = 0;

    /* JADX WARN: Illegal instructions before constructor call */
    public CreatePublicKeyCredentialDomException(k kVar, String str) {
        String strConcat = "androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/".concat(kVar.a);
        super(str, strConcat);
        if (strConcat.length() > 0) {
            return;
        }
        ay0.e("type must not be empty");
        throw null;
    }
}
