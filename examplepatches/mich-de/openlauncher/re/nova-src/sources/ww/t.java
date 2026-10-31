package ww;

import android.view.animation.Animation;

/* loaded from: classes4.dex */
public final class t implements Animation.AnimationListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94843a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ mi.b f94844b;

    public /* synthetic */ t(mi.b bVar, int i5) {
        this.f94843a = i5;
        this.f94844b = bVar;
    }

    private final void a(Animation animation) {
    }

    private final void b(Animation animation) {
    }

    private final void c(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        switch (this.f94843a) {
            case 0:
                break;
            default:
                this.f94844b.setVisibility(4);
                break;
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
        int i5 = this.f94843a;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
        switch (this.f94843a) {
            case 0:
                this.f94844b.setVisibility(0);
                break;
            default:
                this.f94844b.setVisibility(0);
                break;
        }
    }
}
