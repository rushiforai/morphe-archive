package a5;

import android.view.View;
import android.view.inputmethod.InputMethodManager;

/* loaded from: classes.dex */
public class e0 implements x8.d {

    /* renamed from: a, reason: collision with root package name */
    public final View f273a;

    public void a() {
        View view = this.f273a;
        if (view != null) {
            ((InputMethodManager) view.getContext().getSystemService("input_method")).hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }

    public void b() {
        View viewFindViewById;
        View view = this.f273a;
        if (view == null) {
            return;
        }
        if (view.isInEditMode() || view.onCheckIsTextEditor()) {
            view.requestFocus();
            viewFindViewById = view;
        } else {
            viewFindViewById = view.getRootView().findFocus();
        }
        if (viewFindViewById == null) {
            viewFindViewById = view.getRootView().findViewById(16908290);
        }
        if (viewFindViewById == null || !viewFindViewById.hasWindowFocus()) {
            return;
        }
        viewFindViewById.post(new d0(viewFindViewById, 0));
    }
}
