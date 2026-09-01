package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jd6 {
    public static final jd6 BEGIN_ARRAY;
    public static final jd6 BEGIN_OBJECT;
    public static final jd6 BOOLEAN;
    public static final jd6 END_ARRAY;
    public static final jd6 END_DOCUMENT;
    public static final jd6 END_OBJECT;
    public static final jd6 NAME;
    public static final jd6 NULL;
    public static final jd6 NUMBER;
    public static final jd6 STRING;
    public static final /* synthetic */ jd6[] a;

    static {
        jd6 jd6Var = new jd6("BEGIN_ARRAY", 0);
        BEGIN_ARRAY = jd6Var;
        jd6 jd6Var2 = new jd6("END_ARRAY", 1);
        END_ARRAY = jd6Var2;
        jd6 jd6Var3 = new jd6("BEGIN_OBJECT", 2);
        BEGIN_OBJECT = jd6Var3;
        jd6 jd6Var4 = new jd6("END_OBJECT", 3);
        END_OBJECT = jd6Var4;
        jd6 jd6Var5 = new jd6("NAME", 4);
        NAME = jd6Var5;
        jd6 jd6Var6 = new jd6("STRING", 5);
        STRING = jd6Var6;
        jd6 jd6Var7 = new jd6("NUMBER", 6);
        NUMBER = jd6Var7;
        jd6 jd6Var8 = new jd6("BOOLEAN", 7);
        BOOLEAN = jd6Var8;
        jd6 jd6Var9 = new jd6("NULL", 8);
        NULL = jd6Var9;
        jd6 jd6Var10 = new jd6("END_DOCUMENT", 9);
        END_DOCUMENT = jd6Var10;
        a = new jd6[]{jd6Var, jd6Var2, jd6Var3, jd6Var4, jd6Var5, jd6Var6, jd6Var7, jd6Var8, jd6Var9, jd6Var10};
    }

    public static jd6 valueOf(String str) {
        return (jd6) Enum.valueOf(jd6.class, str);
    }

    public static jd6[] values() {
        return (jd6[]) a.clone();
    }
}
