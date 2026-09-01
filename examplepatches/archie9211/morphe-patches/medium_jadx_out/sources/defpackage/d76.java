package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d76 {
    public static final d76 Height;
    public static final d76 Width;
    public static final /* synthetic */ d76[] a;
    public static final /* synthetic */ i04 b;

    static {
        d76 d76Var = new d76("Width", 0);
        Width = d76Var;
        d76 d76Var2 = new d76("Height", 1);
        Height = d76Var2;
        d76[] d76VarArr = {d76Var, d76Var2};
        a = d76VarArr;
        b = new i04(d76VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static d76 valueOf(String str) {
        return (d76) Enum.valueOf(d76.class, str);
    }

    public static d76[] values() {
        return (d76[]) a.clone();
    }
}
