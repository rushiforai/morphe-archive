package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hl0 {
    public static final hl0 L;
    public static final hl0 M;
    public static final hl0 S;
    public static final hl0 XL;
    public static final hl0 XS;
    public static final hl0 XXL;
    public static final hl0 XXS;
    public static final hl0 XXXS;
    public static final hl0 XXXXS;
    public static final /* synthetic */ hl0[] c;
    public static final /* synthetic */ i04 d;
    public final float a;
    public final xj3 b;

    static {
        hl0 hl0Var = new hl0("XXL", 0, 128.0f, new xj3((((long) Float.floatToRawIntBits(72.0f)) << 32) | (((long) Float.floatToRawIntBits(-16.0f)) & 4294967295L)));
        XXL = hl0Var;
        hl0 hl0Var2 = new hl0("XL", 1, 80.0f, new xj3((((long) Float.floatToRawIntBits(45.0f)) << 32) | (((long) Float.floatToRawIntBits(-10.0f)) & 4294967295L)));
        XL = hl0Var2;
        hl0 hl0Var3 = new hl0("L", 2, 64.0f, new xj3((((long) Float.floatToRawIntBits(36.0f)) << 32) | (((long) Float.floatToRawIntBits(-8.0f)) & 4294967295L)));
        L = hl0Var3;
        hl0 hl0Var4 = new hl0("M", 3, 48.0f, new xj3((((long) Float.floatToRawIntBits(27.0f)) << 32) | (((long) Float.floatToRawIntBits(-6.0f)) & 4294967295L)));
        M = hl0Var4;
        hl0 hl0Var5 = new hl0("S", 4, 40.0f, new xj3((((long) Float.floatToRawIntBits(23.0f)) << 32) | (((long) Float.floatToRawIntBits(-5.0f)) & 4294967295L)));
        S = hl0Var5;
        hl0 hl0Var6 = new hl0("XS", 5, 32.0f, new xj3((((long) Float.floatToRawIntBits(-4.0f)) & 4294967295L) | (((long) Float.floatToRawIntBits(18.0f)) << 32)));
        XS = hl0Var6;
        hl0 hl0Var7 = new hl0("XXS", 6, 28.0f, new xj3((((long) Float.floatToRawIntBits(-4.0f)) & 4294967295L) | (((long) Float.floatToRawIntBits(16.0f)) << 32)));
        XXS = hl0Var7;
        hl0 hl0Var8 = new hl0("XXXS", 7, 20.0f, null);
        XXXS = hl0Var8;
        hl0 hl0Var9 = new hl0("XXXXS", 8, 16.0f, null);
        XXXXS = hl0Var9;
        hl0[] hl0VarArr = {hl0Var, hl0Var2, hl0Var3, hl0Var4, hl0Var5, hl0Var6, hl0Var7, hl0Var8, hl0Var9};
        c = hl0VarArr;
        d = new i04(hl0VarArr);
    }

    public hl0(String str, int i, float f, xj3 xj3Var) {
        this.a = f;
        this.b = xj3Var;
    }

    public static g04 getEntries() {
        return d;
    }

    public static hl0 valueOf(String str) {
        return (hl0) Enum.valueOf(hl0.class, str);
    }

    public static hl0[] values() {
        return (hl0[]) c.clone();
    }

    /* JADX INFO: renamed from: getMemberIconDpOffset-Ctc3-3Q, reason: not valid java name */
    public final xj3 m113getMemberIconDpOffsetCtc33Q() {
        return this.b;
    }

    /* JADX INFO: renamed from: getSize-D9Ej5fM, reason: not valid java name */
    public final float m114getSizeD9Ej5fM() {
        return this.a;
    }
}
