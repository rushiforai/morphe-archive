package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lv1 {
    public static final float[] a;
    public static final float[] b;
    public static final krd c;
    public static final krd d;
    public static final dkb e;
    public static final dkb f;
    public static final dkb g;
    public static final dkb h;
    public static final dkb i;
    public static final dkb j;
    public static final dkb k;
    public static final dkb l;
    public static final dkb m;
    public static final dkb n;
    public static final dkb o;
    public static final dkb p;
    public static final dkb q;
    public static final dkb r;
    public static final bo6 s;
    public static final bo6 t;
    public static final dkb u;
    public static final dkb v;
    public static final dkb w;
    public static final xp8 x;
    public static final jv1[] y;

    static {
        float[] fArr = {0.64f, 0.33f, 0.3f, 0.6f, 0.15f, 0.06f};
        a = fArr;
        float[] fArr2 = {0.67f, 0.33f, 0.21f, 0.71f, 0.14f, 0.08f};
        b = fArr2;
        float[] fArr3 = {0.708f, 0.292f, 0.17f, 0.797f, 0.131f, 0.046f};
        krd krdVar = new krd(2.4d, 0.9478672985781991d, 0.05213270142180095d, 0.07739938080495357d, 0.04045d);
        krd krdVar2 = new krd(2.2d, 0.9478672985781991d, 0.05213270142180095d, 0.07739938080495357d, 0.04045d);
        krd krdVar3 = new krd(-3.0d, 2.0d, 2.0d, 5.591816309728916d, 0.28466892d, 0.55991073d, -0.685490157d);
        c = krdVar3;
        krd krdVar4 = new krd(-2.0d, -1.555223d, 1.860454d, 0.012683313515655966d, 18.8515625d, -18.6875d, 6.277394636015326d);
        d = krdVar4;
        u2f u2fVar = gsa.j;
        dkb dkbVar = new dkb("sRGB IEC61966-2.1", fArr, u2fVar, krdVar, 0);
        e = dkbVar;
        dkb dkbVar2 = new dkb("sRGB IEC61966-2.1 (Linear)", fArr, u2fVar, 1.0d, 0.0f, 1.0f, 1);
        f = dkbVar2;
        dkb dkbVar3 = new dkb("scRGB-nl IEC 61966-2-2:2003", fArr, u2fVar, null, new ay0(13), new ay0(14), -0.799f, 2.399f, krdVar, 2);
        g = dkbVar3;
        dkb dkbVar4 = new dkb("scRGB IEC 61966-2-2:2003", fArr, u2fVar, 1.0d, -0.5f, 7.499f, 3);
        h = dkbVar4;
        dkb dkbVar5 = new dkb("Rec. ITU-R BT.709-5", new float[]{0.64f, 0.33f, 0.3f, 0.6f, 0.15f, 0.06f}, u2fVar, new krd(2.2222222222222223d, 0.9099181073703367d, 0.09008189262966333d, 0.2222222222222222d, 0.081d), 4);
        i = dkbVar5;
        dkb dkbVar6 = new dkb("Rec. ITU-R BT.2020-1", new float[]{0.708f, 0.292f, 0.17f, 0.797f, 0.131f, 0.046f}, u2fVar, new krd(2.2222222222222223d, 0.9096697898662786d, 0.09033021013372146d, 0.2222222222222222d, 0.08145d), 5);
        j = dkbVar6;
        dkb dkbVar7 = new dkb("SMPTE RP 431-2-2007 DCI (P3)", new float[]{0.68f, 0.32f, 0.265f, 0.69f, 0.15f, 0.06f}, new u2f(0.314f, 0.351f), 2.6d, 0.0f, 1.0f, 6);
        k = dkbVar7;
        dkb dkbVar8 = new dkb("Display P3", new float[]{0.68f, 0.32f, 0.265f, 0.69f, 0.15f, 0.06f}, u2fVar, krdVar, 7);
        l = dkbVar8;
        double d2 = 0.2222222222222222d;
        double d3 = 0.081d;
        double d4 = 2.2222222222222223d;
        double d5 = 0.9099181073703367d;
        double d6 = 0.09008189262966333d;
        dkb dkbVar9 = new dkb("NTSC (1953)", fArr2, gsa.g, new krd(d4, d5, d6, d2, d3), 8);
        m = dkbVar9;
        dkb dkbVar10 = new dkb("SMPTE-C RGB", new float[]{0.63f, 0.34f, 0.31f, 0.595f, 0.155f, 0.07f}, u2fVar, new krd(d4, d5, d6, d2, d3), 9);
        n = dkbVar10;
        dkb dkbVar11 = new dkb("Adobe RGB (1998)", new float[]{0.64f, 0.33f, 0.21f, 0.71f, 0.15f, 0.06f}, u2fVar, 2.2d, 0.0f, 1.0f, 10);
        o = dkbVar11;
        dkb dkbVar12 = new dkb("ROMM RGB ISO 22028-2:2013", new float[]{0.7347f, 0.2653f, 0.1596f, 0.8404f, 0.0366f, 1.0E-4f}, gsa.h, new krd(1.8d, 1.0d, 0.0d, 0.0625d, 0.031248d), 11);
        p = dkbVar12;
        u2f u2fVar2 = gsa.i;
        dkb dkbVar13 = new dkb("SMPTE ST 2065-1:2012 ACES", new float[]{0.7347f, 0.2653f, 0.0f, 1.0f, 1.0E-4f, -0.077f}, u2fVar2, 1.0d, -65504.0f, 65504.0f, 12);
        q = dkbVar13;
        dkb dkbVar14 = new dkb("Academy S-2014-004 ACEScg", new float[]{0.713f, 0.293f, 0.165f, 0.83f, 0.128f, 0.044f}, u2fVar2, 1.0d, -65504.0f, 65504.0f, 13);
        r = dkbVar14;
        bo6 bo6Var = new bo6(14, 1, 12884901889L, "Generic XYZ");
        s = bo6Var;
        bo6 bo6Var2 = new bo6(15, 0, 12884901890L, "Generic L*a*b*");
        t = bo6Var2;
        dkb dkbVar15 = new dkb("None", fArr, u2fVar, krdVar2, 16);
        u = dkbVar15;
        dkb dkbVar16 = new dkb("Hybrid Log Gamma encoding", fArr3, u2fVar, null, new ay0(15), new ay0(16), 0.0f, 1.0f, krdVar3, 17);
        v = dkbVar16;
        dkb dkbVar17 = new dkb("Perceptual Quantizer encoding", fArr3, u2fVar, null, new ay0(17), new ay0(18), 0.0f, 1.0f, krdVar4, 18);
        w = dkbVar17;
        xp8 xp8Var = new xp8("Oklab", 19, 12884901890L);
        x = xp8Var;
        y = new jv1[]{dkbVar, dkbVar2, dkbVar3, dkbVar4, dkbVar5, dkbVar6, dkbVar7, dkbVar8, dkbVar9, dkbVar10, dkbVar11, dkbVar12, dkbVar13, dkbVar14, bo6Var, bo6Var2, dkbVar15, dkbVar16, dkbVar17, xp8Var};
    }

    public static double a(krd krdVar, double d2) {
        double d3 = d2 < 0.0d ? -1.0d : 1.0d;
        double d4 = d2 * d3;
        double d5 = krdVar.b;
        double d6 = krdVar.c;
        double d7 = krdVar.d;
        double d8 = krdVar.e;
        double d9 = krdVar.f;
        double d10 = d5 * d4;
        return (krdVar.g + 1.0d) * d3 * (d10 <= 1.0d ? Math.pow(d10, d6) : Math.exp((d4 - d9) * d7) + d8);
    }

    public static double b(krd krdVar, double d2) {
        double d3 = d2 < 0.0d ? -1.0d : 1.0d;
        double d4 = 1.0d / krdVar.b;
        double d5 = 1.0d / krdVar.c;
        double d6 = 1.0d / krdVar.d;
        double d7 = krdVar.e;
        double d8 = krdVar.f;
        double d9 = (d2 * d3) / (krdVar.g + 1.0d);
        return d3 * (d9 <= 1.0d ? Math.pow(d9, d5) * d4 : (Math.log(d9 - d7) * d6) + d8);
    }

    public static double c(krd krdVar, double d2) {
        double d3 = d2 < 0.0d ? -1.0d : 1.0d;
        double d4 = d2 * d3;
        double d5 = krdVar.b;
        double d6 = krdVar.d;
        double dPow = (Math.pow(d4, d6) * krdVar.c) + d5;
        return Math.pow((dPow >= 0.0d ? dPow : 0.0d) / ((Math.pow(d4, d6) * krdVar.f) + krdVar.e), krdVar.g) * d3;
    }

    public static double d(krd krdVar, double d2) {
        double d3 = d2 < 0.0d ? -1.0d : 1.0d;
        double d4 = d2 * d3;
        double d5 = -krdVar.b;
        double d6 = krdVar.e;
        double d7 = 1.0d / krdVar.g;
        return Math.pow(Math.max((Math.pow(d4, d7) * d6) + d5, 0.0d) / ((Math.pow(d4, d7) * (-krdVar.f)) + krdVar.c), 1.0d / krdVar.d) * d3;
    }
}
