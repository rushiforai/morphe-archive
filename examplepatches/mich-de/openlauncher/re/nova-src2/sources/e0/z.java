package e0;

import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;

/* loaded from: classes2.dex */
public abstract class z {

    /* renamed from: a, reason: collision with root package name */
    public static final long f50168a = ViewConfiguration.getTapTimeout();

    public static final boolean a(g gVar) {
        ViewParent parent = b3.g.g(gVar).getParent();
        while (parent != null && (parent instanceof ViewGroup)) {
            ViewGroup viewGroup = (ViewGroup) parent;
            if (viewGroup.shouldDelayChildPressedState()) {
                return true;
            }
            parent = viewGroup.getParent();
        }
        return false;
    }
}
