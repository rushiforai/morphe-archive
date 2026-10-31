package com.android.launcher3.allapps;

import a90.d;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.SparseIntArray;
import android.view.View;
import androidx.recyclerview.widget.g2;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.z1;
import bh.c;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.logging.StatsLogManager;
import com.android.launcher3.views.RecyclerViewFastScroller;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.c0;
import e10.d0;
import e10.s2;
import e10.t0;
import e10.y2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.regex.Pattern;
import kl.q0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import kz.a;
import l10.x;
import mx.j0;
import o9.g3;
import o9.k;
import o9.n1;
import o9.t1;
import q9.j;
import q9.m;
import q9.n;
import q9.r;
import q9.s;
import w20.e;

/* loaded from: classes.dex */
public class AllAppsRecyclerView extends a {

    /* renamed from: c, reason: collision with root package name */
    public s f21044c;

    /* renamed from: d, reason: collision with root package name */
    public final int f21045d;

    /* renamed from: e, reason: collision with root package name */
    public final SparseIntArray f21046e;

    /* renamed from: f, reason: collision with root package name */
    public final SparseIntArray f21047f;

    /* renamed from: g, reason: collision with root package name */
    public final bm.a f21048g;

    /* renamed from: h, reason: collision with root package name */
    public final n f21049h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f21050i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f21051j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f21052k;

    static {
        Pattern pattern = g3.f79846a;
    }

    public AllAppsRecyclerView(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        this.f21046e = new SparseIntArray();
        this.f21047f = new SparseIntArray();
        this.f21049h = new n(this);
        this.f21050i = new ArrayList();
        this.f21051j = false;
        this.f21052k = false;
        getResources().getDimensionPixelSize(2131165273);
        this.f21045d = y2.f51877a.W().l() == d0.f51460c ? 1 : t1.a(context).a(context).d();
        this.f21048g = new bm.a(this);
    }

    public static void w(BubbleTextView bubbleTextView, float f11, float f12, float f13, float f14, float f15) {
        int left;
        int iE;
        float f16 = f15 - f14;
        float width = bubbleTextView.getWidth() / 2.0f;
        CharSequence text = bubbleTextView.getText();
        if (TextUtils.isEmpty(text)) {
            left = bubbleTextView.getLeft() + ((int) width);
        } else {
            left = (bubbleTextView.getLeft() + ((int) width)) - ((int) v4.a.e(bubbleTextView.getPaint().measureText(text.toString()) / 2.0f, 0.0f, width - bubbleTextView.getPaddingLeft()));
        }
        float f17 = left;
        float width2 = bubbleTextView.getWidth() / 2.0f;
        CharSequence text2 = bubbleTextView.getText();
        if (TextUtils.isEmpty(text2)) {
            iE = bubbleTextView.getLeft() + ((int) width2);
        } else {
            iE = ((int) v4.a.e(bubbleTextView.getPaint().measureText(text2.toString()) / 2.0f, 0.0f, width2 - bubbleTextView.getPaddingRight())) + bubbleTextView.getLeft() + ((int) width2);
        }
        float f18 = iE;
        if (f17 < f12) {
            float fE = v4.a.e((((f14 - f11) * (1.0f - ((bubbleTextView.getWidth() - (f12 - f17)) / bubbleTextView.getWidth()))) / f16) + 1.0f, 0.0f, 1.0f);
            bubbleTextView.setPivotX(bubbleTextView.getWidth());
            bubbleTextView.setScaleX(fE);
            return;
        }
        if (f18 <= f13) {
            bubbleTextView.setScaleX(1.0f);
            return;
        }
        float fE2 = v4.a.e((((f14 - f11) * (1.0f - ((bubbleTextView.getWidth() + (f13 - f18)) / bubbleTextView.getWidth()))) / f16) + 1.0f, 0.0f, 1.0f);
        bubbleTextView.setPivotX(0.0f);
        bubbleTextView.setScaleX(fE2);
    }

    @Override // androidx.recyclerview.widget.RecyclerView
    public final int d() {
        if (y2.f51877a.a0().l() == c0.f51452d) {
            return 0;
        }
        return getPaddingBottom();
    }

    @Override // androidx.recyclerview.widget.RecyclerView
    public final boolean dispatchNestedPreScroll(int i5, int i11, int[] iArr, int[] iArr2, int i12) {
        Context context = getContext();
        q0 q0Var = n1.C0;
        AllAppsContainerView allAppsContainerView = ((NovaLauncher) k.Y(context)).V;
        return super.dispatchNestedPreScroll(i5, i11, iArr, iArr2, i12);
    }

    @Override // androidx.recyclerview.widget.RecyclerView
    public final int e() {
        return 0;
    }

    @Override // o9.m
    public final int g() {
        return getPaddingBottom() + ((v(getAdapter().getItemCount(), 0) + getPaddingTop()) - getHeight());
    }

    @Override // android.view.View
    public final float getBottomFadingEdgeStrength() {
        return 0.0f;
    }

    @Override // android.view.View
    public final int getTopPaddingOffset() {
        return -getPaddingTop();
    }

    @Override // o9.m
    public final int h() {
        View childAt;
        int childPosition;
        if (this.f21044c.f83886f.isEmpty() || this.f21045d == 0 || getChildCount() == 0 || (childPosition = getChildPosition((childAt = getChildAt(0)))) == -1) {
            return -1;
        }
        return v(childPosition, getLayoutManager().getDecoratedTop(childAt)) + getPaddingTop();
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    @Override // o9.m
    public final RecyclerViewFastScroller i() {
        return this.f79988a;
    }

    @Override // android.view.View
    public final boolean isPaddingOffsetRequired() {
        return true;
    }

    @Override // o9.m
    public final void k() {
        bm.a aVar = this.f21048g;
        aVar.f18056a = -1;
        aVar.d(false);
        aVar.f18059d = null;
    }

    @Override // o9.m
    public final void l(int i5) {
        s sVar = this.f21044c;
        if (sVar == null) {
            return;
        }
        if (!sVar.f83886f.isEmpty() && this.f21045d != 0) {
            y2.f51877a.getClass();
            s2 s2Var = y2.E0;
            KProperty kProperty = y2.f51881b[77];
            s2Var.getClass();
            if (((Boolean) s2Var.l()).booleanValue()) {
                int iH = h();
                if (iH < 0) {
                    this.f79988a.e(-1);
                    return;
                }
                int iJ = j() - this.f79988a.f21293i;
                int iG = g();
                if (iG <= 0) {
                    this.f79988a.e(-1);
                    return;
                }
                RecyclerViewFastScroller recyclerViewFastScroller = this.f79988a;
                if (!recyclerViewFastScroller.n) {
                    if (this.f21052k) {
                        q(iH, 0);
                        return;
                    } else {
                        q(iH, iG);
                        return;
                    }
                }
                if (recyclerViewFastScroller.f21297m) {
                    return;
                }
                int i11 = (int) ((iH / iG) * iJ);
                int i12 = recyclerViewFastScroller.f21300r;
                int i13 = i11 - i12;
                if (i13 * i5 <= 0.0f) {
                    recyclerViewFastScroller.e(i12);
                    return;
                }
                int iMax = Math.max(0, Math.min(iJ, (i5 < 0 ? Math.max((int) ((i5 * i12) / i11), i13) : Math.min((int) (((iJ - i12) * i5) / (iJ - i11)), i13)) + i12));
                this.f79988a.e(iMax);
                if (i11 == iMax) {
                    this.f79988a.n = false;
                    return;
                }
                return;
            }
        }
        this.f79988a.e(-1);
    }

    @Override // o9.m
    public final String m(float f11) {
        z1 layoutManager;
        s sVar = this.f21044c;
        if (sVar.f83891k == 0) {
            return b.f42142b;
        }
        ArrayList arrayList = sVar.f83887g;
        r rVar = (r) arrayList.get(0);
        int i5 = 1;
        while (i5 < arrayList.size()) {
            r rVar2 = (r) arrayList.get(i5);
            if (rVar2.f83880c > f11) {
                break;
            }
            i5++;
            rVar = rVar2;
        }
        bm.a aVar = this.f21048g;
        d dVar = (d) aVar.f18062g;
        c cVar = (c) aVar.f18061f;
        int[] iArr = (int[]) aVar.f18060e;
        AllAppsRecyclerView allAppsRecyclerView = (AllAppsRecyclerView) aVar.f18058c;
        int i11 = aVar.f18056a;
        Intrinsics.d(rVar);
        int i12 = rVar.f83879b.f83841a;
        if (i11 != i12) {
            aVar.f18056a = i12;
            int i13 = -1;
            cVar.f17889a = -1;
            cVar.f17890b = -1;
            cVar.f17891c = -1;
            ArrayList arrayList2 = allAppsRecyclerView.f21044c.f83886f;
            if (!arrayList2.isEmpty() && allAppsRecyclerView.f21045d != 0 && (layoutManager = allAppsRecyclerView.getLayoutManager()) != null) {
                int childCount = allAppsRecyclerView.getChildCount();
                int i14 = 0;
                while (true) {
                    if (i14 >= childCount) {
                        break;
                    }
                    View childAt = allAppsRecyclerView.getChildAt(i14);
                    int childAdapterPosition = allAppsRecyclerView.getChildAdapterPosition(childAt);
                    if (childAdapterPosition != i13) {
                        j jVar = (j) arrayList2.get(childAdapterPosition);
                        if (m.g(jVar.f83842b, 65538)) {
                            cVar.f17889a = jVar.f83843c;
                            cVar.f17890b = layoutManager.getDecoratedTop(childAt);
                            cVar.f17891c = layoutManager.getDecoratedMeasuredHeight(childAt);
                            break;
                        }
                    }
                    i14++;
                    i13 = -1;
                }
            }
            allAppsRecyclerView.removeCallbacks(dVar);
            int paddingTop = allAppsRecyclerView.getPaddingTop();
            int i15 = cVar.f17889a;
            int i16 = cVar.f17891c;
            int i17 = ((i15 * i16) + paddingTop) - cVar.f17890b;
            j jVar2 = (j) allAppsRecyclerView.f21044c.f83886f.get(i12);
            int paddingTop2 = m.g(jVar2.f83842b, 65538) ? (jVar2.f83843c * i16) + (jVar2.f83843c > 0 ? allAppsRecyclerView.getPaddingTop() : 0) : 0;
            int length = iArr.length;
            for (int i18 = 0; i18 < length; i18++) {
                int i19 = length - 1;
                if (i18 == i19) {
                    int i21 = paddingTop2 - i17;
                    iArr[i18] = i21 - ((i21 / length) * i19);
                } else {
                    iArr[i18] = (paddingTop2 - i17) / length;
                }
            }
            aVar.f18057b = 0;
            allAppsRecyclerView.postOnAnimation(dVar);
        }
        return rVar.f83878a;
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        m1 adapter = getAdapter();
        this.f21052k = false;
        if (adapter == null || this.f72855b <= 0) {
            return;
        }
        int measuredHeight = (getMeasuredHeight() - (v(adapter.getItemCount(), 0) + getPaddingTop())) + this.f72855b;
        if (measuredHeight > 0) {
            this.f21052k = true;
            setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), measuredHeight);
        }
    }

    @Override // o9.m, androidx.recyclerview.widget.RecyclerView
    public final void onScrollStateChanged(int i5) {
        super.onScrollStateChanged(i5);
        StatsLogManager statsLogManagerO = k.Y(getContext()).O();
        if (i5 == 0) {
            statsLogManagerO.a();
        } else {
            if (i5 != 1) {
                return;
            }
            requestFocus();
            statsLogManagerO.a();
            ((za.d) za.d.p(getContext())).h();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView
    public final void onScrolled(int i5, int i11) {
        super.onScrolled(i5, i11);
        if (this.f21051j) {
            Context context = getContext();
            q0 q0Var = n1.C0;
            View view = ((NovaLauncher) k.Y(context)).V.f21031m;
            x xVar = (x) view.getBackground();
            float left = view.getLeft() + xVar.f74471d;
            float right = view.getRight() - xVar.f74471d;
            for (int i12 = 0; i12 < getChildCount(); i12++) {
                View childAt = getChildAt(i12);
                if (getChildAdapterPosition(childAt) != -1 && (childAt instanceof BubbleTextView)) {
                    BubbleTextView bubbleTextView = (BubbleTextView) childAt;
                    float decoratedTop = getLayoutManager().getDecoratedTop(childAt);
                    if (y2.f51877a.S().l() != c0.f51452d) {
                        float f11 = -bubbleTextView.getTotalPaddingTop();
                        float fK = f11 + e.k(22);
                        if (decoratedTop < fK) {
                            w(bubbleTextView, decoratedTop, left, right, fK, f11);
                        } else {
                            if (bubbleTextView.o != 1.0f) {
                                bubbleTextView.P(1.0f);
                            }
                            bubbleTextView.setScaleX(1.0f);
                        }
                    } else if (bubbleTextView.getLeft() < left || bubbleTextView.getRight() > right) {
                        float height = getHeight() - (bubbleTextView.getHeight() - bubbleTextView.getTotalPaddingBottom());
                        float fK2 = height - e.k(22);
                        if (decoratedTop > fK2) {
                            float fE = v4.a.e(1.0f - (((fK2 - decoratedTop) * 1.0f) / (fK2 - height)), 0.0f, 1.0f);
                            if (bubbleTextView.o != fE) {
                                bubbleTextView.P(fE);
                            }
                        } else {
                            if (bubbleTextView.o != 1.0f) {
                                bubbleTextView.P(1.0f);
                            }
                            bubbleTextView.setScaleX(1.0f);
                        }
                    }
                }
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        x();
        int i14 = 0;
        while (true) {
            ArrayList arrayList = this.f21050i;
            if (i14 >= arrayList.size()) {
                return;
            }
            View view = (View) arrayList.get(i14);
            view.measure(View.MeasureSpec.makeMeasureSpec(i5, 1073741824), View.MeasureSpec.makeMeasureSpec(i5, 1073741824));
            view.layout(0, 0, i5, i11);
            i14++;
        }
    }

    @Override // o9.m
    public final boolean p() {
        this.f21044c.getClass();
        return true;
    }

    @Override // kz.a
    public final s r() {
        return this.f21044c;
    }

    @Override // kz.a
    public final int s() {
        j0 j0Var = k.Y(getContext()).f79934x;
        int measuredWidth = (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
        return (measuredWidth - ((measuredWidth / j0Var.f77146h0) - j0Var.f77140e0)) - j0Var.f77142f0;
    }

    @Override // androidx.recyclerview.widget.RecyclerView
    public final void setAdapter(m1 m1Var) {
        m1 adapter = getAdapter();
        n nVar = this.f21049h;
        if (adapter != null) {
            getAdapter().unregisterAdapterDataObserver(nVar);
        }
        super.setAdapter(m1Var);
        if (m1Var != null) {
            m1Var.registerAdapterDataObserver(nVar);
        }
    }

    @Override // android.view.View
    public final void setVerticalFadingEdgeEnabled(boolean z11) {
        this.f21051j = z11;
    }

    @Override // kz.a
    public final boolean t() {
        return this.f21052k;
    }

    @Override // kz.a
    public final void u(s sVar) {
        this.f21044c = sVar;
    }

    public final int v(int i5, int i11) {
        SparseIntArray sparseIntArray = this.f21046e;
        if (sparseIntArray.size() == 0) {
            x();
        }
        ArrayList arrayList = this.f21044c.f83886f;
        if (arrayList.size() == 0) {
            return 0;
        }
        j jVar = i5 < arrayList.size() ? (j) arrayList.get(i5) : null;
        SparseIntArray sparseIntArray2 = this.f21047f;
        int i12 = sparseIntArray2.get(i5, -1);
        if (i12 < 0) {
            i12 = 0;
            for (int i13 = 0; i13 < i5; i13++) {
                j jVar2 = (j) arrayList.get(i13);
                if (this.f21045d != 1 && (m.g(jVar2.f83842b, 65538) || jVar2.f83842b == 8388608)) {
                    if (jVar != null && jVar.f83843c == jVar2.f83843c && (m.g(jVar.f83842b, 65538) || jVar.f83842b == 8388608)) {
                        break;
                    }
                    if (jVar2.f83844d == 0) {
                        i12 += sparseIntArray.get(jVar2.f83842b, 0);
                    }
                } else {
                    int measuredHeight = sparseIntArray.get(jVar2.f83842b);
                    if (measuredHeight == 0) {
                        androidx.recyclerview.widget.s2 s2VarFindViewHolderForAdapterPosition = findViewHolderForAdapterPosition(i13);
                        if (s2VarFindViewHolderForAdapterPosition == null) {
                            androidx.recyclerview.widget.s2 s2VarCreateViewHolder = getAdapter().createViewHolder(this, jVar2.f83842b);
                            getAdapter().onBindViewHolder(s2VarCreateViewHolder, i13);
                            s2VarCreateViewHolder.itemView.measure(0, 0);
                            measuredHeight = s2VarCreateViewHolder.itemView.getMeasuredHeight();
                            getRecycledViewPool().c(s2VarCreateViewHolder);
                        } else {
                            measuredHeight = s2VarFindViewHolderForAdapterPosition.itemView.getMeasuredHeight();
                        }
                    }
                    i12 += measuredHeight;
                }
            }
            sparseIntArray2.put(i5, i12);
        }
        return i12 - i11;
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return drawable == null || super.verifyDrawable(drawable);
    }

    public final void x() {
        j0 j0Var = k.Y(getContext()).f79934x;
        g2 recycledViewPool = getRecycledViewPool();
        int i5 = ((t0) (getContext().getResources().getConfiguration().orientation == 2 ? y2.f51877a.M() : y2.f51877a.L()).l()).f51821a;
        recycledViewPool.d(4, 1);
        recycledViewPool.d(16, 1);
        recycledViewPool.d(8, 1);
        int i11 = this.f21045d;
        recycledViewPool.d(2, (i11 + 1) * i5);
        recycledViewPool.d(SQLiteDatabase.OPEN_FULLMUTEX, i5 * i11);
        recycledViewPool.d(4194304, 4);
        recycledViewPool.d(8388608, 1);
        SparseIntArray sparseIntArray = this.f21046e;
        sparseIntArray.clear();
        sparseIntArray.put(2, j0Var.f77138d0);
        sparseIntArray.put(SQLiteDatabase.OPEN_FULLMUTEX, j0Var.f77138d0);
        sparseIntArray.put(4194304, j0Var.f77138d0);
        sparseIntArray.put(8388608, j0Var.f77138d0);
    }
}
