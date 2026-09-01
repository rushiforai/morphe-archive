package defpackage;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w4g extends mo7 implements Serializable {
    public final MessageDigest e;
    public final int f;
    public final boolean g;
    public final String h;

    /* JADX WARN: Illegal instructions before constructor call */
    public w4g() {
        boolean z = false;
        super(z);
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            this.e = messageDigest;
            this.f = messageDigest.getDigestLength();
            this.h = "Hashing.sha256()";
            try {
                messageDigest.clone();
                z = true;
            } catch (CloneNotSupportedException unused) {
            }
            this.g = z;
        } catch (NoSuchAlgorithmException e) {
            ay0.d(e);
            throw null;
        }
    }

    @Override // defpackage.mo7
    public final String toString() {
        return this.h;
    }
}
