package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class tc8 {
    public static final LinkedHashMap b = new LinkedHashMap();
    public final LinkedHashMap a = new LinkedHashMap();

    public final void a(sc8 sc8Var) {
        sc8Var.getClass();
        String strW = gq7.w(sc8Var.getClass());
        if (strW.length() <= 0) {
            ay0.e("navigator name cannot be an empty string");
            return;
        }
        LinkedHashMap linkedHashMap = this.a;
        sc8 sc8Var2 = (sc8) linkedHashMap.get(strW);
        if (g76.L(sc8Var2, sc8Var)) {
            return;
        }
        if (sc8Var2 != null && sc8Var2.b) {
            mm.g("Navigator ", sc8Var, " is replacing an already attached ", sc8Var2);
        } else if (sc8Var.b) {
            z72.e("Navigator ", sc8Var, " is already attached to another NavController");
        }
    }

    public sc8 b(String str) {
        str.getClass();
        if (str.length() <= 0) {
            ay0.e("navigator name cannot be an empty string");
            return null;
        }
        sc8 sc8Var = (sc8) this.a.get(str);
        if (sc8Var != null) {
            return sc8Var;
        }
        ygf.f(ev6.x("Could not find Navigator with name \"", str, "\". You must call NavController.addNavigator() for each navigation type."));
        return null;
    }
}
