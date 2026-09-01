package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qn1 {
    public static final qn1 ANNOTATION_CLASS;
    public static final qn1 CLASS;
    public static final qn1 ENUM_CLASS;
    public static final qn1 ENUM_ENTRY;
    public static final qn1 INTERFACE;
    public static final qn1 OBJECT;
    public static final /* synthetic */ qn1[] a;

    static {
        qn1 qn1Var = new qn1("CLASS", 0);
        CLASS = qn1Var;
        qn1 qn1Var2 = new qn1("INTERFACE", 1);
        INTERFACE = qn1Var2;
        qn1 qn1Var3 = new qn1("ENUM_CLASS", 2);
        ENUM_CLASS = qn1Var3;
        qn1 qn1Var4 = new qn1("ENUM_ENTRY", 3);
        ENUM_ENTRY = qn1Var4;
        qn1 qn1Var5 = new qn1("ANNOTATION_CLASS", 4);
        ANNOTATION_CLASS = qn1Var5;
        qn1 qn1Var6 = new qn1("OBJECT", 5);
        OBJECT = qn1Var6;
        a = new qn1[]{qn1Var, qn1Var2, qn1Var3, qn1Var4, qn1Var5, qn1Var6};
    }

    public static qn1 valueOf(String str) {
        return (qn1) Enum.valueOf(qn1.class, str);
    }

    public static qn1[] values() {
        return (qn1[]) a.clone();
    }

    public final boolean isSingleton() {
        return this == OBJECT || this == ENUM_ENTRY;
    }
}
