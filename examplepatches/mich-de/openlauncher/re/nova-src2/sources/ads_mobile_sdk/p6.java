package ads_mobile_sdk;

import android.view.View;
import b.a9;

/* loaded from: classes.dex */
public final class p6 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i50.c f8107a;

    public p6(i50.c cVar) {
        this.f8107a = cVar;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        this.f8107a.a(view);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        i50.c cVar = this.f8107a;
        if (((a9) cVar.f61380c) != null) {
            if (view.getViewTreeObserver().isAlive()) {
                view.getViewTreeObserver().removeOnWindowFocusChangeListener((a9) cVar.f61380c);
            }
            cVar.f61380c = null;
        }
    }
}
