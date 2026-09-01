package defpackage;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mig extends rr7 implements Serializable {
    public final MessageDigest d;
    public final int e;
    public final boolean f;
    public final String g;

    public mig() {
        boolean z;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            this.d = messageDigest;
            this.e = messageDigest.getDigestLength();
            this.g = "Hashing.sha256()";
            try {
                messageDigest.clone();
                z = true;
            } catch (CloneNotSupportedException unused) {
                z = false;
            }
            this.f = z;
        } catch (NoSuchAlgorithmException e) {
            ay0.d(e);
            throw null;
        }
    }

    public final String toString() {
        return this.g;
    }
}
