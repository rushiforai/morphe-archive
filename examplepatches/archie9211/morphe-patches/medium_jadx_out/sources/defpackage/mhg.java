package defpackage;

import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class mhg {
    public static final qvg a = qvg.a(new byte[0]);

    public static final qvg a(int i) {
        return qvg.a(ByteBuffer.allocate(5).put((byte) 0).putInt(i).array());
    }

    public static final qvg b(int i) {
        return qvg.a(ByteBuffer.allocate(5).put((byte) 1).putInt(i).array());
    }
}
