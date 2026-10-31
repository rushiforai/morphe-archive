package z8;

import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;
import androidx.lifecycle.DefaultLifecycleObserver;
import b9.g;
import h6.a0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class a implements c, g, DefaultLifecycleObserver {

    /* renamed from: a, reason: collision with root package name */
    public boolean f98301a;

    /* renamed from: b, reason: collision with root package name */
    public final ImageView f98302b;

    public a(ImageView imageView) {
        this.f98302b = imageView;
    }

    public final void a() {
        Object drawable = this.f98302b.getDrawable();
        Animatable animatable = drawable instanceof Animatable ? (Animatable) drawable : null;
        if (animatable == null) {
            return;
        }
        if (this.f98301a) {
            animatable.start();
        } else {
            animatable.stop();
        }
    }

    public final void b(Drawable drawable) {
        ImageView imageView = this.f98302b;
        Object drawable2 = imageView.getDrawable();
        Animatable animatable = drawable2 instanceof Animatable ? (Animatable) drawable2 : null;
        if (animatable != null) {
            animatable.stop();
        }
        imageView.setImageDrawable(drawable);
        a();
    }

    @Override // z8.c
    public final View c() {
        return this.f98302b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof a) {
            return Intrinsics.b(this.f98302b, ((a) obj).f98302b);
        }
        return false;
    }

    @Override // z8.b
    public final void g(Drawable drawable) {
        b(drawable);
    }

    @Override // z8.b
    public void h(Drawable drawable) {
        b(drawable);
    }

    public final int hashCode() {
        return this.f98302b.hashCode();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onStart(a0 a0Var) {
        this.f98301a = true;
        a();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onStop(a0 a0Var) {
        this.f98301a = false;
        a();
    }

    @Override // z8.b
    public final void u(Drawable drawable) {
        b(drawable);
    }

    @Override // b9.g
    public final Drawable x() {
        return this.f98302b.getDrawable();
    }
}
