package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vl8 {
    public static final vl8 FORCE_FLEXIBILITY;
    public static final vl8 NOT_NULL;
    public static final vl8 NULLABLE;
    public static final /* synthetic */ vl8[] a;

    static {
        vl8 vl8Var = new vl8("FORCE_FLEXIBILITY", 0);
        FORCE_FLEXIBILITY = vl8Var;
        vl8 vl8Var2 = new vl8("NULLABLE", 1);
        NULLABLE = vl8Var2;
        vl8 vl8Var3 = new vl8("NOT_NULL", 2);
        NOT_NULL = vl8Var3;
        a = new vl8[]{vl8Var, vl8Var2, vl8Var3};
    }

    public static vl8 valueOf(String str) {
        return (vl8) Enum.valueOf(vl8.class, str);
    }

    public static vl8[] values() {
        return (vl8[]) a.clone();
    }
}
