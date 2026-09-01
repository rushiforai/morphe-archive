package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cvg {
    public static final cvg b = new cvg(new ubg(2));
    public static final cvg c = new cvg(new s7g());
    public static final cvg d;
    public static final cvg e;
    public static final cvg f;
    public final fvg a;

    static {
        new cvg(new b9g());
        new cvg(new e9g());
        d = new cvg(new ybg());
        e = new cvg(new y8g());
        f = new cvg(new wbg());
    }

    public cvg(jvg jvgVar) {
        if (oag.a()) {
            this.a = new eoc(jvgVar);
        } else if ("The Android Project".equals(System.getProperty("java.vendor"))) {
            this.a = new avg(jvgVar, 0);
        } else {
            this.a = new avg(jvgVar, 1);
        }
    }
}
