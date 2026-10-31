package d20;

import android.content.Context;
import android.util.AttributeSet;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import com.android.launcher3.allapps.FloatingHeaderView;
import mx.j0;

/* loaded from: classes.dex */
public abstract class f extends FrameLayout implements q9.v {

    /* renamed from: e, reason: collision with root package name */
    public static final e f48898e = new e(0);

    /* renamed from: a, reason: collision with root package name */
    public boolean f48899a;

    /* renamed from: b, reason: collision with root package name */
    public float f48900b;

    /* renamed from: c, reason: collision with root package name */
    public final lz.a f48901c;

    /* renamed from: d, reason: collision with root package name */
    public final lz.a f48902d;

    public f(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        final int i5 = 0;
        this.f48901c = new lz.a(new Runnable(this) { // from class: d20.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f f48896b;

            {
                this.f48896b = this;
            }

            @Override // java.lang.Runnable
            public final void run() {
                switch (i5) {
                    case 0:
                        this.f48896b.i();
                        break;
                    default:
                        this.f48896b.i();
                        break;
                }
            }
        });
        final int i11 = 1;
        this.f48902d = new lz.a(new Runnable(this) { // from class: d20.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f f48896b;

            {
                this.f48896b = this;
            }

            @Override // java.lang.Runnable
            public final void run() {
                switch (i11) {
                    case 0:
                        this.f48896b.i();
                        break;
                    default:
                        this.f48896b.i();
                        break;
                }
            }
        });
    }

    public void b(j0 j0Var) {
        removeAllViews();
    }

    @Override // q9.v
    public final void c(int i5, boolean z11) {
        this.f48899a = z11;
        i();
        if (z11) {
            return;
        }
        this.f48900b = i5;
        i();
    }

    @Override // q9.v
    public final Class d() {
        return getClass();
    }

    @Override // q9.v
    public final boolean e() {
        return getVisibility() == 0;
    }

    public void f(FloatingHeaderView floatingHeaderView, q9.v[] vVarArr, boolean z11) {
    }

    public void g(j0 j0Var) {
    }

    @Override // q9.v
    public final void h(boolean z11, s9.o oVar, Interpolator interpolator, Interpolator interpolator2) {
        oVar.a(this.f48901c, lz.a.f75160c, z11 ? 1.0f : 0.0f, interpolator);
    }

    public final void i() {
        if (a()) {
            float f11 = 1;
            lz.a aVar = this.f48902d;
            setTranslationY((f11 - aVar.f75162b) * this.f48900b);
            float interpolation = f48898e.getInterpolation(aVar.f75162b);
            setAlpha(this.f48901c.f75162b * (((f11 - interpolation) * (1 ^ (this.f48899a ? 1 : 0))) + interpolation));
            s9.a.a(this);
        }
    }
}
