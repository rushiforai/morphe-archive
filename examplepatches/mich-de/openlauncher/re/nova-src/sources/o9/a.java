package o9;

import android.util.Pair;
import android.view.MotionEvent;
import android.view.View;
import android.widget.LinearLayout;
import com.android.launcher3.folder.Folder;

/* loaded from: classes.dex */
public abstract class a extends LinearLayout implements ya.k0 {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f79741b = 0;

    /* renamed from: a, reason: collision with root package name */
    public boolean f79742a;

    public static void L(za.d dVar, boolean z11) {
        M(dVar, z11, 7471103);
        dVar.m();
    }

    public static void M(za.d dVar, boolean z11, int i5) {
        za.j jVarU = dVar.u();
        for (int childCount = jVarU.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = jVarU.getChildAt(childCount);
            if (childAt instanceof a) {
                a aVar = (a) childAt;
                if (aVar.R(i5)) {
                    aVar.K(z11);
                }
            }
        }
    }

    public static a P(za.d dVar, int i5) {
        za.j jVarU = dVar.u();
        if (jVarU == null) {
            return null;
        }
        for (int childCount = jVarU.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = jVarU.getChildAt(childCount);
            if (childAt instanceof a) {
                a aVar = (a) childAt;
                if (aVar.R(i5) && aVar.f79742a) {
                    return aVar;
                }
            }
        }
        return null;
    }

    public final void I() {
        View viewN;
        Pair pairO = O();
        if (pairO == null || !ps.f.i(getContext())) {
            return;
        }
        ps.f.o((View) pairO.first, 32, (String) pairO.second);
        if (this.f79742a && (viewN = N()) != null) {
            viewN.performAccessibilityAction(64, null);
        }
        ((za.d) za.d.p(getContext())).u().sendAccessibilityEvent(2048);
    }

    public boolean J() {
        return this instanceof Folder;
    }

    public final void K(boolean z11) {
        Q(z11 & g3.a());
        this.f79742a = false;
    }

    public View N() {
        return this;
    }

    public Pair O() {
        return null;
    }

    public abstract void Q(boolean z11);

    public abstract boolean R(int i5);

    public boolean S() {
        K(true);
        return true;
    }

    public boolean T() {
        return false;
    }

    public boolean k(MotionEvent motionEvent) {
        return false;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        return true;
    }
}
