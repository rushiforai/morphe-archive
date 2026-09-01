package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ro7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ long c;
    public final /* synthetic */ long d;
    public final /* synthetic */ c09 e;
    public final /* synthetic */ long f;

    public /* synthetic */ ro7(boolean z, long j, long j2, c09 c09Var, long j3, int i) {
        this.a = i;
        this.b = z;
        this.c = j;
        this.d = j2;
        this.e = c09Var;
        this.f = j3;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        zl3 zl3Var;
        long j;
        int i = this.a;
        c1e c1eVar = c1e.a;
        long j2 = this.f;
        boolean z = this.b;
        switch (i) {
            case 0:
                c09 c09Var = this.e;
                zl3Var = (zl3) obj;
                zl3Var.getClass();
                if (z) {
                    float fZ = zl3Var.Z(18.0f);
                    long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fZ)) << 32) | (((long) Float.floatToRawIntBits(fZ)) & 4294967295L);
                    float fZ2 = zl3Var.Z(2.0f);
                    float fZ3 = zl3Var.Z(2.0f);
                    ho2.t(zl3Var, this.c, jFloatToRawIntBits, (((long) Float.floatToRawIntBits(fZ2)) << 32) | (((long) Float.floatToRawIntBits(fZ3)) & 4294967295L), ph4.R);
                    j = j2;
                } else {
                    float fZ4 = zl3Var.Z(1.0f);
                    float fZ5 = zl3Var.Z(18.0f) - (fZ4 / 2.0f);
                    j = j2;
                    long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(fZ5)) << 32) | (((long) Float.floatToRawIntBits(fZ5)) & 4294967295L);
                    float fZ6 = zl3Var.Z(2.0f);
                    float fZ7 = zl3Var.Z(2.0f);
                    ho2.t(zl3Var, this.d, jFloatToRawIntBits2, (((long) Float.floatToRawIntBits(fZ6)) << 32) | (((long) Float.floatToRawIntBits(fZ7)) & 4294967295L), new uuc(fZ4, 0.0f, 0, 0, 30));
                }
                if (z) {
                    ((md5) zl3Var.b0().b).C(zl3Var.Z(1.0f), zl3Var.Z(1.0f));
                    try {
                        c09Var.g(zl3Var, c09Var.h(), 1.0f, new bs0(5, j));
                    } finally {
                    }
                }
                return c1eVar;
            default:
                c09 c09Var2 = this.e;
                zl3Var = (zl3) obj;
                zl3Var.getClass();
                if (z) {
                    float fZ8 = zl3Var.Z(18.0f);
                    long jFloatToRawIntBits3 = (((long) Float.floatToRawIntBits(fZ8)) << 32) | (((long) Float.floatToRawIntBits(fZ8)) & 4294967295L);
                    float fZ9 = zl3Var.Z(2.0f);
                    float fZ10 = zl3Var.Z(2.0f);
                    ho2.t(zl3Var, this.c, jFloatToRawIntBits3, (((long) Float.floatToRawIntBits(fZ9)) << 32) | (((long) Float.floatToRawIntBits(fZ10)) & 4294967295L), ph4.R);
                } else {
                    float fZ11 = zl3Var.Z(1.0f);
                    float fZ12 = zl3Var.Z(18.0f) - (fZ11 / 2.0f);
                    long jFloatToRawIntBits4 = (((long) Float.floatToRawIntBits(fZ12)) << 32) | (((long) Float.floatToRawIntBits(fZ12)) & 4294967295L);
                    float fZ13 = zl3Var.Z(2.0f);
                    float fZ14 = zl3Var.Z(2.0f);
                    ho2.t(zl3Var, this.d, jFloatToRawIntBits4, (((long) Float.floatToRawIntBits(fZ13)) << 32) | (((long) Float.floatToRawIntBits(fZ14)) & 4294967295L), new uuc(fZ11, 0.0f, 0, 0, 30));
                }
                if (z) {
                    ((md5) zl3Var.b0().b).C(zl3Var.Z(1.0f), zl3Var.Z(1.0f));
                    try {
                        c09Var2.g(zl3Var, c09Var2.h(), 1.0f, new bs0(5, j2));
                    } finally {
                    }
                }
                return c1eVar;
        }
    }
}
