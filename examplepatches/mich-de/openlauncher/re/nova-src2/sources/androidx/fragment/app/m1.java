package androidx.fragment.app;

import android.view.View;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class m1 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f14615a;

    public m1(View view) {
        this.f14615a = view;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        View view2 = this.f14615a;
        view2.removeOnAttachStateChangeListener(this);
        WeakHashMap weakHashMap = a5.a1.f250a;
        a5.q0.c(view2);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
    }
}
