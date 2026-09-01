package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dd6 {
    public static final dd6 BEGIN_ARRAY;
    public static final dd6 BEGIN_OBJECT;
    public static final dd6 BOOLEAN;
    public static final dd6 END_ARRAY;
    public static final dd6 END_DOCUMENT;
    public static final dd6 END_OBJECT;
    public static final dd6 NAME;
    public static final dd6 NULL;
    public static final dd6 NUMBER;
    public static final dd6 STRING;
    public static final /* synthetic */ dd6[] a;

    static {
        dd6 dd6Var = new dd6("BEGIN_ARRAY", 0);
        BEGIN_ARRAY = dd6Var;
        dd6 dd6Var2 = new dd6("END_ARRAY", 1);
        END_ARRAY = dd6Var2;
        dd6 dd6Var3 = new dd6("BEGIN_OBJECT", 2);
        BEGIN_OBJECT = dd6Var3;
        dd6 dd6Var4 = new dd6("END_OBJECT", 3);
        END_OBJECT = dd6Var4;
        dd6 dd6Var5 = new dd6("NAME", 4);
        NAME = dd6Var5;
        dd6 dd6Var6 = new dd6("STRING", 5);
        STRING = dd6Var6;
        dd6 dd6Var7 = new dd6("NUMBER", 6);
        NUMBER = dd6Var7;
        dd6 dd6Var8 = new dd6("BOOLEAN", 7);
        BOOLEAN = dd6Var8;
        dd6 dd6Var9 = new dd6("NULL", 8);
        NULL = dd6Var9;
        dd6 dd6Var10 = new dd6("END_DOCUMENT", 9);
        END_DOCUMENT = dd6Var10;
        a = new dd6[]{dd6Var, dd6Var2, dd6Var3, dd6Var4, dd6Var5, dd6Var6, dd6Var7, dd6Var8, dd6Var9, dd6Var10};
    }

    public static dd6 valueOf(String str) {
        return (dd6) Enum.valueOf(dd6.class, str);
    }

    public static dd6[] values() {
        return (dd6[]) a.clone();
    }
}
