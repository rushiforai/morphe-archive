package wj;

import ai.u1;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.provider.Settings;
import h6.c1;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class n extends l {

    /* renamed from: l, reason: collision with root package name */
    public final u1 f94463l;

    /* renamed from: m, reason: collision with root package name */
    public final c3.b f94464m;
    public j7.o n;

    public n(Context context, d dVar, u1 u1Var, c3.b bVar) {
        super(context, dVar);
        this.f94463l = u1Var;
        this.f94464m = bVar;
        bVar.f19222a = this;
    }

    @Override // wj.l
    public final boolean d(boolean z11, boolean z12, boolean z13) {
        j7.o oVar;
        boolean zD = super.d(z11, z12, z13);
        if (this.f94451c != null && Settings.Global.getFloat(this.f94449a.getContentResolver(), "animator_duration_scale", 1.0f) == 0.0f && (oVar = this.n) != null) {
            return oVar.setVisible(z11, z12);
        }
        if (!isRunning()) {
            this.f94464m.g();
        }
        if (z11 && z13) {
            this.f94464m.C();
        }
        return zD;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int i5;
        j7.o oVar;
        Rect rect = new Rect();
        if (!getBounds().isEmpty() && isVisible() && canvas.getClipBounds(rect)) {
            w6.b bVar = this.f94451c;
            d dVar = this.f94450b;
            if (bVar != null && Settings.Global.getFloat(this.f94449a.getContentResolver(), "animator_duration_scale", 1.0f) == 0.0f && (oVar = this.n) != null) {
                oVar.setBounds(getBounds());
                this.n.setTint(dVar.f94415c[0]);
                this.n.draw(canvas);
                return;
            }
            canvas.save();
            Rect bounds = getBounds();
            float fB = b();
            ObjectAnimator objectAnimator = this.f94452d;
            boolean z11 = objectAnimator != null && objectAnimator.isRunning();
            ObjectAnimator objectAnimator2 = this.f94453e;
            boolean z12 = objectAnimator2 != null && objectAnimator2.isRunning();
            u1 u1Var = this.f94463l;
            ((d) u1Var.f13368a).a();
            u1Var.g(canvas, bounds, fB, z11, z12);
            int i11 = dVar.f94419g;
            int i12 = this.f94458j;
            Paint paint = this.f94457i;
            if (i11 == 0) {
                this.f94463l.l(canvas, paint, 0.0f, 1.0f, dVar.f94416d, i12, 0);
                i5 = i11;
            } else {
                m mVar = (m) ((ArrayList) this.f94464m.f19223b).get(0);
                m mVar2 = (m) c1.l((ArrayList) this.f94464m.f19223b, 1);
                u1 u1Var2 = this.f94463l;
                if (u1Var2 instanceof o) {
                    i5 = i11;
                    u1Var2.l(canvas, paint, 0.0f, mVar.f94459a, dVar.f94416d, i12, i5);
                    this.f94463l.l(canvas, paint, mVar2.f94460b, 1.0f, dVar.f94416d, i12, i5);
                } else {
                    i5 = i11;
                    i12 = 0;
                    u1Var2.l(canvas, paint, mVar2.f94460b, mVar.f94459a + 1.0f, dVar.f94416d, 0, i5);
                }
            }
            for (int i13 = 0; i13 < ((ArrayList) this.f94464m.f19223b).size(); i13++) {
                m mVar3 = (m) ((ArrayList) this.f94464m.f19223b).get(i13);
                this.f94463l.k(canvas, paint, mVar3, this.f94458j);
                if (i13 > 0 && i5 > 0) {
                    this.f94463l.l(canvas, paint, ((m) ((ArrayList) this.f94464m.f19223b).get(i13 - 1)).f94460b, mVar3.f94459a, dVar.f94416d, i12, i5);
                }
            }
            canvas.restore();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return this.f94463l.p();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return this.f94463l.q();
    }
}
