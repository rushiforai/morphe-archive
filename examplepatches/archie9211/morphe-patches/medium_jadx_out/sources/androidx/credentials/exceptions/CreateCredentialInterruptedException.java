package androidx.credentials.exceptions;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Landroidx/credentials/exceptions/CreateCredentialInterruptedException;", "Landroidx/credentials/exceptions/CreateCredentialException;", "credentials"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CreateCredentialInterruptedException extends CreateCredentialException {
    public CreateCredentialInterruptedException(CharSequence charSequence) {
        super(charSequence, "android.credentials.CreateCredentialException.TYPE_INTERRUPTED");
    }
}
