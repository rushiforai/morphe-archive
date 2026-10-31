package k0;

import android.view.View;
import androidx.core.graphics.Insets;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class h2 {

    /* renamed from: v, reason: collision with root package name */
    public static final WeakHashMap f70617v = new WeakHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final b f70618a = e.c(4, "captionBar");

    /* renamed from: b, reason: collision with root package name */
    public final b f70619b;

    /* renamed from: c, reason: collision with root package name */
    public final b f70620c;

    /* renamed from: d, reason: collision with root package name */
    public final b f70621d;

    /* renamed from: e, reason: collision with root package name */
    public final b f70622e;

    /* renamed from: f, reason: collision with root package name */
    public final b f70623f;

    /* renamed from: g, reason: collision with root package name */
    public final b f70624g;

    /* renamed from: h, reason: collision with root package name */
    public final b f70625h;

    /* renamed from: i, reason: collision with root package name */
    public final b f70626i;

    /* renamed from: j, reason: collision with root package name */
    public final e2 f70627j;

    /* renamed from: k, reason: collision with root package name */
    public final c2 f70628k;

    /* renamed from: l, reason: collision with root package name */
    public final e2 f70629l;

    /* renamed from: m, reason: collision with root package name */
    public final e2 f70630m;
    public final e2 n;
    public final e2 o;

    /* renamed from: p, reason: collision with root package name */
    public final e2 f70631p;

    /* renamed from: q, reason: collision with root package name */
    public final e2 f70632q;

    /* renamed from: r, reason: collision with root package name */
    public final e2 f70633r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f70634s;

    /* renamed from: t, reason: collision with root package name */
    public int f70635t;

    /* renamed from: u, reason: collision with root package name */
    public final w0 f70636u;

    public h2(View view) {
        b bVarC = e.c(128, "displayCutout");
        this.f70619b = bVarC;
        b bVarC2 = e.c(8, "ime");
        this.f70620c = bVarC2;
        b bVarC3 = e.c(32, "mandatorySystemGestures");
        this.f70621d = bVarC3;
        this.f70622e = e.c(2, "navigationBars");
        this.f70623f = e.c(1, "statusBars");
        b bVarC4 = e.c(7, "systemBars");
        this.f70624g = bVarC4;
        b bVarC5 = e.c(16, "systemGestures");
        this.f70625h = bVarC5;
        b bVarC6 = e.c(64, "tappableElement");
        this.f70626i = bVarC6;
        e2 e2Var = new e2(i2.i(Insets.NONE), "waterfall");
        this.f70627j = e2Var;
        this.f70628k = new c2(new c2(bVarC4, bVarC2), bVarC);
        new c2(new c2(new c2(bVarC6, bVarC3), bVarC5), e2Var);
        this.f70629l = e.d(4, "captionBarIgnoringVisibility");
        this.f70630m = e.d(2, "navigationBarsIgnoringVisibility");
        this.n = e.d(1, "statusBarsIgnoringVisibility");
        this.o = e.d(7, "systemBarsIgnoringVisibility");
        this.f70631p = e.d(64, "tappableElementIgnoringVisibility");
        this.f70632q = e.d(8, "imeAnimationTarget");
        this.f70633r = e.d(8, "imeAnimationSource");
        Object parent = view.getParent();
        View view2 = parent instanceof View ? (View) parent : null;
        Object tag = view2 != null ? view2.getTag(2131427745) : null;
        Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
        this.f70634s = bool != null ? bool.booleanValue() : false;
        this.f70636u = new w0(this);
    }

    public static void a(h2 h2Var, a5.h2 h2Var2) {
        boolean z11 = false;
        h2Var.f70618a.f(h2Var2, 0);
        h2Var.f70620c.f(h2Var2, 0);
        h2Var.f70619b.f(h2Var2, 0);
        h2Var.f70622e.f(h2Var2, 0);
        h2Var.f70623f.f(h2Var2, 0);
        h2Var.f70624g.f(h2Var2, 0);
        h2Var.f70625h.f(h2Var2, 0);
        h2Var.f70626i.f(h2Var2, 0);
        h2Var.f70621d.f(h2Var2, 0);
        h2Var.f70629l.f(i2.i(h2Var2.f296a.h(4)));
        h2Var.f70630m.f(i2.i(h2Var2.f296a.h(2)));
        h2Var.n.f(i2.i(h2Var2.f296a.h(1)));
        h2Var.o.f(i2.i(h2Var2.f296a.h(7)));
        h2Var.f70631p.f(i2.i(h2Var2.f296a.h(64)));
        a5.n nVarF = h2Var2.f296a.f();
        if (nVarF != null) {
            h2Var.f70627j.f(i2.i(nVarF.a()));
        }
        synchronized (z1.k.f97943c) {
            z.p0 p0Var = z1.k.f97950j.f97895h;
            if (p0Var != null) {
                if (p0Var.c()) {
                    z11 = true;
                }
            }
        }
        if (z11) {
            z1.k.a();
        }
    }
}
