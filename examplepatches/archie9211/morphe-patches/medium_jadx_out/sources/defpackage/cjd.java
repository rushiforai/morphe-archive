package defpackage;

import android.graphics.Rect;
import android.view.Choreographer;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cjd implements ab9 {
    public final View a;
    public final ku3 b;
    public final djd c;
    public boolean d;
    public x45 e;
    public x45 f;
    public uid g;
    public ry5 h;
    public final ArrayList i;
    public final vq6 j;
    public Rect k;
    public final hl2 l;
    public final o78 m;
    public b2a n;

    public cjd(View view, mn mnVar) {
        ku3 ku3Var = new ku3(view);
        djd djdVar = new djd(Choreographer.getInstance());
        this.a = view;
        this.b = ku3Var;
        this.c = djdVar;
        this.e = ox8.j;
        this.f = ox8.k;
        this.g = new uid("", 4, bkd.b);
        this.h = ry5.g;
        this.i = new ArrayList();
        this.j = vx0.d0(yw6.NONE, new bd9(27, this));
        this.l = new hl2(mnVar, ku3Var);
        this.m = new o78(new ajd[16]);
    }

    @Override // defpackage.ab9
    public final void a(uid uidVar, yqa yqaVar, qjd qjdVar, k0b k0bVar, zwa zwaVar, zwa zwaVar2) {
        hl2 hl2Var = this.l;
        synchronized (hl2Var.c) {
            try {
                hl2Var.j = uidVar;
                hl2Var.l = yqaVar;
                hl2Var.k = qjdVar;
                hl2Var.m = k0bVar;
                hl2Var.n = zwaVar;
                hl2Var.o = zwaVar2;
                if (hl2Var.e || hl2Var.d) {
                    hl2Var.a();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.ab9
    public final void b(uid uidVar, ry5 ry5Var, pi9 pi9Var, qa2 qa2Var) {
        this.d = true;
        this.g = uidVar;
        this.h = ry5Var;
        this.e = pi9Var;
        this.f = qa2Var;
        i(ajd.StartInput);
    }

    @Override // defpackage.ab9
    public final void c() {
        i(ajd.StartInput);
    }

    @Override // defpackage.ab9
    public final void d() {
        i(ajd.ShowKeyboard);
    }

    @Override // defpackage.ab9
    public final void e() {
        this.d = false;
        this.e = ox8.l;
        this.f = ox8.m;
        this.k = null;
        i(ajd.StopInput);
    }

    @Override // defpackage.ab9
    public final void f(uid uidVar, uid uidVar2) {
        boolean z = (bkd.b(this.g.b, uidVar2.b) && g76.L(this.g.c, uidVar2.c)) ? false : true;
        this.g = uidVar2;
        int size = this.i.size();
        for (int i = 0; i < size; i++) {
            wwa wwaVar = (wwa) ((WeakReference) this.i.get(i)).get();
            if (wwaVar != null) {
                wwaVar.d = uidVar2;
            }
        }
        hl2 hl2Var = this.l;
        synchronized (hl2Var.c) {
            hl2Var.j = null;
            hl2Var.l = null;
            hl2Var.k = null;
            hl2Var.m = fn.A;
            hl2Var.n = null;
            hl2Var.o = null;
        }
        if (g76.L(uidVar, uidVar2)) {
            if (z) {
                ku3 ku3Var = this.b;
                int iF = bkd.f(uidVar2.b);
                int iE = bkd.e(uidVar2.b);
                bkd bkdVar = this.g.c;
                int iF2 = bkdVar != null ? bkd.f(bkdVar.a) : -1;
                bkd bkdVar2 = this.g.c;
                ((InputMethodManager) ((vq6) ku3Var.c).getValue()).updateSelection((View) ku3Var.b, iF, iE, iF2, bkdVar2 != null ? bkd.e(bkdVar2.a) : -1);
                return;
            }
            return;
        }
        if (uidVar != null && (!g76.L(uidVar.a.b, uidVar2.a.b) || (bkd.b(uidVar.b, uidVar2.b) && !g76.L(uidVar.c, uidVar2.c)))) {
            ku3 ku3Var2 = this.b;
            ((InputMethodManager) ((vq6) ku3Var2.c).getValue()).restartInput((View) ku3Var2.b);
            return;
        }
        int size2 = this.i.size();
        for (int i2 = 0; i2 < size2; i2++) {
            wwa wwaVar2 = (wwa) ((WeakReference) this.i.get(i2)).get();
            if (wwaVar2 != null) {
                uid uidVar3 = this.g;
                ku3 ku3Var3 = this.b;
                if (wwaVar2.h) {
                    wwaVar2.d = uidVar3;
                    if (wwaVar2.f) {
                        ((InputMethodManager) ((vq6) ku3Var3.c).getValue()).updateExtractedText((View) ku3Var3.b, wwaVar2.e, yi2.S(uidVar3));
                    }
                    bkd bkdVar3 = uidVar3.c;
                    long j = uidVar3.b;
                    int iF3 = bkdVar3 != null ? bkd.f(bkdVar3.a) : -1;
                    bkd bkdVar4 = uidVar3.c;
                    ((InputMethodManager) ((vq6) ku3Var3.c).getValue()).updateSelection((View) ku3Var3.b, bkd.f(j), bkd.e(j), iF3, bkdVar4 != null ? bkd.e(bkdVar4.a) : -1);
                }
            }
        }
    }

    @Override // defpackage.ab9
    public final void g() {
        i(ajd.HideKeyboard);
    }

    @Override // defpackage.ab9
    public final void h(zwa zwaVar) {
        Rect rect;
        this.k = new Rect(nk7.w0(zwaVar.a), nk7.w0(zwaVar.b), nk7.w0(zwaVar.c), nk7.w0(zwaVar.d));
        if (!this.i.isEmpty() || (rect = this.k) == null) {
            return;
        }
        this.a.requestRectangleOnScreen(new Rect(rect));
    }

    public final void i(ajd ajdVar) {
        this.m.b(ajdVar);
        if (this.n == null) {
            b2a b2aVar = new b2a(7, this);
            this.c.execute(b2aVar);
            this.n = b2aVar;
        }
    }
}
