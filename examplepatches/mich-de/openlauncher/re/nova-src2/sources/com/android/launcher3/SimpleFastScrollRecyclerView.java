package com.android.launcher3;

import android.content.Context;
import android.graphics.Point;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.d2;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.z1;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import o9.m;
import o9.o0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0017\u0018\u00002\u00020\u00012\u00020\u0002B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/android/launcher3/SimpleFastScrollRecyclerView;", "Lo9/m;", "Landroidx/recyclerview/widget/d2;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes2.dex */
public class SimpleFastScrollRecyclerView extends m implements d2 {

    /* renamed from: b, reason: collision with root package name */
    public final Point f20985b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f20986c;

    public SimpleFastScrollRecyclerView(@NotNull Context context, @NotNull AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f20985b = new Point();
        addOnItemTouchListener(this);
    }

    @Override // androidx.recyclerview.widget.d2
    public final void a(boolean z11) {
    }

    @Override // androidx.recyclerview.widget.d2
    public final boolean c(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        Point point = this.f20985b;
        if (action == 0) {
            this.f20986c = this.f79988a.c(motionEvent.getX(), motionEvent.getY(), point);
        }
        if (!this.f20986c) {
            return false;
        }
        getParent().requestDisallowInterceptTouchEvent(true);
        return this.f79988a.b(motionEvent, point);
    }

    @Override // o9.m
    public final int g() {
        View childAt;
        m1 adapter = getAdapter();
        if (adapter == null || (childAt = getChildAt(0)) == null) {
            return 0;
        }
        return ((adapter.getItemCount() * childAt.getMeasuredHeight()) - j()) - getPaddingTop();
    }

    @Override // o9.m
    public final int h() {
        if (getChildCount() == 0) {
            return -1;
        }
        View childAt = getChildAt(0);
        int measuredHeight = childAt.getMeasuredHeight() * getChildAdapterPosition(childAt);
        z1 layoutManager = getLayoutManager();
        Intrinsics.d(layoutManager);
        return (getPaddingTop() + measuredHeight) - layoutManager.getDecoratedTop(childAt);
    }

    @Override // o9.m
    public final void l(int i5) {
        int iH = h();
        if (iH < 0) {
            this.f79988a.e(-1);
        } else {
            q(iH, g());
        }
    }

    @Override // o9.m
    public String m(float f11) {
        String strA;
        if (getAdapter() == null) {
            return b.f42142b;
        }
        Object adapter = getAdapter();
        o0 o0Var = adapter instanceof o0 ? (o0) adapter : null;
        stopScroll();
        Intrinsics.d(getAdapter());
        float itemCount = r1.getItemCount() * f11;
        int iG = g();
        LinearLayoutManager linearLayoutManager = (LinearLayoutManager) getLayoutManager();
        Intrinsics.d(linearLayoutManager);
        linearLayoutManager.scrollToPositionWithOffset(0, (int) (-(iG * f11)));
        if (f11 == 1.0f) {
            itemCount--;
        }
        return (o0Var == null || (strA = o0Var.a((int) itemCount)) == null) ? b.f42142b : strA;
    }

    @Override // android.view.View, androidx.recyclerview.widget.d2
    public final void onTouchEvent(MotionEvent motionEvent) {
        if (this.f20986c) {
            this.f79988a.b(motionEvent, this.f20985b);
        }
    }
}
