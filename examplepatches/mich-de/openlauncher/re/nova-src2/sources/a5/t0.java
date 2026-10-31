package a5;

import android.view.View;
import android.view.WindowInsets;

/* loaded from: classes.dex */
public abstract class t0 {
    public static h2 a(View view) {
        WindowInsets rootWindowInsets = view.getRootWindowInsets();
        if (rootWindowInsets == null) {
            return null;
        }
        h2 h2VarG = h2.g(null, rootWindowInsets);
        f2 f2Var = h2VarG.f296a;
        f2Var.t(h2VarG);
        f2Var.d(view.getRootView());
        return h2VarG;
    }

    public static void b(View view, int i5, int i11) {
        view.setScrollIndicators(i5, i11);
    }
}
