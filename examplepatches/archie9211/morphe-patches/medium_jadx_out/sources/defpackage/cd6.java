package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cd6 {
    public static final cd6 ANY;
    public static final cd6 BEGIN_ARRAY;
    public static final cd6 BEGIN_OBJECT;
    public static final cd6 BOOLEAN;
    public static final cd6 END_ARRAY;
    public static final cd6 END_DOCUMENT;
    public static final cd6 END_OBJECT;
    public static final cd6 LONG;
    public static final cd6 NAME;
    public static final cd6 NULL;
    public static final cd6 NUMBER;
    public static final cd6 STRING;
    public static final /* synthetic */ cd6[] a;
    public static final /* synthetic */ i04 b;

    static {
        cd6 cd6Var = new cd6("BEGIN_ARRAY", 0);
        BEGIN_ARRAY = cd6Var;
        cd6 cd6Var2 = new cd6("END_ARRAY", 1);
        END_ARRAY = cd6Var2;
        cd6 cd6Var3 = new cd6("BEGIN_OBJECT", 2);
        BEGIN_OBJECT = cd6Var3;
        cd6 cd6Var4 = new cd6("END_OBJECT", 3);
        END_OBJECT = cd6Var4;
        cd6 cd6Var5 = new cd6("NAME", 4);
        NAME = cd6Var5;
        cd6 cd6Var6 = new cd6("STRING", 5);
        STRING = cd6Var6;
        cd6 cd6Var7 = new cd6("NUMBER", 6);
        NUMBER = cd6Var7;
        cd6 cd6Var8 = new cd6("LONG", 7);
        LONG = cd6Var8;
        cd6 cd6Var9 = new cd6("BOOLEAN", 8);
        BOOLEAN = cd6Var9;
        cd6 cd6Var10 = new cd6("NULL", 9);
        NULL = cd6Var10;
        cd6 cd6Var11 = new cd6("END_DOCUMENT", 10);
        END_DOCUMENT = cd6Var11;
        cd6 cd6Var12 = new cd6("ANY", 11);
        ANY = cd6Var12;
        cd6[] cd6VarArr = {cd6Var, cd6Var2, cd6Var3, cd6Var4, cd6Var5, cd6Var6, cd6Var7, cd6Var8, cd6Var9, cd6Var10, cd6Var11, cd6Var12};
        a = cd6VarArr;
        b = new i04(cd6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static cd6 valueOf(String str) {
        return (cd6) Enum.valueOf(cd6.class, str);
    }

    public static cd6[] values() {
        return (cd6[]) a.clone();
    }
}
