package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ueg {
    public static final cig a = new cig(xcg.class, xwf.class);
    public static final cig b = new cig(jdg.class, vwf.class);
    public static final ngg c;
    public static final bgg d;
    public static final z0g e;

    static {
        trg.B();
        c = new ngg("type.googleapis.com/google.crypto.tink.HpkePrivateKey", zrg.ASYMMETRIC_PRIVATE);
        zrg zrgVar = zrg.ASYMMETRIC_PUBLIC;
        xrg.C();
        d = new bgg("type.googleapis.com/google.crypto.tink.HpkePublicKey", zrgVar);
        e = new z0g(11);
    }
}
