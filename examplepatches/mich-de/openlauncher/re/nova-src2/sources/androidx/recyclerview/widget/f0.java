package androidx.recyclerview.widget;

import android.os.Trace;
import java.util.ArrayList;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class f0 implements Runnable {

    /* renamed from: e, reason: collision with root package name */
    public static final ThreadLocal f14950e = new ThreadLocal();

    /* renamed from: f, reason: collision with root package name */
    public static final c0 f14951f = new c0(0);

    /* renamed from: a, reason: collision with root package name */
    public ArrayList f14952a;

    /* renamed from: b, reason: collision with root package name */
    public long f14953b;

    /* renamed from: c, reason: collision with root package name */
    public long f14954c;

    /* renamed from: d, reason: collision with root package name */
    public ArrayList f14955d;

    public static s2 c(RecyclerView recyclerView, int i5, long j11) {
        int iH = recyclerView.mChildHelper.h();
        for (int i11 = 0; i11 < iH; i11++) {
            s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(recyclerView.mChildHelper.g(i11));
            if (childViewHolderInt.mPosition == i5 && !childViewHolderInt.isInvalid()) {
                return null;
            }
        }
        h2 h2Var = recyclerView.mRecycler;
        try {
            recyclerView.onEnterLayoutOrScroll();
            s2 s2VarL = h2Var.l(i5, j11);
            if (s2VarL != null) {
                if (!s2VarL.isBound() || s2VarL.isInvalid()) {
                    h2Var.a(s2VarL, false);
                } else {
                    h2Var.i(s2VarL.itemView);
                }
            }
            recyclerView.onExitLayoutOrScroll(false);
            return s2VarL;
        } catch (Throwable th2) {
            recyclerView.onExitLayoutOrScroll(false);
            throw th2;
        }
    }

    public final void a(RecyclerView recyclerView, int i5, int i11) {
        if (recyclerView.isAttachedToWindow()) {
            if (RecyclerView.sDebugAssertionsEnabled && !this.f14952a.contains(recyclerView)) {
                throw new IllegalStateException("attempting to post unregistered view!");
            }
            if (this.f14953b == 0) {
                this.f14953b = recyclerView.getNanoTime();
                recyclerView.post(this);
            }
        }
        d0 d0Var = recyclerView.mPrefetchRegistry;
        d0Var.f14920a = i5;
        d0Var.f14921b = i11;
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00cd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(long j11) {
        e0 e0Var;
        RecyclerView recyclerView;
        RecyclerView recyclerView2;
        e0 e0Var2;
        ArrayList arrayList = this.f14955d;
        ArrayList arrayList2 = this.f14952a;
        int size = arrayList2.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            RecyclerView recyclerView3 = (RecyclerView) arrayList2.get(i11);
            if (recyclerView3.getWindowVisibility() == 0) {
                recyclerView3.mPrefetchRegistry.b(recyclerView3, false);
                i5 += recyclerView3.mPrefetchRegistry.f14923d;
            }
        }
        arrayList.ensureCapacity(i5);
        int i12 = 0;
        for (int i13 = 0; i13 < size; i13++) {
            RecyclerView recyclerView4 = (RecyclerView) arrayList2.get(i13);
            if (recyclerView4.getWindowVisibility() == 0) {
                d0 d0Var = recyclerView4.mPrefetchRegistry;
                int iAbs = Math.abs(d0Var.f14921b) + Math.abs(d0Var.f14920a);
                for (int i14 = 0; i14 < d0Var.f14923d * 2; i14 += 2) {
                    if (i12 >= arrayList.size()) {
                        e0Var2 = new e0();
                        arrayList.add(e0Var2);
                    } else {
                        e0Var2 = (e0) arrayList.get(i12);
                    }
                    int[] iArr = d0Var.f14922c;
                    int i15 = iArr[i14 + 1];
                    e0Var2.f14932a = i15 <= iAbs;
                    e0Var2.f14933b = iAbs;
                    e0Var2.f14934c = i15;
                    e0Var2.f14935d = recyclerView4;
                    e0Var2.f14936e = iArr[i14];
                    i12++;
                }
            }
        }
        Collections.sort(arrayList, f14951f);
        for (int i16 = 0; i16 < arrayList.size() && (recyclerView = (e0Var = (e0) arrayList.get(i16)).f14935d) != null; i16++) {
            s2 s2VarC = c(recyclerView, e0Var.f14936e, e0Var.f14932a ? Long.MAX_VALUE : j11);
            if (s2VarC != null && s2VarC.mNestedRecyclerView != null && s2VarC.isBound() && !s2VarC.isInvalid() && (recyclerView2 = s2VarC.mNestedRecyclerView.get()) != null) {
                if (recyclerView2.mDataSetHasChangedAfterLayout && recyclerView2.mChildHelper.h() != 0) {
                    recyclerView2.removeAndRecycleViews();
                }
                d0 d0Var2 = recyclerView2.mPrefetchRegistry;
                d0Var2.b(recyclerView2, true);
                if (d0Var2.f14923d != 0) {
                    try {
                        int i17 = w4.i.f93753a;
                        Trace.beginSection("RV Nested Prefetch");
                        o2 o2Var = recyclerView2.mState;
                        m1 m1Var = recyclerView2.mAdapter;
                        o2Var.f15072d = 1;
                        o2Var.f15073e = m1Var.getItemCount();
                        o2Var.f15075g = false;
                        o2Var.f15076h = false;
                        o2Var.f15077i = false;
                        for (int i18 = 0; i18 < d0Var2.f14923d * 2; i18 += 2) {
                            c(recyclerView2, d0Var2.f14922c[i18], j11);
                        }
                        Trace.endSection();
                    } catch (Throwable th2) {
                        int i19 = w4.i.f93753a;
                        Trace.endSection();
                        throw th2;
                    }
                }
            }
            e0Var.a();
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        ArrayList arrayList = this.f14952a;
        try {
            int i5 = w4.i.f93753a;
            Trace.beginSection("RV Prefetch");
            if (!arrayList.isEmpty()) {
                int size = arrayList.size();
                long jMax = 0;
                for (int i11 = 0; i11 < size; i11++) {
                    RecyclerView recyclerView = (RecyclerView) arrayList.get(i11);
                    if (recyclerView.getWindowVisibility() == 0) {
                        jMax = Math.max(recyclerView.getDrawingTime(), jMax);
                    }
                }
                if (jMax != 0) {
                    b(TimeUnit.MILLISECONDS.toNanos(jMax) + this.f14954c);
                }
            }
            this.f14953b = 0L;
            Trace.endSection();
        } catch (Throwable th2) {
            this.f14953b = 0L;
            int i12 = w4.i.f93753a;
            Trace.endSection();
            throw th2;
        }
    }
}
