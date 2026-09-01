package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yw6 {
    public static final yw6 NONE;
    public static final yw6 PUBLICATION;
    public static final yw6 SYNCHRONIZED;
    public static final /* synthetic */ yw6[] a;
    public static final /* synthetic */ i04 b;

    static {
        yw6 yw6Var = new yw6("SYNCHRONIZED", 0);
        SYNCHRONIZED = yw6Var;
        yw6 yw6Var2 = new yw6("PUBLICATION", 1);
        PUBLICATION = yw6Var2;
        yw6 yw6Var3 = new yw6("NONE", 2);
        NONE = yw6Var3;
        yw6[] yw6VarArr = {yw6Var, yw6Var2, yw6Var3};
        a = yw6VarArr;
        b = new i04(yw6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static yw6 valueOf(String str) {
        return (yw6) Enum.valueOf(yw6.class, str);
    }

    public static yw6[] values() {
        return (yw6[]) a.clone();
    }
}
