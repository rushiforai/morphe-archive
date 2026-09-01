package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m52 {
    public static final m52 BOOLEAN_TYPE;
    public static final m52 COLOR_DRAWABLE_TYPE;
    public static final m52 COLOR_TYPE;
    public static final m52 DIMENSION_TYPE;
    public static final m52 FLOAT_TYPE;
    public static final m52 INT_TYPE;
    public static final m52 REFERENCE_TYPE;
    public static final m52 STRING_TYPE;
    public static final /* synthetic */ m52[] a;

    static {
        m52 m52Var = new m52("INT_TYPE", 0);
        INT_TYPE = m52Var;
        m52 m52Var2 = new m52("FLOAT_TYPE", 1);
        FLOAT_TYPE = m52Var2;
        m52 m52Var3 = new m52("COLOR_TYPE", 2);
        COLOR_TYPE = m52Var3;
        m52 m52Var4 = new m52("COLOR_DRAWABLE_TYPE", 3);
        COLOR_DRAWABLE_TYPE = m52Var4;
        m52 m52Var5 = new m52("STRING_TYPE", 4);
        STRING_TYPE = m52Var5;
        m52 m52Var6 = new m52("BOOLEAN_TYPE", 5);
        BOOLEAN_TYPE = m52Var6;
        m52 m52Var7 = new m52("DIMENSION_TYPE", 6);
        DIMENSION_TYPE = m52Var7;
        m52 m52Var8 = new m52("REFERENCE_TYPE", 7);
        REFERENCE_TYPE = m52Var8;
        a = new m52[]{m52Var, m52Var2, m52Var3, m52Var4, m52Var5, m52Var6, m52Var7, m52Var8};
    }

    public static m52 valueOf(String str) {
        return (m52) Enum.valueOf(m52.class, str);
    }

    public static m52[] values() {
        return (m52[]) a.clone();
    }
}
