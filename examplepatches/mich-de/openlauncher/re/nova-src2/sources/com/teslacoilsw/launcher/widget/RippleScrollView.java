package com.teslacoilsw.launcher.widget;

import a5.a1;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.AnimationUtils;
import android.widget.EdgeEffect;
import android.widget.FrameLayout;
import android.widget.OverScroller;
import androidx.recyclerview.widget.u1;
import b.c0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.WeakHashMap;
import mc0.b;
import mc0.d;
import w20.p;

/* loaded from: classes.dex */
public class RippleScrollView extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public long f46462a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f46463b;

    /* renamed from: c, reason: collision with root package name */
    public final OverScroller f46464c;

    /* renamed from: d, reason: collision with root package name */
    public EdgeEffect f46465d;

    /* renamed from: e, reason: collision with root package name */
    public EdgeEffect f46466e;

    /* renamed from: f, reason: collision with root package name */
    public int f46467f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f46468g;

    /* renamed from: h, reason: collision with root package name */
    public View f46469h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f46470i;

    /* renamed from: j, reason: collision with root package name */
    public VelocityTracker f46471j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f46472k;

    /* renamed from: l, reason: collision with root package name */
    public final int f46473l;

    /* renamed from: m, reason: collision with root package name */
    public final int f46474m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f46475p;

    /* renamed from: q, reason: collision with root package name */
    public int f46476q;

    /* renamed from: r, reason: collision with root package name */
    public final int[] f46477r;

    /* renamed from: s, reason: collision with root package name */
    public final int[] f46478s;

    /* renamed from: t, reason: collision with root package name */
    public int f46479t;

    /* renamed from: u, reason: collision with root package name */
    public SavedState f46480u;

    /* renamed from: v, reason: collision with root package name */
    public float f46481v;

    /* loaded from: classes4.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public int f46482a;

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("HorizontalScrollView.SavedState{");
            sb2.append(Integer.toHexString(System.identityHashCode(this)));
            sb2.append(" scrollPosition=");
            return c0.o(sb2, this.f46482a, "}");
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f46482a);
        }
    }

    public RippleScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 16842880);
        this.f46463b = new Rect();
        this.f46468g = true;
        this.f46469h = null;
        this.f46470i = false;
        this.f46472k = true;
        this.f46476q = -1;
        this.f46477r = new int[2];
        this.f46478s = new int[2];
        this.f46481v = Float.MIN_VALUE;
        this.f46464c = new OverScroller(getContext());
        setFocusable(true);
        setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        setWillNotDraw(false);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        this.f46473l = viewConfiguration.getScaledTouchSlop();
        this.f46474m = viewConfiguration.getScaledMinimumFlingVelocity();
        this.n = viewConfiguration.getScaledMaximumFlingVelocity();
        this.o = viewConfiguration.getScaledOverscrollDistance();
        this.f46475p = viewConfiguration.getScaledOverflingDistance();
    }

    public static boolean g(View view, RippleScrollView rippleScrollView) {
        if (view == rippleScrollView) {
            return true;
        }
        Object parent = view.getParent();
        return (parent instanceof ViewGroup) && g((View) parent, rippleScrollView);
    }

    public final boolean a(int i5) {
        View viewFindFocus = findFocus();
        if (viewFindFocus == this) {
            viewFindFocus = null;
        }
        View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, i5);
        int bottom = (int) ((getBottom() - getTop()) * 0.5f);
        if (viewFindNextFocus == null || !h(viewFindNextFocus, bottom, getHeight())) {
            if (i5 == 33 && getScrollY() < bottom) {
                bottom = getScrollY();
            } else if (i5 == 130 && getChildCount() > 0) {
                int bottom2 = getChildAt(0).getBottom() - ((getHeight() + getScrollY()) - getPaddingBottom());
                if (bottom2 < bottom) {
                    bottom = bottom2;
                }
            }
            if (bottom == 0) {
                return false;
            }
            if (i5 != 130) {
                bottom = -bottom;
            }
            c(bottom);
        } else {
            Rect rect = this.f46463b;
            viewFindNextFocus.getDrawingRect(rect);
            offsetDescendantRectToMyCoords(viewFindNextFocus, rect);
            c(b(rect));
            viewFindNextFocus.requestFocus(i5);
        }
        if (viewFindFocus == null || !viewFindFocus.isFocused() || h(viewFindFocus, 0, getHeight())) {
            return true;
        }
        int descendantFocusability = getDescendantFocusability();
        setDescendantFocusability(SQLiteDatabase.OPEN_SHAREDCACHE);
        requestFocus();
        setDescendantFocusability(descendantFocusability);
        return true;
    }

    @Override // android.view.ViewGroup
    public final void addView(View view) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view);
    }

    public final int b(Rect rect) {
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
        if (rect.bottom < getChildAt(0).getHeight()) {
            i5 -= verticalFadingEdgeLength;
        }
        int i11 = rect.bottom;
        if (i11 > i5 && rect.top > scrollY) {
            return Math.min(rect.height() > height ? rect.top - scrollY : rect.bottom - i5, getChildAt(0).getBottom() - i5);
        }
        if (rect.top >= scrollY || i11 >= i5) {
            return 0;
        }
        return Math.max(rect.height() > height ? 0 - (i5 - rect.bottom) : 0 - (scrollY - rect.top), -getScrollY());
    }

    public final void c(int i5) {
        if (i5 != 0) {
            if (this.f46472k) {
                k(0, i5);
            } else {
                scrollBy(0, i5);
            }
        }
    }

    @Override // android.view.View
    public final void computeScroll() {
        if (this.f46464c.computeScrollOffset()) {
            int scrollX = getScrollX();
            int scrollY = getScrollY();
            int currX = this.f46464c.getCurrX();
            int currY = this.f46464c.getCurrY();
            if (scrollX != currX || scrollY != currY) {
                int iF = f();
                int overScrollMode = getOverScrollMode();
                boolean z11 = true;
                if (overScrollMode != 0 && (overScrollMode != 1 || iF <= 0)) {
                    z11 = false;
                }
                boolean z12 = z11;
                overScrollBy(currX - scrollX, currY - scrollY, scrollX, scrollY, 0, iF, 0, this.f46475p, false);
                onScrollChanged(getScrollX(), getScrollY(), scrollX, scrollY);
                if (z12) {
                    if (currY < 0 && scrollY >= 0) {
                        this.f46465d.onAbsorb((int) this.f46464c.getCurrVelocity());
                    } else if (currY > iF && scrollY <= iF) {
                        this.f46466e.onAbsorb((int) this.f46464c.getCurrVelocity());
                    }
                }
            }
            if (awakenScrollBars()) {
                return;
            }
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.View
    public final int computeVerticalScrollOffset() {
        return Math.max(0, super.computeVerticalScrollOffset());
    }

    @Override // android.view.View
    public final int computeVerticalScrollRange() {
        int childCount = getChildCount();
        int height = (getHeight() - getPaddingBottom()) - getPaddingTop();
        if (childCount == 0) {
            return height;
        }
        int bottom = getChildAt(0).getBottom();
        int scrollY = getScrollY();
        int iMax = Math.max(0, bottom - height);
        return scrollY < 0 ? bottom - scrollY : scrollY > iMax ? (scrollY - iMax) + bottom : bottom;
    }

    public final void d(int i5) {
        boolean z11 = (getScrollY() > 0 || i5 > 0) && (getScrollY() < f() || i5 < 0);
        float f11 = i5;
        boolean z12 = v30.a.f92041e;
        if (z12 ? super.dispatchNestedPreFling(0.0f, f11) : false) {
            return;
        }
        if (z12) {
            super.dispatchNestedFling(0.0f, f11, z11);
        }
        if (!z11 || getChildCount() <= 0) {
            return;
        }
        int height = (getHeight() - getPaddingBottom()) - getPaddingTop();
        this.f46464c.fling(getScrollX(), getScrollY(), 0, i5, 0, 0, 0, Math.max(0, getChildAt(0).getHeight() - height), 0, height / 2);
        postInvalidateOnAnimation();
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00d7 A[RETURN] */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        boolean zA;
        if (!super.dispatchKeyEvent(keyEvent)) {
            Rect rect = this.f46463b;
            rect.setEmpty();
            View childAt = getChildAt(0);
            if (childAt != null) {
                if (getHeight() < getPaddingBottom() + getPaddingTop() + childAt.getHeight()) {
                    if (keyEvent.getAction() == 0) {
                        int keyCode = keyEvent.getKeyCode();
                        if (keyCode == 19) {
                            zA = !keyEvent.isAltPressed() ? a(33) : e(33);
                        } else if (keyCode != 20) {
                            if (keyCode == 62) {
                                int i5 = keyEvent.isShiftPressed() ? 33 : 130;
                                boolean z11 = i5 == 130;
                                int height = getHeight();
                                if (z11) {
                                    rect.top = getScrollY() + height;
                                    int childCount = getChildCount();
                                    if (childCount > 0) {
                                        View childAt2 = getChildAt(childCount - 1);
                                        if (rect.top + height > childAt2.getBottom()) {
                                            rect.top = childAt2.getBottom() - height;
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
                                j(i5, i11, i12);
                            }
                            zA = false;
                        } else {
                            zA = !keyEvent.isAltPressed() ? a(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE) : e(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                        }
                        if (!zA) {
                            return false;
                        }
                    } else {
                        zA = false;
                        if (!zA) {
                        }
                    }
                } else if (isFocused() && keyEvent.getKeyCode() != 4) {
                    View viewFindFocus = findFocus();
                    if (viewFindFocus == this) {
                        viewFindFocus = null;
                    }
                    View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                    if (viewFindNextFocus != null && viewFindNextFocus != this && viewFindNextFocus.requestFocus(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE)) {
                        zA = true;
                    }
                    if (!zA) {
                    }
                }
            }
        }
        return true;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.f46465d != null) {
            int scrollY = getScrollY();
            if (!this.f46465d.isFinished()) {
                int iSave = canvas.save();
                int width = (getWidth() - getPaddingLeft()) - getPaddingRight();
                canvas.translate(getPaddingLeft(), Math.min(0, scrollY));
                this.f46465d.setSize(width, getHeight());
                if (this.f46465d.draw(canvas)) {
                    postInvalidateOnAnimation();
                }
                canvas.restoreToCount(iSave);
            }
            if (this.f46466e.isFinished()) {
                return;
            }
            int iSave2 = canvas.save();
            int width2 = (getWidth() - getPaddingLeft()) - getPaddingRight();
            int height = getHeight();
            canvas.translate(getPaddingLeft() + (-width2), Math.max(f(), scrollY) + height);
            canvas.rotate(180.0f, width2, 0.0f);
            this.f46466e.setSize(width2, height);
            if (this.f46466e.draw(canvas)) {
                postInvalidateOnAnimation();
            }
            canvas.restoreToCount(iSave2);
        }
    }

    public final boolean e(int i5) {
        int childCount;
        boolean z11 = i5 == 130;
        int height = getHeight();
        Rect rect = this.f46463b;
        rect.top = 0;
        rect.bottom = height;
        if (z11 && (childCount = getChildCount()) > 0) {
            int paddingBottom = getPaddingBottom() + getChildAt(childCount - 1).getBottom();
            rect.bottom = paddingBottom;
            rect.top = paddingBottom - height;
        }
        return j(i5, rect.top, rect.bottom);
    }

    public final int f() {
        if (getChildCount() > 0) {
            return Math.max(0, getChildAt(0).getHeight() - ((getHeight() - getPaddingBottom()) - getPaddingTop()));
        }
        return 0;
    }

    @Override // android.view.View
    public final float getBottomFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        int bottom = (getChildAt(0).getBottom() - getScrollY()) - (getHeight() - getPaddingBottom());
        if (bottom < verticalFadingEdgeLength) {
            return bottom / verticalFadingEdgeLength;
        }
        return 1.0f;
    }

    @Override // android.view.View
    public final float getTopFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        if (getScrollY() < verticalFadingEdgeLength) {
            return getScrollY() / verticalFadingEdgeLength;
        }
        return 1.0f;
    }

    public final boolean h(View view, int i5, int i11) {
        Rect rect = this.f46463b;
        view.getDrawingRect(rect);
        offsetDescendantRectToMyCoords(view, rect);
        return rect.bottom + i5 >= getScrollY() && rect.top - i5 <= getScrollY() + i11;
    }

    public final void i(MotionEvent motionEvent) {
        int action = (motionEvent.getAction() & 65280) >> 8;
        if (motionEvent.getPointerId(action) == this.f46476q) {
            int i5 = action == 0 ? 1 : 0;
            this.f46467f = (int) motionEvent.getY(i5);
            this.f46476q = motionEvent.getPointerId(i5);
            VelocityTracker velocityTracker = this.f46471j;
            if (velocityTracker != null) {
                velocityTracker.clear();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean j(int i5, int i11, int i12) {
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
            c(z12 ? i11 - scrollY : i12 - i13);
            z11 = true;
        } else {
            z11 = false;
        }
        if (view != findFocus()) {
            view.requestFocus(i5);
        }
        return z11;
    }

    public final void k(int i5, int i11) {
        if (getChildCount() == 0) {
            return;
        }
        if (AnimationUtils.currentAnimationTimeMillis() - this.f46462a > 250) {
            int iMax = Math.max(0, getChildAt(0).getHeight() - ((getHeight() - getPaddingBottom()) - getPaddingTop()));
            int scrollY = getScrollY();
            this.f46464c.startScroll(getScrollX(), scrollY, 0, Math.max(0, Math.min(i11 + scrollY, iMax)) - scrollY);
            postInvalidateOnAnimation();
        } else {
            if (!this.f46464c.isFinished()) {
                this.f46464c.abortAnimation();
            }
            scrollBy(i5, i11);
        }
        this.f46462a = AnimationUtils.currentAnimationTimeMillis();
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

    @Override // android.view.View
    public final boolean onGenericMotionEvent(MotionEvent motionEvent) {
        if ((motionEvent.getSource() & 2) != 0 && motionEvent.getAction() == 8 && !this.f46470i) {
            float axisValue = motionEvent.getAxisValue(9);
            if (axisValue != 0.0f) {
                if (this.f46481v == Float.MIN_VALUE) {
                    TypedValue typedValue = new TypedValue();
                    if (!getContext().getTheme().resolveAttribute(16842829, typedValue, true)) {
                        throw new IllegalStateException("Expected theme to define listPreferredItemHeight.");
                    }
                    this.f46481v = typedValue.getDimension(getContext().getResources().getDisplayMetrics());
                }
                int i5 = (int) (axisValue * this.f46481v);
                int iF = f();
                int scrollY = getScrollY();
                int i11 = scrollY - i5;
                if (i11 < 0) {
                    iF = 0;
                } else if (i11 <= iF) {
                    iF = i11;
                }
                if (iF != scrollY) {
                    super.scrollTo(getScrollX(), iF);
                    return true;
                }
            }
        }
        return super.onGenericMotionEvent(motionEvent);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName(RippleScrollView.class.getName());
        accessibilityEvent.setScrollable(f() > 0);
        accessibilityEvent.setScrollX(getScrollX());
        accessibilityEvent.setScrollY(getScrollY());
        accessibilityEvent.setMaxScrollX(getScrollX());
        accessibilityEvent.setMaxScrollY(f());
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        int iF;
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(RippleScrollView.class.getName());
        if (!isEnabled() || (iF = f()) <= 0) {
            return;
        }
        accessibilityNodeInfo.setScrollable(true);
        if (getScrollY() > 0) {
            accessibilityNodeInfo.addAction(UserMetadata.MAX_INTERNAL_KEY_SIZE);
        }
        if (getScrollY() < iF) {
            accessibilityNodeInfo.addAction(u1.FLAG_APPEARED_IN_PRE_LAYOUT);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0125  */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 2 && this.f46470i) {
            return true;
        }
        if (getScrollY() == 0 && !canScrollVertically(1)) {
            return false;
        }
        int i5 = action & 255;
        if (i5 == 0) {
            int y11 = (int) motionEvent.getY();
            int x11 = (int) motionEvent.getX();
            if (getChildCount() > 0) {
                int scrollY = getScrollY();
                View childAt = getChildAt(0);
                if (y11 < childAt.getTop() - scrollY || y11 >= childAt.getBottom() - scrollY || x11 < childAt.getLeft() || x11 >= childAt.getRight()) {
                    this.f46470i = false;
                    VelocityTracker velocityTracker = this.f46471j;
                    if (velocityTracker != null) {
                        velocityTracker.recycle();
                        this.f46471j = null;
                    }
                } else {
                    this.f46467f = y11;
                    this.f46476q = motionEvent.getPointerId(0);
                    VelocityTracker velocityTracker2 = this.f46471j;
                    if (velocityTracker2 == null) {
                        this.f46471j = VelocityTracker.obtain();
                    } else {
                        velocityTracker2.clear();
                    }
                    this.f46471j.addMovement(motionEvent);
                    this.f46470i = !this.f46464c.isFinished();
                    if (v30.a.f92041e) {
                        super.startNestedScroll(2);
                    }
                }
            }
        } else if (i5 == 1) {
            this.f46470i = false;
            this.f46476q = -1;
            VelocityTracker velocityTracker3 = this.f46471j;
            if (velocityTracker3 != null) {
                velocityTracker3.recycle();
                this.f46471j = null;
            }
            if (this.f46464c.springBack(getScrollX(), getScrollY(), 0, 0, 0, f())) {
                postInvalidateOnAnimation();
            }
            if (v30.a.f92041e) {
                super.stopNestedScroll();
            }
        } else if (i5 == 2) {
            int i11 = this.f46476q;
            if (i11 != -1) {
                int iFindPointerIndex = motionEvent.findPointerIndex(i11);
                if (iFindPointerIndex == -1) {
                    b bVar = d.f76206a;
                    bVar.r("ScrollView");
                    bVar.d("Invalid pointerId=%d in onInterceptTouchEvent", Integer.valueOf(i11));
                } else {
                    int y12 = (int) motionEvent.getY(iFindPointerIndex);
                    int iAbs = Math.abs(y12 - this.f46467f);
                    motionEvent.getEventTime();
                    motionEvent.getDownTime();
                    if (iAbs > this.f46473l) {
                        if ((2 & (v30.a.f92041e ? super.getNestedScrollAxes() : 0)) == 0) {
                            this.f46470i = true;
                            this.f46467f = y12;
                            if (this.f46471j == null) {
                                this.f46471j = VelocityTracker.obtain();
                            }
                            this.f46471j.addMovement(motionEvent);
                            this.f46479t = 0;
                            ViewParent parent = getParent();
                            if (parent != null) {
                                parent.requestDisallowInterceptTouchEvent(true);
                            }
                        }
                    }
                }
            }
        } else if (i5 != 3) {
            if (i5 == 6) {
                i(motionEvent);
            }
        }
        return this.f46470i;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) throws IllegalAccessException, IllegalArgumentException {
        super.onLayout(z11, i5, i11, i12, i13);
        this.f46468g = false;
        View view = this.f46469h;
        if (view != null && g(view, this)) {
            View view2 = this.f46469h;
            Rect rect = this.f46463b;
            view2.getDrawingRect(rect);
            offsetDescendantRectToMyCoords(view2, rect);
            int iB = b(rect);
            if (iB != 0) {
                scrollBy(0, iB);
            }
        }
        this.f46469h = null;
        WeakHashMap weakHashMap = a1.f250a;
        if (!isLaidOut()) {
            SavedState savedState = this.f46480u;
            if (savedState != null) {
                p.b(this, savedState.f46482a);
                this.f46480u = null;
            }
            int iMax = Math.max(0, (getChildCount() > 0 ? getChildAt(0).getMeasuredHeight() : 0) - (((i13 - i11) - getPaddingBottom()) - getPaddingTop()));
            if (getScrollY() > iMax) {
                p.b(this, iMax);
            } else if (getScrollY() < 0) {
                p.b(this, 0);
            }
        }
        scrollTo(getScrollX(), getScrollY());
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f11, float f12, boolean z11) {
        if (z11) {
            return false;
        }
        d((int) f12);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScroll(View view, int i5, int i11, int i12, int i13) {
        int scrollY = getScrollY();
        scrollBy(0, i13);
        int scrollY2 = getScrollY() - scrollY;
        int i14 = i13 - scrollY2;
        if (v30.a.f92041e) {
            super.dispatchNestedScroll(0, scrollY2, 0, i14, null);
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScrollAccepted(View view, View view2, int i5) {
        super.onNestedScrollAccepted(view, view2, i5);
        startNestedScroll(2);
    }

    @Override // android.view.View
    public final void onOverScrolled(int i5, int i11, boolean z11, boolean z12) throws IllegalAccessException, IllegalArgumentException {
        if (this.f46464c.isFinished()) {
            super.scrollTo(i5, i11);
        } else {
            int scrollX = getScrollX();
            int scrollY = getScrollY();
            p.a(this, i5);
            p.b(this, i11);
            if (isHardwareAccelerated() && (getParent() instanceof View)) {
                ((View) getParent()).invalidate();
            }
            onScrollChanged(getScrollX(), getScrollY(), scrollX, scrollY);
            if (z12) {
                this.f46464c.springBack(getScrollX(), getScrollY(), 0, 0, 0, f());
            }
        }
        awakenScrollBars();
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i5, Rect rect) {
        if (i5 == 2) {
            i5 = Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE;
        } else if (i5 == 1) {
            i5 = 33;
        }
        View viewFindNextFocus = rect == null ? FocusFinder.getInstance().findNextFocus(this, null, i5) : FocusFinder.getInstance().findNextFocusFromRect(this, rect, i5);
        if (viewFindNextFocus != null && h(viewFindNextFocus, 0, getHeight())) {
            return viewFindNextFocus.requestFocus(i5, rect);
        }
        return false;
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (getContext().getApplicationInfo().targetSdkVersion <= 18) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.f46480u = savedState;
        requestLayout();
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        if (getContext().getApplicationInfo().targetSdkVersion <= 18) {
            return super.onSaveInstanceState();
        }
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.f46482a = getScrollY();
        return savedState;
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        View viewFindFocus = findFocus();
        if (viewFindFocus == null || this == viewFindFocus || !h(viewFindFocus, 0, i13)) {
            return;
        }
        Rect rect = this.f46463b;
        viewFindFocus.getDrawingRect(rect);
        offsetDescendantRectToMyCoords(viewFindFocus, rect);
        c(b(rect));
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onStartNestedScroll(View view, View view2, int i5) {
        return (i5 & 2) != 0;
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        ViewParent parent;
        if (this.f46471j == null) {
            this.f46471j = VelocityTracker.obtain();
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.f46479t = 0;
        }
        motionEventObtain.offsetLocation(0.0f, this.f46479t);
        if (actionMasked != 0) {
            if (actionMasked != 1) {
                if (actionMasked == 2) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.f46476q);
                    if (iFindPointerIndex == -1) {
                        b bVar = d.f76206a;
                        bVar.r("ScrollView");
                        bVar.d("Invalid pointerId=%d in onTouchEvent", Integer.valueOf(this.f46476q));
                    } else {
                        int y11 = (int) motionEvent.getY(iFindPointerIndex);
                        int i5 = this.f46467f - y11;
                        boolean z11 = v30.a.f92041e;
                        int[] iArr = this.f46478s;
                        int[] iArr2 = this.f46477r;
                        if (z11 ? super.dispatchNestedPreScroll(0, i5, iArr, iArr2) : false) {
                            i5 -= iArr[1];
                            motionEventObtain.offsetLocation(0.0f, iArr2[1]);
                            this.f46479t += iArr2[1];
                        }
                        if (!this.f46470i && Math.abs(i5) > this.f46473l) {
                            ViewParent parent2 = getParent();
                            if (parent2 != null) {
                                parent2.requestDisallowInterceptTouchEvent(true);
                            }
                            this.f46470i = true;
                            i5 = i5 > 0 ? i5 - this.f46473l : i5 + this.f46473l;
                        }
                        if (this.f46470i) {
                            this.f46467f = y11 - iArr2[1];
                            int scrollY = getScrollY();
                            int iF = f();
                            int overScrollMode = getOverScrollMode();
                            boolean z12 = overScrollMode == 0 || (overScrollMode == 1 && iF > 0);
                            boolean zOverScrollBy = overScrollBy(0, i5, 0, getScrollY(), 0, iF, 0, this.o, true);
                            int i11 = i5;
                            if (zOverScrollBy) {
                                if (!(z11 ? super.hasNestedScrollingParent() : false)) {
                                    this.f46471j.clear();
                                }
                            }
                            int scrollY2 = getScrollY() - scrollY;
                            if (z11 ? super.dispatchNestedScroll(0, scrollY2, 0, i11 - scrollY2, this.f46477r) : false) {
                                int i12 = this.f46467f;
                                int i13 = iArr2[1];
                                this.f46467f = i12 - i13;
                                motionEventObtain.offsetLocation(0.0f, i13);
                                this.f46479t += iArr2[1];
                            } else if (z12) {
                                int i14 = scrollY + i11;
                                if (i14 < 0) {
                                    this.f46465d.onPull(i11 / getHeight(), motionEvent.getX(iFindPointerIndex) / getWidth());
                                    if (!this.f46466e.isFinished()) {
                                        this.f46466e.onRelease();
                                    }
                                } else if (i14 > iF) {
                                    this.f46466e.onPull(i11 / getHeight(), 1.0f - (motionEvent.getX(iFindPointerIndex) / getWidth()));
                                    if (!this.f46465d.isFinished()) {
                                        this.f46465d.onRelease();
                                    }
                                }
                                EdgeEffect edgeEffect = this.f46465d;
                                if (edgeEffect != null && (!edgeEffect.isFinished() || !this.f46466e.isFinished())) {
                                    postInvalidateOnAnimation();
                                }
                            }
                        }
                    }
                } else if (actionMasked != 3) {
                    if (actionMasked == 5) {
                        int actionIndex = motionEvent.getActionIndex();
                        this.f46467f = (int) motionEvent.getY(actionIndex);
                        this.f46476q = motionEvent.getPointerId(actionIndex);
                    } else if (actionMasked == 6) {
                        i(motionEvent);
                        this.f46467f = (int) motionEvent.getY(motionEvent.findPointerIndex(this.f46476q));
                    }
                } else if (this.f46470i && getChildCount() > 0) {
                    if (this.f46464c.springBack(getScrollX(), getScrollY(), 0, 0, 0, f())) {
                        postInvalidateOnAnimation();
                    }
                    this.f46476q = -1;
                    this.f46470i = false;
                    VelocityTracker velocityTracker = this.f46471j;
                    if (velocityTracker != null) {
                        velocityTracker.recycle();
                        this.f46471j = null;
                    }
                    EdgeEffect edgeEffect2 = this.f46465d;
                    if (edgeEffect2 != null) {
                        edgeEffect2.onRelease();
                        this.f46466e.onRelease();
                    }
                }
            } else if (this.f46470i) {
                VelocityTracker velocityTracker2 = this.f46471j;
                velocityTracker2.computeCurrentVelocity(1000, this.n);
                int yVelocity = (int) velocityTracker2.getYVelocity(this.f46476q);
                if (Math.abs(yVelocity) > this.f46474m) {
                    d(-yVelocity);
                } else if (this.f46464c.springBack(getScrollX(), getScrollY(), 0, 0, 0, f())) {
                    postInvalidateOnAnimation();
                }
                this.f46476q = -1;
                this.f46470i = false;
                VelocityTracker velocityTracker3 = this.f46471j;
                if (velocityTracker3 != null) {
                    velocityTracker3.recycle();
                    this.f46471j = null;
                }
                EdgeEffect edgeEffect3 = this.f46465d;
                if (edgeEffect3 != null) {
                    edgeEffect3.onRelease();
                    this.f46466e.onRelease();
                }
            }
        } else {
            if (getChildCount() == 0) {
                return false;
            }
            boolean zIsFinished = this.f46464c.isFinished();
            this.f46470i = !zIsFinished;
            if (!zIsFinished && (parent = getParent()) != null) {
                parent.requestDisallowInterceptTouchEvent(true);
            }
            if (!this.f46464c.isFinished()) {
                this.f46464c.abortAnimation();
            }
            this.f46467f = (int) motionEvent.getY();
            this.f46476q = motionEvent.getPointerId(0);
            if (v30.a.f92041e) {
                super.startNestedScroll(2);
            }
        }
        VelocityTracker velocityTracker4 = this.f46471j;
        if (velocityTracker4 != null) {
            velocityTracker4.addMovement(motionEventObtain);
        }
        motionEventObtain.recycle();
        return true;
    }

    @Override // android.view.View
    public final boolean performAccessibilityAction(int i5, Bundle bundle) {
        if (super.performAccessibilityAction(i5, bundle)) {
            return true;
        }
        if (isEnabled()) {
            if (i5 == 4096) {
                int iMin = Math.min(getScrollY() + ((getHeight() - getPaddingBottom()) - getPaddingTop()), f());
                if (iMin != getScrollY()) {
                    k(0 - getScrollX(), iMin - getScrollY());
                    return true;
                }
            } else if (i5 == 8192) {
                int iMax = Math.max(getScrollY() - ((getHeight() - getPaddingBottom()) - getPaddingTop()), 0);
                if (iMax != getScrollY()) {
                    k(0 - getScrollX(), iMax - getScrollY());
                    return true;
                }
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        if (this.f46468g) {
            this.f46469h = view2;
        } else {
            Rect rect = this.f46463b;
            view2.getDrawingRect(rect);
            offsetDescendantRectToMyCoords(view2, rect);
            int iB = b(rect);
            if (iB != 0) {
                scrollBy(0, iB);
            }
        }
        super.requestChildFocus(view, view2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z11) {
        rect.offset(view.getLeft() - view.getScrollX(), view.getTop() - view.getScrollY());
        int iB = b(rect);
        boolean z12 = iB != 0;
        if (z12) {
            if (z11) {
                scrollBy(0, iB);
                return z12;
            }
            k(0, iB);
        }
        return z12;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        VelocityTracker velocityTracker;
        if (z11 && (velocityTracker = this.f46471j) != null) {
            velocityTracker.recycle();
            this.f46471j = null;
        }
        super.requestDisallowInterceptTouchEvent(z11);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        this.f46468g = true;
        super.requestLayout();
    }

    @Override // android.view.View
    public final void scrollTo(int i5, int i11) {
        if (getChildCount() > 0) {
            View childAt = getChildAt(0);
            int width = (getWidth() - getPaddingRight()) - getPaddingLeft();
            int width2 = childAt.getWidth();
            if (width >= width2 || i5 < 0) {
                i5 = 0;
            } else if (width + i5 > width2) {
                i5 = width2 - width;
            }
            int height = (getHeight() - getPaddingBottom()) - getPaddingTop();
            int height2 = childAt.getHeight();
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
    public final void setOverScrollMode(int i5) {
        if (i5 == 2) {
            this.f46465d = null;
            this.f46466e = null;
        } else if (this.f46465d == null) {
            Context context = getContext();
            this.f46465d = new EdgeEffect(context);
            this.f46466e = new EdgeEffect(context);
        }
        super.setOverScrollMode(i5);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
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
