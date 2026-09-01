package androidx.credentials.exceptions.publickeycredential;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b&\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Landroidx/credentials/exceptions/publickeycredential/SignalCredentialStateException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "credentials"}, k = 1, mv = {2, 1, 0}, xi = 48)
public abstract class SignalCredentialStateException extends Exception {
    public static final /* synthetic */ int a = 0;

    public SignalCredentialStateException(String str, String str2) {
        super(str2 != null ? str2.toString() : null);
    }
}
