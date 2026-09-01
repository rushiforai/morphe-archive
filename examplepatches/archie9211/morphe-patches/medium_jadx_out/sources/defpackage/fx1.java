package defpackage;

import java.util.HashMap;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fx1 {
    public static final fx1 ARM64;
    public static final fx1 ARMV6;
    public static final fx1 ARMV7;
    public static final fx1 ARMV7S;
    public static final fx1 ARM_UNKNOWN;
    public static final fx1 PPC;
    public static final fx1 PPC64;
    public static final fx1 UNKNOWN;
    public static final fx1 X86_32;
    public static final fx1 X86_64;
    public static final HashMap a;
    public static final /* synthetic */ fx1[] b;

    static {
        fx1 fx1Var = new fx1("X86_32", 0);
        X86_32 = fx1Var;
        fx1 fx1Var2 = new fx1("X86_64", 1);
        X86_64 = fx1Var2;
        fx1 fx1Var3 = new fx1("ARM_UNKNOWN", 2);
        ARM_UNKNOWN = fx1Var3;
        fx1 fx1Var4 = new fx1("PPC", 3);
        PPC = fx1Var4;
        fx1 fx1Var5 = new fx1("PPC64", 4);
        PPC64 = fx1Var5;
        fx1 fx1Var6 = new fx1("ARMV6", 5);
        ARMV6 = fx1Var6;
        fx1 fx1Var7 = new fx1("ARMV7", 6);
        ARMV7 = fx1Var7;
        fx1 fx1Var8 = new fx1("UNKNOWN", 7);
        UNKNOWN = fx1Var8;
        fx1 fx1Var9 = new fx1("ARMV7S", 8);
        ARMV7S = fx1Var9;
        fx1 fx1Var10 = new fx1("ARM64", 9);
        ARM64 = fx1Var10;
        b = new fx1[]{fx1Var, fx1Var2, fx1Var3, fx1Var4, fx1Var5, fx1Var6, fx1Var7, fx1Var8, fx1Var9, fx1Var10};
        HashMap map = new HashMap(4);
        a = map;
        map.put("armeabi-v7a", fx1Var7);
        map.put("armeabi", fx1Var6);
        map.put("arm64-v8a", fx1Var10);
        map.put("x86", fx1Var);
    }

    public static fx1 valueOf(String str) {
        return (fx1) Enum.valueOf(fx1.class, str);
    }

    public static fx1[] values() {
        return (fx1[]) b.clone();
    }
}
