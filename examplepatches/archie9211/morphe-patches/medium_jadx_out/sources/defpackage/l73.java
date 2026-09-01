package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l73 {
    public static final l73 AVATAR;
    public static final l73 BOTTOM_SHEET;
    public static final l73 BUTTONS;
    public static final l73 CARD;
    public static final l73 CHECK_BOX;
    public static final l73 COLORS;
    public static final l73 DIALOG;
    public static final l73 DIVIDERS;
    public static final l73 DROPDOWNMENU;
    public static final l73 PROGRESS_BAR;
    public static final l73 RADIO_BUTTON;
    public static final l73 SWITCH;
    public static final l73 TEXT_FIELD;
    public static final l73 TYPOGRAPHY;
    public static final /* synthetic */ l73[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    static {
        l73 l73Var = new l73("COLORS", 0, "Colors");
        COLORS = l73Var;
        l73 l73Var2 = new l73("TYPOGRAPHY", 1, "Typography");
        TYPOGRAPHY = l73Var2;
        l73 l73Var3 = new l73("BUTTONS", 2, "Buttons");
        BUTTONS = l73Var3;
        l73 l73Var4 = new l73("DIVIDERS", 3, "Dividers");
        DIVIDERS = l73Var4;
        l73 l73Var5 = new l73("RADIO_BUTTON", 4, "Radio Button");
        RADIO_BUTTON = l73Var5;
        l73 l73Var6 = new l73("SWITCH", 5, "Switch");
        SWITCH = l73Var6;
        l73 l73Var7 = new l73("CHECK_BOX", 6, "Check Box");
        CHECK_BOX = l73Var7;
        l73 l73Var8 = new l73("TEXT_FIELD", 7, "Text Field");
        TEXT_FIELD = l73Var8;
        l73 l73Var9 = new l73("CARD", 8, "Card");
        CARD = l73Var9;
        l73 l73Var10 = new l73("PROGRESS_BAR", 9, "Progress bar");
        PROGRESS_BAR = l73Var10;
        l73 l73Var11 = new l73("BOTTOM_SHEET", 10, "Bottom sheet");
        BOTTOM_SHEET = l73Var11;
        l73 l73Var12 = new l73("DIALOG", 11, "Dialog");
        DIALOG = l73Var12;
        l73 l73Var13 = new l73("DROPDOWNMENU", 12, "DropdownMenu");
        DROPDOWNMENU = l73Var13;
        l73 l73Var14 = new l73("AVATAR", 13, "Avatar");
        AVATAR = l73Var14;
        l73[] l73VarArr = {l73Var, l73Var2, l73Var3, l73Var4, l73Var5, l73Var6, l73Var7, l73Var8, l73Var9, l73Var10, l73Var11, l73Var12, l73Var13, l73Var14};
        b = l73VarArr;
        c = new i04(l73VarArr);
    }

    public l73(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static l73 valueOf(String str) {
        return (l73) Enum.valueOf(l73.class, str);
    }

    public static l73[] values() {
        return (l73[]) b.clone();
    }

    public final void Demo(x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-643909799);
        int i3 = 2;
        if ((i & 6) == 0) {
            i2 = (p65Var.d(ordinal()) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            switch (j73.a[ordinal()]) {
                case 1:
                    p65Var.Y(-322024373);
                    ap7.a(null, p65Var, 0);
                    p65Var.p(false);
                    break;
                case 2:
                    p65Var.Y(-322022935);
                    fu7.b(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 3:
                    p65Var.Y(-322021659);
                    mo7.a(null, p65Var, 0);
                    p65Var.p(false);
                    break;
                case 4:
                    p65Var.Y(-322020474);
                    vp7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 5:
                    p65Var.Y(-322019126);
                    nr7.b(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 6:
                    p65Var.Y(-322017845);
                    kk7.f(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 7:
                    p65Var.Y(-322016435);
                    to7.b(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 8:
                    p65Var.Y(-322014936);
                    f76.x(null, p65Var, 0);
                    p65Var.p(false);
                    break;
                case 9:
                    p65Var.Y(-322013789);
                    qo7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 10:
                    p65Var.Y(-322012534);
                    br7.f(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 11:
                    p65Var.Y(-322011062);
                    vn7.b(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 12:
                    p65Var.Y(-322009787);
                    hp7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 13:
                    p65Var.Y(-322008469);
                    eq7.a(p65Var, 0);
                    p65Var.p(false);
                    break;
                case 14:
                    p65Var.Y(-322007163);
                    f76.d(p65Var, 0);
                    p65Var.p(false);
                    break;
                default:
                    throw ho2.L(p65Var, -322024947, false);
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
