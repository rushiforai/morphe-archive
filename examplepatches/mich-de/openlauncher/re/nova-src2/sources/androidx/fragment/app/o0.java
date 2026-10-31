package androidx.fragment.app;

import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.Transformation;

/* loaded from: classes2.dex */
public final class o0 extends AnimationSet implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final ViewGroup f14638a;

    /* renamed from: b, reason: collision with root package name */
    public final View f14639b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f14640c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f14641d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f14642e;

    public o0(Animation animation, ViewGroup viewGroup, View view) {
        super(false);
        this.f14642e = true;
        this.f14638a = viewGroup;
        this.f14639b = view;
        addAnimation(animation);
        viewGroup.post(this);
    }

    @Override // android.view.animation.AnimationSet, android.view.animation.Animation
    public final boolean getTransformation(long j11, Transformation transformation) {
        this.f14642e = true;
        if (this.f14640c) {
            return !this.f14641d;
        }
        if (!super.getTransformation(j11, transformation)) {
            this.f14640c = true;
            a5.c0.a(this.f14638a, this);
        }
        return true;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z11 = this.f14640c;
        ViewGroup viewGroup = this.f14638a;
        if (z11 || !this.f14642e) {
            viewGroup.endViewTransition(this.f14639b);
            this.f14641d = true;
        } else {
            this.f14642e = false;
            viewGroup.post(this);
        }
    }

    @Override // android.view.animation.Animation
    public final boolean getTransformation(long j11, Transformation transformation, float f11) {
        this.f14642e = true;
        if (this.f14640c) {
            return !this.f14641d;
        }
        if (!super.getTransformation(j11, transformation, f11)) {
            this.f14640c = true;
            a5.c0.a(this.f14638a, this);
        }
        return true;
    }
}
