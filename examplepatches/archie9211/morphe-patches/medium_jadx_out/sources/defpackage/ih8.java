package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ih8 {
    public static final ih8 Height;
    public static final ih8 Width;
    public static final /* synthetic */ ih8[] a;
    public static final /* synthetic */ i04 b;

    static {
        ih8 ih8Var = new ih8("Width", 0);
        Width = ih8Var;
        ih8 ih8Var2 = new ih8("Height", 1);
        Height = ih8Var2;
        ih8[] ih8VarArr = {ih8Var, ih8Var2};
        a = ih8VarArr;
        b = new i04(ih8VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ih8 valueOf(String str) {
        return (ih8) Enum.valueOf(ih8.class, str);
    }

    public static ih8[] values() {
        return (ih8[]) a.clone();
    }
}
