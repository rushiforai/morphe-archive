package a5;

import android.view.View;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public final class i1 {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f299a;

    public i1(View view) {
        this.f299a = new WeakReference(view);
    }

    public final void a(float f11) {
        View view = (View) this.f299a.get();
        if (view != null) {
            view.animate().alpha(f11);
        }
    }

    public final void b() {
        View view = (View) this.f299a.get();
        if (view != null) {
            view.animate().cancel();
        }
    }

    public final void c(long j11) {
        View view = (View) this.f299a.get();
        if (view != null) {
            view.animate().setDuration(j11);
        }
    }

    public final void d(j1 j1Var) {
        View view = (View) this.f299a.get();
        if (view != null) {
            if (j1Var != null) {
                view.animate().setListener(new h1(0, j1Var, view));
            } else {
                view.animate().setListener(null);
            }
        }
    }

    public final void e(float f11) {
        View view = (View) this.f299a.get();
        if (view != null) {
            view.animate().translationY(f11);
        }
    }
}
