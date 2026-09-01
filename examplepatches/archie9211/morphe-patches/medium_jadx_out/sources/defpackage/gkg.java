package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gkg {
    public static final pif a;
    public static final pif b;
    public static final uhg c;
    public static final shg d;
    public static final zfg e;
    public static final wfg f;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.HmacKey");
        d2f d2fVarB = pif.b();
        d2fVarB.F0(ntg.RAW, sjg.e);
        d2fVarB.F0(ntg.TINK, sjg.b);
        d2fVarB.F0(ntg.zzc, sjg.d);
        d2fVarB.F0(ntg.CRUNCHY, sjg.c);
        a = d2fVarB.y0();
        d2f d2fVarB2 = pif.b();
        d2fVarB2.F0(iqg.SHA1, tjg.b);
        d2fVarB2.F0(iqg.SHA224, tjg.c);
        d2fVarB2.F0(iqg.SHA256, tjg.d);
        d2fVarB2.F0(iqg.SHA384, tjg.e);
        d2fVarB2.F0(iqg.SHA512, tjg.f);
        b = d2fVarB2.y0();
        c = new uhg(ujg.class, new s9g(2));
        d = new shg(qvgVarC, new q9g(2));
        e = new zfg(kjg.class, new pbg(2));
        f = new wfg(qvgVarC, new t9g());
    }
}
