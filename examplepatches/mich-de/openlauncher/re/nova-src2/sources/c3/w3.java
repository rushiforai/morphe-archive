package c3;

import android.view.View;

/* loaded from: classes.dex */
public final class w3 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f19460a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.y1 f19461b;

    public w3(View view, p1.y1 y1Var) {
        this.f19460a = view;
        this.f19461b = y1Var;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f19460a.removeOnAttachStateChangeListener(this);
        this.f19461b.v();
    }
}
