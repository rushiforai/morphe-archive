package defpackage;

import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ed6 {
    public static final ed6 BEGIN_ARRAY;
    public static final ed6 BEGIN_OBJECT;
    public static final ed6 BOOLEAN;
    public static final ed6 END_ARRAY;
    public static final ed6 END_DOCUMENT;
    public static final ed6 END_OBJECT;
    public static final ed6 NAME;
    public static final ed6 NULL;
    public static final ed6 NUMBER;
    public static final ed6 STRING;
    public static final /* synthetic */ ed6[] a;

    public static ed6 valueOf(String str) {
        return (ed6) Enum.valueOf(ed6.class, str);
    }

    public static ed6[] values() {
        return (ed6[]) a.clone();
    }

    static {
        ed6 ed6Var = new ed6("BEGIN_ARRAY", 0);
        BEGIN_ARRAY = ed6Var;
        ed6 ed6Var2 = new ed6("END_ARRAY", 1);
        END_ARRAY = ed6Var2;
        ed6 ed6Var3 = new ed6("BEGIN_OBJECT", 2);
        BEGIN_OBJECT = ed6Var3;
        ed6 ed6Var4 = new ed6("END_OBJECT", 3);
        END_OBJECT = ed6Var4;
        ed6 ed6Var5 = new ed6(mBTDfueQiGWRV.xZeJCrvWdRZPd, 4);
        NAME = ed6Var5;
        ed6 ed6Var6 = new ed6("STRING", 5);
        STRING = ed6Var6;
        ed6 ed6Var7 = new ed6("NUMBER", 6);
        NUMBER = ed6Var7;
        ed6 ed6Var8 = new ed6("BOOLEAN", 7);
        BOOLEAN = ed6Var8;
        ed6 ed6Var9 = new ed6("NULL", 8);
        NULL = ed6Var9;
        ed6 ed6Var10 = new ed6("END_DOCUMENT", 9);
        END_DOCUMENT = ed6Var10;
        a = new ed6[]{ed6Var, ed6Var2, ed6Var3, ed6Var4, ed6Var5, ed6Var6, ed6Var7, ed6Var8, ed6Var9, ed6Var10};
    }
}
