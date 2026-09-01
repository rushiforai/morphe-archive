package defpackage;

import android.os.Build;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zn6 {
    public static final zn6 ADD;
    public static final zn6 COLOR;
    public static final zn6 COLOR_BURN;
    public static final zn6 COLOR_DODGE;
    public static final zn6 DARKEN;
    public static final zn6 DIFFERENCE;
    public static final zn6 EXCLUSION;
    public static final zn6 HARD_LIGHT;
    public static final zn6 HARD_MIX;
    public static final zn6 HUE;
    public static final zn6 LIGHTEN;
    public static final zn6 LUMINOSITY;
    public static final zn6 MULTIPLY;
    public static final zn6 NORMAL;
    public static final zn6 OVERLAY;
    public static final zn6 SATURATION;
    public static final zn6 SCREEN;
    public static final zn6 SOFT_LIGHT;
    public static final /* synthetic */ zn6[] a;

    static {
        zn6 zn6Var = new zn6("NORMAL", 0);
        NORMAL = zn6Var;
        zn6 zn6Var2 = new zn6("MULTIPLY", 1);
        MULTIPLY = zn6Var2;
        zn6 zn6Var3 = new zn6("SCREEN", 2);
        SCREEN = zn6Var3;
        zn6 zn6Var4 = new zn6("OVERLAY", 3);
        OVERLAY = zn6Var4;
        zn6 zn6Var5 = new zn6("DARKEN", 4);
        DARKEN = zn6Var5;
        zn6 zn6Var6 = new zn6("LIGHTEN", 5);
        LIGHTEN = zn6Var6;
        zn6 zn6Var7 = new zn6("COLOR_DODGE", 6);
        COLOR_DODGE = zn6Var7;
        zn6 zn6Var8 = new zn6("COLOR_BURN", 7);
        COLOR_BURN = zn6Var8;
        zn6 zn6Var9 = new zn6("HARD_LIGHT", 8);
        HARD_LIGHT = zn6Var9;
        zn6 zn6Var10 = new zn6("SOFT_LIGHT", 9);
        SOFT_LIGHT = zn6Var10;
        zn6 zn6Var11 = new zn6("DIFFERENCE", 10);
        DIFFERENCE = zn6Var11;
        zn6 zn6Var12 = new zn6("EXCLUSION", 11);
        EXCLUSION = zn6Var12;
        zn6 zn6Var13 = new zn6("HUE", 12);
        HUE = zn6Var13;
        zn6 zn6Var14 = new zn6("SATURATION", 13);
        SATURATION = zn6Var14;
        zn6 zn6Var15 = new zn6("COLOR", 14);
        COLOR = zn6Var15;
        zn6 zn6Var16 = new zn6("LUMINOSITY", 15);
        LUMINOSITY = zn6Var16;
        zn6 zn6Var17 = new zn6("ADD", 16);
        ADD = zn6Var17;
        zn6 zn6Var18 = new zn6("HARD_MIX", 17);
        HARD_MIX = zn6Var18;
        a = new zn6[]{zn6Var, zn6Var2, zn6Var3, zn6Var4, zn6Var5, zn6Var6, zn6Var7, zn6Var8, zn6Var9, zn6Var10, zn6Var11, zn6Var12, zn6Var13, zn6Var14, zn6Var15, zn6Var16, zn6Var17, zn6Var18};
    }

    public static zn6 valueOf(String str) {
        return (zn6) Enum.valueOf(zn6.class, str);
    }

    public static zn6[] values() {
        return (zn6[]) a.clone();
    }

    public ds0 toNativeBlendMode() {
        switch (yn6.a[ordinal()]) {
            case 2:
                return Build.VERSION.SDK_INT >= 29 ? ds0.MULTIPLY : ds0.MODULATE;
            case 3:
                return ds0.SCREEN;
            case 4:
                return ds0.OVERLAY;
            case 5:
                return ds0.DARKEN;
            case 6:
                return ds0.LIGHTEN;
            case 7:
                return ds0.PLUS;
            default:
                return null;
        }
    }
}
