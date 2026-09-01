package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zb7 {
    public static final zb7 Immediately;
    public static final zb7 OnIterationFinish;
    public static final /* synthetic */ zb7[] a;
    public static final /* synthetic */ i04 b;

    static {
        zb7 zb7Var = new zb7("Immediately", 0);
        Immediately = zb7Var;
        zb7 zb7Var2 = new zb7("OnIterationFinish", 1);
        OnIterationFinish = zb7Var2;
        zb7[] zb7VarArr = {zb7Var, zb7Var2};
        a = zb7VarArr;
        b = new i04(zb7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static zb7 valueOf(String str) {
        return (zb7) Enum.valueOf(zb7.class, str);
    }

    public static zb7[] values() {
        return (zb7[]) a.clone();
    }
}
