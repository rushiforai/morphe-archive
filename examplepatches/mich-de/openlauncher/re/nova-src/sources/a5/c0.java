package a5;

import android.view.View;
import android.view.ViewTreeObserver;

/* loaded from: classes2.dex */
public final class c0 implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final View f261a;

    /* renamed from: b, reason: collision with root package name */
    public ViewTreeObserver f262b;

    /* renamed from: c, reason: collision with root package name */
    public final Runnable f263c;

    public c0(View view, Runnable runnable) {
        this.f261a = view;
        this.f262b = view.getViewTreeObserver();
        this.f263c = runnable;
    }

    public static void a(View view, Runnable runnable) {
        if (view == null) {
            throw new NullPointerException("view == null");
        }
        c0 c0Var = new c0(view, runnable);
        view.getViewTreeObserver().addOnPreDrawListener(c0Var);
        view.addOnAttachStateChangeListener(c0Var);
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        boolean zIsAlive = this.f262b.isAlive();
        View view = this.f261a;
        if (zIsAlive) {
            this.f262b.removeOnPreDrawListener(this);
        } else {
            view.getViewTreeObserver().removeOnPreDrawListener(this);
        }
        view.removeOnAttachStateChangeListener(this);
        this.f263c.run();
        return true;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        this.f262b = view.getViewTreeObserver();
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        boolean zIsAlive = this.f262b.isAlive();
        View view2 = this.f261a;
        if (zIsAlive) {
            this.f262b.removeOnPreDrawListener(this);
        } else {
            view2.getViewTreeObserver().removeOnPreDrawListener(this);
        }
        view2.removeOnAttachStateChangeListener(this);
    }
}
