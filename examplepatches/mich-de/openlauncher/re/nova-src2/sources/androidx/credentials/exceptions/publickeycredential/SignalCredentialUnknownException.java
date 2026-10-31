package androidx.credentials.exceptions.publickeycredential;

import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Landroidx/credentials/exceptions/publickeycredential/SignalCredentialUnknownException;", "Landroidx/credentials/exceptions/publickeycredential/SignalCredentialStateException;", "credentials"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class SignalCredentialUnknownException extends SignalCredentialStateException {
    @JvmOverloads
    public SignalCredentialUnknownException() {
        super("androidx.credentials.SignalCredentialStateException.TYPE_UNKNOWN", null);
    }
}
