package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zr4 {
    public static final zr4 Active;
    public static final zr4 ActiveParent;
    public static final zr4 Captured;
    public static final zr4 Inactive;
    public static final /* synthetic */ zr4[] a;
    public static final /* synthetic */ i04 b;

    static {
        zr4 zr4Var = new zr4("Active", 0);
        Active = zr4Var;
        zr4 zr4Var2 = new zr4("ActiveParent", 1);
        ActiveParent = zr4Var2;
        zr4 zr4Var3 = new zr4("Captured", 2);
        Captured = zr4Var3;
        zr4 zr4Var4 = new zr4("Inactive", 3);
        Inactive = zr4Var4;
        zr4[] zr4VarArr = {zr4Var, zr4Var2, zr4Var3, zr4Var4};
        a = zr4VarArr;
        b = new i04(zr4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static zr4 valueOf(String str) {
        return (zr4) Enum.valueOf(zr4.class, str);
    }

    public static zr4[] values() {
        return (zr4[]) a.clone();
    }

    public boolean getHasFocus() {
        int i = yr4.a[ordinal()];
        if (i == 1 || i == 2 || i == 3) {
            return true;
        }
        if (i == 4) {
            return false;
        }
        ygf.a();
        return false;
    }

    public boolean isCaptured() {
        int i = yr4.a[ordinal()];
        if (i == 1) {
            return true;
        }
        if (i == 2 || i == 3 || i == 4) {
            return false;
        }
        ygf.a();
        return false;
    }

    public boolean isFocused() {
        int i = yr4.a[ordinal()];
        if (i == 1 || i == 2) {
            return true;
        }
        if (i == 3 || i == 4) {
            return false;
        }
        ygf.a();
        return false;
    }
}
