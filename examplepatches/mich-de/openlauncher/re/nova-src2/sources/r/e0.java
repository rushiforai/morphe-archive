package r;

import android.view.ViewTreeObserver;
import android.widget.PopupWindow;

/* loaded from: classes2.dex */
public final class e0 implements PopupWindow.OnDismissListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d9.d f84699a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f0 f84700b;

    public e0(f0 f0Var, d9.d dVar) {
        this.f84700b = f0Var;
        this.f84699a = dVar;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
        ViewTreeObserver viewTreeObserver = this.f84700b.G.getViewTreeObserver();
        if (viewTreeObserver != null) {
            viewTreeObserver.removeGlobalOnLayoutListener(this.f84699a);
        }
    }
}
