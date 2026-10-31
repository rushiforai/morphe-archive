package o9;

import android.view.View;
import android.view.ViewTreeObserver;

/* loaded from: classes2.dex */
public final class q0 implements ViewTreeObserver.OnDrawListener, View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public View f80074a;

    /* renamed from: b, reason: collision with root package name */
    public long f80075b;

    public q0(View view) {
        view.addOnAttachStateChangeListener(this);
        if (view.isAttachedToWindow()) {
            onViewAttachedToWindow(view);
        }
    }

    @Override // android.view.ViewTreeObserver.OnDrawListener
    public final void onDraw() {
        this.f80075b++;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        View rootView = view.getRootView();
        this.f80074a = rootView;
        rootView.getViewTreeObserver().addOnDrawListener(this);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        View view2 = this.f80074a;
        if (view2 != null) {
            view2.getViewTreeObserver().removeOnDrawListener(this);
            this.f80074a = null;
        }
    }
}
