package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class acg {
    public static final cig a = new cig(lcg.class, xwf.class);
    public static final cig b = new cig(ucg.class, vwf.class);
    public static final ngg c;
    public static final bgg d;
    public static final z0g e;

    static {
        fpg.B();
        c = new ngg("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey", zrg.ASYMMETRIC_PRIVATE);
        zrg zrgVar = zrg.ASYMMETRIC_PUBLIC;
        jpg.E();
        d = new bgg("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPublicKey", zrgVar);
        e = new z0g(10);
    }
}
