package defpackage;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.MessageDigest;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p4g {
    public final MessageDigest a;
    public final int b;
    public boolean c;

    public p4g(MessageDigest messageDigest, int i, int i2) {
        switch (i2) {
            case 1:
                this.a = messageDigest;
                this.b = i;
                break;
            default:
                ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
                this.a = messageDigest;
                this.b = i;
                break;
        }
    }
}
