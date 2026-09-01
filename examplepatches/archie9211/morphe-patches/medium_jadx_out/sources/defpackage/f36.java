package defpackage;

import android.os.Build;
import android.view.View;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class f36 extends up1 implements Runnable, yp8, View.OnAttachStateChangeListener {
    public boolean d;
    public int e;
    public z4f f;
    public final f78 g;
    public final h49 h;
    public final x68 i;
    public final ejc j;

    public f36() {
        super(1);
        f78 f78Var = new f78(9);
        h5f.a.getClass();
        f78Var.m(g5f.b, new u5f("caption bar"));
        f78Var.m(g5f.c, new u5f("display cutout"));
        f78Var.m(g5f.d, new u5f("ime"));
        f78Var.m(g5f.e, new u5f("mandatory system gestures"));
        f78Var.m(g5f.f, new u5f("navigation bars"));
        f78Var.m(g5f.g, new u5f("status bars"));
        f78Var.m(g5f.h, new u5f("system gestures"));
        f78Var.m(g5f.i, new u5f("tappable element"));
        f78Var.m(g5f.j, new u5f(ziYqbdHrAXvj.trBcQ));
        this.g = f78Var;
        this.h = new h49(0);
        this.i = new x68(4);
        this.j = new ejc();
    }

    /* JADX WARN: Removed duplicated region for block: B:78:0x0259  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void E0(defpackage.z4f r28) {
        /*
            Method dump skipped, instruction units count: 613
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f36.E0(z4f):void");
    }

    @Override // defpackage.yp8
    public final z4f W(View view, z4f z4fVar) {
        if (this.d) {
            this.f = z4fVar;
            if (Build.VERSION.SDK_INT == 30) {
                view.post(this);
                return z4fVar;
            }
        } else if (this.e == 0) {
            E0(z4fVar);
        }
        return z4fVar;
    }

    @Override // defpackage.up1
    public final void d(f4f f4fVar) {
        boolean z = false;
        this.d = false;
        int iD = f4fVar.a.d();
        this.e &= ~iD;
        this.f = null;
        h5f h5fVar = (h5f) j5f.a.b(iD);
        if (h5fVar != null) {
            Object objG = this.g.g(h5fVar);
            objG.getClass();
            u5f u5fVar = (u5f) objG;
            u5fVar.c.h(0.0f);
            u5fVar.e.h(1.0f);
            u5fVar.d.h(0L);
            u5fVar.c.h(0.0f);
            u5fVar.b.setValue(Boolean.FALSE);
            u5fVar.j = -1L;
            u5fVar.k = -1L;
            h49 h49Var = this.h;
            h49Var.h(h49Var.g() + 1);
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
    }

    @Override // defpackage.up1
    public final void e(f4f f4fVar) {
        this.d = true;
    }

    @Override // defpackage.up1
    public final z4f f(z4f z4fVar, List list) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            f4f f4fVar = (f4f) list.get(i);
            h5f h5fVar = (h5f) j5f.a.b(f4fVar.a.d());
            if (h5fVar != null) {
                Object objG = this.g.g(h5fVar);
                objG.getClass();
                u5f u5fVar = (u5f) objG;
                if (((Boolean) u5fVar.b.getValue()).booleanValue()) {
                    e4f e4fVar = f4fVar.a;
                    u5fVar.c.h(e4fVar.c());
                    u5fVar.e.h(e4fVar.a());
                    u5fVar.d.h(e4fVar.b());
                }
            }
        }
        E0(z4fVar);
        return z4fVar;
    }

    @Override // defpackage.up1
    public final mya g(f4f f4fVar, mya myaVar) {
        z4f z4fVar = this.f;
        boolean z = false;
        this.d = false;
        this.f = null;
        if (f4fVar.a.b() > 0 && z4fVar != null) {
            int iD = f4fVar.a.d();
            this.e |= iD;
            h5f h5fVar = (h5f) j5f.a.b(iD);
            if (h5fVar != null) {
                Object objG = this.g.g(h5fVar);
                objG.getClass();
                u5f u5fVar = (u5f) objG;
                b36 b36VarI = z4fVar.a.i(iD);
                long j = (((long) b36VarI.a) << 48) | (((long) b36VarI.b) << 32) | (((long) b36VarI.c) << 16) | ((long) b36VarI.d);
                long j2 = u5fVar.h;
                if (!lk7.t(j, j2)) {
                    u5fVar.j = j2;
                    u5fVar.k = j;
                    u5fVar.b.setValue(Boolean.TRUE);
                    e4f e4fVar = f4fVar.a;
                    u5fVar.c.h(e4fVar.c());
                    u5fVar.e.h(e4fVar.a());
                    u5fVar.d.h(e4fVar.b());
                    h49 h49Var = this.h;
                    h49Var.h(h49Var.g() + 1);
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
                        return myaVar;
                    }
                }
            }
        }
        return myaVar;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        Object parent = view.getParent();
        View view2 = parent instanceof View ? (View) parent : null;
        if (view2 != null) {
            view = view2;
        }
        WeakHashMap weakHashMap = ute.a;
        mte.c(view, this);
        f4f.a(view, this);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        Object parent = view.getParent();
        View view2 = parent instanceof View ? (View) parent : null;
        if (view2 != null) {
            view = view2;
        }
        WeakHashMap weakHashMap = ute.a;
        mte.c(view, null);
        f4f.a(view, null);
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.d) {
            this.e = 0;
            this.d = false;
            z4f z4fVar = this.f;
            if (z4fVar != null) {
                E0(z4fVar);
                this.f = null;
            }
        }
    }
}
