package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wl9 {
    public static final wl9 EDIT_POST;
    public static final wl9 READ_POST;
    public static final /* synthetic */ wl9[] b;
    public static final /* synthetic */ i04 c;
    public final boolean a;

    static {
        wl9 wl9Var = new wl9(0, "READ_POST", true);
        READ_POST = wl9Var;
        wl9 wl9Var2 = new wl9(1, "EDIT_POST", false);
        EDIT_POST = wl9Var2;
        wl9[] wl9VarArr = {wl9Var, wl9Var2};
        b = wl9VarArr;
        c = new i04(wl9VarArr);
    }

    public wl9(int i, String str, boolean z) {
        this.a = z;
    }

    public static g04 getEntries() {
        return c;
    }

    public static wl9 valueOf(String str) {
        return (wl9) Enum.valueOf(wl9.class, str);
    }

    public static wl9[] values() {
        return (wl9[]) b.clone();
    }

    public final boolean getAreImagesZoomable() {
        return this.a;
    }

    public final boolean getHasPaddingBelowLastGraf() {
        return true;
    }
}
