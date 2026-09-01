package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ds0 {
    public static final ds0 CLEAR;
    public static final ds0 COLOR;
    public static final ds0 COLOR_BURN;
    public static final ds0 COLOR_DODGE;
    public static final ds0 DARKEN;
    public static final ds0 DIFFERENCE;
    public static final ds0 DST;
    public static final ds0 DST_ATOP;
    public static final ds0 DST_IN;
    public static final ds0 DST_OUT;
    public static final ds0 DST_OVER;
    public static final ds0 EXCLUSION;
    public static final ds0 HARD_LIGHT;
    public static final ds0 HUE;
    public static final ds0 LIGHTEN;
    public static final ds0 LUMINOSITY;
    public static final ds0 MODULATE;
    public static final ds0 MULTIPLY;
    public static final ds0 OVERLAY;
    public static final ds0 PLUS;
    public static final ds0 SATURATION;
    public static final ds0 SCREEN;
    public static final ds0 SOFT_LIGHT;
    public static final ds0 SRC;
    public static final ds0 SRC_ATOP;
    public static final ds0 SRC_IN;
    public static final ds0 SRC_OUT;
    public static final ds0 SRC_OVER;
    public static final ds0 XOR;
    public static final /* synthetic */ ds0[] a;

    static {
        ds0 ds0Var = new ds0("CLEAR", 0);
        CLEAR = ds0Var;
        ds0 ds0Var2 = new ds0("SRC", 1);
        SRC = ds0Var2;
        ds0 ds0Var3 = new ds0("DST", 2);
        DST = ds0Var3;
        ds0 ds0Var4 = new ds0("SRC_OVER", 3);
        SRC_OVER = ds0Var4;
        ds0 ds0Var5 = new ds0("DST_OVER", 4);
        DST_OVER = ds0Var5;
        ds0 ds0Var6 = new ds0("SRC_IN", 5);
        SRC_IN = ds0Var6;
        ds0 ds0Var7 = new ds0("DST_IN", 6);
        DST_IN = ds0Var7;
        ds0 ds0Var8 = new ds0("SRC_OUT", 7);
        SRC_OUT = ds0Var8;
        ds0 ds0Var9 = new ds0("DST_OUT", 8);
        DST_OUT = ds0Var9;
        ds0 ds0Var10 = new ds0("SRC_ATOP", 9);
        SRC_ATOP = ds0Var10;
        ds0 ds0Var11 = new ds0("DST_ATOP", 10);
        DST_ATOP = ds0Var11;
        ds0 ds0Var12 = new ds0("XOR", 11);
        XOR = ds0Var12;
        ds0 ds0Var13 = new ds0("PLUS", 12);
        PLUS = ds0Var13;
        ds0 ds0Var14 = new ds0("MODULATE", 13);
        MODULATE = ds0Var14;
        ds0 ds0Var15 = new ds0("SCREEN", 14);
        SCREEN = ds0Var15;
        ds0 ds0Var16 = new ds0("OVERLAY", 15);
        OVERLAY = ds0Var16;
        ds0 ds0Var17 = new ds0("DARKEN", 16);
        DARKEN = ds0Var17;
        ds0 ds0Var18 = new ds0("LIGHTEN", 17);
        LIGHTEN = ds0Var18;
        ds0 ds0Var19 = new ds0("COLOR_DODGE", 18);
        COLOR_DODGE = ds0Var19;
        ds0 ds0Var20 = new ds0("COLOR_BURN", 19);
        COLOR_BURN = ds0Var20;
        ds0 ds0Var21 = new ds0("HARD_LIGHT", 20);
        HARD_LIGHT = ds0Var21;
        ds0 ds0Var22 = new ds0("SOFT_LIGHT", 21);
        SOFT_LIGHT = ds0Var22;
        ds0 ds0Var23 = new ds0("DIFFERENCE", 22);
        DIFFERENCE = ds0Var23;
        ds0 ds0Var24 = new ds0("EXCLUSION", 23);
        EXCLUSION = ds0Var24;
        ds0 ds0Var25 = new ds0("MULTIPLY", 24);
        MULTIPLY = ds0Var25;
        ds0 ds0Var26 = new ds0("HUE", 25);
        HUE = ds0Var26;
        ds0 ds0Var27 = new ds0("SATURATION", 26);
        SATURATION = ds0Var27;
        ds0 ds0Var28 = new ds0("COLOR", 27);
        COLOR = ds0Var28;
        ds0 ds0Var29 = new ds0("LUMINOSITY", 28);
        LUMINOSITY = ds0Var29;
        a = new ds0[]{ds0Var, ds0Var2, ds0Var3, ds0Var4, ds0Var5, ds0Var6, ds0Var7, ds0Var8, ds0Var9, ds0Var10, ds0Var11, ds0Var12, ds0Var13, ds0Var14, ds0Var15, ds0Var16, ds0Var17, ds0Var18, ds0Var19, ds0Var20, ds0Var21, ds0Var22, ds0Var23, ds0Var24, ds0Var25, ds0Var26, ds0Var27, ds0Var28, ds0Var29};
    }

    public static ds0 valueOf(String str) {
        return (ds0) Enum.valueOf(ds0.class, str);
    }

    public static ds0[] values() {
        return (ds0[]) a.clone();
    }
}
