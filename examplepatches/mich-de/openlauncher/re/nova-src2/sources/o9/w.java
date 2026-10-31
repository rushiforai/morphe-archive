package o9;

import android.animation.ObjectAnimator;
import android.graphics.PointF;
import android.util.ArrayMap;
import com.android.launcher3.CellLayout;

/* loaded from: classes2.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final v2 f80196a;

    /* renamed from: b, reason: collision with root package name */
    public float f80197b;

    /* renamed from: c, reason: collision with root package name */
    public float f80198c;

    /* renamed from: d, reason: collision with root package name */
    public float f80199d;

    /* renamed from: e, reason: collision with root package name */
    public float f80200e;

    /* renamed from: f, reason: collision with root package name */
    public final float f80201f;

    /* renamed from: g, reason: collision with root package name */
    public float f80202g;

    /* renamed from: h, reason: collision with root package name */
    public final int f80203h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f80204i = false;

    /* renamed from: j, reason: collision with root package name */
    public float f80205j = 0.0f;

    /* renamed from: k, reason: collision with root package name */
    public ObjectAnimator f80206k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ CellLayout f80207l;

    public w(CellLayout cellLayout, v2 v2Var, int i5, int i11, int i12, int i13, int i14, int i15, int i16) {
        this.f80207l = cellLayout;
        int[] iArr = cellLayout.f20906j;
        float f11 = cellLayout.R;
        cellLayout.N(i11, i12, i15, i16, iArr);
        int[] iArr2 = cellLayout.f20906j;
        int i17 = iArr2[0];
        int i18 = iArr2[1];
        cellLayout.N(i13, i14, i15, i16, iArr2);
        int i19 = iArr2[0] - i17;
        int i21 = iArr2[1] - i18;
        this.f80196a = v2Var;
        this.f80203h = i5;
        this.f80197b = 0.0f;
        this.f80198c = 0.0f;
        PointF pointF = cellLayout.f20908l;
        v2Var.p(pointF);
        this.f80199d = pointF.x;
        this.f80200e = pointF.y;
        this.f80202g = v2Var.b();
        this.f80201f = 1.0f - ((4.0f / v2Var.c().getWidth()) * this.f80202g);
        int i22 = i5 == 0 ? -1 : 1;
        if (i19 == i21 && i19 == 0) {
            return;
        }
        if (i21 == 0) {
            this.f80197b = Math.signum(i19) * (-i22) * f11;
            return;
        }
        if (i19 == 0) {
            this.f80198c = Math.signum(i21) * (-i22) * f11;
            return;
        }
        float f12 = i21;
        float f13 = i19;
        double dAtan = Math.atan(f12 / f13);
        float f14 = -i22;
        double d5 = f11;
        this.f80197b = (int) (Math.abs(Math.cos(dAtan) * d5) * Math.signum(f13) * f14);
        this.f80198c = (int) (Math.abs(Math.sin(dAtan) * d5) * Math.signum(f12) * f14);
    }

    public static void a(w wVar, float f11) {
        v2 v2Var = wVar.f80196a;
        wVar.f80205j = f11;
        if (wVar.f80203h == 0 && wVar.f80204i) {
            f11 = 1.0f;
        }
        float f12 = 1.0f - f11;
        v2Var.i((wVar.f80199d * f12) + (wVar.f80197b * f11), (f12 * wVar.f80200e) + (f11 * wVar.f80198c));
        float f13 = wVar.f80205j;
        v2Var.h(((1.0f - f13) * wVar.f80202g) + (wVar.f80201f * f13));
    }

    public final void b() {
        ArrayMap arrayMap = this.f80207l.B;
        boolean z11 = this.f80197b == 0.0f && this.f80198c == 0.0f;
        v2 v2Var = this.f80196a;
        if (arrayMap.containsKey(v2Var)) {
            w wVar = (w) arrayMap.get(v2Var);
            arrayMap.remove(v2Var);
            if (z11) {
                wVar.c();
                return;
            } else {
                ObjectAnimator objectAnimator = wVar.f80206k;
                if (objectAnimator != null) {
                    objectAnimator.cancel();
                }
            }
        }
        if (z11) {
            return;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, CellLayout.f20890j0, 0.0f, 1.0f);
        this.f80206k = objectAnimatorOfFloat;
        if (g3.a()) {
            objectAnimatorOfFloat.setRepeatMode(2);
            objectAnimatorOfFloat.setRepeatCount(-1);
        }
        objectAnimatorOfFloat.setDuration(this.f80203h == 0 ? 650L : 300L);
        objectAnimatorOfFloat.setStartDelay((int) (Math.random() * 60.0d));
        objectAnimatorOfFloat.addListener(new aa.i0(this, 13));
        arrayMap.put(v2Var, this);
        objectAnimatorOfFloat.start();
    }

    public final void c() {
        ObjectAnimator objectAnimator = this.f80206k;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        if (this.f80203h == 0 && this.f80204i) {
            this.f80202g = 1.0f;
            this.f80198c = 0.0f;
            this.f80197b = 0.0f;
        } else {
            this.f80202g = 1.0f;
            this.f80199d = 0.0f;
            this.f80200e = 0.0f;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, CellLayout.f20890j0, this.f80205j, 0.0f);
        this.f80206k = objectAnimatorOfFloat;
        objectAnimatorOfFloat.setInterpolator(s9.k.f86793f);
        this.f80206k.setDuration(150L);
        this.f80206k.start();
    }
}
