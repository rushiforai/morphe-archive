package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class px0 {
    public static final px0 Collapsed;
    public static final px0 Expanded;
    public static final /* synthetic */ px0[] a;
    public static final /* synthetic */ i04 b;

    static {
        px0 px0Var = new px0("Collapsed", 0);
        Collapsed = px0Var;
        px0 px0Var2 = new px0("Expanded", 1);
        Expanded = px0Var2;
        px0[] px0VarArr = {px0Var, px0Var2};
        a = px0VarArr;
        b = new i04(px0VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static px0 valueOf(String str) {
        return (px0) Enum.valueOf(px0.class, str);
    }

    public static px0[] values() {
        return (px0[]) a.clone();
    }
}
