package androidx.recyclerview.widget;

import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final k1 f14993a;

    /* renamed from: e, reason: collision with root package name */
    public View f14997e;

    /* renamed from: d, reason: collision with root package name */
    public int f14996d = 0;

    /* renamed from: b, reason: collision with root package name */
    public final h f14994b = new h();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f14995c = new ArrayList();

    public i(k1 k1Var) {
        this.f14993a = k1Var;
    }

    public final void a(View view, int i5, boolean z11) {
        RecyclerView recyclerView = this.f14993a.f15030a;
        int childCount = i5 < 0 ? recyclerView.getChildCount() : f(i5);
        this.f14994b.e(childCount, z11);
        if (z11) {
            i(view);
        }
        recyclerView.addView(view, childCount);
        recyclerView.dispatchChildAttached(view);
    }

    public final void b(View view, int i5, ViewGroup.LayoutParams layoutParams, boolean z11) {
        RecyclerView recyclerView = this.f14993a.f15030a;
        int childCount = i5 < 0 ? recyclerView.getChildCount() : f(i5);
        this.f14994b.e(childCount, z11);
        if (z11) {
            i(view);
        }
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        if (childViewHolderInt != null) {
            if (!childViewHolderInt.isTmpDetached() && !childViewHolderInt.shouldIgnore()) {
                StringBuilder sb2 = new StringBuilder("Called attach on a child which is not detached: ");
                sb2.append(childViewHolderInt);
                throw new IllegalArgumentException(a2.c.j(recyclerView, sb2));
            }
            if (RecyclerView.sVerboseLoggingEnabled) {
                childViewHolderInt.toString();
            }
            childViewHolderInt.clearTmpDetachFlag();
        } else if (RecyclerView.sDebugAssertionsEnabled) {
            StringBuilder sb3 = new StringBuilder("No ViewHolder found for child: ");
            sb3.append(view);
            sb3.append(", index: ");
            sb3.append(childCount);
            throw new IllegalArgumentException(a2.c.j(recyclerView, sb3));
        }
        recyclerView.attachViewToParent(view, childCount, layoutParams);
    }

    public final void c(int i5) {
        int iF = f(i5);
        this.f14994b.f(iF);
        RecyclerView recyclerView = this.f14993a.f15030a;
        View childAt = recyclerView.getChildAt(iF);
        if (childAt != null) {
            s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(childAt);
            if (childViewHolderInt != null) {
                if (childViewHolderInt.isTmpDetached() && !childViewHolderInt.shouldIgnore()) {
                    StringBuilder sb2 = new StringBuilder("called detach on an already detached child ");
                    sb2.append(childViewHolderInt);
                    throw new IllegalArgumentException(a2.c.j(recyclerView, sb2));
                }
                if (RecyclerView.sVerboseLoggingEnabled) {
                    childViewHolderInt.toString();
                }
                childViewHolderInt.addFlags(256);
            }
        } else if (RecyclerView.sDebugAssertionsEnabled) {
            StringBuilder sb3 = new StringBuilder("No view at offset ");
            sb3.append(iF);
            throw new IllegalArgumentException(a2.c.j(recyclerView, sb3));
        }
        recyclerView.detachViewFromParent(iF);
    }

    public final View d(int i5) {
        return this.f14993a.f15030a.getChildAt(f(i5));
    }

    public final int e() {
        return this.f14993a.f15030a.getChildCount() - this.f14995c.size();
    }

    public final int f(int i5) {
        if (i5 < 0) {
            return -1;
        }
        int childCount = this.f14993a.f15030a.getChildCount();
        int i11 = i5;
        while (i11 < childCount) {
            h hVar = this.f14994b;
            int iB = i5 - (i11 - hVar.b(i11));
            if (iB == 0) {
                while (hVar.d(i11)) {
                    i11++;
                }
                return i11;
            }
            i11 += iB;
        }
        return -1;
    }

    public final View g(int i5) {
        return this.f14993a.f15030a.getChildAt(i5);
    }

    public final int h() {
        return this.f14993a.f15030a.getChildCount();
    }

    public final void i(View view) {
        this.f14995c.add(view);
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        if (childViewHolderInt != null) {
            childViewHolderInt.onEnteredHiddenState(this.f14993a.f15030a);
        }
    }

    public final int j(View view) {
        int iIndexOfChild = this.f14993a.f15030a.indexOfChild(view);
        if (iIndexOfChild != -1) {
            h hVar = this.f14994b;
            if (!hVar.d(iIndexOfChild)) {
                return iIndexOfChild - hVar.b(iIndexOfChild);
            }
        }
        return -1;
    }

    public final void k(int i5) {
        k1 k1Var = this.f14993a;
        int i11 = this.f14996d;
        if (i11 == 1) {
            throw new IllegalStateException("Cannot call removeView(At) within removeView(At)");
        }
        if (i11 == 2) {
            throw new IllegalStateException("Cannot call removeView(At) within removeViewIfHidden");
        }
        try {
            int iF = f(i5);
            View childAt = k1Var.f15030a.getChildAt(iF);
            if (childAt != null) {
                this.f14996d = 1;
                this.f14997e = childAt;
                if (this.f14994b.f(iF)) {
                    l(childAt);
                }
                k1Var.b(iF);
            }
            this.f14996d = 0;
            this.f14997e = null;
        } catch (Throwable th2) {
            this.f14996d = 0;
            this.f14997e = null;
            throw th2;
        }
    }

    public final void l(View view) {
        s2 childViewHolderInt;
        if (!this.f14995c.remove(view) || (childViewHolderInt = RecyclerView.getChildViewHolderInt(view)) == null) {
            return;
        }
        childViewHolderInt.onLeftHiddenState(this.f14993a.f15030a);
    }

    public final String toString() {
        return this.f14994b.toString() + ", hidden list:" + this.f14995c.size();
    }
}
