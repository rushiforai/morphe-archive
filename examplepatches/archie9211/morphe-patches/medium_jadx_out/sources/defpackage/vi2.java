package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vi2 {
    public static final vi2 CANCELLED;
    public static final vi2 ERROR;
    public static final vi2 SUCCEEDED;
    public static final /* synthetic */ vi2[] a;

    static {
        vi2 vi2Var = new vi2("SUCCEEDED", 0);
        SUCCEEDED = vi2Var;
        vi2 vi2Var2 = new vi2("ERROR", 1);
        ERROR = vi2Var2;
        vi2 vi2Var3 = new vi2("CANCELLED", 2);
        CANCELLED = vi2Var3;
        a = new vi2[]{vi2Var, vi2Var2, vi2Var3};
    }

    public static vi2 valueOf(String str) {
        return (vi2) Enum.valueOf(vi2.class, str);
    }

    public static vi2[] values() {
        return (vi2[]) a.clone();
    }
}
