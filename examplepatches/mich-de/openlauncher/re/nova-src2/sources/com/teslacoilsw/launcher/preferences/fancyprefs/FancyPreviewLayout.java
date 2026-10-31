package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ScrollView;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import o9.r0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w20.e;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPreviewLayout;", "Landroid/view/ViewGroup;", "Lo9/r0;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPreviewLayout extends ViewGroup implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public ViewGroup f46019a;

    /* renamed from: b, reason: collision with root package name */
    public ScrollView f46020b;

    /* renamed from: c, reason: collision with root package name */
    public Drawable f46021c;

    /* renamed from: d, reason: collision with root package name */
    public int f46022d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f46023e;

    /* renamed from: f, reason: collision with root package name */
    public final Rect f46024f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f46025g;

    @JvmOverloads
    public FancyPreviewLayout(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f46023e = true;
        this.f46024f = new Rect();
        this.f46025g = new ArrayList();
    }

    /* renamed from: a, reason: from getter */
    public final ArrayList getF46025g() {
        return this.f46025g;
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        boolean zDrawChild = super.drawChild(canvas, view, j11);
        if (!Intrinsics.b(view, getChildAt(1))) {
            return zDrawChild;
        }
        Drawable drawable = this.f46021c;
        if (drawable != null) {
            drawable.draw(canvas);
            return zDrawChild;
        }
        Intrinsics.m("shadowDrawable");
        throw null;
    }

    @Override // o9.r0
    public final void h(Rect rect) {
        this.f46024f.set(rect);
        ViewGroup viewGroup = this.f46019a;
        if (viewGroup == null) {
            Intrinsics.m("preview");
            throw null;
        }
        viewGroup.setPadding(viewGroup.getPaddingLeft(), rect.top, viewGroup.getPaddingRight(), viewGroup.getPaddingBottom());
        Iterator it = this.f46025g.iterator();
        while (it.hasNext()) {
            View view = (View) it.next();
            view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), rect.bottom);
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f46019a = (ViewGroup) findViewById(2131428626);
        this.f46020b = (ScrollView) findViewById(2131428303);
        Drawable drawable = getContext().getDrawable(2131231259);
        Intrinsics.d(drawable);
        this.f46021c = drawable;
        ScrollView scrollView = this.f46020b;
        if (scrollView != null) {
            this.f46025g.add(scrollView);
        } else {
            Intrinsics.m("mainScrollView");
            throw null;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int i14 = i12 - i5;
        int i15 = i13 - i11;
        ViewGroup viewGroup = this.f46019a;
        if (viewGroup == null) {
            Intrinsics.m("preview");
            throw null;
        }
        if (viewGroup == null) {
            Intrinsics.m("preview");
            throw null;
        }
        viewGroup.layout(0, 0, i14, viewGroup.getMinimumHeight() + this.f46022d);
        View childAt = getChildAt(1);
        ViewGroup viewGroup2 = this.f46019a;
        if (viewGroup2 != null) {
            childAt.layout(0, viewGroup2.getMinimumHeight() + this.f46022d, i14, i15);
        } else {
            Intrinsics.m("preview");
            throw null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00bc  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        int measuredHeight;
        int i12;
        int measuredHeight2 = getMeasuredHeight();
        super.onMeasure(i5, i11);
        boolean z11 = true;
        if (getMeasuredHeight() != measuredHeight2) {
            this.f46023e = true;
        }
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
        int iK = e.k(24);
        int measuredHeight3 = getMeasuredHeight();
        ViewGroup viewGroup = this.f46019a;
        if (viewGroup == null) {
            Intrinsics.m("preview");
            throw null;
        }
        int minimumHeight = measuredHeight3 - viewGroup.getMinimumHeight();
        ScrollView scrollView = this.f46020b;
        if (scrollView == null) {
            Intrinsics.m("mainScrollView");
            throw null;
        }
        int paddingTop = ((minimumHeight - scrollView.getPaddingTop()) - iK) - this.f46024f.bottom;
        View childAt = getChildAt(1);
        ScrollView scrollView2 = this.f46020b;
        if (scrollView2 == null) {
            Intrinsics.m("mainScrollView");
            throw null;
        }
        scrollView2.measure(View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(paddingTop, 1073741824));
        ScrollView scrollView3 = this.f46020b;
        if (scrollView3 == null) {
            Intrinsics.m("mainScrollView");
            throw null;
        }
        View childAt2 = scrollView3.getChildAt(0);
        Intrinsics.e(childAt2, "null cannot be cast to non-null type android.view.ViewGroup");
        ViewGroup viewGroup2 = (ViewGroup) childAt2;
        if (this.f46023e) {
            int childCount = viewGroup2.getChildCount();
            int i13 = 0;
            while (i13 < childCount) {
                View childAt3 = viewGroup2.getChildAt(i13);
                ViewGroup.LayoutParams layoutParams = childAt3.getLayoutParams();
                boolean z12 = z11;
                if (childAt3.getVisibility() == 8) {
                    measuredHeight = 0;
                } else if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                    measuredHeight = childAt3.getMeasuredHeight() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
                } else {
                    measuredHeight = childAt3.getMeasuredHeight();
                }
                if (i13 == viewGroup2.getChildCount() - 1) {
                    if ((paddingTop + iK) - measuredHeight < 0) {
                        i12 = (measuredHeight - iK) - paddingTop;
                        if (i12 < iK) {
                            paddingTop = iK - i12;
                        }
                        this.f46022d = paddingTop;
                        if (paddingTop > iK * 2) {
                            this.f46022d = 0;
                        }
                    } else {
                        paddingTop -= measuredHeight;
                        i13++;
                        z11 = z12;
                    }
                } else if (paddingTop - measuredHeight < 0) {
                    i12 = (measuredHeight - iK) - paddingTop;
                    if (i12 < iK) {
                    }
                    this.f46022d = paddingTop;
                    if (paddingTop > iK * 2) {
                    }
                } else {
                    paddingTop -= measuredHeight;
                    i13++;
                    z11 = z12;
                }
            }
        }
        ViewGroup viewGroup3 = this.f46019a;
        if (viewGroup3 == null) {
            Intrinsics.m("preview");
            throw null;
        }
        int minimumHeight2 = viewGroup3.getMinimumHeight() + this.f46022d;
        ViewGroup viewGroup4 = this.f46019a;
        if (viewGroup4 == null) {
            Intrinsics.m("preview");
            throw null;
        }
        viewGroup4.measure(iMakeMeasureSpec, View.MeasureSpec.makeMeasureSpec(minimumHeight2, 1073741824));
        childAt.measure(iMakeMeasureSpec, View.MeasureSpec.makeMeasureSpec(getMeasuredHeight() - minimumHeight2, 1073741824));
        Drawable drawable = this.f46021c;
        if (drawable == null) {
            Intrinsics.m("shadowDrawable");
            throw null;
        }
        drawable.setBounds(0, minimumHeight2 - e.k(8), getMeasuredWidth(), minimumHeight2);
        this.f46023e = false;
    }
}
