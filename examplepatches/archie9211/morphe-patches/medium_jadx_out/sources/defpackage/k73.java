package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k73 {
    public static final k73 AVATAR;
    public static final k73 BOTTOM_SHEET;
    public static final k73 BUTTONS;
    public static final k73 CARD;
    public static final k73 CHECK_BOX;
    public static final k73 COLORS;
    public static final k73 DIALOG;
    public static final k73 DIVIDERS;
    public static final k73 DROPDOWNMENU;
    public static final k73 PROGRESS_BAR;
    public static final k73 RADIO_BUTTON;
    public static final k73 SHIMMER;
    public static final k73 SWITCH;
    public static final k73 TEXT_FIELD;
    public static final k73 TYPOGRAPHY;
    public static final /* synthetic */ k73[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    static {
        k73 k73Var = new k73("COLORS", 0, "Colors");
        COLORS = k73Var;
        k73 k73Var2 = new k73("TYPOGRAPHY", 1, "Typography");
        TYPOGRAPHY = k73Var2;
        k73 k73Var3 = new k73("BUTTONS", 2, "Buttons");
        BUTTONS = k73Var3;
        k73 k73Var4 = new k73("DIVIDERS", 3, "Dividers");
        DIVIDERS = k73Var4;
        k73 k73Var5 = new k73("RADIO_BUTTON", 4, "Radio Button");
        RADIO_BUTTON = k73Var5;
        k73 k73Var6 = new k73("SWITCH", 5, "Switch");
        SWITCH = k73Var6;
        k73 k73Var7 = new k73("CHECK_BOX", 6, "Check Box");
        CHECK_BOX = k73Var7;
        k73 k73Var8 = new k73("TEXT_FIELD", 7, "Text Field");
        TEXT_FIELD = k73Var8;
        k73 k73Var9 = new k73("CARD", 8, "Card");
        CARD = k73Var9;
        k73 k73Var10 = new k73("PROGRESS_BAR", 9, "Progress bar");
        PROGRESS_BAR = k73Var10;
        k73 k73Var11 = new k73("BOTTOM_SHEET", 10, "Bottom sheet");
        BOTTOM_SHEET = k73Var11;
        k73 k73Var12 = new k73("DIALOG", 11, "Dialog");
        DIALOG = k73Var12;
        k73 k73Var13 = new k73("DROPDOWNMENU", 12, "DropdownMenu");
        DROPDOWNMENU = k73Var13;
        k73 k73Var14 = new k73("AVATAR", 13, "Avatar");
        AVATAR = k73Var14;
        k73 k73Var15 = new k73("SHIMMER", 14, "Shimmer");
        SHIMMER = k73Var15;
        k73[] k73VarArr = {k73Var, k73Var2, k73Var3, k73Var4, k73Var5, k73Var6, k73Var7, k73Var8, k73Var9, k73Var10, k73Var11, k73Var12, k73Var13, k73Var14, k73Var15};
        b = k73VarArr;
        c = new i04(k73VarArr);
    }

    public k73(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static k73 valueOf(String str) {
        return (k73) Enum.valueOf(k73.class, str);
    }

    public static k73[] values() {
        return (k73[]) b.clone();
    }

    public final void Demo(x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2041262233);
        if ((i & 6) == 0) {
            i2 = (p65Var.d(ordinal()) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            switch (i73.a[ordinal()]) {
                case 1:
                    p65Var.Y(1147050202);
                    yo7.d(null, p65Var, 0);
                    p65Var.p(false);
                    break;
                case 2:
                    p65Var.Y(1147051672);
                    dl7.g(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 3:
                    p65Var.Y(1147052980);
                    fo7.a(null, p65Var, 0);
                    p65Var.p(false);
                    break;
                case 4:
                    p65Var.Y(1147054197);
                    tp7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 5:
                    p65Var.Y(1147055577);
                    mr7.b(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 6:
                    p65Var.Y(1147056890);
                    hk7.d(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 7:
                    p65Var.Y(1147058332);
                    vo7.c(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 8:
                    p65Var.Y(1147059863);
                    d46.q(null, p65Var, 0);
                    p65Var.p(false);
                    break;
                case 9:
                    p65Var.Y(1147061042);
                    no7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 10:
                    p65Var.Y(1147062329);
                    xz5.s(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 11:
                    p65Var.Y(1147063833);
                    vv2.f(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 12:
                    p65Var.Y(1147065140);
                    gp7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 13:
                    p65Var.Y(1147066490);
                    xp7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 14:
                    p65Var.Y(1147067828);
                    d46.b(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 15:
                    p65Var.Y(1147069013);
                    ep7.n(p65Var, 0);
                    p65Var.p(false);
                    break;
                default:
                    throw ho2.L(p65Var, 1147049679, false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s8(i, i3, this);
        }
    }

    public final String getTabTitle() {
        return this.a;
    }
}
