package defpackage;

import android.os.Build;
import android.view.View;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g36 extends up1 implements Runnable, yp8, View.OnAttachStateChangeListener {
    public final f5f d;
    public boolean e;
    public boolean f;
    public z4f g;

    public g36(f5f f5fVar) {
        super(!f5fVar.t ? 1 : 0);
        this.d = f5fVar;
    }

    @Override // defpackage.yp8
    public final z4f W(View view, z4f z4fVar) {
        this.g = z4fVar;
        f5f f5fVar = this.d;
        hqe hqeVar = f5fVar.r;
        w4f w4fVar = z4fVar.a;
        hqeVar.f(ek7.M(w4fVar.i(8)));
        if (this.e) {
            if (Build.VERSION.SDK_INT == 30) {
                view.post(this);
            }
        } else if (!this.f) {
            f5fVar.s.f(ek7.M(w4fVar.i(8)));
            f5f.b(f5fVar, z4fVar);
        }
        return f5fVar.t ? z4f.b : z4fVar;
    }

    @Override // defpackage.up1
    public final void d(f4f f4fVar) {
        this.e = false;
        this.f = false;
        z4f z4fVar = this.g;
        if (f4fVar.a.b() > 0 && z4fVar != null) {
            w4f w4fVar = z4fVar.a;
            f5f f5fVar = this.d;
            f5fVar.s.f(ek7.M(w4fVar.i(8)));
            f5fVar.r.f(ek7.M(w4fVar.i(8)));
            f5f.b(f5fVar, z4fVar);
        }
        this.g = null;
    }

    @Override // defpackage.up1
    public final void e(f4f f4fVar) {
        this.e = true;
        this.f = true;
    }

    @Override // defpackage.up1
    public final z4f f(z4f z4fVar, List list) {
        f5f f5fVar = this.d;
        f5f.b(f5fVar, z4fVar);
        return f5fVar.t ? z4f.b : z4fVar;
    }

    @Override // defpackage.up1
    public final mya g(f4f f4fVar, mya myaVar) {
        this.e = false;
        return myaVar;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        view.requestApplyInsets();
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.e) {
            this.e = false;
            this.f = false;
            z4f z4fVar = this.g;
            if (z4fVar != null) {
                f5f f5fVar = this.d;
                f5fVar.s.f(ek7.M(z4fVar.a.i(8)));
                f5f.b(f5fVar, z4fVar);
                this.g = null;
            }
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
    }
}
