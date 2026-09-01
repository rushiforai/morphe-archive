package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class z22 {
    public static final sn3 a = new sn3(1, co.B);
    public static final sn3 b = new sn3(1, co.C);
    public static final sn3 c = new sn3(1, co.E);
    public static final sn3 d = new sn3(1, co.D);
    public static final sn3 e = new sn3(1, x22.c);
    public static final sn3 f = new sn3(1, x22.b);
    public static final sn3 g = new sn3(1, x22.i);
    public static final sn3 h = new sn3(1, x22.e);
    public static final sn3 i = new sn3(1, x22.f);
    public static final sn3 j = new sn3(1, x22.h);
    public static final sn3 k = new sn3(1, x22.g);
    public static final sn3 l = new sn3(1, x22.j);
    public static final sn3 m = new sn3(1, x22.k);
    public static final sn3 n = new sn3(1, x22.l);
    public static final sn3 o = new sn3(1, x22.n);
    public static final e32 p = new e32(fn.w);
    public static final sn3 q = new sn3(1, x22.q);
    public static final sn3 r = new sn3(1, x22.p);
    public static final sn3 s = new sn3(1, x22.r);
    public static final sn3 t = new sn3(1, x22.s);
    public static final sn3 u = new sn3(1, x22.t);
    public static final sn3 v = new sn3(1, x22.u);
    public static final sn3 w = new sn3(1, x22.m);
    public static final sn3 x = new sn3(0, x22.o);
    public static final sn3 y = new sn3(1, x22.d);

    public static final void a(mx8 mx8Var, jt jtVar, mz1 mz1Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1925803616);
        int i3 = (p65Var.f(mx8Var) ? 4 : 2) | i2 | (p65Var.f(jtVar) ? 32 : 16) | (p65Var.h(mz1Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            mn mnVar = (mn) mx8Var;
            o10 o10VarA = a.a(mnVar.m131getAccessibilityManager());
            o10 o10VarA2 = b.a(mnVar.getAutofill());
            o10 o10VarA3 = d.a(mnVar.getAutofillManager());
            o10 o10VarA4 = c.a(mnVar.getAutofillTree());
            o10 o10VarA5 = e.a(mnVar.getClipboardManager());
            o10 o10VarA6 = f.a(mnVar.getClipboard());
            o10 o10VarA7 = h.a(mnVar.getDensity());
            o10 o10VarA8 = i.a(mnVar.getFocusOwner());
            o10 o10VarA9 = j.a(mnVar.getFontLoader());
            o10VarA9.e = false;
            o10 o10VarA10 = k.a(mnVar.getFontFamilyResolver());
            o10VarA10.e = false;
            k40.d(new o10[]{o10VarA, o10VarA2, o10VarA3, o10VarA4, o10VarA5, o10VarA6, o10VarA7, o10VarA8, o10VarA9, o10VarA10, l.a(mnVar.getHapticFeedBack()), m.a(mnVar.getInputModeManager()), n.a(mnVar.getLayoutDirection()), q.a(mnVar.getTextInputService()), r.a(mnVar.getSoftwareKeyboardController()), s.a(mnVar.getTextToolbar()), t.a(jtVar), u.a(mnVar.getViewConfiguration()), v.a(mnVar.getWindowInfo()), w.a(mnVar.getPointerIconService()), g.a(mnVar.getGraphicsContext()), c67.a.a(mnVar.getRetainedValuesStore()), o.a(mnVar.getLocaleList())}, mz1Var, p65Var, ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y22(mx8Var, jtVar, mz1Var, i2);
        }
    }

    public static final void b(String str) {
        throw new IllegalStateException(("CompositionLocal " + str + " not present").toString());
    }
}
