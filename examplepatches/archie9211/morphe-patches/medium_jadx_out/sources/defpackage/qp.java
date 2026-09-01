package defpackage;

import android.content.Context;
import android.os.Build;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qp implements lf5 {
    public static boolean f = true;
    public final mn a;
    public final Object b = new Object();
    public pue c;
    public boolean d;
    public final op e;

    public qp(mn mnVar) {
        this.a = mnVar;
        op opVar = new op();
        this.e = opVar;
        if (mnVar.isAttachedToWindow()) {
            Context context = mnVar.getContext();
            if (!this.d) {
                context.getApplicationContext().registerComponentCallbacks(opVar);
                this.d = true;
            }
        }
        mnVar.addOnAttachStateChangeListener(new pp(0, this));
    }

    @Override // defpackage.lf5
    public final void a(of5 of5Var) {
        synchronized (this.b) {
            if (!of5Var.s) {
                of5Var.s = true;
                of5Var.b();
            }
        }
    }

    @Override // defpackage.lf5
    public final of5 b() {
        qf5 wf5Var;
        qf5 uf5Var;
        of5 of5Var;
        synchronized (this.b) {
            try {
                mn mnVar = this.a;
                int i = Build.VERSION.SDK_INT;
                if (i >= 29) {
                    nm.r(mnVar);
                }
                if (i >= 29) {
                    uf5Var = new uf5();
                } else {
                    if (f) {
                        try {
                            wf5Var = new tf5(this.a, new h61(), new g61());
                        } catch (Throwable unused) {
                            f = false;
                            wf5Var = new wf5(c(this.a));
                        }
                    } else {
                        wf5Var = new wf5(c(this.a));
                    }
                    uf5Var = wf5Var;
                }
                of5Var = new of5(uf5Var);
            } catch (Throwable th) {
                throw th;
            }
        }
        return of5Var;
    }

    public final wl3 c(mn mnVar) {
        pue pueVar = this.c;
        if (pueVar != null) {
            return pueVar;
        }
        pue pueVar2 = new pue(mnVar.getContext());
        pueVar2.setClipChildren(false);
        pueVar2.setClipToPadding(false);
        pueVar2.setTag(R.id.hide_graphics_layer_in_inspector_tag, Boolean.TRUE);
        mnVar.addView(pueVar2, -1);
        this.c = pueVar2;
        return pueVar2;
    }
}
