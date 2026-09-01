package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jxb {
    public static final ax a = new ax(Float.NaN, Float.NaN);
    public static final hud b = new hud(new dsb(4), new dsb(5));
    public static final long c;
    public static final wlc d;

    static {
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(0.01f)) << 32) | (((long) Float.floatToRawIntBits(0.01f)) & 4294967295L);
        c = jFloatToRawIntBits;
        d = new wlc(new ip8(jFloatToRawIntBits));
    }
}
