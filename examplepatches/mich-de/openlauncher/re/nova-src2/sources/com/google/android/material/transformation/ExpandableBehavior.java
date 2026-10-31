package com.google.android.material.transformation;

import a5.a1;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import java.util.ArrayList;
import java.util.WeakHashMap;
import l4.b;
import qj.a;

@Deprecated
/* loaded from: classes3.dex */
public abstract class ExpandableBehavior extends b {

    /* renamed from: a, reason: collision with root package name */
    public int f34532a = 0;

    public ExpandableBehavior() {
    }

    @Override // l4.b
    public abstract boolean f(View view, View view2);

    /* JADX WARN: Multi-variable type inference failed */
    @Override // l4.b
    public final boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) {
        Object obj = (a) view2;
        boolean z11 = ((FloatingActionButton) obj).f34292l.f61880a;
        if (z11) {
            int i5 = this.f34532a;
            if (i5 != 0 && i5 != 2) {
                return false;
            }
        } else if (this.f34532a != 1) {
            return false;
        }
        this.f34532a = z11 ? 1 : 2;
        w((View) obj, view, z11, true);
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // l4.b
    public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
        a aVar;
        int i11;
        WeakHashMap weakHashMap = a1.f250a;
        if (!view.isLaidOut()) {
            ArrayList arrayListK = coordinatorLayout.k(view);
            int size = arrayListK.size();
            int i12 = 0;
            while (true) {
                if (i12 >= size) {
                    aVar = null;
                    break;
                }
                View view2 = (View) arrayListK.get(i12);
                if (f(view, view2)) {
                    aVar = (a) view2;
                    break;
                }
                i12++;
            }
            if (aVar != null) {
                boolean z11 = ((FloatingActionButton) aVar).f34292l.f61880a;
                if (!z11 ? this.f34532a == 1 : !((i11 = this.f34532a) != 0 && i11 != 2)) {
                    int i13 = z11 ? 1 : 2;
                    this.f34532a = i13;
                    view.getViewTreeObserver().addOnPreDrawListener(new ik.a(this, view, i13, aVar));
                }
            }
        }
        return false;
    }

    public abstract void w(View view, View view2, boolean z11, boolean z12);

    public ExpandableBehavior(Context context, AttributeSet attributeSet) {
    }
}
