package mx;

import android.view.View;
import java.util.WeakHashMap;

/* loaded from: classes4.dex */
public final class n1 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77216a;

    public /* synthetic */ n1(int i5) {
        this.f77216a = i5;
    }

    private final void a(View view) {
    }

    private final void b(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        switch (this.f77216a) {
            case 0:
                break;
            default:
                view.removeOnAttachStateChangeListener(this);
                WeakHashMap weakHashMap = a5.a1.f250a;
                a5.q0.c(view);
                break;
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        switch (this.f77216a) {
            case 0:
                view.removeOnAttachStateChangeListener(p1.f77226c);
                p1.b(view);
                break;
        }
    }
}
