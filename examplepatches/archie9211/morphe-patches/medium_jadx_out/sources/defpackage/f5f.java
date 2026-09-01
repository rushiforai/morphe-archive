package defpackage;

import android.graphics.Path;
import android.os.Build;
import android.view.View;
import com.medium.reader.R;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f5f {
    public static final WeakHashMap w = new WeakHashMap();
    public final hu a;
    public final hu b;
    public final hu c;
    public final hu d;
    public final hu e;
    public final hu f;
    public final hu g;
    public final hu h;
    public final hu i;
    public final hqe j;
    public final k49 k;
    public final y0e l;
    public final hqe m;
    public final hqe n;
    public final hqe o;
    public final hqe p;
    public final hqe q;
    public final hqe r;
    public final hqe s;
    public final boolean t;
    public int u;
    public final g36 v;

    public f5f(View view) {
        hu huVar = new hu(4, "captionBar");
        this.a = huVar;
        hu huVar2 = new hu(128, "displayCutout");
        this.b = huVar2;
        hu huVar3 = new hu(8, "ime");
        this.c = huVar3;
        hu huVar4 = new hu(32, "mandatorySystemGestures");
        this.d = huVar4;
        hu huVar5 = new hu(2, "navigationBars");
        this.e = huVar5;
        hu huVar6 = new hu(1, "statusBars");
        this.f = huVar6;
        hu huVar7 = new hu(519, "systemBars");
        this.g = huVar7;
        hu huVar8 = new hu(16, "systemGestures");
        this.h = huVar8;
        hu huVar9 = new hu(64, "tappableElement");
        this.i = huVar9;
        hqe hqeVar = new hqe(new k36(0, 0, 0, 0), "waterfall");
        this.j = hqeVar;
        this.k = qo7.u(null);
        y0e y0eVar = new y0e(new y0e(huVar7, huVar3), huVar2);
        this.l = y0eVar;
        new y0e(y0eVar, new y0e(new y0e(new y0e(huVar9, huVar4), huVar8), hqeVar));
        this.m = tr7.A(4, "captionBarIgnoringVisibility");
        this.n = tr7.A(2, "navigationBarsIgnoringVisibility");
        this.o = tr7.A(1, "statusBarsIgnoringVisibility");
        this.p = tr7.A(519, "systemBarsIgnoringVisibility");
        this.q = tr7.A(64, "tappableElementIgnoringVisibility");
        this.r = new hqe(new k36(0, 0, 0, 0), "imeAnimationTarget");
        this.s = new hqe(new k36(0, 0, 0, 0), "imeAnimationSource");
        Object parent = view.getParent();
        View view2 = parent instanceof View ? (View) parent : null;
        Object tag = view2 != null ? view2.getTag(R.id.consume_window_insets_tag) : null;
        Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
        this.t = bool != null ? bool.booleanValue() : false;
        this.v = new g36(this);
        WeakHashMap weakHashMap = ute.a;
        z4f z4fVarA = nte.a(view);
        if (z4fVarA != null) {
            w4f w4fVar = z4fVarA.a;
            huVar.f(w4fVar.u(4));
            huVar2.f(w4fVar.u(128));
            huVar3.f(w4fVar.u(8));
            huVar4.f(w4fVar.u(32));
            huVar5.f(w4fVar.u(2));
            huVar6.f(w4fVar.u(1));
            huVar7.f(w4fVar.u(519));
            huVar8.f(w4fVar.u(16));
            huVar9.f(w4fVar.u(64));
        }
    }

    public static void b(f5f f5fVar, z4f z4fVar) {
        boolean z = false;
        f5fVar.a.g(z4fVar, 0);
        f5fVar.c.g(z4fVar, 0);
        f5fVar.b.g(z4fVar, 0);
        f5fVar.e.g(z4fVar, 0);
        f5fVar.f.g(z4fVar, 0);
        f5fVar.g.g(z4fVar, 0);
        f5fVar.h.g(z4fVar, 0);
        f5fVar.i.g(z4fVar, 0);
        f5fVar.d.g(z4fVar, 0);
        f5fVar.m.f(ek7.M(z4fVar.a.j(4)));
        f5fVar.n.f(ek7.M(z4fVar.a.j(2)));
        f5fVar.o.f(ek7.M(z4fVar.a.j(1)));
        f5fVar.p.f(ek7.M(z4fVar.a.j(519)));
        f5fVar.q.f(ek7.M(z4fVar.a.j(64)));
        yg3 yg3VarH = z4fVar.a.h();
        f5fVar.j.f(ek7.M(yg3VarH != null ? yg3VarH.a() : b36.e));
        br brVar = null;
        if (yg3VarH != null) {
            Path pathH = Build.VERSION.SDK_INT >= 31 ? io.h(yg3VarH.a) : null;
            if (pathH != null) {
                brVar = new br(pathH);
            }
        }
        f5fVar.k.setValue(brVar);
        synchronized (uic.c) {
            g78 g78Var = uic.j.h;
            if (g78Var != null) {
                if (g78Var.h()) {
                    z = true;
                }
            }
        }
        if (z) {
            uic.c();
        }
    }

    public final void a(View view) {
        if (this.u == 0) {
            WeakHashMap weakHashMap = ute.a;
            g36 g36Var = this.v;
            mte.c(view, g36Var);
            if (view.isAttachedToWindow()) {
                view.requestApplyInsets();
            }
            view.addOnAttachStateChangeListener(g36Var);
            f4f.a(view, g36Var);
        }
        this.u++;
    }
}
