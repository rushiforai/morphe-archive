package defpackage;

import sprig.b.VPIE.gYpYQDQkhfs;
import sprig.g.Hq.fiHTiFJ;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gk6 {
    public static final gk6 CENTER;
    public static final gk6 CHARACTER_PALETTE;
    public static final gk6 COPY;
    public static final gk6 CUT;
    public static final gk6 DELETE_FROM_LINE_START;
    public static final gk6 DELETE_NEXT_CHAR;
    public static final gk6 DELETE_NEXT_WORD;
    public static final gk6 DELETE_PREV_CHAR;
    public static final gk6 DELETE_PREV_WORD;
    public static final gk6 DELETE_TO_LINE_END;
    public static final gk6 DESELECT;
    public static final gk6 DOWN;
    public static final gk6 END;
    public static final gk6 HOME;
    public static final gk6 LEFT_CHAR;
    public static final gk6 LEFT_WORD;
    public static final gk6 LINE_END;
    public static final gk6 LINE_LEFT;
    public static final gk6 LINE_RIGHT;
    public static final gk6 LINE_START;
    public static final gk6 NEW_LINE;
    public static final gk6 NEXT_PARAGRAPH;
    public static final gk6 PAGE_DOWN;
    public static final gk6 PAGE_UP;
    public static final gk6 PASTE;
    public static final gk6 PREV_PARAGRAPH;
    public static final gk6 REDO;
    public static final gk6 RIGHT_CHAR;
    public static final gk6 RIGHT_WORD;
    public static final gk6 SELECT_ALL;
    public static final gk6 SELECT_DOWN;
    public static final gk6 SELECT_END;
    public static final gk6 SELECT_HOME;
    public static final gk6 SELECT_LEFT_CHAR;
    public static final gk6 SELECT_LEFT_WORD;
    public static final gk6 SELECT_LINE_END;
    public static final gk6 SELECT_LINE_LEFT;
    public static final gk6 SELECT_LINE_RIGHT;
    public static final gk6 SELECT_LINE_START;
    public static final gk6 SELECT_NEXT_PARAGRAPH;
    public static final gk6 SELECT_PAGE_DOWN;
    public static final gk6 SELECT_PAGE_UP;
    public static final gk6 SELECT_PREV_PARAGRAPH;
    public static final gk6 SELECT_RIGHT_CHAR;
    public static final gk6 SELECT_RIGHT_WORD;
    public static final gk6 SELECT_UP;
    public static final gk6 TAB;
    public static final gk6 UNDO;
    public static final gk6 UP;
    public static final /* synthetic */ gk6[] b;
    public static final /* synthetic */ i04 c;
    public final boolean a;

    public gk6(int i, String str, boolean z) {
        this.a = z;
    }

    public static g04 getEntries() {
        return c;
    }

    public static gk6 valueOf(String str) {
        return (gk6) Enum.valueOf(gk6.class, str);
    }

    public static gk6[] values() {
        return (gk6[]) b.clone();
    }

    public final boolean getEditsText() {
        return this.a;
    }

    static {
        gk6 gk6Var = new gk6(0, "LEFT_CHAR", false);
        LEFT_CHAR = gk6Var;
        gk6 gk6Var2 = new gk6(1, "RIGHT_CHAR", false);
        RIGHT_CHAR = gk6Var2;
        gk6 gk6Var3 = new gk6(2, fiHTiFJ.RCKHEIZSrhPM, false);
        RIGHT_WORD = gk6Var3;
        gk6 gk6Var4 = new gk6(3, "LEFT_WORD", false);
        LEFT_WORD = gk6Var4;
        gk6 gk6Var5 = new gk6(4, "NEXT_PARAGRAPH", false);
        NEXT_PARAGRAPH = gk6Var5;
        gk6 gk6Var6 = new gk6(5, "PREV_PARAGRAPH", false);
        PREV_PARAGRAPH = gk6Var6;
        gk6 gk6Var7 = new gk6(6, "LINE_START", false);
        LINE_START = gk6Var7;
        gk6 gk6Var8 = new gk6(7, "LINE_END", false);
        LINE_END = gk6Var8;
        gk6 gk6Var9 = new gk6(8, "LINE_LEFT", false);
        LINE_LEFT = gk6Var9;
        gk6 gk6Var10 = new gk6(9, "LINE_RIGHT", false);
        LINE_RIGHT = gk6Var10;
        gk6 gk6Var11 = new gk6(10, "UP", false);
        UP = gk6Var11;
        gk6 gk6Var12 = new gk6(11, "DOWN", false);
        DOWN = gk6Var12;
        gk6 gk6Var13 = new gk6(12, "CENTER", false);
        CENTER = gk6Var13;
        gk6 gk6Var14 = new gk6(13, "PAGE_UP", false);
        PAGE_UP = gk6Var14;
        gk6 gk6Var15 = new gk6(14, "PAGE_DOWN", false);
        PAGE_DOWN = gk6Var15;
        gk6 gk6Var16 = new gk6(15, "HOME", false);
        HOME = gk6Var16;
        gk6 gk6Var17 = new gk6(16, "END", false);
        END = gk6Var17;
        gk6 gk6Var18 = new gk6(17, "COPY", false);
        COPY = gk6Var18;
        gk6 gk6Var19 = new gk6(18, "PASTE", true);
        PASTE = gk6Var19;
        gk6 gk6Var20 = new gk6(19, "CUT", true);
        CUT = gk6Var20;
        gk6 gk6Var21 = new gk6(20, "DELETE_PREV_CHAR", true);
        DELETE_PREV_CHAR = gk6Var21;
        gk6 gk6Var22 = new gk6(21, "DELETE_NEXT_CHAR", true);
        DELETE_NEXT_CHAR = gk6Var22;
        gk6 gk6Var23 = new gk6(22, "DELETE_PREV_WORD", true);
        DELETE_PREV_WORD = gk6Var23;
        gk6 gk6Var24 = new gk6(23, "DELETE_NEXT_WORD", true);
        DELETE_NEXT_WORD = gk6Var24;
        gk6 gk6Var25 = new gk6(24, "DELETE_FROM_LINE_START", true);
        DELETE_FROM_LINE_START = gk6Var25;
        gk6 gk6Var26 = new gk6(25, "DELETE_TO_LINE_END", true);
        DELETE_TO_LINE_END = gk6Var26;
        gk6 gk6Var27 = new gk6(26, "SELECT_ALL", false);
        SELECT_ALL = gk6Var27;
        gk6 gk6Var28 = new gk6(27, "SELECT_LEFT_CHAR", false);
        SELECT_LEFT_CHAR = gk6Var28;
        gk6 gk6Var29 = new gk6(28, "SELECT_RIGHT_CHAR", false);
        SELECT_RIGHT_CHAR = gk6Var29;
        gk6 gk6Var30 = new gk6(29, "SELECT_UP", false);
        SELECT_UP = gk6Var30;
        gk6 gk6Var31 = new gk6(30, "SELECT_DOWN", false);
        SELECT_DOWN = gk6Var31;
        gk6 gk6Var32 = new gk6(31, "SELECT_PAGE_UP", false);
        SELECT_PAGE_UP = gk6Var32;
        gk6 gk6Var33 = new gk6(32, "SELECT_PAGE_DOWN", false);
        SELECT_PAGE_DOWN = gk6Var33;
        gk6 gk6Var34 = new gk6(33, "SELECT_HOME", false);
        SELECT_HOME = gk6Var34;
        gk6 gk6Var35 = new gk6(34, "SELECT_END", false);
        SELECT_END = gk6Var35;
        gk6 gk6Var36 = new gk6(35, "SELECT_LEFT_WORD", false);
        SELECT_LEFT_WORD = gk6Var36;
        gk6 gk6Var37 = new gk6(36, "SELECT_RIGHT_WORD", false);
        SELECT_RIGHT_WORD = gk6Var37;
        gk6 gk6Var38 = new gk6(37, "SELECT_NEXT_PARAGRAPH", false);
        SELECT_NEXT_PARAGRAPH = gk6Var38;
        gk6 gk6Var39 = new gk6(38, "SELECT_PREV_PARAGRAPH", false);
        SELECT_PREV_PARAGRAPH = gk6Var39;
        gk6 gk6Var40 = new gk6(39, "SELECT_LINE_START", false);
        SELECT_LINE_START = gk6Var40;
        gk6 gk6Var41 = new gk6(40, gYpYQDQkhfs.oTgGb, false);
        SELECT_LINE_END = gk6Var41;
        gk6 gk6Var42 = new gk6(41, "SELECT_LINE_LEFT", false);
        SELECT_LINE_LEFT = gk6Var42;
        gk6 gk6Var43 = new gk6(42, "SELECT_LINE_RIGHT", false);
        SELECT_LINE_RIGHT = gk6Var43;
        gk6 gk6Var44 = new gk6(43, "DESELECT", false);
        DESELECT = gk6Var44;
        gk6 gk6Var45 = new gk6(44, "NEW_LINE", true);
        NEW_LINE = gk6Var45;
        gk6 gk6Var46 = new gk6(45, "TAB", true);
        TAB = gk6Var46;
        gk6 gk6Var47 = new gk6(46, "UNDO", true);
        UNDO = gk6Var47;
        gk6 gk6Var48 = new gk6(47, "REDO", true);
        REDO = gk6Var48;
        gk6 gk6Var49 = new gk6(48, "CHARACTER_PALETTE", true);
        CHARACTER_PALETTE = gk6Var49;
        gk6[] gk6VarArr = {gk6Var, gk6Var2, gk6Var3, gk6Var4, gk6Var5, gk6Var6, gk6Var7, gk6Var8, gk6Var9, gk6Var10, gk6Var11, gk6Var12, gk6Var13, gk6Var14, gk6Var15, gk6Var16, gk6Var17, gk6Var18, gk6Var19, gk6Var20, gk6Var21, gk6Var22, gk6Var23, gk6Var24, gk6Var25, gk6Var26, gk6Var27, gk6Var28, gk6Var29, gk6Var30, gk6Var31, gk6Var32, gk6Var33, gk6Var34, gk6Var35, gk6Var36, gk6Var37, gk6Var38, gk6Var39, gk6Var40, gk6Var41, gk6Var42, gk6Var43, gk6Var44, gk6Var45, gk6Var46, gk6Var47, gk6Var48, gk6Var49};
        b = gk6VarArr;
        c = new i04(gk6VarArr);
    }
}
