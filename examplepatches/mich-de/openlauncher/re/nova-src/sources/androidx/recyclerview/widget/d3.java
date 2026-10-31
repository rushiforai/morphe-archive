package androidx.recyclerview.widget;

import android.view.View;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class d3 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f14924a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public int f14925b = Integer.MIN_VALUE;

    /* renamed from: c, reason: collision with root package name */
    public int f14926c = Integer.MIN_VALUE;

    /* renamed from: d, reason: collision with root package name */
    public int f14927d = 0;

    /* renamed from: e, reason: collision with root package name */
    public final int f14928e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ StaggeredGridLayoutManager f14929f;

    public d3(StaggeredGridLayoutManager staggeredGridLayoutManager, int i5) {
        this.f14929f = staggeredGridLayoutManager;
        this.f14928e = i5;
    }

    public final void a() {
        View view = (View) h6.c1.l(this.f14924a, 1);
        z2 z2Var = (z2) view.getLayoutParams();
        this.f14926c = this.f14929f.f14841c.b(view);
        z2Var.getClass();
    }

    public final void b() {
        this.f14924a.clear();
        this.f14925b = Integer.MIN_VALUE;
        this.f14926c = Integer.MIN_VALUE;
        this.f14927d = 0;
    }

    public final int c() {
        return this.f14929f.f14846h ? e(r1.size() - 1, -1) : e(0, this.f14924a.size());
    }

    public final int d() {
        return this.f14929f.f14846h ? e(0, this.f14924a.size()) : e(r1.size() - 1, -1);
    }

    public final int e(int i5, int i11) {
        StaggeredGridLayoutManager staggeredGridLayoutManager = this.f14929f;
        int iK = staggeredGridLayoutManager.f14841c.k();
        int iG = staggeredGridLayoutManager.f14841c.g();
        int i12 = i11 > i5 ? 1 : -1;
        while (i5 != i11) {
            View view = (View) this.f14924a.get(i5);
            int iE = staggeredGridLayoutManager.f14841c.e(view);
            int iB = staggeredGridLayoutManager.f14841c.b(view);
            boolean z11 = iE <= iG;
            boolean z12 = iB >= iK;
            if (z11 && z12 && (iE < iK || iB > iG)) {
                return staggeredGridLayoutManager.getPosition(view);
            }
            i5 += i12;
        }
        return -1;
    }

    public final int f(int i5) {
        int i11 = this.f14926c;
        if (i11 != Integer.MIN_VALUE) {
            return i11;
        }
        if (this.f14924a.size() == 0) {
            return i5;
        }
        a();
        return this.f14926c;
    }

    public final View g(int i5, int i11) {
        StaggeredGridLayoutManager staggeredGridLayoutManager = this.f14929f;
        ArrayList arrayList = this.f14924a;
        View view = null;
        if (i11 != -1) {
            int size = arrayList.size() - 1;
            while (size >= 0) {
                View view2 = (View) arrayList.get(size);
                if ((staggeredGridLayoutManager.f14846h && staggeredGridLayoutManager.getPosition(view2) >= i5) || ((!staggeredGridLayoutManager.f14846h && staggeredGridLayoutManager.getPosition(view2) <= i5) || !view2.hasFocusable())) {
                    break;
                }
                size--;
                view = view2;
            }
            return view;
        }
        int size2 = arrayList.size();
        int i12 = 0;
        while (i12 < size2) {
            View view3 = (View) arrayList.get(i12);
            if ((staggeredGridLayoutManager.f14846h && staggeredGridLayoutManager.getPosition(view3) <= i5) || ((!staggeredGridLayoutManager.f14846h && staggeredGridLayoutManager.getPosition(view3) >= i5) || !view3.hasFocusable())) {
                break;
            }
            i12++;
            view = view3;
        }
        return view;
    }

    public final int h(int i5) {
        int i11 = this.f14925b;
        if (i11 != Integer.MIN_VALUE) {
            return i11;
        }
        ArrayList arrayList = this.f14924a;
        if (arrayList.size() == 0) {
            return i5;
        }
        View view = (View) arrayList.get(0);
        z2 z2Var = (z2) view.getLayoutParams();
        this.f14925b = this.f14929f.f14841c.e(view);
        z2Var.getClass();
        return this.f14925b;
    }
}
