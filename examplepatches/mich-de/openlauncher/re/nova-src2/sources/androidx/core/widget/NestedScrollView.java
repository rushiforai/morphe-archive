package androidx.core.widget;

import a5.a1;
import a5.j;
import a5.k0;
import a5.l0;
import a5.m0;
import a5.s0;
import a5.v;
import a5.w;
import a5.y;
import a5.z;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.FocusFinder;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.AnimationUtils;
import android.widget.EdgeEffect;
import android.widget.FrameLayout;
import android.widget.OverScroller;
import androidx.compose.ui.node.LayoutNode;
import androidx.core.view.ScrollingView;
import androidx.recyclerview.widget.n0;
import b.c0;
import cm.f;
import com.google.android.material.datepicker.h;
import com.vungle.ads.internal.protos.Sdk;
import e5.d;
import ic.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public class NestedScrollView extends FrameLayout implements y, v, ScrollingView {
    public static final float B = (float) (Math.log(0.78d) / Math.log(0.9d));
    public static final h C = new h(3);
    public static final int[] D = {16843130};
    public final j A;

    /* renamed from: a, reason: collision with root package name */
    public final float f14236a;

    /* renamed from: b, reason: collision with root package name */
    public long f14237b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f14238c;

    /* renamed from: d, reason: collision with root package name */
    public final OverScroller f14239d;

    /* renamed from: e, reason: collision with root package name */
    public final EdgeEffect f14240e;

    /* renamed from: f, reason: collision with root package name */
    public final EdgeEffect f14241f;

    /* renamed from: g, reason: collision with root package name */
    public int f14242g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f14243h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f14244i;

    /* renamed from: j, reason: collision with root package name */
    public View f14245j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f14246k;

    /* renamed from: l, reason: collision with root package name */
    public VelocityTracker f14247l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f14248m;
    public final boolean n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f14249p;

    /* renamed from: q, reason: collision with root package name */
    public final int f14250q;

    /* renamed from: r, reason: collision with root package name */
    public int f14251r;

    /* renamed from: s, reason: collision with root package name */
    public final int[] f14252s;

    /* renamed from: t, reason: collision with root package name */
    public final int[] f14253t;

    /* renamed from: u, reason: collision with root package name */
    public int f14254u;

    /* renamed from: v, reason: collision with root package name */
    public int f14255v;

    /* renamed from: w, reason: collision with root package name */
    public SavedState f14256w;

    /* renamed from: x, reason: collision with root package name */
    public final z f14257x;

    /* renamed from: y, reason: collision with root package name */
    public final w f14258y;

    /* renamed from: z, reason: collision with root package name */
    public float f14259z;

    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public int f14260a;

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("HorizontalScrollView.SavedState{");
            sb2.append(Integer.toHexString(System.identityHashCode(this)));
            sb2.append(" scrollPosition=");
            return c0.o(sb2, this.f14260a, "}");
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f14260a);
        }
    }

    public NestedScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969748);
        this.f14238c = new Rect();
        this.f14243h = true;
        this.f14244i = false;
        this.f14245j = null;
        this.f14246k = false;
        this.n = true;
        this.f14251r = -1;
        this.f14252s = new int[2];
        this.f14253t = new int[2];
        this.A = new j(getContext(), new f(this, 11));
        int i5 = Build.VERSION.SDK_INT;
        this.f14240e = i5 >= 31 ? d.a(context, attributeSet) : new EdgeEffect(context);
        this.f14241f = i5 >= 31 ? d.a(context, attributeSet) : new EdgeEffect(context);
        this.f14236a = context.getResources().getDisplayMetrics().density * 160.0f * 386.0878f * 0.84f;
        this.f14239d = new OverScroller(getContext());
        setFocusable(true);
        setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        setWillNotDraw(false);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        this.o = viewConfiguration.getScaledTouchSlop();
        this.f14249p = viewConfiguration.getScaledMinimumFlingVelocity();
        this.f14250q = viewConfiguration.getScaledMaximumFlingVelocity();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, D, 2130969748, 0);
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(0, false);
        if (z11 != this.f14248m) {
            this.f14248m = z11;
            requestLayout();
        }
        typedArrayObtainStyledAttributes.recycle();
        this.f14257x = new z();
        this.f14258y = new w(this);
        setNestedScrollingEnabled(true);
        a1.k(this, C);
    }

    public static boolean o(View view, NestedScrollView nestedScrollView) {
        if (view == nestedScrollView) {
            return true;
        }
        Object parent = view.getParent();
        return (parent instanceof ViewGroup) && o((View) parent, nestedScrollView);
    }

    public final void A(int i5) {
        this.f14258y.h(i5);
    }

    @Override // a5.x
    public final void a(int i5, View view) {
        z zVar = this.f14257x;
        if (i5 == 1) {
            zVar.f385b = 0;
        } else {
            zVar.f384a = 0;
        }
        A(i5);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view);
    }

    @Override // a5.x
    public final void b(View view, View view2, int i5, int i11) {
        z zVar = this.f14257x;
        if (i11 == 1) {
            zVar.f385b = i5;
        } else {
            zVar.f384a = i5;
        }
        y(2, i11);
    }

    @Override // a5.x
    public final void c(View view, int i5, int i11, int[] iArr, int i12) {
        i(i5, i11, iArr, null, i12);
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public final int computeHorizontalScrollExtent() {
        return super.computeHorizontalScrollExtent();
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public final int computeHorizontalScrollOffset() {
        return super.computeHorizontalScrollOffset();
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public final int computeHorizontalScrollRange() {
        return super.computeHorizontalScrollRange();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00fc  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void computeScroll() {
        int iRound;
        int i5;
        int i11;
        if (this.f14239d.isFinished()) {
            return;
        }
        this.f14239d.computeScrollOffset();
        int currY = this.f14239d.getCurrY();
        int i12 = currY - this.f14255v;
        int height = getHeight();
        EdgeEffect edgeEffect = this.f14240e;
        EdgeEffect edgeEffect2 = this.f14241f;
        if (i12 <= 0 || a.a.P(edgeEffect) == 0.0f) {
            if (i12 < 0 && a.a.P(edgeEffect2) != 0.0f) {
                float f11 = height;
                iRound = Math.round(a.a.Y(edgeEffect2, (i12 * 4.0f) / f11, 0.5f) * (f11 / 4.0f));
                if (iRound != i12) {
                    edgeEffect2.finish();
                }
            }
            this.f14255v = currY;
            int[] iArr = this.f14253t;
            iArr[1] = 0;
            i(0, i12, iArr, null, 1);
            i5 = i12 - iArr[1];
            int iM = m();
            if (w4.a.c()) {
                c5.a.a(this, Math.abs(this.f14239d.getCurrVelocity()));
            }
            if (i5 == 0) {
                int scrollY = getScrollY();
                s(i5, getScrollX(), scrollY, iM);
                int scrollY2 = getScrollY() - scrollY;
                int i13 = i5 - scrollY2;
                iArr[1] = 0;
                i11 = 1;
                this.f14258y.d(0, scrollY2, 0, i13, this.f14252s, 1, iArr);
                i5 = i13 - iArr[1];
            } else {
                i11 = 1;
            }
            if (i5 != 0) {
                int overScrollMode = getOverScrollMode();
                if (overScrollMode == 0 || (overScrollMode == i11 && iM > 0)) {
                    if (i5 < 0) {
                        if (edgeEffect.isFinished()) {
                            edgeEffect.onAbsorb((int) this.f14239d.getCurrVelocity());
                        }
                    } else if (edgeEffect2.isFinished()) {
                        edgeEffect2.onAbsorb((int) this.f14239d.getCurrVelocity());
                    }
                }
                this.f14239d.abortAnimation();
                A(i11);
            }
            if (this.f14239d.isFinished()) {
                postInvalidateOnAnimation();
                return;
            } else {
                A(i11);
                return;
            }
        }
        iRound = Math.round(a.a.Y(edgeEffect, ((-i12) * 4.0f) / height, 0.5f) * ((-height) / 4.0f));
        if (iRound != i12) {
            edgeEffect.finish();
        }
        i12 -= iRound;
        this.f14255v = currY;
        int[] iArr2 = this.f14253t;
        iArr2[1] = 0;
        i(0, i12, iArr2, null, 1);
        i5 = i12 - iArr2[1];
        int iM2 = m();
        if (w4.a.c()) {
        }
        if (i5 == 0) {
        }
        if (i5 != 0) {
        }
        if (this.f14239d.isFinished()) {
        }
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public final int computeVerticalScrollExtent() {
        return super.computeVerticalScrollExtent();
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public final int computeVerticalScrollOffset() {
        return Math.max(0, super.computeVerticalScrollOffset());
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public final int computeVerticalScrollRange() {
        int childCount = getChildCount();
        int height = (getHeight() - getPaddingBottom()) - getPaddingTop();
        if (childCount == 0) {
            return height;
        }
        View childAt = getChildAt(0);
        int bottom = childAt.getBottom() + ((FrameLayout.LayoutParams) childAt.getLayoutParams()).bottomMargin;
        int scrollY = getScrollY();
        int iMax = Math.max(0, bottom - height);
        return scrollY < 0 ? bottom - scrollY : scrollY > iMax ? (scrollY - iMax) + bottom : bottom;
    }

    public final boolean d(int i5) {
        View viewFindFocus = findFocus();
        if (viewFindFocus == this) {
            viewFindFocus = null;
        }
        View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, i5);
        int height = (int) (getHeight() * 0.5f);
        if (viewFindNextFocus == null || !p(viewFindNextFocus, height, getHeight())) {
            if (i5 == 33 && getScrollY() < height) {
                height = getScrollY();
            } else if (i5 == 130 && getChildCount() > 0) {
                View childAt = getChildAt(0);
                height = Math.min((childAt.getBottom() + ((FrameLayout.LayoutParams) childAt.getLayoutParams()).bottomMargin) - ((getHeight() + getScrollY()) - getPaddingBottom()), height);
            }
            if (height == 0) {
                return false;
            }
            if (i5 != 130) {
                height = -height;
            }
            v(height, 0, 1, true);
        } else {
            Rect rect = this.f14238c;
            viewFindNextFocus.getDrawingRect(rect);
            offsetDescendantRectToMyCoords(viewFindNextFocus, rect);
            v(h(rect), 0, 1, true);
            viewFindNextFocus.requestFocus(i5);
        }
        if (viewFindFocus != null && viewFindFocus.isFocused() && !p(viewFindFocus, 0, getHeight())) {
            int descendantFocusability = getDescendantFocusability();
            setDescendantFocusability(SQLiteDatabase.OPEN_SHAREDCACHE);
            requestFocus();
            setDescendantFocusability(descendantFocusability);
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || j(keyEvent);
    }

    @Override // android.view.View
    public final boolean dispatchNestedFling(float f11, float f12, boolean z11) {
        return this.f14258y.a(f11, f12, z11);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreFling(float f11, float f12) {
        return this.f14258y.b(f11, f12);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreScroll(int i5, int i11, int[] iArr, int[] iArr2) {
        return this.f14258y.c(i5, i11, iArr, iArr2, 0);
    }

    @Override // android.view.View
    public final boolean dispatchNestedScroll(int i5, int i11, int i12, int i13, int[] iArr) {
        return this.f14258y.d(i5, i11, i12, i13, iArr, 0, null);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        int paddingLeft;
        super.draw(canvas);
        int scrollY = getScrollY();
        EdgeEffect edgeEffect = this.f14240e;
        int paddingLeft2 = 0;
        if (!edgeEffect.isFinished()) {
            int iSave = canvas.save();
            int width = getWidth();
            int height = getHeight();
            int iMin = Math.min(0, scrollY);
            if (getClipToPadding()) {
                width -= getPaddingRight() + getPaddingLeft();
                paddingLeft = getPaddingLeft();
            } else {
                paddingLeft = 0;
            }
            if (getClipToPadding()) {
                height -= getPaddingBottom() + getPaddingTop();
                iMin += getPaddingTop();
            }
            canvas.translate(paddingLeft, iMin);
            edgeEffect.setSize(width, height);
            if (edgeEffect.draw(canvas)) {
                postInvalidateOnAnimation();
            }
            canvas.restoreToCount(iSave);
        }
        EdgeEffect edgeEffect2 = this.f14241f;
        if (edgeEffect2.isFinished()) {
            return;
        }
        int iSave2 = canvas.save();
        int width2 = getWidth();
        int height2 = getHeight();
        int iMax = Math.max(m(), scrollY) + height2;
        if (getClipToPadding()) {
            width2 -= getPaddingRight() + getPaddingLeft();
            paddingLeft2 = getPaddingLeft();
        }
        if (getClipToPadding()) {
            height2 -= getPaddingBottom() + getPaddingTop();
            iMax -= getPaddingBottom();
        }
        canvas.translate(paddingLeft2 - width2, iMax);
        canvas.rotate(180.0f, width2, 0.0f);
        edgeEffect2.setSize(width2, height2);
        if (edgeEffect2.draw(canvas)) {
            postInvalidateOnAnimation();
        }
        canvas.restoreToCount(iSave2);
    }

    @Override // a5.y
    public final void e(View view, int i5, int i11, int i12, int i13, int i14, int[] iArr) {
        q(i13, i14, iArr);
    }

    @Override // a5.x
    public final void f(View view, int i5, int i11, int i12, int i13, int i14) {
        q(i13, i14, null);
    }

    @Override // a5.x
    public final boolean g(View view, View view2, int i5, int i11) {
        return (i5 & 2) != 0;
    }

    @Override // android.view.View
    public final float getBottomFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        View childAt = getChildAt(0);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        int bottom = ((childAt.getBottom() + layoutParams.bottomMargin) - getScrollY()) - (getHeight() - getPaddingBottom());
        if (bottom < verticalFadingEdgeLength) {
            return bottom / verticalFadingEdgeLength;
        }
        return 1.0f;
    }

    @Override // android.view.ViewGroup
    public final int getNestedScrollAxes() {
        return this.f14257x.a();
    }

    @Override // android.view.View
    public final float getTopFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        int scrollY = getScrollY();
        if (scrollY < verticalFadingEdgeLength) {
            return scrollY / verticalFadingEdgeLength;
        }
        return 1.0f;
    }

    public final int h(Rect rect) {
        if (getChildCount() == 0) {
            return 0;
        }
        int height = getHeight();
        int scrollY = getScrollY();
        int i5 = scrollY + height;
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        if (rect.top > 0) {
            scrollY += verticalFadingEdgeLength;
        }
        View childAt = getChildAt(0);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
        int i11 = rect.bottom < (childAt.getHeight() + layoutParams.topMargin) + layoutParams.bottomMargin ? i5 - verticalFadingEdgeLength : i5;
        int i12 = rect.bottom;
        if (i12 > i11 && rect.top > scrollY) {
            return Math.min(rect.height() > height ? rect.top - scrollY : rect.bottom - i11, (childAt.getBottom() + layoutParams.bottomMargin) - i5);
        }
        if (rect.top >= scrollY || i12 >= i11) {
            return 0;
        }
        return Math.max(rect.height() > height ? 0 - (i11 - rect.bottom) : 0 - (scrollY - rect.top), -getScrollY());
    }

    @Override // android.view.View
    public final boolean hasNestedScrollingParent() {
        return this.f14258y.f(0);
    }

    public final boolean i(int i5, int i11, int[] iArr, int[] iArr2, int i12) {
        return this.f14258y.c(i5, i11, iArr, null, i12);
    }

    @Override // android.view.View
    public final boolean isNestedScrollingEnabled() {
        return this.f14258y.f379d;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0098  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean j(KeyEvent keyEvent) {
        this.f14238c.setEmpty();
        int childCount = getChildCount();
        int i5 = Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE;
        if (childCount > 0) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            if (childAt.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin > (getHeight() - getPaddingTop()) - getPaddingBottom()) {
                if (keyEvent.getAction() == 0) {
                    int keyCode = keyEvent.getKeyCode();
                    if (keyCode == 19) {
                        return keyEvent.isAltPressed() ? l(33) : d(33);
                    }
                    if (keyCode == 20) {
                        return keyEvent.isAltPressed() ? l(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE) : d(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                    }
                    if (keyCode == 62) {
                        if (keyEvent.isShiftPressed()) {
                            i5 = 33;
                        }
                        t(i5);
                        return false;
                    }
                    if (keyCode == 92) {
                        return l(33);
                    }
                    if (keyCode == 93) {
                        return l(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                    }
                    if (keyCode == 122) {
                        t(33);
                        return false;
                    }
                    if (keyCode == 123) {
                        t(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                        return false;
                    }
                }
            } else if (isFocused() && keyEvent.getKeyCode() != 4) {
                View viewFindFocus = findFocus();
                if (viewFindFocus == this) {
                    viewFindFocus = null;
                }
                View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                if (viewFindNextFocus != null && viewFindNextFocus != this && viewFindNextFocus.requestFocus(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void k(int i5) {
        if (getChildCount() > 0) {
            this.f14239d.fling(getScrollX(), getScrollY(), 0, i5, 0, 0, Integer.MIN_VALUE, LayoutNode.NotPlacedPlaceOrder, 0, 0);
            y(2, 1);
            this.f14255v = getScrollY();
            postInvalidateOnAnimation();
            if (w4.a.c()) {
                c5.a.a(this, Math.abs(this.f14239d.getCurrVelocity()));
            }
        }
    }

    public final boolean l(int i5) {
        int childCount;
        boolean z11 = i5 == 130;
        int height = getHeight();
        Rect rect = this.f14238c;
        rect.top = 0;
        rect.bottom = height;
        if (z11 && (childCount = getChildCount()) > 0) {
            View childAt = getChildAt(childCount - 1);
            int paddingBottom = getPaddingBottom() + childAt.getBottom() + ((FrameLayout.LayoutParams) childAt.getLayoutParams()).bottomMargin;
            rect.bottom = paddingBottom;
            rect.top = paddingBottom - height;
        }
        return u(i5, rect.top, rect.bottom);
    }

    public final int m() {
        if (getChildCount() <= 0) {
            return 0;
        }
        View childAt = getChildAt(0);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
        return Math.max(0, ((childAt.getHeight() + layoutParams.topMargin) + layoutParams.bottomMargin) - ((getHeight() - getPaddingTop()) - getPaddingBottom()));
    }

    @Override // android.view.ViewGroup
    public final void measureChild(View view, int i5, int i11) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        view.measure(ViewGroup.getChildMeasureSpec(i5, getPaddingRight() + getPaddingLeft(), layoutParams.width), View.MeasureSpec.makeMeasureSpec(0, 0));
    }

    @Override // android.view.ViewGroup
    public final void measureChildWithMargins(View view, int i5, int i11, int i12, int i13) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        view.measure(ViewGroup.getChildMeasureSpec(i5, getPaddingRight() + getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i11, marginLayoutParams.width), View.MeasureSpec.makeMeasureSpec(marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, 0));
    }

    public final float n() {
        if (this.f14259z == 0.0f) {
            TypedValue typedValue = new TypedValue();
            Context context = getContext();
            if (!context.getTheme().resolveAttribute(16842829, typedValue, true)) {
                throw new IllegalStateException("Expected theme to define listPreferredItemHeight.");
            }
            this.f14259z = typedValue.getDimension(context.getResources().getDisplayMetrics());
        }
        return this.f14259z;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f14244i = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:131:0x0287  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x028f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01c2  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onGenericMotionEvent(MotionEvent motionEvent) {
        float axisValue;
        int i5;
        int width;
        int i11;
        int scaledMinimumFlingVelocity;
        int scaledMaximumFlingVelocity;
        boolean z11;
        float yVelocity;
        float f11;
        long j11;
        float f12;
        float fSqrt;
        int i12;
        float f13;
        if (motionEvent.getAction() != 8 || this.f14246k) {
            return false;
        }
        if (b.M(motionEvent, 2)) {
            i5 = 9;
            axisValue = motionEvent.getAxisValue(9);
            width = (int) motionEvent.getX();
        } else if (b.M(motionEvent, 4194304)) {
            axisValue = motionEvent.getAxisValue(26);
            width = getWidth() / 2;
            i5 = 26;
        } else {
            axisValue = 0.0f;
            i5 = 0;
            width = 0;
        }
        if (axisValue == 0.0f) {
            return false;
        }
        v(-((int) (n() * axisValue)), width, 1, b.M(motionEvent, 8194));
        if (i5 == 0) {
            return true;
        }
        j jVar = this.A;
        NestedScrollView nestedScrollView = (NestedScrollView) jVar.f303b.f20116b;
        int[] iArr = jVar.f309h;
        int source = motionEvent.getSource();
        int deviceId = motionEvent.getDeviceId();
        int i13 = 1;
        if (jVar.f307f == source && jVar.f308g == deviceId && jVar.f306e == i5) {
            z11 = false;
            i11 = 0;
        } else {
            Context context = jVar.f302a;
            ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
            int deviceId2 = motionEvent.getDeviceId();
            i11 = 0;
            int source2 = motionEvent.getSource();
            int i14 = Build.VERSION.SDK_INT;
            if (i14 >= 34) {
                scaledMinimumFlingVelocity = k0.h(viewConfiguration, deviceId2, i5, source2);
            } else {
                InputDevice device = InputDevice.getDevice(deviceId2);
                if (device == null || device.getMotionRange(i5, source2) == null) {
                    scaledMinimumFlingVelocity = LayoutNode.NotPlacedPlaceOrder;
                } else {
                    Resources resources = context.getResources();
                    int identifier = (source2 == 4194304 && i5 == 26) ? resources.getIdentifier("config_viewMinRotaryEncoderFlingVelocity", "dimen", "android") : -1;
                    Objects.requireNonNull(viewConfiguration);
                    if (identifier == -1) {
                        scaledMinimumFlingVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
                    } else if (identifier == 0 || (scaledMinimumFlingVelocity = resources.getDimensionPixelSize(identifier)) < 0) {
                    }
                }
            }
            iArr[0] = scaledMinimumFlingVelocity;
            int deviceId3 = motionEvent.getDeviceId();
            int source3 = motionEvent.getSource();
            if (i14 >= 34) {
                scaledMaximumFlingVelocity = k0.g(viewConfiguration, deviceId3, i5, source3);
            } else {
                InputDevice device2 = InputDevice.getDevice(deviceId3);
                if (device2 == null || device2.getMotionRange(i5, source3) == null) {
                    scaledMaximumFlingVelocity = Integer.MIN_VALUE;
                } else {
                    Resources resources2 = context.getResources();
                    int identifier2 = (source3 == 4194304 && i5 == 26) ? resources2.getIdentifier("config_viewMaxRotaryEncoderFlingVelocity", "dimen", "android") : -1;
                    Objects.requireNonNull(viewConfiguration);
                    if (identifier2 == -1) {
                        scaledMaximumFlingVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
                    } else if (identifier2 == 0 || (scaledMaximumFlingVelocity = resources2.getDimensionPixelSize(identifier2)) < 0) {
                    }
                }
            }
            iArr[1] = scaledMaximumFlingVelocity;
            jVar.f307f = source;
            jVar.f308g = deviceId;
            jVar.f306e = i5;
            z11 = true;
        }
        if (iArr[i11] == Integer.MAX_VALUE) {
            VelocityTracker velocityTracker = jVar.f304c;
            if (velocityTracker == null) {
                return true;
            }
            velocityTracker.recycle();
            jVar.f304c = null;
            return true;
        }
        if (jVar.f304c == null) {
            jVar.f304c = VelocityTracker.obtain();
        }
        VelocityTracker velocityTracker2 = jVar.f304c;
        Map map = l0.f315a;
        velocityTracker2.addMovement(motionEvent);
        int i15 = 20;
        if (Build.VERSION.SDK_INT < 34 && motionEvent.getSource() == 4194304) {
            Map map2 = l0.f315a;
            if (!map2.containsKey(velocityTracker2)) {
                map2.put(velocityTracker2, new m0());
            }
            m0 m0Var = (m0) map2.get(velocityTracker2);
            long[] jArr = m0Var.f319b;
            long eventTime = motionEvent.getEventTime();
            if (m0Var.f321d != 0 && eventTime - jArr[m0Var.f322e] > 40) {
                m0Var.f321d = i11;
                m0Var.f320c = 0.0f;
            }
            int i16 = (m0Var.f322e + 1) % 20;
            m0Var.f322e = i16;
            int i17 = m0Var.f321d;
            if (i17 != 20) {
                m0Var.f321d = i17 + 1;
            }
            m0Var.f318a[i16] = motionEvent.getAxisValue(26);
            jArr[m0Var.f322e] = eventTime;
        }
        velocityTracker2.computeCurrentVelocity(1000, Float.MAX_VALUE);
        m0 m0Var2 = (m0) l0.f315a.get(velocityTracker2);
        if (m0Var2 != null) {
            float[] fArr = m0Var2.f318a;
            long[] jArr2 = m0Var2.f319b;
            int i18 = m0Var2.f321d;
            if (i18 < 2) {
                f12 = Float.MAX_VALUE;
                i12 = 1000;
                fSqrt = 0.0f;
                f13 = fSqrt * i12;
                m0Var2.f320c = f13;
                if (f13 >= (-Math.abs(f12))) {
                    m0Var2.f320c = -Math.abs(f12);
                } else if (m0Var2.f320c > Math.abs(f12)) {
                    m0Var2.f320c = Math.abs(f12);
                }
            } else {
                int i19 = m0Var2.f322e;
                int i21 = ((i19 + 20) - (i18 - 1)) % 20;
                long j12 = jArr2[i19];
                while (true) {
                    j11 = jArr2[i21];
                    if (j12 - j11 <= 100) {
                        break;
                    }
                    m0Var2.f321d--;
                    i21 = (i21 + 1) % 20;
                }
                int i22 = m0Var2.f321d;
                if (i22 >= 2) {
                    if (i22 == 2) {
                        int i23 = (i21 + 1) % 20;
                        if (j11 != jArr2[i23]) {
                            f12 = Float.MAX_VALUE;
                            i12 = 1000;
                            fSqrt = fArr[i23] / (r12 - j11);
                        }
                    } else {
                        f12 = Float.MAX_VALUE;
                        float f14 = 0.0f;
                        int i24 = 0;
                        int i25 = 0;
                        while (true) {
                            if (i24 >= m0Var2.f321d - 1) {
                                break;
                            }
                            int i26 = i24 + i21;
                            long j13 = jArr2[i26 % 20];
                            int i27 = (i26 + 1) % i15;
                            if (jArr2[i27] != j13) {
                                i25++;
                                float fSqrt2 = (f14 < 0.0f ? -1.0f : 1.0f) * ((float) Math.sqrt(Math.abs(f14) * 2.0f));
                                float f15 = fArr[i27] / (jArr2[i27] - j13);
                                float fAbs = (Math.abs(f15) * (f15 - fSqrt2)) + f14;
                                if (i25 == i13) {
                                    fAbs *= 0.5f;
                                }
                                f14 = fAbs;
                            }
                            i24++;
                            i15 = 20;
                            i13 = 1;
                        }
                        fSqrt = ((float) Math.sqrt(Math.abs(f14) * 2.0f)) * (f14 < 0.0f ? -1.0f : 1.0f);
                        i12 = 1000;
                    }
                    f13 = fSqrt * i12;
                    m0Var2.f320c = f13;
                    if (f13 >= (-Math.abs(f12))) {
                    }
                }
            }
        }
        if (Build.VERSION.SDK_INT >= 34) {
            yVelocity = k0.d(velocityTracker2, i5);
        } else if (i5 == 0) {
            yVelocity = velocityTracker2.getXVelocity();
        } else if (i5 == 1) {
            yVelocity = velocityTracker2.getYVelocity();
        } else {
            m0 m0Var3 = (m0) l0.f315a.get(velocityTracker2);
            yVelocity = (m0Var3 == null || i5 != 26) ? 0.0f : m0Var3.f320c;
        }
        float f16 = yVelocity * (-nestedScrollView.n());
        float fSignum = Math.signum(f16);
        if (z11 || (fSignum != Math.signum(jVar.f305d) && fSignum != 0.0f)) {
            nestedScrollView.f14239d.abortAnimation();
        }
        if (Math.abs(f16) < iArr[0]) {
            return true;
        }
        float fMax = Math.max(-r1, Math.min(f16, iArr[1]));
        if (fMax == 0.0f) {
            f11 = 0.0f;
        } else {
            nestedScrollView.f14239d.abortAnimation();
            nestedScrollView.k((int) fMax);
            f11 = fMax;
        }
        jVar.f305d = f11;
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0119  */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        boolean z11 = true;
        if (action == 2 && this.f14246k) {
            return true;
        }
        int i5 = action & 255;
        if (i5 == 0) {
            int y11 = (int) motionEvent.getY();
            int x11 = (int) motionEvent.getX();
            if (getChildCount() > 0) {
                int scrollY = getScrollY();
                View childAt = getChildAt(0);
                if (y11 < childAt.getTop() - scrollY || y11 >= childAt.getBottom() - scrollY || x11 < childAt.getLeft() || x11 >= childAt.getRight()) {
                    if (!z(motionEvent) && this.f14239d.isFinished()) {
                        z11 = false;
                    }
                    this.f14246k = z11;
                    VelocityTracker velocityTracker = this.f14247l;
                    if (velocityTracker != null) {
                        velocityTracker.recycle();
                        this.f14247l = null;
                    }
                } else {
                    this.f14242g = y11;
                    this.f14251r = motionEvent.getPointerId(0);
                    VelocityTracker velocityTracker2 = this.f14247l;
                    if (velocityTracker2 == null) {
                        this.f14247l = VelocityTracker.obtain();
                    } else {
                        velocityTracker2.clear();
                    }
                    this.f14247l.addMovement(motionEvent);
                    this.f14239d.computeScrollOffset();
                    if (!z(motionEvent) && this.f14239d.isFinished()) {
                        z11 = false;
                    }
                    this.f14246k = z11;
                    y(2, 0);
                }
            }
        } else if (i5 == 1) {
            this.f14246k = false;
            this.f14251r = -1;
            VelocityTracker velocityTracker3 = this.f14247l;
            if (velocityTracker3 != null) {
                velocityTracker3.recycle();
                this.f14247l = null;
            }
            if (this.f14239d.springBack(getScrollX(), getScrollY(), 0, 0, 0, m())) {
                postInvalidateOnAnimation();
            }
            A(0);
        } else if (i5 == 2) {
            int i11 = this.f14251r;
            if (i11 != -1) {
                int iFindPointerIndex = motionEvent.findPointerIndex(i11);
                if (iFindPointerIndex == -1) {
                    Log.e("NestedScrollView", "Invalid pointerId=" + i11 + " in onInterceptTouchEvent");
                } else {
                    int y12 = (int) motionEvent.getY(iFindPointerIndex);
                    if (Math.abs(y12 - this.f14242g) > this.o && (2 & this.f14257x.a()) == 0) {
                        this.f14246k = true;
                        this.f14242g = y12;
                        if (this.f14247l == null) {
                            this.f14247l = VelocityTracker.obtain();
                        }
                        this.f14247l.addMovement(motionEvent);
                        this.f14254u = 0;
                        ViewParent parent = getParent();
                        if (parent != null) {
                            parent.requestDisallowInterceptTouchEvent(true);
                        }
                    }
                }
            }
        } else if (i5 != 3) {
            if (i5 == 6) {
                r(motionEvent);
            }
        }
        return this.f14246k;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int measuredHeight;
        super.onLayout(z11, i5, i11, i12, i13);
        int i14 = 0;
        this.f14243h = false;
        View view = this.f14245j;
        if (view != null && o(view, this)) {
            View view2 = this.f14245j;
            Rect rect = this.f14238c;
            view2.getDrawingRect(rect);
            offsetDescendantRectToMyCoords(view2, rect);
            int iH = h(rect);
            if (iH != 0) {
                scrollBy(0, iH);
            }
        }
        this.f14245j = null;
        if (!this.f14244i) {
            if (this.f14256w != null) {
                scrollTo(getScrollX(), this.f14256w.f14260a);
                this.f14256w = null;
            }
            if (getChildCount() > 0) {
                View childAt = getChildAt(0);
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
                measuredHeight = childAt.getMeasuredHeight() + layoutParams.topMargin + layoutParams.bottomMargin;
            } else {
                measuredHeight = 0;
            }
            int paddingTop = ((i13 - i11) - getPaddingTop()) - getPaddingBottom();
            int scrollY = getScrollY();
            if (paddingTop < measuredHeight && scrollY >= 0) {
                i14 = paddingTop + scrollY > measuredHeight ? measuredHeight - paddingTop : scrollY;
            }
            if (i14 != scrollY) {
                scrollTo(getScrollX(), i14);
            }
        }
        scrollTo(getScrollX(), getScrollY());
        this.f14244i = true;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (this.f14248m && View.MeasureSpec.getMode(i11) != 0 && getChildCount() > 0) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            int measuredHeight = childAt.getMeasuredHeight();
            int measuredHeight2 = (((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom()) - layoutParams.topMargin) - layoutParams.bottomMargin;
            if (measuredHeight < measuredHeight2) {
                childAt.measure(ViewGroup.getChildMeasureSpec(i5, getPaddingRight() + getPaddingLeft() + layoutParams.leftMargin + layoutParams.rightMargin, layoutParams.width), View.MeasureSpec.makeMeasureSpec(measuredHeight2, 1073741824));
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f11, float f12, boolean z11) {
        if (z11) {
            return false;
        }
        dispatchNestedFling(0.0f, f12, true);
        k((int) f12);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedPreFling(View view, float f11, float f12) {
        return this.f14258y.b(f11, f12);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedPreScroll(View view, int i5, int i11, int[] iArr) {
        i(i5, i11, iArr, null, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScroll(View view, int i5, int i11, int i12, int i13) {
        q(i13, 0, null);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScrollAccepted(View view, View view2, int i5) {
        b(view, view2, i5, 0);
    }

    @Override // android.view.View
    public final void onOverScrolled(int i5, int i11, boolean z11, boolean z12) {
        super.scrollTo(i5, i11);
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i5, Rect rect) {
        if (i5 == 2) {
            i5 = Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE;
        } else if (i5 == 1) {
            i5 = 33;
        }
        View viewFindNextFocus = rect == null ? FocusFinder.getInstance().findNextFocus(this, null, i5) : FocusFinder.getInstance().findNextFocusFromRect(this, rect, i5);
        if (viewFindNextFocus != null && p(viewFindNextFocus, 0, getHeight())) {
            return viewFindNextFocus.requestFocus(i5, rect);
        }
        return false;
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.f14256w = savedState;
        requestLayout();
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.f14260a = getScrollY();
        return savedState;
    }

    @Override // android.view.View
    public final void onScrollChanged(int i5, int i11, int i12, int i13) {
        super.onScrollChanged(i5, i11, i12, i13);
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        View viewFindFocus = findFocus();
        if (viewFindFocus == null || this == viewFindFocus || !p(viewFindFocus, 0, i13)) {
            return;
        }
        Rect rect = this.f14238c;
        viewFindFocus.getDrawingRect(rect);
        offsetDescendantRectToMyCoords(viewFindFocus, rect);
        int iH = h(rect);
        if (iH != 0) {
            if (this.n) {
                x(0, iH, false);
            } else {
                scrollBy(0, iH);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onStartNestedScroll(View view, View view2, int i5) {
        return g(view, view2, i5, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onStopNestedScroll(View view) {
        a(0, view);
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x013e  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0145  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        ViewParent parent;
        float fY;
        int iRound;
        int i5;
        ViewParent parent2;
        if (this.f14247l == null) {
            this.f14247l = VelocityTracker.obtain();
        }
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.f14254u = 0;
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
        float f11 = 0.0f;
        motionEventObtain.offsetLocation(0.0f, this.f14254u);
        if (actionMasked != 0) {
            EdgeEffect edgeEffect = this.f14240e;
            EdgeEffect edgeEffect2 = this.f14241f;
            if (actionMasked == 1) {
                VelocityTracker velocityTracker = this.f14247l;
                velocityTracker.computeCurrentVelocity(1000, this.f14250q);
                int yVelocity = (int) velocityTracker.getYVelocity(this.f14251r);
                if (Math.abs(yVelocity) >= this.f14249p) {
                    if (a.a.P(edgeEffect) != 0.0f) {
                        if (w(edgeEffect, yVelocity)) {
                            edgeEffect.onAbsorb(yVelocity);
                        } else {
                            k(-yVelocity);
                        }
                    } else if (a.a.P(edgeEffect2) != 0.0f) {
                        int i11 = -yVelocity;
                        if (w(edgeEffect2, i11)) {
                            edgeEffect2.onAbsorb(i11);
                        } else {
                            k(i11);
                        }
                    } else {
                        int i12 = -yVelocity;
                        float f12 = i12;
                        if (!this.f14258y.b(0.0f, f12)) {
                            dispatchNestedFling(0.0f, f12, true);
                            k(i12);
                        }
                    }
                } else if (this.f14239d.springBack(getScrollX(), getScrollY(), 0, 0, 0, m())) {
                    postInvalidateOnAnimation();
                }
                this.f14251r = -1;
                this.f14246k = false;
                VelocityTracker velocityTracker2 = this.f14247l;
                if (velocityTracker2 != null) {
                    velocityTracker2.recycle();
                    this.f14247l = null;
                }
                A(0);
                edgeEffect.onRelease();
                edgeEffect2.onRelease();
            } else if (actionMasked == 2) {
                int iFindPointerIndex = motionEvent.findPointerIndex(this.f14251r);
                if (iFindPointerIndex == -1) {
                    Log.e("NestedScrollView", "Invalid pointerId=" + this.f14251r + " in onTouchEvent");
                } else {
                    int y11 = (int) motionEvent.getY(iFindPointerIndex);
                    int i13 = this.f14242g - y11;
                    float x11 = motionEvent.getX(iFindPointerIndex) / getWidth();
                    float height = i13 / getHeight();
                    if (a.a.P(edgeEffect) != 0.0f) {
                        fY = -a.a.Y(edgeEffect, -height, x11);
                        if (a.a.P(edgeEffect) == 0.0f) {
                            edgeEffect.onRelease();
                        }
                    } else {
                        if (a.a.P(edgeEffect2) != 0.0f) {
                            fY = a.a.Y(edgeEffect2, height, 1.0f - x11);
                            if (a.a.P(edgeEffect2) == 0.0f) {
                                edgeEffect2.onRelease();
                            }
                        }
                        iRound = Math.round(f11 * getHeight());
                        if (iRound != 0) {
                            invalidate();
                        }
                        i5 = i13 - iRound;
                        if (!this.f14246k && Math.abs(i5) > this.o) {
                            parent2 = getParent();
                            if (parent2 != null) {
                                parent2.requestDisallowInterceptTouchEvent(true);
                            }
                            this.f14246k = true;
                            i5 = i5 <= 0 ? i5 - this.o : i5 + this.o;
                        }
                        if (this.f14246k) {
                            int iV = v(i5, (int) motionEvent.getX(iFindPointerIndex), 0, false);
                            this.f14242g = y11 - iV;
                            this.f14254u += iV;
                        }
                    }
                    f11 = fY;
                    iRound = Math.round(f11 * getHeight());
                    if (iRound != 0) {
                    }
                    i5 = i13 - iRound;
                    if (!this.f14246k) {
                        parent2 = getParent();
                        if (parent2 != null) {
                        }
                        this.f14246k = true;
                        if (i5 <= 0) {
                        }
                    }
                    if (this.f14246k) {
                    }
                }
            } else if (actionMasked == 3) {
                if (this.f14246k && getChildCount() > 0) {
                    if (this.f14239d.springBack(getScrollX(), getScrollY(), 0, 0, 0, m())) {
                        postInvalidateOnAnimation();
                    }
                }
                this.f14251r = -1;
                this.f14246k = false;
                VelocityTracker velocityTracker3 = this.f14247l;
                if (velocityTracker3 != null) {
                    velocityTracker3.recycle();
                    this.f14247l = null;
                }
                A(0);
                edgeEffect.onRelease();
                edgeEffect2.onRelease();
            } else if (actionMasked == 5) {
                int actionIndex = motionEvent.getActionIndex();
                this.f14242g = (int) motionEvent.getY(actionIndex);
                this.f14251r = motionEvent.getPointerId(actionIndex);
            } else if (actionMasked == 6) {
                r(motionEvent);
                this.f14242g = (int) motionEvent.getY(motionEvent.findPointerIndex(this.f14251r));
            }
        } else {
            if (getChildCount() == 0) {
                return false;
            }
            if (this.f14246k && (parent = getParent()) != null) {
                parent.requestDisallowInterceptTouchEvent(true);
            }
            if (!this.f14239d.isFinished()) {
                this.f14239d.abortAnimation();
                A(1);
            }
            int y12 = (int) motionEvent.getY();
            int pointerId = motionEvent.getPointerId(0);
            this.f14242g = y12;
            this.f14251r = pointerId;
            y(2, 0);
        }
        VelocityTracker velocityTracker4 = this.f14247l;
        if (velocityTracker4 != null) {
            velocityTracker4.addMovement(motionEventObtain);
        }
        motionEventObtain.recycle();
        return true;
    }

    public final boolean p(View view, int i5, int i11) {
        Rect rect = this.f14238c;
        view.getDrawingRect(rect);
        offsetDescendantRectToMyCoords(view, rect);
        return rect.bottom + i5 >= getScrollY() && rect.top - i5 <= getScrollY() + i11;
    }

    public final void q(int i5, int i11, int[] iArr) {
        int scrollY = getScrollY();
        scrollBy(0, i5);
        int scrollY2 = getScrollY() - scrollY;
        if (iArr != null) {
            iArr[1] = iArr[1] + scrollY2;
        }
        this.f14258y.d(0, scrollY2, 0, i5 - scrollY2, null, i11, iArr);
    }

    public final void r(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.f14251r) {
            int i5 = actionIndex == 0 ? 1 : 0;
            this.f14242g = (int) motionEvent.getY(i5);
            this.f14251r = motionEvent.getPointerId(i5);
            VelocityTracker velocityTracker = this.f14247l;
            if (velocityTracker != null) {
                velocityTracker.clear();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        if (this.f14243h) {
            this.f14245j = view2;
        } else {
            Rect rect = this.f14238c;
            view2.getDrawingRect(rect);
            offsetDescendantRectToMyCoords(view2, rect);
            int iH = h(rect);
            if (iH != 0) {
                scrollBy(0, iH);
            }
        }
        super.requestChildFocus(view, view2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z11) {
        rect.offset(view.getLeft() - view.getScrollX(), view.getTop() - view.getScrollY());
        int iH = h(rect);
        boolean z12 = iH != 0;
        if (z12) {
            if (z11) {
                scrollBy(0, iH);
                return z12;
            }
            x(0, iH, false);
        }
        return z12;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        VelocityTracker velocityTracker;
        if (z11 && (velocityTracker = this.f14247l) != null) {
            velocityTracker.recycle();
            this.f14247l = null;
        }
        super.requestDisallowInterceptTouchEvent(z11);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        this.f14243h = true;
        super.requestLayout();
    }

    public final boolean s(int i5, int i11, int i12, int i13) {
        int i14;
        boolean z11;
        int i15;
        boolean z12;
        getOverScrollMode();
        super.computeHorizontalScrollRange();
        super.computeHorizontalScrollExtent();
        computeVerticalScrollRange();
        super.computeVerticalScrollExtent();
        int i16 = i12 + i5;
        if (i11 <= 0 && i11 >= 0) {
            i14 = i11;
            z11 = false;
        } else {
            i14 = 0;
            z11 = true;
        }
        if (i16 > i13) {
            i15 = i13;
        } else {
            if (i16 >= 0) {
                i15 = i16;
                z12 = false;
                if (z12 && !this.f14258y.f(1)) {
                    this.f14239d.springBack(i14, i15, 0, 0, 0, m());
                }
                super.scrollTo(i14, i15);
                return !z11 || z12;
            }
            i15 = 0;
        }
        z12 = true;
        if (z12) {
            this.f14239d.springBack(i14, i15, 0, 0, 0, m());
        }
        super.scrollTo(i14, i15);
        if (z11) {
        }
    }

    @Override // android.view.View
    public final void scrollTo(int i5, int i11) {
        if (getChildCount() > 0) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            int width = (getWidth() - getPaddingLeft()) - getPaddingRight();
            int width2 = childAt.getWidth() + layoutParams.leftMargin + layoutParams.rightMargin;
            int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
            int height2 = childAt.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin;
            if (width >= width2 || i5 < 0) {
                i5 = 0;
            } else if (width + i5 > width2) {
                i5 = width2 - width;
            }
            if (height >= height2 || i11 < 0) {
                i11 = 0;
            } else if (height + i11 > height2) {
                i11 = height2 - height;
            }
            if (i5 == getScrollX() && i11 == getScrollY()) {
                return;
            }
            super.scrollTo(i5, i11);
        }
    }

    @Override // android.view.View
    public final void setNestedScrollingEnabled(boolean z11) {
        w wVar = this.f14258y;
        if (wVar.f379d) {
            ViewGroup viewGroup = wVar.f378c;
            WeakHashMap weakHashMap = a1.f250a;
            s0.n(viewGroup);
        }
        wVar.f379d = z11;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return true;
    }

    @Override // android.view.View
    public final boolean startNestedScroll(int i5) {
        return this.f14258y.g(i5, 0);
    }

    @Override // android.view.View
    public final void stopNestedScroll() {
        A(0);
    }

    public final void t(int i5) {
        boolean z11 = i5 == 130;
        int height = getHeight();
        Rect rect = this.f14238c;
        if (z11) {
            rect.top = getScrollY() + height;
            int childCount = getChildCount();
            if (childCount > 0) {
                View childAt = getChildAt(childCount - 1);
                int paddingBottom = getPaddingBottom() + childAt.getBottom() + ((FrameLayout.LayoutParams) childAt.getLayoutParams()).bottomMargin;
                if (rect.top + height > paddingBottom) {
                    rect.top = paddingBottom - height;
                }
            }
        } else {
            int scrollY = getScrollY() - height;
            rect.top = scrollY;
            if (scrollY < 0) {
                rect.top = 0;
            }
        }
        int i11 = rect.top;
        int i12 = height + i11;
        rect.bottom = i12;
        u(i5, i11, i12);
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean u(int i5, int i11, int i12) {
        boolean z11;
        int height = getHeight();
        int scrollY = getScrollY();
        int i13 = height + scrollY;
        boolean z12 = i5 == 33;
        ArrayList<View> focusables = getFocusables(2);
        int size = focusables.size();
        View view = null;
        boolean z13 = false;
        for (int i14 = 0; i14 < size; i14++) {
            View view2 = focusables.get(i14);
            int top = view2.getTop();
            int bottom = view2.getBottom();
            if (i11 < bottom && top < i12) {
                boolean z14 = i11 < top && bottom < i12;
                if (view == null) {
                    view = view2;
                    z13 = z14;
                } else {
                    boolean z15 = (z12 && top < view.getTop()) || (!z12 && bottom > view.getBottom());
                    if (z13) {
                        if (z14 && z15) {
                            view = view2;
                        }
                    } else if (z14) {
                        view = view2;
                        z13 = true;
                    } else if (z15) {
                    }
                }
            }
        }
        if (view == null) {
            view = this;
        }
        if (i11 < scrollY || i12 > i13) {
            v(z12 ? i11 - scrollY : i12 - i13, 0, 1, true);
            z11 = true;
        } else {
            z11 = false;
        }
        if (view != findFocus()) {
            view.requestFocus(i5);
        }
        return z11;
    }

    public final int v(int i5, int i11, int i12, boolean z11) {
        int i13;
        int i14;
        boolean z12;
        VelocityTracker velocityTracker;
        if (i12 == 1) {
            y(2, i12);
        }
        boolean zC = this.f14258y.c(0, i5, this.f14253t, this.f14252s, i12);
        int[] iArr = this.f14252s;
        int[] iArr2 = this.f14253t;
        if (zC) {
            i13 = i5 - iArr2[1];
            i14 = iArr[1];
        } else {
            i13 = i5;
            i14 = 0;
        }
        int scrollY = getScrollY();
        int iM = m();
        int overScrollMode = getOverScrollMode();
        boolean z13 = (overScrollMode == 0 || (overScrollMode == 1 && m() > 0)) && !z11;
        boolean z14 = s(i13, 0, scrollY, iM) && !this.f14258y.f(i12);
        int scrollY2 = getScrollY() - scrollY;
        iArr2[1] = 0;
        this.f14258y.d(0, scrollY2, 0, i13 - scrollY2, this.f14252s, i12, iArr2);
        int i15 = i14 + iArr[1];
        int i16 = i13 - iArr2[1];
        int i17 = scrollY + i16;
        EdgeEffect edgeEffect = this.f14241f;
        EdgeEffect edgeEffect2 = this.f14240e;
        if (i17 < 0) {
            if (z13) {
                a.a.Y(edgeEffect2, (-i16) / getHeight(), i11 / getWidth());
                if (!edgeEffect.isFinished()) {
                    edgeEffect.onRelease();
                }
            }
        } else if (i17 > iM && z13) {
            a.a.Y(edgeEffect, i16 / getHeight(), 1.0f - (i11 / getWidth()));
            if (!edgeEffect2.isFinished()) {
                edgeEffect2.onRelease();
            }
        }
        if (edgeEffect2.isFinished() && edgeEffect.isFinished()) {
            z12 = z14;
        } else {
            postInvalidateOnAnimation();
            z12 = false;
        }
        if (z12 && i12 == 0 && (velocityTracker = this.f14247l) != null) {
            velocityTracker.clear();
        }
        if (i12 == 1) {
            A(i12);
            edgeEffect2.onRelease();
            edgeEffect.onRelease();
        }
        return i15;
    }

    public final boolean w(EdgeEffect edgeEffect, int i5) {
        if (i5 > 0) {
            return true;
        }
        float fP = a.a.P(edgeEffect) * getHeight();
        float fAbs = Math.abs(-i5) * 0.35f;
        float f11 = this.f14236a * 0.015f;
        double dLog = Math.log(fAbs / f11);
        double d5 = B;
        return ((float) (Math.exp((d5 / (d5 - 1.0d)) * dLog) * ((double) f11))) < fP;
    }

    public final void x(int i5, int i11, boolean z11) {
        if (getChildCount() == 0) {
            return;
        }
        if (AnimationUtils.currentAnimationTimeMillis() - this.f14237b > 250) {
            View childAt = getChildAt(0);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            int height = childAt.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin;
            int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
            int scrollY = getScrollY();
            int iMax = Math.max(0, Math.min(i11 + scrollY, Math.max(0, height - height2))) - scrollY;
            this.f14239d.startScroll(getScrollX(), scrollY, 0, iMax, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
            if (z11) {
                y(2, 1);
            } else {
                A(1);
            }
            this.f14255v = getScrollY();
            postInvalidateOnAnimation();
        } else {
            if (!this.f14239d.isFinished()) {
                this.f14239d.abortAnimation();
                A(1);
            }
            scrollBy(i5, i11);
        }
        this.f14237b = AnimationUtils.currentAnimationTimeMillis();
    }

    public final boolean y(int i5, int i11) {
        return this.f14258y.g(2, i11);
    }

    public final boolean z(MotionEvent motionEvent) {
        boolean z11;
        EdgeEffect edgeEffect = this.f14240e;
        if (a.a.P(edgeEffect) != 0.0f) {
            a.a.Y(edgeEffect, 0.0f, motionEvent.getX() / getWidth());
            z11 = true;
        } else {
            z11 = false;
        }
        EdgeEffect edgeEffect2 = this.f14241f;
        if (a.a.P(edgeEffect2) == 0.0f) {
            return z11;
        }
        a.a.Y(edgeEffect2, 0.0f, 1.0f - (motionEvent.getX() / getWidth()));
        return true;
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5) {
        if (getChildCount() <= 0) {
            super.addView(view, i5);
            return;
        }
        throw new IllegalStateException("ScrollView can host only one direct child");
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void addView(View view, ViewGroup.LayoutParams layoutParams) {
        if (getChildCount() <= 0) {
            super.addView(view, layoutParams);
            return;
        }
        throw new IllegalStateException("ScrollView can host only one direct child");
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (getChildCount() <= 0) {
            super.addView(view, i5, layoutParams);
            return;
        }
        throw new IllegalStateException("ScrollView can host only one direct child");
    }
}
