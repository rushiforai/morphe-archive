package defpackage;

import org.chromium.net.NetworkException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qq extends NetworkException {
    public qq(android.net.http.NetworkException networkException, boolean z) {
        super(networkException.getMessage(), networkException);
        if (!z && mm.h(networkException)) {
            throw new IllegalArgumentException("Translating QuicException as NetworkException results in loss of information. Make sure you handle QuicException first. See the stacktrace for where the translation is being performed, and the cause for the exception being translated.", networkException);
        }
    }
}
