package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pn1 {
    public static final pn1 ANNOTATION_CLASS;
    public static final pn1 CLASS;
    public static final pn1 COMPANION_OBJECT;
    public static final pn1 ENUM_CLASS;
    public static final pn1 ENUM_ENTRY;
    public static final pn1 INTERFACE;
    public static final pn1 OBJECT;
    public static final /* synthetic */ pn1[] b;
    public static final /* synthetic */ i04 c;
    public final vl4 a;

    static {
        pn1 pn1Var = new pn1("CLASS", 0, 0);
        CLASS = pn1Var;
        pn1 pn1Var2 = new pn1("INTERFACE", 1, 1);
        INTERFACE = pn1Var2;
        pn1 pn1Var3 = new pn1("ENUM_CLASS", 2, 2);
        ENUM_CLASS = pn1Var3;
        pn1 pn1Var4 = new pn1("ENUM_ENTRY", 3, 3);
        ENUM_ENTRY = pn1Var4;
        pn1 pn1Var5 = new pn1("ANNOTATION_CLASS", 4, 4);
        ANNOTATION_CLASS = pn1Var5;
        pn1 pn1Var6 = new pn1("OBJECT", 5, 5);
        OBJECT = pn1Var6;
        pn1 pn1Var7 = new pn1("COMPANION_OBJECT", 6, 6);
        COMPANION_OBJECT = pn1Var7;
        pn1[] pn1VarArr = {pn1Var, pn1Var2, pn1Var3, pn1Var4, pn1Var5, pn1Var6, pn1Var7};
        b = pn1VarArr;
        c = new i04(pn1VarArr);
    }

    public pn1(String str, int i, int i2) {
        yl4 yl4Var = cm4.f;
        yl4Var.getClass();
        this.a = new vl4(yl4Var, i2);
    }

    public static g04 getEntries() {
        return c;
    }

    public static pn1 valueOf(String str) {
        return (pn1) Enum.valueOf(pn1.class, str);
    }

    public static pn1[] values() {
        return (pn1[]) b.clone();
    }

    public final vl4 getFlag$kotlin_metadata() {
        return this.a;
    }
}
