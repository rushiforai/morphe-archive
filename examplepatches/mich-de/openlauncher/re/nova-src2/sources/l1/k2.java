package l1;

import android.view.View;
import android.view.ViewTreeObserver;
import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final class k2 implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener {

    /* renamed from: a, reason: collision with root package name */
    public boolean f73527a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f73528b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f73529c;

    public k2(View view, Function0 function0) {
        this.f73528b = view;
        this.f73529c = function0;
        view.addOnAttachStateChangeListener(this);
        if (this.f73527a || !view.isAttachedToWindow()) {
            return;
        }
        view.getViewTreeObserver().addOnGlobalLayoutListener(this);
        this.f73527a = true;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        this.f73529c.invoke();
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        if (this.f73527a) {
            return;
        }
        View view2 = this.f73528b;
        if (view2.isAttachedToWindow()) {
            view2.getViewTreeObserver().addOnGlobalLayoutListener(this);
            this.f73527a = true;
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        if (this.f73527a) {
            this.f73528b.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            this.f73527a = false;
        }
    }
}
