package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g73 {
    public static final f73 Companion;
    public static final g73 INSERT_PARAGRAPH_AT;
    public static final g73 INSERT_SECTION_AT;
    public static final g73 REMOVE_PARAGRAPH_AT;
    public static final g73 REMOVE_SECTION_AT;
    public static final g73 UPDATE_CAPTION;
    public static final g73 UPDATE_IMAGE;
    public static final g73 UPDATE_PARAGRAPH_AT;
    public static final g73 UPDATE_POST_DISPLAY;
    public static final g73 UPDATE_SECTION_AT;
    public static final g73 UPDATE_SUBTITLE;
    public static final g73 UPDATE_TITLE;
    public static final w5d b;
    public static final /* synthetic */ g73[] c;
    public static final /* synthetic */ i04 d;
    public final z26 a;

    static {
        g73 g73Var = new g73("INSERT_PARAGRAPH_AT", 0, new z26(DeltaType.INSERT_PARAGRAPH_AT, 0));
        INSERT_PARAGRAPH_AT = g73Var;
        g73 g73Var2 = new g73("REMOVE_PARAGRAPH_AT", 1, new z26(DeltaType.REMOVE_PARAGRAPH_AT, 2));
        REMOVE_PARAGRAPH_AT = g73Var2;
        g73 g73Var3 = new g73("UPDATE_PARAGRAPH_AT", 2, new z26(DeltaType.UPDATE_PARAGRAPH_AT, 6));
        UPDATE_PARAGRAPH_AT = g73Var3;
        g73 g73Var4 = new g73("UPDATE_TITLE", 3, new z26(DeltaType.UPDATE_TITLE, 10));
        UPDATE_TITLE = g73Var4;
        g73 g73Var5 = new g73("UPDATE_SUBTITLE", 4, new z26(DeltaType.UPDATE_SUBTITLE, 9));
        UPDATE_SUBTITLE = g73Var5;
        g73 g73Var6 = new g73("UPDATE_IMAGE", 5, new z26(DeltaType.UPDATE_IMAGE, 5));
        UPDATE_IMAGE = g73Var6;
        g73 g73Var7 = new g73("UPDATE_CAPTION", 6, new z26(DeltaType.UPDATE_CAPTION, 4));
        UPDATE_CAPTION = g73Var7;
        g73 g73Var8 = new g73("INSERT_SECTION_AT", 7, new z26(DeltaType.INSERT_SECTION_AT, 1));
        INSERT_SECTION_AT = g73Var8;
        g73 g73Var9 = new g73("REMOVE_SECTION_AT", 8, new z26(DeltaType.REMOVE_SECTION_AT, 3));
        REMOVE_SECTION_AT = g73Var9;
        g73 g73Var10 = new g73("UPDATE_SECTION_AT", 9, new z26(DeltaType.UPDATE_SECTION_AT, 8));
        UPDATE_SECTION_AT = g73Var10;
        g73 g73Var11 = new g73("UPDATE_POST_DISPLAY", 10, new z26(DeltaType.UPDATE_POST_DISPLAY, 7));
        UPDATE_POST_DISPLAY = g73Var11;
        g73[] g73VarArr = {g73Var, g73Var2, g73Var3, g73Var4, g73Var5, g73Var6, g73Var7, g73Var8, g73Var9, g73Var10, g73Var11};
        c = g73VarArr;
        d = new i04(g73VarArr);
        Companion = new f73();
        b = new w5d(new e73(0));
    }

    public g73(String str, int i, z26 z26Var) {
        this.a = z26Var;
    }

    public static g04 getEntries() {
        return d;
    }

    public static g73 valueOf(String str) {
        return (g73) Enum.valueOf(g73.class, str);
    }

    public static g73[] values() {
        return (g73[]) c.clone();
    }
}
