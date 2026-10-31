package com.bytedance.adsdk.ugeno.jw;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.EdgeEffect;
import android.widget.Scroller;
import b.c0;
import h6.c1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: classes2.dex */
public class sya extends ViewGroup {
    private int aeu;

    /* renamed from: av, reason: collision with root package name */
    private boolean f22356av;
    private boolean bba;

    /* renamed from: bh, reason: collision with root package name */
    private int f22357bh;
    private boolean bhi;
    private int dc;

    /* renamed from: dj, reason: collision with root package name */
    int f22358dj;
    private int dqs;
    private int duz;

    /* renamed from: dv, reason: collision with root package name */
    private boolean f22359dv;
    private int dwi;

    /* renamed from: dy, reason: collision with root package name */
    private int f22360dy;

    /* renamed from: ea, reason: collision with root package name */
    private Parcelable f22361ea;
    private final zb fby;

    /* renamed from: hf, reason: collision with root package name */
    private boolean f22362hf;
    private List<Object> hpv;
    private float htf;
    private float ifb;

    /* renamed from: iq, reason: collision with root package name */
    private lud f22363iq;

    /* renamed from: jc, reason: collision with root package name */
    private int f22364jc;

    /* renamed from: jw, reason: collision with root package name */
    private final Rect f22365jw;
    private float kgy;

    /* renamed from: lv, reason: collision with root package name */
    private dj f22366lv;

    /* renamed from: mp, reason: collision with root package name */
    private boolean f22367mp;
    private int nji;
    private VelocityTracker oby;

    /* renamed from: ok, reason: collision with root package name */
    private ClassLoader f22368ok;
    private boolean oty;
    private int pmi;

    /* renamed from: rl, reason: collision with root package name */
    private EdgeEffect f22369rl;
    private int rmf;
    private float rmy;

    /* renamed from: ry, reason: collision with root package name */
    private Scroller f22370ry;

    /* renamed from: sg, reason: collision with root package name */
    private final Runnable f22371sg;
    com.bytedance.adsdk.ugeno.jw.zb sya;
    private lt syc;
    private int sz;
    private float thx;

    /* renamed from: tn, reason: collision with root package name */
    private int f22372tn;
    private int tru;

    /* renamed from: uf, reason: collision with root package name */
    private boolean f22373uf;

    /* renamed from: uh, reason: collision with root package name */
    private int f22374uh;

    /* renamed from: ui, reason: collision with root package name */
    private dj f22375ui;

    /* renamed from: ul, reason: collision with root package name */
    private final ArrayList<zb> f22376ul;

    /* renamed from: ur, reason: collision with root package name */
    private int f22377ur;

    /* renamed from: uz, reason: collision with root package name */
    private List<dj> f22378uz;
    private Drawable wie;

    /* renamed from: wr, reason: collision with root package name */
    private ArrayList<View> f22379wr;
    private int wwx;
    private boolean xkz;
    private boolean xym;

    /* renamed from: xz, reason: collision with root package name */
    private int f22380xz;
    private int ycx;

    /* renamed from: yi, reason: collision with root package name */
    private int f22381yi;
    private float yzp;

    /* renamed from: zr, reason: collision with root package name */
    private EdgeEffect f22382zr;

    /* renamed from: zb, reason: collision with root package name */
    static final int[] f22355zb = {16842931};
    private static final Comparator<zb> lud = new Comparator<zb>() { // from class: com.bytedance.adsdk.ugeno.jw.sya.1
        @Override // java.util.Comparator
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public int compare(zb zbVar, zb zbVar2) {
            return zbVar.f22389zb - zbVar2.f22389zb;
        }
    };

    /* renamed from: lt, reason: collision with root package name */
    private static final Interpolator f22354lt = new Interpolator() { // from class: com.bytedance.adsdk.ugeno.jw.sya.2
        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float f11) {
            float f12 = f11 - 1.0f;
            return (f12 * f12 * f12 * f12 * f12) + 1.0f;
        }
    };
    private static final fby giw = new fby();

    public interface dj {
        void ok(int i5);

        void ry(int i5);

        void ycx(int i5, float f11, int i11);
    }

    public static class fby implements Comparator<View> {
        @Override // java.util.Comparator
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public int compare(View view, View view2) {
            C0018sya c0018sya = (C0018sya) view.getLayoutParams();
            C0018sya c0018sya2 = (C0018sya) view2.getLayoutParams();
            boolean z11 = c0018sya.ycx;
            return z11 != c0018sya2.ycx ? z11 ? 1 : -1 : c0018sya.lud - c0018sya2.lud;
        }
    }

    public class lt extends DataSetObserver {
        public lt() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() throws Resources.NotFoundException {
            sya.this.zb();
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() throws Resources.NotFoundException {
            sya.this.zb();
        }
    }

    public interface lud {
        void ycx(View view, float f11);
    }

    public static class ul extends com.bytedance.adsdk.ugeno.jw.ycx {
        public static final Parcelable.Creator<ul> CREATOR = new Parcelable.ClassLoaderCreator<ul>() { // from class: com.bytedance.adsdk.ugeno.jw.sya.ul.1
            @Override // android.os.Parcelable.ClassLoaderCreator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public ul createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new ul(parcel, classLoader);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public ul createFromParcel(Parcel parcel) {
                return new ul(parcel, null);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public ul[] newArray(int i5) {
                return new ul[i5];
            }
        };

        /* renamed from: dj, reason: collision with root package name */
        ClassLoader f22386dj;
        Parcelable sya;

        /* renamed from: zb, reason: collision with root package name */
        int f22387zb;

        public ul(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("FragmentPager.SavedState{");
            sb2.append(Integer.toHexString(System.identityHashCode(this)));
            sb2.append(" position=");
            return c0.o(sb2, this.f22387zb, "}");
        }

        @Override // com.bytedance.adsdk.ugeno.jw.ycx, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f22387zb);
            parcel.writeParcelable(this.sya, i5);
        }

        public ul(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            classLoader = classLoader == null ? getClass().getClassLoader() : classLoader;
            this.f22387zb = parcel.readInt();
            this.sya = parcel.readParcelable(classLoader);
            this.f22386dj = classLoader;
        }
    }

    @Target({ElementType.TYPE})
    @Inherited
    @Retention(RetentionPolicy.RUNTIME)
    public @interface ycx {
    }

    public static class zb {

        /* renamed from: dj, reason: collision with root package name */
        float f22388dj;
        float lud;
        boolean sya;
        Object ycx;

        /* renamed from: zb, reason: collision with root package name */
        int f22389zb;
    }

    public sya(Context context) {
        super(context);
        this.f22376ul = new ArrayList<>();
        this.fby = new zb();
        this.f22365jw = new Rect();
        this.f22364jc = -1;
        this.f22361ea = null;
        this.f22368ok = null;
        this.htf = -3.4028235E38f;
        this.thx = Float.MAX_VALUE;
        this.tru = 1;
        this.dwi = -1;
        this.bba = true;
        this.f22367mp = false;
        this.f22371sg = new Runnable() { // from class: com.bytedance.adsdk.ugeno.jw.sya.3
            @Override // java.lang.Runnable
            public void run() throws Resources.NotFoundException {
                sya.this.setScrollState(0);
                sya.this.sya();
            }
        };
        this.f22357bh = 0;
        ycx();
    }

    private boolean dj(int i5) {
        if (this.f22376ul.size() == 0) {
            if (this.bba) {
                return false;
            }
            this.f22373uf = false;
            ycx(0, 0.0f, 0);
            if (this.f22373uf) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        zb zbVarJw = jw();
        int clientWidth = getClientWidth();
        int i11 = this.f22360dy;
        int i12 = clientWidth + i11;
        float f11 = clientWidth;
        int i13 = zbVarJw.f22389zb;
        float f12 = ((i5 / f11) - zbVarJw.lud) / (zbVarJw.f22388dj + (i11 / f11));
        this.f22373uf = false;
        ycx(i13, f12, (int) (i12 * f12));
        if (this.f22373uf) {
            return true;
        }
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
    }

    private boolean fby() {
        this.dwi = -1;
        jc();
        this.f22369rl.onRelease();
        this.f22382zr.onRelease();
        return this.f22369rl.isFinished() || this.f22382zr.isFinished();
    }

    private int getClientWidth() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    private void jc() {
        this.bhi = false;
        this.f22356av = false;
        VelocityTracker velocityTracker = this.oby;
        if (velocityTracker != null) {
            velocityTracker.recycle();
            this.oby = null;
        }
    }

    private zb jw() {
        int i5;
        int clientWidth = getClientWidth();
        float f11 = 0.0f;
        float scrollX = clientWidth > 0 ? getScrollX() / clientWidth : 0.0f;
        float f12 = clientWidth > 0 ? this.f22360dy / clientWidth : 0.0f;
        int i11 = 0;
        boolean z11 = true;
        zb zbVar = null;
        int i12 = -1;
        float f13 = 0.0f;
        while (i11 < this.f22376ul.size()) {
            zb zbVar2 = this.f22376ul.get(i11);
            if (!z11 && zbVar2.f22389zb != (i5 = i12 + 1)) {
                zbVar2 = this.fby;
                zbVar2.lud = f11 + f13 + f12;
                zbVar2.f22389zb = i5;
                zbVar2.f22388dj = this.sya.ycx(i5);
                i11--;
            }
            zb zbVar3 = zbVar2;
            f11 = zbVar3.lud;
            float f14 = zbVar3.f22388dj + f11 + f12;
            if (!z11 && scrollX < f11) {
                break;
            }
            if (scrollX < f14 || i11 == this.f22376ul.size() - 1) {
                return zbVar3;
            }
            int i13 = zbVar3.f22389zb;
            float f15 = zbVar3.f22388dj;
            i11++;
            i12 = i13;
            f13 = f15;
            zbVar = zbVar3;
            z11 = false;
        }
        return zbVar;
    }

    private void lt() {
        int i5 = 0;
        while (i5 < getChildCount()) {
            if (!((C0018sya) getChildAt(i5).getLayoutParams()).ycx) {
                removeViewAt(i5);
                i5--;
            }
            i5++;
        }
    }

    private void lud(int i5) {
        dj djVar = this.f22366lv;
        if (djVar != null) {
            djVar.ok(i5);
        }
        List<dj> list = this.f22378uz;
        if (list != null) {
            int size = list.size();
            for (int i11 = 0; i11 < size; i11++) {
                dj djVar2 = this.f22378uz.get(i11);
                if (djVar2 != null) {
                    djVar2.ok(i5);
                }
            }
        }
        dj djVar3 = this.f22375ui;
        if (djVar3 != null) {
            djVar3.ok(i5);
        }
    }

    private void setScrollingCacheEnabled(boolean z11) {
        if (this.oty != z11) {
            this.oty = z11;
        }
    }

    private void ul() {
        if (this.f22377ur != 0) {
            ArrayList<View> arrayList = this.f22379wr;
            if (arrayList == null) {
                this.f22379wr = new ArrayList<>();
            } else {
                arrayList.clear();
            }
            int childCount = getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                this.f22379wr.add(getChildAt(i5));
            }
            Collections.sort(this.f22379wr, giw);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList<View> arrayList, int i5, int i11) {
        zb zbVarYcx;
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i12 = 0; i12 < getChildCount(); i12++) {
                View childAt = getChildAt(i12);
                if (childAt.getVisibility() == 0 && (zbVarYcx = ycx(childAt)) != null && zbVarYcx.f22389zb == this.f22358dj) {
                    childAt.addFocusables(arrayList, i5, i11);
                }
            }
        }
        if ((descendantFocusability != 262144 || size == arrayList.size()) && isFocusable()) {
            if ((i11 & 1) == 1 && isInTouchMode() && !isFocusableInTouchMode()) {
                return;
            }
            arrayList.add(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addTouchables(ArrayList<View> arrayList) {
        zb zbVarYcx;
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() == 0 && (zbVarYcx = ycx(childAt)) != null && zbVarYcx.f22389zb == this.f22358dj) {
                childAt.addTouchables(arrayList);
            }
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (!checkLayoutParams(layoutParams)) {
            layoutParams = generateLayoutParams(layoutParams);
        }
        C0018sya c0018sya = (C0018sya) layoutParams;
        boolean zSya = c0018sya.ycx | sya(view);
        c0018sya.ycx = zSya;
        if (!this.f22359dv) {
            super.addView(view, i5, layoutParams);
        } else {
            if (zSya) {
                throw new IllegalStateException("Cannot add pager decor view during layout");
            }
            c0018sya.f22383dj = true;
            addViewInLayout(view, i5, layoutParams);
        }
    }

    @Override // android.view.View
    public boolean canScrollHorizontally(int i5) {
        if (this.sya == null) {
            return false;
        }
        int clientWidth = getClientWidth();
        int scrollX = getScrollX();
        return i5 < 0 ? scrollX > ((int) (((float) clientWidth) * this.htf)) : i5 > 0 && scrollX < ((int) (((float) clientWidth) * this.thx));
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof C0018sya) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.View
    public void computeScroll() {
        this.xkz = true;
        if (this.f22370ry.isFinished() || !this.f22370ry.computeScrollOffset()) {
            ycx(true);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = this.f22370ry.getCurrX();
        int currY = this.f22370ry.getCurrY();
        if (scrollX != currX || scrollY != currY) {
            scrollTo(currX, currY);
            if (!dj(currX)) {
                this.f22370ry.abortAnimation();
                scrollTo(0, currY);
            }
        }
        postInvalidateOnAnimation();
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || ycx(keyEvent);
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        zb zbVarYcx;
        if (accessibilityEvent.getEventType() == 4096) {
            return super.dispatchPopulateAccessibilityEvent(accessibilityEvent);
        }
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() == 0 && (zbVarYcx = ycx(childAt)) != null && zbVarYcx.f22389zb == this.f22358dj && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        com.bytedance.adsdk.ugeno.jw.zb zbVar;
        super.draw(canvas);
        int overScrollMode = getOverScrollMode();
        boolean zDraw = false;
        if (overScrollMode == 0 || (overScrollMode == 1 && (zbVar = this.sya) != null && zbVar.ycx() > 1)) {
            if (!this.f22369rl.isFinished()) {
                int iSave = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate(getPaddingTop() + (-height), this.htf * width);
                this.f22369rl.setSize(height, width);
                zDraw = this.f22369rl.draw(canvas);
                canvas.restoreToCount(iSave);
            }
            if (!this.f22382zr.isFinished()) {
                int iSave2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate(-getPaddingTop(), (-(this.thx + 1.0f)) * width2);
                this.f22382zr.setSize(height2, width2);
                zDraw |= this.f22382zr.draw(canvas);
                canvas.restoreToCount(iSave2);
            }
        } else {
            this.f22369rl.finish();
            this.f22382zr.finish();
        }
        if (zDraw) {
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.wie;
        if (drawable == null || !drawable.isStateful()) {
            return;
        }
        drawable.setState(getDrawableState());
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new C0018sya();
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return generateDefaultLayoutParams();
    }

    public com.bytedance.adsdk.ugeno.jw.zb getAdapter() {
        return this.sya;
    }

    @Override // android.view.ViewGroup
    public int getChildDrawingOrder(int i5, int i11) {
        if (this.f22377ur == 2) {
            i11 = (i5 - 1) - i11;
        }
        return ((C0018sya) this.f22379wr.get(i11).getLayoutParams()).f22384lt;
    }

    public int getCurrentItem() {
        return this.f22358dj;
    }

    public int getOffscreenPageLimit() {
        return this.tru;
    }

    public int getPageMargin() {
        return this.f22360dy;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.bba = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        removeCallbacks(this.f22371sg);
        Scroller scroller = this.f22370ry;
        if (scroller != null && !scroller.isFinished()) {
            this.f22370ry.abortAnimation();
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        int i5;
        float f11;
        int i11;
        super.onDraw(canvas);
        if (this.f22360dy <= 0 || this.wie == null || this.f22376ul.size() <= 0 || this.sya == null) {
            return;
        }
        int scrollX = getScrollX();
        float width = getWidth();
        float f12 = this.f22360dy / width;
        int i12 = 0;
        zb zbVar = this.f22376ul.get(0);
        float f13 = zbVar.lud;
        int size = this.f22376ul.size();
        int i13 = zbVar.f22389zb;
        int i14 = this.f22376ul.get(size - 1).f22389zb;
        while (i13 < i14) {
            while (true) {
                i5 = zbVar.f22389zb;
                if (i13 <= i5 || i12 >= size) {
                    break;
                }
                i12++;
                zbVar = this.f22376ul.get(i12);
            }
            if (i13 == i5) {
                float f14 = zbVar.lud;
                float f15 = zbVar.f22388dj;
                f11 = (f14 + f15) * width;
                f13 = f14 + f15 + f12;
            } else {
                float fYcx = this.sya.ycx(i13);
                f11 = (f13 + fYcx) * width;
                f13 = fYcx + f12 + f13;
            }
            if (this.f22360dy + f11 > scrollX) {
                i11 = scrollX;
                this.wie.setBounds(Math.round(f11), this.pmi, Math.round(this.f22360dy + f11), this.f22374uh);
                this.wie.draw(canvas);
            } else {
                i11 = scrollX;
            }
            if (f11 > i11 + r2) {
                return;
            }
            i13++;
            scrollX = i11;
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) throws Resources.NotFoundException {
        int iFindPointerIndex;
        int action = motionEvent.getAction() & 255;
        if (action == 3 || action == 1) {
            fby();
            return false;
        }
        if (action != 0) {
            if (this.bhi) {
                return true;
            }
            if (this.f22356av) {
                return false;
            }
        }
        if (action == 0) {
            float x11 = motionEvent.getX();
            this.ifb = x11;
            this.rmy = x11;
            float y11 = motionEvent.getY();
            this.yzp = y11;
            this.kgy = y11;
            this.dwi = motionEvent.getPointerId(0);
            this.f22356av = false;
            this.xkz = true;
            this.f22370ry.computeScrollOffset();
            if (this.f22357bh != 2 || Math.abs(this.f22370ry.getFinalX() - this.f22370ry.getCurrX()) <= this.f22381yi) {
                ycx(false);
                this.bhi = false;
            } else {
                this.f22370ry.abortAnimation();
                this.f22362hf = false;
                sya();
                this.bhi = true;
                sya(true);
                setScrollState(1);
            }
        } else if (action == 2) {
            int i5 = this.dwi;
            if (i5 != -1 && (iFindPointerIndex = motionEvent.findPointerIndex(i5)) != -1) {
                float x12 = motionEvent.getX(iFindPointerIndex);
                float f11 = x12 - this.rmy;
                float fAbs = Math.abs(f11);
                float y12 = motionEvent.getY(iFindPointerIndex);
                float fAbs2 = Math.abs(y12 - this.yzp);
                if (f11 != 0.0f && !ycx(this.rmy, f11) && ycx(this, false, (int) f11, (int) x12, (int) y12)) {
                    this.rmy = x12;
                    this.kgy = y12;
                    this.f22356av = true;
                    return false;
                }
                int i11 = this.f22380xz;
                if (fAbs > i11 && fAbs * 0.5f > fAbs2) {
                    this.bhi = true;
                    sya(true);
                    setScrollState(1);
                    this.rmy = f11 > 0.0f ? this.ifb + this.f22380xz : this.ifb - this.f22380xz;
                    this.kgy = y12;
                    setScrollingCacheEnabled(true);
                } else if (fAbs2 > i11) {
                    this.f22356av = true;
                }
                if (this.bhi && zb(x12)) {
                    postInvalidateOnAnimation();
                }
            }
        } else if (action == 6) {
            ycx(motionEvent);
        }
        if (this.oby == null) {
            this.oby = VelocityTracker.obtain();
        }
        this.oby.addMovement(motionEvent);
        return this.bhi;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0094  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) throws Resources.NotFoundException {
        boolean z12;
        zb zbVarYcx;
        int iMax;
        int measuredWidth;
        int iMax2;
        int measuredHeight;
        int childCount = getChildCount();
        int i14 = i12 - i5;
        int i15 = i13 - i11;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        int i16 = 0;
        for (int i17 = 0; i17 < childCount; i17++) {
            View childAt = getChildAt(i17);
            if (childAt.getVisibility() != 8) {
                C0018sya c0018sya = (C0018sya) childAt.getLayoutParams();
                if (c0018sya.ycx) {
                    int i18 = c0018sya.f22385zb;
                    int i19 = i18 & 7;
                    int i21 = i18 & 112;
                    if (i19 != 1) {
                        if (i19 == 3) {
                            measuredWidth = childAt.getMeasuredWidth() + paddingLeft;
                        } else if (i19 != 5) {
                            measuredWidth = paddingLeft;
                        } else {
                            iMax = (i14 - paddingRight) - childAt.getMeasuredWidth();
                            paddingRight += childAt.getMeasuredWidth();
                        }
                        if (i21 == 16) {
                            if (i21 == 48) {
                                measuredHeight = childAt.getMeasuredHeight() + paddingTop;
                            } else if (i21 != 80) {
                                measuredHeight = paddingTop;
                            } else {
                                iMax2 = (i15 - paddingBottom) - childAt.getMeasuredHeight();
                                paddingBottom += childAt.getMeasuredHeight();
                            }
                            int i22 = paddingLeft + scrollX;
                            childAt.layout(i22, paddingTop, childAt.getMeasuredWidth() + i22, childAt.getMeasuredHeight() + paddingTop);
                            i16++;
                            paddingTop = measuredHeight;
                            paddingLeft = measuredWidth;
                        } else {
                            iMax2 = Math.max((i15 - childAt.getMeasuredHeight()) / 2, paddingTop);
                        }
                        int i23 = iMax2;
                        measuredHeight = paddingTop;
                        paddingTop = i23;
                        int i222 = paddingLeft + scrollX;
                        childAt.layout(i222, paddingTop, childAt.getMeasuredWidth() + i222, childAt.getMeasuredHeight() + paddingTop);
                        i16++;
                        paddingTop = measuredHeight;
                        paddingLeft = measuredWidth;
                    } else {
                        iMax = Math.max((i14 - childAt.getMeasuredWidth()) / 2, paddingLeft);
                    }
                    int i24 = iMax;
                    measuredWidth = paddingLeft;
                    paddingLeft = i24;
                    if (i21 == 16) {
                    }
                    int i232 = iMax2;
                    measuredHeight = paddingTop;
                    paddingTop = i232;
                    int i2222 = paddingLeft + scrollX;
                    childAt.layout(i2222, paddingTop, childAt.getMeasuredWidth() + i2222, childAt.getMeasuredHeight() + paddingTop);
                    i16++;
                    paddingTop = measuredHeight;
                    paddingLeft = measuredWidth;
                }
            }
        }
        int i25 = (i14 - paddingLeft) - paddingRight;
        for (int i26 = 0; i26 < childCount; i26++) {
            View childAt2 = getChildAt(i26);
            if (childAt2.getVisibility() != 8) {
                C0018sya c0018sya2 = (C0018sya) childAt2.getLayoutParams();
                if (!c0018sya2.ycx && (zbVarYcx = ycx(childAt2)) != null) {
                    float f11 = i25;
                    int i27 = ((int) (zbVarYcx.lud * f11)) + paddingLeft;
                    if (c0018sya2.f22383dj) {
                        c0018sya2.f22383dj = false;
                        childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (f11 * c0018sya2.sya), 1073741824), View.MeasureSpec.makeMeasureSpec((i15 - paddingTop) - paddingBottom, 1073741824));
                    }
                    childAt2.layout(i27, paddingTop, childAt2.getMeasuredWidth() + i27, childAt2.getMeasuredHeight() + paddingTop);
                }
            }
        }
        this.pmi = paddingTop;
        this.f22374uh = i15 - paddingBottom;
        this.duz = i16;
        if (this.bba) {
            z12 = false;
            ycx(this.f22358dj, false, 0, false);
        } else {
            z12 = false;
        }
        this.bba = z12;
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) throws Resources.NotFoundException {
        C0018sya c0018sya;
        C0018sya c0018sya2;
        int i12;
        setMeasuredDimension(View.getDefaultSize(0, i5), View.getDefaultSize(0, i11));
        int measuredWidth = getMeasuredWidth();
        this.aeu = Math.min(measuredWidth / 10, this.rmf);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int i13 = 0;
        while (true) {
            boolean z11 = true;
            int i14 = 1073741824;
            if (i13 >= childCount) {
                break;
            }
            View childAt = getChildAt(i13);
            if (childAt.getVisibility() != 8 && (c0018sya2 = (C0018sya) childAt.getLayoutParams()) != null && c0018sya2.ycx) {
                int i15 = c0018sya2.f22385zb;
                int i16 = i15 & 7;
                int i17 = i15 & 112;
                boolean z12 = i17 == 48 || i17 == 80;
                if (i16 != 3 && i16 != 5) {
                    z11 = false;
                }
                int i18 = Integer.MIN_VALUE;
                if (z12) {
                    i12 = Integer.MIN_VALUE;
                    i18 = 1073741824;
                } else {
                    i12 = z11 ? 1073741824 : Integer.MIN_VALUE;
                }
                int i19 = ((ViewGroup.LayoutParams) c0018sya2).width;
                if (i19 != -2) {
                    if (i19 == -1) {
                        i19 = paddingLeft;
                    }
                    i18 = 1073741824;
                } else {
                    i19 = paddingLeft;
                }
                int i21 = ((ViewGroup.LayoutParams) c0018sya2).height;
                if (i21 == -2) {
                    i21 = measuredHeight;
                    i14 = i12;
                } else if (i21 == -1) {
                    i21 = measuredHeight;
                }
                childAt.measure(View.MeasureSpec.makeMeasureSpec(i19, i18), View.MeasureSpec.makeMeasureSpec(i21, i14));
                if (z12) {
                    measuredHeight -= childAt.getMeasuredHeight();
                } else if (z11) {
                    paddingLeft -= childAt.getMeasuredWidth();
                }
            }
            i13++;
        }
        this.wwx = View.MeasureSpec.makeMeasureSpec(paddingLeft, 1073741824);
        this.f22372tn = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
        this.f22359dv = true;
        sya();
        this.f22359dv = false;
        int childCount2 = getChildCount();
        for (int i22 = 0; i22 < childCount2; i22++) {
            View childAt2 = getChildAt(i22);
            if (childAt2.getVisibility() != 8 && ((c0018sya = (C0018sya) childAt2.getLayoutParams()) == null || !c0018sya.ycx)) {
                childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (paddingLeft * c0018sya.sya), 1073741824), this.f22372tn);
            }
        }
    }

    @Override // android.view.ViewGroup
    public boolean onRequestFocusInDescendants(int i5, Rect rect) {
        int i11;
        int i12;
        int i13;
        zb zbVarYcx;
        int childCount = getChildCount();
        if ((i5 & 2) != 0) {
            i12 = childCount;
            i11 = 0;
            i13 = 1;
        } else {
            i11 = childCount - 1;
            i12 = -1;
            i13 = -1;
        }
        while (i11 != i12) {
            View childAt = getChildAt(i11);
            if (childAt.getVisibility() == 0 && (zbVarYcx = ycx(childAt)) != null && zbVarYcx.f22389zb == this.f22358dj && childAt.requestFocus(i5, rect)) {
                return true;
            }
            i11 += i13;
        }
        return false;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) throws Resources.NotFoundException {
        if (!(parcelable instanceof ul)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        ul ulVar = (ul) parcelable;
        super.onRestoreInstanceState(ulVar.ycx());
        if (this.sya != null) {
            ycx(ulVar.f22387zb, false, true);
            return;
        }
        this.f22364jc = ulVar.f22387zb;
        this.f22361ea = ulVar.sya;
        this.f22368ok = ulVar.f22386dj;
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        ul ulVar = new ul(super.onSaveInstanceState());
        ulVar.f22387zb = this.f22358dj;
        com.bytedance.adsdk.ugeno.jw.zb zbVar = this.sya;
        if (zbVar != null) {
            ulVar.sya = zbVar.zb();
        }
        return ulVar;
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        if (i5 != i12) {
            int i14 = this.f22360dy;
            ycx(i5, i12, i14, i14);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) throws Resources.NotFoundException {
        com.bytedance.adsdk.ugeno.jw.zb zbVar;
        int iFindPointerIndex;
        if (this.xym) {
            return true;
        }
        boolean zFby = false;
        if ((motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) || (zbVar = this.sya) == null || zbVar.ycx() == 0) {
            return false;
        }
        if (this.oby == null) {
            this.oby = VelocityTracker.obtain();
        }
        this.oby.addMovement(motionEvent);
        int action = motionEvent.getAction() & 255;
        if (action == 0) {
            this.f22370ry.abortAnimation();
            this.f22362hf = false;
            sya();
            float x11 = motionEvent.getX();
            this.ifb = x11;
            this.rmy = x11;
            float y11 = motionEvent.getY();
            this.yzp = y11;
            this.kgy = y11;
            this.dwi = motionEvent.getPointerId(0);
        } else if (action != 1) {
            if (action != 2) {
                if (action != 3) {
                    if (action == 5) {
                        int actionIndex = motionEvent.getActionIndex();
                        if (actionIndex != -1) {
                            this.rmy = motionEvent.getX(actionIndex);
                            this.dwi = motionEvent.getPointerId(actionIndex);
                        }
                    } else if (action == 6) {
                        ycx(motionEvent);
                        int iFindPointerIndex2 = motionEvent.findPointerIndex(this.dwi);
                        if (iFindPointerIndex2 != -1) {
                            this.rmy = motionEvent.getX(iFindPointerIndex2);
                        }
                    }
                } else if (this.bhi) {
                    ycx(this.f22358dj, true, 0, false);
                    zFby = fby();
                }
            } else if (!this.bhi) {
                int iFindPointerIndex3 = motionEvent.findPointerIndex(this.dwi);
                if (iFindPointerIndex3 == -1) {
                    zFby = fby();
                } else {
                    float x12 = motionEvent.getX(iFindPointerIndex3);
                    float fAbs = Math.abs(x12 - this.rmy);
                    float y12 = motionEvent.getY(iFindPointerIndex3);
                    float fAbs2 = Math.abs(y12 - this.kgy);
                    if (fAbs > this.f22380xz && fAbs > fAbs2) {
                        this.bhi = true;
                        sya(true);
                        float f11 = this.ifb;
                        this.rmy = x12 - f11 > 0.0f ? f11 + this.f22380xz : f11 - this.f22380xz;
                        this.kgy = y12;
                        setScrollState(1);
                        setScrollingCacheEnabled(true);
                        ViewParent parent = getParent();
                        if (parent != null) {
                            parent.requestDisallowInterceptTouchEvent(true);
                        }
                    }
                    if (this.bhi) {
                        zFby = zb(motionEvent.getX(iFindPointerIndex));
                    }
                }
            } else if (this.bhi && (iFindPointerIndex = motionEvent.findPointerIndex(this.dwi)) != -1) {
                zFby = zb(motionEvent.getX(iFindPointerIndex));
            }
        } else if (this.bhi) {
            VelocityTracker velocityTracker = this.oby;
            velocityTracker.computeCurrentVelocity(1000, this.dc);
            int xVelocity = (int) velocityTracker.getXVelocity(this.dwi);
            this.f22362hf = true;
            int clientWidth = getClientWidth();
            int scrollX = getScrollX();
            zb zbVarJw = jw();
            float f12 = clientWidth;
            int i5 = zbVarJw.f22389zb;
            float f13 = ((scrollX / f12) - zbVarJw.lud) / (zbVarJw.f22388dj + (this.f22360dy / f12));
            int iFindPointerIndex4 = motionEvent.findPointerIndex(this.dwi);
            if (iFindPointerIndex4 != -1) {
                ycx(ycx(i5, f13, xVelocity, (int) (motionEvent.getX(iFindPointerIndex4) - this.ifb)), true, true, xVelocity);
                zFby = fby();
            }
        }
        if (zFby) {
            postInvalidateOnAnimation();
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void removeView(View view) {
        if (this.f22359dv) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    public void setAdapter(com.bytedance.adsdk.ugeno.jw.zb zbVar) throws Resources.NotFoundException {
        com.bytedance.adsdk.ugeno.jw.zb zbVar2 = this.sya;
        if (zbVar2 != null) {
            zbVar2.ycx((DataSetObserver) null);
            for (int i5 = 0; i5 < this.f22376ul.size(); i5++) {
                zb zbVar3 = this.f22376ul.get(i5);
                this.sya.ycx((ViewGroup) this, zbVar3.f22389zb, zbVar3.ycx);
            }
            this.f22376ul.clear();
            lt();
            this.f22358dj = 0;
            scrollTo(0, 0);
        }
        this.sya = zbVar;
        this.ycx = 0;
        if (zbVar != null) {
            if (this.syc == null) {
                this.syc = new lt();
            }
            this.sya.ycx((DataSetObserver) this.syc);
            this.f22362hf = false;
            boolean z11 = this.bba;
            this.bba = true;
            this.ycx = this.sya.ycx();
            int i11 = this.f22364jc;
            if (i11 >= 0) {
                ycx(i11, false, true);
                this.f22364jc = -1;
                this.f22361ea = null;
                this.f22368ok = null;
            } else if (z11) {
                requestLayout();
            } else {
                sya();
            }
        }
        List<Object> list = this.hpv;
        if (list == null || list.isEmpty()) {
            return;
        }
        int size = this.hpv.size();
        for (int i12 = 0; i12 < size; i12++) {
            this.hpv.get(i12);
        }
    }

    public void setCurrentItem(int i5) throws Resources.NotFoundException {
        this.f22362hf = false;
        ycx(i5, !this.bba, false);
    }

    public void setOffscreenPageLimit(int i5) throws Resources.NotFoundException {
        if (i5 <= 0) {
            Log.w("ViewPager", "Requested offscreen page limit " + i5 + " too small; defaulting to 1");
            i5 = 1;
        }
        if (i5 != this.tru) {
            this.tru = i5;
            sya();
        }
    }

    @Deprecated
    public void setOnPageChangeListener(dj djVar) {
        this.f22366lv = djVar;
    }

    public void setPageMargin(int i5) {
        int i11 = this.f22360dy;
        this.f22360dy = i5;
        int width = getWidth();
        ycx(width, width, i5, i11);
        requestLayout();
    }

    public void setPageMarginDrawable(Drawable drawable) {
        this.wie = drawable;
        if (drawable != null) {
            refreshDrawableState();
        }
        setWillNotDraw(drawable == null);
        invalidate();
    }

    public void setScrollState(int i5) {
        if (this.f22357bh == i5) {
            return;
        }
        this.f22357bh = i5;
        if (this.f22363iq != null) {
            zb(i5 != 0);
        }
        lt(i5);
    }

    public void setScroller(Scroller scroller) {
        this.f22370ry = scroller;
    }

    public void sya() throws Resources.NotFoundException {
        ycx(this.f22358dj);
    }

    @Override // android.view.View
    public boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.wie;
    }

    public void ycx() {
        setWillNotDraw(false);
        setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        setFocusable(true);
        Context context = getContext();
        this.f22370ry = new Scroller(context, f22354lt);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        float f11 = context.getResources().getDisplayMetrics().density;
        this.f22380xz = viewConfiguration.getScaledPagingTouchSlop();
        this.nji = (int) (400.0f * f11);
        this.dc = viewConfiguration.getScaledMaximumFlingVelocity();
        this.f22369rl = new EdgeEffect(context);
        this.f22382zr = new EdgeEffect(context);
        this.sz = (int) (25.0f * f11);
        this.f22381yi = (int) (2.0f * f11);
        this.rmf = (int) (f11 * 16.0f);
    }

    public void zb(dj djVar) {
        List<dj> list = this.f22378uz;
        if (list != null) {
            list.remove(djVar);
        }
    }

    /* renamed from: com.bytedance.adsdk.ugeno.jw.sya$sya, reason: collision with other inner class name */
    public static class C0018sya extends ViewGroup.LayoutParams {

        /* renamed from: dj, reason: collision with root package name */
        boolean f22383dj;

        /* renamed from: lt, reason: collision with root package name */
        int f22384lt;
        int lud;
        float sya;
        public boolean ycx;

        /* renamed from: zb, reason: collision with root package name */
        public int f22385zb;

        public C0018sya() {
            super(-1, -1);
            this.sya = 0.0f;
        }

        public C0018sya(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.sya = 0.0f;
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, sya.f22355zb);
            this.f22385zb = typedArrayObtainStyledAttributes.getInteger(0, 48);
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    private static boolean sya(View view) {
        return view.getClass().getAnnotation(ycx.class) != null;
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new C0018sya(getContext(), attributeSet);
    }

    public void zb() throws Resources.NotFoundException {
        int iYcx = this.sya.ycx();
        this.ycx = iYcx;
        boolean z11 = this.f22376ul.size() < (this.tru * 2) + 1 && this.f22376ul.size() < iYcx;
        int iMax = this.f22358dj;
        int i5 = 0;
        while (i5 < this.f22376ul.size()) {
            zb zbVar = this.f22376ul.get(i5);
            int iYcx2 = this.sya.ycx(zbVar.ycx);
            if (iYcx2 != -1) {
                if (iYcx2 == -2) {
                    this.f22376ul.remove(i5);
                    i5--;
                    this.sya.ycx((ViewGroup) this, zbVar.f22389zb, zbVar.ycx);
                    int i11 = this.f22358dj;
                    if (i11 == zbVar.f22389zb) {
                        iMax = Math.max(0, Math.min(i11, iYcx - 1));
                    }
                } else {
                    int i12 = zbVar.f22389zb;
                    if (i12 != iYcx2) {
                        if (i12 == this.f22358dj) {
                            iMax = iYcx2;
                        }
                        zbVar.f22389zb = iYcx2;
                    }
                }
                z11 = true;
            }
            i5++;
        }
        Collections.sort(this.f22376ul, lud);
        if (z11) {
            int childCount = getChildCount();
            for (int i13 = 0; i13 < childCount; i13++) {
                C0018sya c0018sya = (C0018sya) getChildAt(i13).getLayoutParams();
                if (!c0018sya.ycx) {
                    c0018sya.sya = 0.0f;
                }
            }
            ycx(iMax, false, true);
            requestLayout();
        }
    }

    private void sya(boolean z11) {
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(z11);
        }
    }

    public void setPageMarginDrawable(int i5) {
        setPageMarginDrawable(getContext().getResources().getDrawable(i5));
    }

    private void lt(int i5) {
        dj djVar = this.f22366lv;
        if (djVar != null) {
            djVar.ry(i5);
        }
        List<dj> list = this.f22378uz;
        if (list != null) {
            int size = list.size();
            for (int i11 = 0; i11 < size; i11++) {
                dj djVar2 = this.f22378uz.get(i11);
                if (djVar2 != null) {
                    djVar2.ry(i5);
                }
            }
        }
        dj djVar3 = this.f22375ui;
        if (djVar3 != null) {
            djVar3.ry(i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00b9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean sya(int i5) throws Resources.NotFoundException {
        boolean zDj;
        View viewFindFocus = findFocus();
        if (viewFindFocus == this) {
            viewFindFocus = null;
        } else if (viewFindFocus != null) {
            for (ViewParent parent = viewFindFocus.getParent(); parent instanceof ViewGroup; parent = parent.getParent()) {
                if (parent == this) {
                    break;
                }
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(viewFindFocus.getClass().getSimpleName());
            for (ViewParent parent2 = viewFindFocus.getParent(); parent2 instanceof ViewGroup; parent2 = parent2.getParent()) {
                sb2.append(" => ");
                sb2.append(parent2.getClass().getSimpleName());
            }
            Log.e("ViewPager", "arrowScroll tried to find focus based on non-child current focused view " + sb2.toString());
            viewFindFocus = null;
        }
        View viewFindNextFocus = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, i5);
        if (viewFindNextFocus == null || viewFindNextFocus == viewFindFocus) {
            if (i5 != 17 && i5 != 1) {
                zDj = (i5 == 66 || i5 == 2) ? lud() : false;
            } else {
                zDj = dj();
            }
        } else if (i5 == 17) {
            int i11 = ycx(this.f22365jw, viewFindNextFocus).left;
            int i12 = ycx(this.f22365jw, viewFindFocus).left;
            if (viewFindFocus != null && i11 >= i12) {
                zDj = dj();
            } else {
                zDj = viewFindNextFocus.requestFocus();
            }
        } else if (i5 == 66) {
            int i13 = ycx(this.f22365jw, viewFindNextFocus).left;
            int i14 = ycx(this.f22365jw, viewFindFocus).left;
            if (viewFindFocus == null || i13 > i14) {
                zDj = viewFindNextFocus.requestFocus();
            }
        }
        if (zDj) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i5));
        }
        return zDj;
    }

    public boolean lud() throws Resources.NotFoundException {
        com.bytedance.adsdk.ugeno.jw.zb zbVar = this.sya;
        if (zbVar == null || this.f22358dj >= zbVar.ycx() - 1) {
            return false;
        }
        ycx(this.f22358dj + 1, true);
        return true;
    }

    public boolean dj() throws Resources.NotFoundException {
        int i5 = this.f22358dj;
        if (i5 <= 0) {
            return false;
        }
        ycx(i5 - 1, true);
        return true;
    }

    public void ycx(int i5, boolean z11) throws Resources.NotFoundException {
        this.f22362hf = false;
        ycx(i5, z11, false);
    }

    public void ycx(int i5, boolean z11, boolean z12) throws Resources.NotFoundException {
        ycx(i5, z11, z12, 0);
    }

    public void ycx(int i5, boolean z11, boolean z12, int i11) throws Resources.NotFoundException {
        com.bytedance.adsdk.ugeno.jw.zb zbVar = this.sya;
        if (zbVar != null && zbVar.ycx() > 0) {
            if (!z12 && this.f22358dj == i5 && this.f22376ul.size() != 0) {
                setScrollingCacheEnabled(false);
                return;
            }
            if (i5 < 0) {
                i5 = 0;
            } else if (i5 >= this.sya.ycx()) {
                i5 = this.sya.ycx() - 1;
            }
            int i12 = this.tru;
            int i13 = this.f22358dj;
            if (i5 > i13 + i12 || i5 < i13 - i12) {
                for (int i14 = 0; i14 < this.f22376ul.size(); i14++) {
                    this.f22376ul.get(i14).sya = true;
                }
            }
            boolean z13 = this.f22358dj != i5;
            if (this.bba) {
                this.f22358dj = i5;
                if (z13) {
                    lud(i5);
                }
                requestLayout();
                return;
            }
            ycx(i5);
            ycx(i5, z11, i11, z13);
            return;
        }
        setScrollingCacheEnabled(false);
    }

    public zb zb(View view) {
        while (true) {
            Object parent = view.getParent();
            if (parent != this) {
                if (parent == null || !(parent instanceof View)) {
                    return null;
                }
                view = (View) parent;
            } else {
                return ycx(view);
            }
        }
    }

    public zb zb(int i5) {
        for (int i11 = 0; i11 < this.f22376ul.size(); i11++) {
            zb zbVar = this.f22376ul.get(i11);
            if (zbVar.f22389zb == i5) {
                return zbVar;
            }
        }
        return null;
    }

    private void zb(int i5, float f11, int i11) {
        dj djVar = this.f22366lv;
        if (djVar != null) {
            djVar.ycx(i5, f11, i11);
        }
        List<dj> list = this.f22378uz;
        if (list != null) {
            int size = list.size();
            for (int i12 = 0; i12 < size; i12++) {
                dj djVar2 = this.f22378uz.get(i12);
                if (djVar2 != null) {
                    djVar2.ycx(i5, f11, i11);
                }
            }
        }
        dj djVar3 = this.f22375ui;
        if (djVar3 != null) {
            djVar3.ycx(i5, f11, i11);
        }
    }

    private void ycx(int i5, boolean z11, int i11, boolean z12) throws Resources.NotFoundException {
        int iMax;
        zb zbVarZb = zb(i5);
        if (zbVarZb != null) {
            iMax = (int) (Math.max(this.htf, Math.min(zbVarZb.lud, this.thx)) * getClientWidth());
        } else {
            iMax = 0;
        }
        if (z11) {
            ycx(iMax, 0, i11);
            if (z12) {
                lud(i5);
                return;
            }
            return;
        }
        if (z12) {
            lud(i5);
        }
        ycx(false);
        scrollTo(iMax, 0);
        dj(iMax);
    }

    private void zb(boolean z11) {
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            getChildAt(i5).setLayerType(z11 ? this.dqs : 0, null);
        }
    }

    private boolean zb(float f11) {
        boolean z11;
        boolean z12;
        float f12 = this.rmy - f11;
        this.rmy = f11;
        float scrollX = getScrollX() + f12;
        float clientWidth = getClientWidth();
        float f13 = this.htf * clientWidth;
        float f14 = this.thx * clientWidth;
        boolean z13 = false;
        zb zbVar = this.f22376ul.get(0);
        zb zbVar2 = (zb) c1.l(this.f22376ul, 1);
        if (zbVar.f22389zb != 0) {
            f13 = zbVar.lud * clientWidth;
            z11 = false;
        } else {
            z11 = true;
        }
        if (zbVar2.f22389zb != this.sya.ycx() - 1) {
            f14 = zbVar2.lud * clientWidth;
            z12 = false;
        } else {
            z12 = true;
        }
        if (scrollX < f13) {
            if (z11) {
                this.f22369rl.onPull(Math.abs(f13 - scrollX) / clientWidth);
                z13 = true;
            }
            scrollX = f13;
        } else if (scrollX > f14) {
            if (z12) {
                this.f22382zr.onPull(Math.abs(scrollX - f14) / clientWidth);
                z13 = true;
            }
            scrollX = f14;
        }
        int i5 = (int) scrollX;
        this.rmy = (scrollX - i5) + this.rmy;
        scrollTo(i5, getScrollY());
        dj(i5);
        return z13;
    }

    public void ycx(dj djVar) {
        if (this.f22378uz == null) {
            this.f22378uz = new ArrayList();
        }
        this.f22378uz.add(djVar);
    }

    public void ycx(boolean z11, lud ludVar) throws Resources.NotFoundException {
        ycx(z11, ludVar, 2);
    }

    public void ycx(boolean z11, lud ludVar, int i5) throws Resources.NotFoundException {
        boolean z12 = ludVar != null;
        boolean z13 = z12 != (this.f22363iq != null);
        this.f22363iq = ludVar;
        setChildrenDrawingOrderEnabled(z12);
        if (z12) {
            this.f22377ur = z11 ? 2 : 1;
            this.dqs = i5;
        } else {
            this.f22377ur = 0;
        }
        if (z13) {
            sya();
        }
    }

    public float ycx(float f11) {
        return (float) Math.sin((f11 - 0.5f) * 0.47123894f);
    }

    public void ycx(int i5, int i11, int i12) throws Resources.NotFoundException {
        int scrollX;
        int iAbs;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        Scroller scroller = this.f22370ry;
        if (scroller != null && !scroller.isFinished()) {
            scrollX = this.xkz ? this.f22370ry.getCurrX() : this.f22370ry.getStartX();
            this.f22370ry.abortAnimation();
            setScrollingCacheEnabled(false);
        } else {
            scrollX = getScrollX();
        }
        int i13 = scrollX;
        int scrollY = getScrollY();
        int i14 = i5 - i13;
        int i15 = i11 - scrollY;
        if (i14 == 0 && i15 == 0) {
            ycx(false);
            sya();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int clientWidth = getClientWidth();
        int i16 = clientWidth / 2;
        float f11 = clientWidth;
        float f12 = i16;
        float fYcx = (ycx(Math.min(1.0f, (Math.abs(i14) * 1.0f) / f11)) * f12) + f12;
        int iAbs2 = Math.abs(i12);
        if (iAbs2 > 0) {
            iAbs = Math.round(Math.abs(fYcx / iAbs2) * 1000.0f) * 4;
        } else {
            iAbs = (int) (((Math.abs(i14) / ((this.sya.ycx(this.f22358dj) * f11) + this.f22360dy)) + 1.0f) * 100.0f);
        }
        int iMin = Math.min(iAbs, 600);
        this.xkz = false;
        this.f22370ry.startScroll(i13, scrollY, i14, i15, iMin);
        postInvalidateOnAnimation();
    }

    public zb ycx(int i5, int i11) {
        zb zbVar = new zb();
        zbVar.f22389zb = i5;
        zbVar.ycx = this.sya.ycx((ViewGroup) this, i5);
        zbVar.f22388dj = this.sya.ycx(i5);
        if (i11 >= 0 && i11 < this.f22376ul.size()) {
            this.f22376ul.add(i11, zbVar);
            return zbVar;
        }
        this.f22376ul.add(zbVar);
        return zbVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0062, code lost:
    
        r8 = null;
     */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00c6 A[PHI: r7 r10 r14
      0x00c6: PHI (r7v7 int) = (r7v6 int), (r7v5 int), (r7v10 int) binds: [B:63:0x00ea, B:60:0x00d4, B:52:0x00bb] A[DONT_GENERATE, DONT_INLINE]
      0x00c6: PHI (r10v9 int) = (r10v1 int), (r10v8 int), (r10v12 int) binds: [B:63:0x00ea, B:60:0x00d4, B:52:0x00bb] A[DONT_GENERATE, DONT_INLINE]
      0x00c6: PHI (r14v6 float) = (r14v4 float), (r14v5 float), (r14v3 float) binds: [B:63:0x00ea, B:60:0x00d4, B:52:0x00bb] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(int i5) throws Resources.NotFoundException {
        zb zbVarZb;
        String hexString;
        zb zbVarYcx;
        zb zbVarYcx2;
        zb zbVar;
        int i11 = this.f22358dj;
        if (i11 != i5) {
            zbVarZb = zb(i11);
            this.f22358dj = i5;
        } else {
            zbVarZb = null;
        }
        if (this.sya == null) {
            ul();
            return;
        }
        if (this.f22362hf) {
            ul();
            return;
        }
        if (getWindowToken() == null) {
            return;
        }
        int i12 = this.tru;
        int iMax = Math.max(0, this.f22358dj - i12);
        int iYcx = this.sya.ycx();
        int iMin = Math.min(iYcx - 1, this.f22358dj + i12);
        if (iYcx == this.ycx) {
            int i13 = 0;
            while (true) {
                if (i13 >= this.f22376ul.size()) {
                    break;
                }
                zbVarYcx = this.f22376ul.get(i13);
                int i14 = zbVarYcx.f22389zb;
                int i15 = this.f22358dj;
                if (i14 >= i15) {
                    if (i14 != i15) {
                        break;
                    }
                } else {
                    i13++;
                }
            }
            if (zbVarYcx == null && iYcx > 0) {
                zbVarYcx = ycx(this.f22358dj, i13);
            }
            if (zbVarYcx != null) {
                int i16 = i13 - 1;
                zb zbVar2 = i16 >= 0 ? this.f22376ul.get(i16) : null;
                int clientWidth = getClientWidth();
                float paddingLeft = clientWidth <= 0 ? 0.0f : (getPaddingLeft() / clientWidth) + (2.0f - zbVarYcx.f22388dj);
                float f11 = 0.0f;
                for (int i17 = this.f22358dj - 1; i17 >= 0; i17--) {
                    if (f11 >= paddingLeft && i17 < iMax) {
                        if (zbVar2 == null) {
                            break;
                        }
                        if (i17 == zbVar2.f22389zb && !zbVar2.sya) {
                            this.f22376ul.remove(i16);
                            this.sya.ycx((ViewGroup) this, i17, zbVar2.ycx);
                            i16--;
                            i13--;
                            if (i16 >= 0) {
                                zbVar = this.f22376ul.get(i16);
                            }
                            zbVar2 = zbVar;
                        }
                    } else if (zbVar2 != null && i17 == zbVar2.f22389zb) {
                        f11 += zbVar2.f22388dj;
                        i16--;
                        if (i16 >= 0) {
                            zbVar = this.f22376ul.get(i16);
                        }
                        zbVar2 = zbVar;
                    } else {
                        f11 += ycx(i17, i16 + 1).f22388dj;
                        i13++;
                        zbVar = i16 >= 0 ? this.f22376ul.get(i16) : null;
                        zbVar2 = zbVar;
                    }
                }
                float f12 = zbVarYcx.f22388dj;
                int i18 = i13 + 1;
                if (f12 < 2.0f) {
                    zb zbVar3 = i18 < this.f22376ul.size() ? this.f22376ul.get(i18) : null;
                    float paddingRight = clientWidth <= 0 ? 0.0f : (getPaddingRight() / clientWidth) + 2.0f;
                    int i19 = this.f22358dj;
                    while (true) {
                        i19++;
                        if (i19 >= iYcx) {
                            break;
                        }
                        if (f12 >= paddingRight && i19 > iMin) {
                            if (zbVar3 == null) {
                                break;
                            }
                            if (i19 == zbVar3.f22389zb && !zbVar3.sya) {
                                this.f22376ul.remove(i18);
                                this.sya.ycx((ViewGroup) this, i19, zbVar3.ycx);
                                if (i18 < this.f22376ul.size()) {
                                    zbVar3 = this.f22376ul.get(i18);
                                }
                            }
                        } else if (zbVar3 != null && i19 == zbVar3.f22389zb) {
                            f12 += zbVar3.f22388dj;
                            i18++;
                            if (i18 < this.f22376ul.size()) {
                                zbVar3 = this.f22376ul.get(i18);
                            }
                        } else {
                            zb zbVarYcx3 = ycx(i19, i18);
                            i18++;
                            f12 += zbVarYcx3.f22388dj;
                            zbVar3 = i18 < this.f22376ul.size() ? this.f22376ul.get(i18) : null;
                        }
                    }
                }
                ycx(zbVarYcx, i13, zbVarZb);
            }
            int childCount = getChildCount();
            for (int i21 = 0; i21 < childCount; i21++) {
                View childAt = getChildAt(i21);
                C0018sya c0018sya = (C0018sya) childAt.getLayoutParams();
                c0018sya.f22384lt = i21;
                if (!c0018sya.ycx && c0018sya.sya == 0.0f && (zbVarYcx2 = ycx(childAt)) != null) {
                    c0018sya.sya = zbVarYcx2.f22388dj;
                    c0018sya.lud = zbVarYcx2.f22389zb;
                }
            }
            ul();
            if (hasFocus()) {
                View viewFindFocus = findFocus();
                zb zbVarZb2 = viewFindFocus != null ? zb(viewFindFocus) : null;
                if (zbVarZb2 == null || zbVarZb2.f22389zb != this.f22358dj) {
                    for (int i22 = 0; i22 < getChildCount(); i22++) {
                        View childAt2 = getChildAt(i22);
                        zb zbVarYcx4 = ycx(childAt2);
                        if (zbVarYcx4 != null && zbVarYcx4.f22389zb == this.f22358dj && childAt2.requestFocus(2)) {
                            return;
                        }
                    }
                    return;
                }
                return;
            }
            return;
        }
        try {
            hexString = getResources().getResourceName(getId());
        } catch (Resources.NotFoundException unused) {
            hexString = Integer.toHexString(getId());
        }
        StringBuilder sb2 = new StringBuilder("The application's PagerAdapter changed the adapter's contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: ");
        c0.A(sb2, this.ycx, ", found: ", iYcx, " Pager id: ");
        sb2.append(hexString);
        sb2.append(" Pager class: ");
        sb2.append(getClass());
        sb2.append(" Problematic adapter: ");
        sb2.append(this.sya.getClass());
        throw new IllegalStateException(sb2.toString());
    }

    private void ycx(zb zbVar, int i5, zb zbVar2) {
        int i11;
        int i12;
        zb zbVar3;
        zb zbVar4;
        int iYcx = this.sya.ycx();
        int clientWidth = getClientWidth();
        float f11 = clientWidth > 0 ? this.f22360dy / clientWidth : 0.0f;
        if (zbVar2 != null) {
            int i13 = zbVar2.f22389zb;
            int i14 = zbVar.f22389zb;
            if (i13 < i14) {
                float fYcx = zbVar2.lud + zbVar2.f22388dj + f11;
                int i15 = i13 + 1;
                int i16 = 0;
                while (i15 <= zbVar.f22389zb && i16 < this.f22376ul.size()) {
                    zb zbVar5 = this.f22376ul.get(i16);
                    while (true) {
                        zbVar4 = zbVar5;
                        if (i15 <= zbVar4.f22389zb || i16 >= this.f22376ul.size() - 1) {
                            break;
                        }
                        i16++;
                        zbVar5 = this.f22376ul.get(i16);
                    }
                    while (i15 < zbVar4.f22389zb) {
                        fYcx += this.sya.ycx(i15) + f11;
                        i15++;
                    }
                    zbVar4.lud = fYcx;
                    fYcx += zbVar4.f22388dj + f11;
                    i15++;
                }
            } else if (i13 > i14) {
                int size = this.f22376ul.size() - 1;
                float fYcx2 = zbVar2.lud;
                while (true) {
                    i13--;
                    if (i13 < zbVar.f22389zb || size < 0) {
                        break;
                    }
                    zb zbVar6 = this.f22376ul.get(size);
                    while (true) {
                        zbVar3 = zbVar6;
                        if (i13 >= zbVar3.f22389zb || size <= 0) {
                            break;
                        }
                        size--;
                        zbVar6 = this.f22376ul.get(size);
                    }
                    while (i13 > zbVar3.f22389zb) {
                        fYcx2 -= this.sya.ycx(i13) + f11;
                        i13--;
                    }
                    fYcx2 -= zbVar3.f22388dj + f11;
                    zbVar3.lud = fYcx2;
                }
            }
        }
        int size2 = this.f22376ul.size();
        float fYcx3 = zbVar.lud;
        int i17 = zbVar.f22389zb;
        int i18 = i17 - 1;
        this.htf = i17 == 0 ? fYcx3 : -3.4028235E38f;
        int i19 = iYcx - 1;
        this.thx = i17 == i19 ? (zbVar.f22388dj + fYcx3) - 1.0f : Float.MAX_VALUE;
        int i21 = i5 - 1;
        while (i21 >= 0) {
            zb zbVar7 = this.f22376ul.get(i21);
            while (true) {
                i12 = zbVar7.f22389zb;
                if (i18 <= i12) {
                    break;
                }
                fYcx3 -= this.sya.ycx(i18) + f11;
                i18--;
            }
            fYcx3 -= zbVar7.f22388dj + f11;
            zbVar7.lud = fYcx3;
            if (i12 == 0) {
                this.htf = fYcx3;
            }
            i21--;
            i18--;
        }
        float fYcx4 = zbVar.lud + zbVar.f22388dj + f11;
        int i22 = zbVar.f22389zb + 1;
        int i23 = i5 + 1;
        while (i23 < size2) {
            zb zbVar8 = this.f22376ul.get(i23);
            while (true) {
                i11 = zbVar8.f22389zb;
                if (i22 >= i11) {
                    break;
                }
                fYcx4 += this.sya.ycx(i22) + f11;
                i22++;
            }
            if (i11 == i19) {
                this.thx = (zbVar8.f22388dj + fYcx4) - 1.0f;
            }
            zbVar8.lud = fYcx4;
            fYcx4 += zbVar8.f22388dj + f11;
            i23++;
            i22++;
        }
        this.f22367mp = false;
    }

    public zb ycx(View view) {
        for (int i5 = 0; i5 < this.f22376ul.size(); i5++) {
            zb zbVar = this.f22376ul.get(i5);
            if (this.sya.ycx(view, zbVar.ycx)) {
                return zbVar;
            }
        }
        return null;
    }

    private void ycx(int i5, int i11, int i12, int i13) {
        if (i11 > 0 && !this.f22376ul.isEmpty()) {
            if (!this.f22370ry.isFinished()) {
                this.f22370ry.setFinalX(getCurrentItem() * getClientWidth());
                return;
            } else {
                scrollTo((int) ((getScrollX() / (((i11 - getPaddingLeft()) - getPaddingRight()) + i13)) * (((i5 - getPaddingLeft()) - getPaddingRight()) + i12)), getScrollY());
                return;
            }
        }
        zb zbVarZb = zb(this.f22358dj);
        int iMin = (int) ((zbVarZb != null ? Math.min(zbVarZb.lud, this.thx) : 0.0f) * ((i5 - getPaddingLeft()) - getPaddingRight()));
        if (iMin != getScrollX()) {
            ycx(false);
            scrollTo(iMin, getScrollY());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(int i5, float f11, int i11) {
        int iMax;
        int width;
        int left;
        if (this.duz > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width2 = getWidth();
            int childCount = getChildCount();
            for (int i12 = 0; i12 < childCount; i12++) {
                View childAt = getChildAt(i12);
                C0018sya c0018sya = (C0018sya) childAt.getLayoutParams();
                if (c0018sya.ycx) {
                    int i13 = c0018sya.f22385zb & 7;
                    if (i13 == 1) {
                        iMax = Math.max((width2 - childAt.getMeasuredWidth()) / 2, paddingLeft);
                    } else {
                        if (i13 == 3) {
                            width = childAt.getWidth() + paddingLeft;
                        } else if (i13 != 5) {
                            width = paddingLeft;
                        } else {
                            iMax = (width2 - paddingRight) - childAt.getMeasuredWidth();
                            paddingRight += childAt.getMeasuredWidth();
                        }
                        left = (paddingLeft + scrollX) - childAt.getLeft();
                        if (left != 0) {
                            childAt.offsetLeftAndRight(left);
                        }
                        paddingLeft = width;
                    }
                    int i14 = iMax;
                    width = paddingLeft;
                    paddingLeft = i14;
                    left = (paddingLeft + scrollX) - childAt.getLeft();
                    if (left != 0) {
                    }
                    paddingLeft = width;
                }
            }
        }
        zb(i5, f11, i11);
        if (this.f22363iq != null) {
            int scrollX2 = getScrollX();
            int childCount2 = getChildCount();
            for (int i15 = 0; i15 < childCount2; i15++) {
                View childAt2 = getChildAt(i15);
                if (!((C0018sya) childAt2.getLayoutParams()).ycx) {
                    this.f22363iq.ycx(childAt2, (childAt2.getLeft() - scrollX2) / getClientWidth());
                }
            }
        }
        this.f22373uf = true;
    }

    private void ycx(boolean z11) {
        boolean z12 = this.f22357bh == 2;
        if (z12) {
            setScrollingCacheEnabled(false);
            if (!this.f22370ry.isFinished()) {
                this.f22370ry.abortAnimation();
                int scrollX = getScrollX();
                int scrollY = getScrollY();
                int currX = this.f22370ry.getCurrX();
                int currY = this.f22370ry.getCurrY();
                if (scrollX != currX || scrollY != currY) {
                    scrollTo(currX, currY);
                    if (currX != scrollX) {
                        dj(currX);
                    }
                }
            }
        }
        this.f22362hf = false;
        for (int i5 = 0; i5 < this.f22376ul.size(); i5++) {
            zb zbVar = this.f22376ul.get(i5);
            if (zbVar.sya) {
                zbVar.sya = false;
                z12 = true;
            }
        }
        if (z12) {
            if (z11) {
                postOnAnimation(this.f22371sg);
            } else {
                this.f22371sg.run();
            }
        }
    }

    private boolean ycx(float f11, float f12) {
        if (f11 >= this.aeu || f12 <= 0.0f) {
            return f11 > ((float) (getWidth() - this.aeu)) && f12 < 0.0f;
        }
        return true;
    }

    private int ycx(int i5, float f11, int i11, int i12) {
        if (Math.abs(i12) <= this.sz || Math.abs(i11) <= this.nji) {
            i5 += (int) (f11 + (i5 >= this.f22358dj ? 0.4f : 0.6f));
        } else if (i11 <= 0) {
            i5++;
        }
        if (this.f22376ul.size() > 0) {
            return Math.max(this.f22376ul.get(0).f22389zb, Math.min(i5, ((zb) c1.l(this.f22376ul, 1)).f22389zb));
        }
        return i5;
    }

    private void ycx(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.dwi) {
            int i5 = actionIndex == 0 ? 1 : 0;
            this.rmy = motionEvent.getX(i5);
            this.dwi = motionEvent.getPointerId(i5);
            VelocityTracker velocityTracker = this.oby;
            if (velocityTracker != null) {
                velocityTracker.clear();
            }
        }
    }

    public boolean ycx(View view, boolean z11, int i5, int i11, int i12) {
        int i13;
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                int i14 = i11 + scrollX;
                if (i14 >= childAt.getLeft() && i14 < childAt.getRight() && (i13 = i12 + scrollY) >= childAt.getTop() && i13 < childAt.getBottom() && ycx(childAt, true, i5, i14 - childAt.getLeft(), i13 - childAt.getTop())) {
                    return true;
                }
            }
        }
        return z11 && view.canScrollHorizontally(-i5);
    }

    public boolean ycx(KeyEvent keyEvent) {
        if (keyEvent.getAction() != 0) {
            return false;
        }
        int keyCode = keyEvent.getKeyCode();
        if (keyCode == 21) {
            if (keyEvent.hasModifiers(2)) {
                return dj();
            }
            return sya(17);
        }
        if (keyCode == 22) {
            if (keyEvent.hasModifiers(2)) {
                return lud();
            }
            return sya(66);
        }
        if (keyCode != 61) {
            return false;
        }
        if (keyEvent.hasNoModifiers()) {
            return sya(2);
        }
        if (keyEvent.hasModifiers(1)) {
            return sya(1);
        }
        return false;
    }

    private Rect ycx(Rect rect, View view) {
        if (rect == null) {
            rect = new Rect();
        }
        if (view == null) {
            rect.set(0, 0, 0, 0);
            return rect;
        }
        rect.left = view.getLeft();
        rect.right = view.getRight();
        rect.top = view.getTop();
        rect.bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup viewGroup = (ViewGroup) parent;
            rect.left = viewGroup.getLeft() + rect.left;
            rect.right = viewGroup.getRight() + rect.right;
            rect.top = viewGroup.getTop() + rect.top;
            rect.bottom = viewGroup.getBottom() + rect.bottom;
            parent = viewGroup.getParent();
        }
        return rect;
    }
}
