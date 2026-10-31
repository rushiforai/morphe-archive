package zx;

import android.animation.TimeInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;

/* loaded from: classes4.dex */
public final class c implements Interpolator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98802a;

    /* renamed from: b, reason: collision with root package name */
    public final DecelerateInterpolator f98803b;

    /* renamed from: c, reason: collision with root package name */
    public final TimeInterpolator f98804c;

    public c(int i5) {
        this.f98802a = i5;
        switch (i5) {
            case 1:
                this.f98803b = d.f98809e;
                this.f98804c = new b(0.13f);
                break;
            default:
                a aVar = new a();
                aVar.f98800a = new b(0.35f);
                this.f98804c = aVar;
                this.f98803b = d.f98811g;
                break;
        }
    }

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        switch (this.f98802a) {
            case 0:
                return this.f98803b.getInterpolation(((a) this.f98804c).getInterpolation(f11));
            default:
                return this.f98803b.getInterpolation(((b) this.f98804c).getInterpolation(f11));
        }
    }
}
