package a5;

import android.os.Build;
import android.view.View;
import android.view.WindowInsets;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class r0 implements View.OnApplyWindowInsetsListener {

    /* renamed from: a, reason: collision with root package name */
    public h2 f356a = null;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f357b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ a0 f358c;

    public r0(View view, a0 a0Var) {
        this.f357b = view;
        this.f358c = a0Var;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        h2 h2VarG = h2.g(view, windowInsets);
        int i5 = Build.VERSION.SDK_INT;
        a0 a0Var = this.f358c;
        if (i5 < 30) {
            s0.a(windowInsets, this.f357b);
            if (h2VarG.equals(this.f356a)) {
                return a0Var.u(view, h2VarG).f();
            }
        }
        this.f356a = h2VarG;
        h2 h2VarU = a0Var.u(view, h2VarG);
        if (i5 >= 30) {
            return h2VarU.f();
        }
        WeakHashMap weakHashMap = a1.f250a;
        q0.c(view);
        return h2VarU.f();
    }
}
