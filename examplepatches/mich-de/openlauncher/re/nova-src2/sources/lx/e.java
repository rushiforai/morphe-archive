package lx;

import a5.a1;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import aosp.android.widget.ProgressBar;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f75159a = 0;

    static {
        new ThreadLocal();
        new ThreadLocal();
    }

    public static final ViewParent a(View view, Class cls) {
        for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (cls.isInstance(parent)) {
                return parent;
            }
        }
        return null;
    }

    public static final View b(View view) {
        ViewGroup viewGroup = view instanceof ViewGroup ? (ViewGroup) view : null;
        if (viewGroup == null || viewGroup.getChildCount() == 0) {
            return null;
        }
        return ((ViewGroup) view).getChildAt(r2.getChildCount() - 1);
    }

    public static final boolean c(ProgressBar progressBar) {
        WeakHashMap weakHashMap = a1.f250a;
        return progressBar.getLayoutDirection() == 1;
    }
}
