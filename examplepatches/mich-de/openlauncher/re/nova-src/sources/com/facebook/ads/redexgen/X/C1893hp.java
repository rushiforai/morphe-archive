package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
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
import com.facebook.ads.internal.androidx.support.v4.view.ViewPager;
import com.facebook.ads.internal.androidx.support.v4.view.ViewPager$DecorView;
import com.facebook.ads.internal.androidx.support.v4.view.ViewPager$SavedState;
import com.facebook.ads.internal.util.parcelable.WrappedParcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.hp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1893hp extends ViewGroup {
    public static byte[] A0s;
    public static String[] A0t = {"Pb5dMBpLoD8olSqqN3M1wt71s6WfJWWx", "mawes8eGWKEfT5kg0DwbKE", "yCX0UAcI", "nBGVAWTalDrx8Q3Q0HTp4hPpqgaJoZ5h", b.f42142b, b.f42142b, "gKpLqM1fc4CgqUT7jB7tIrf4xsKdVFyY", "wKHjR3FqXT8StRIGs0zAAfuJmbbhub4H"};
    public static final int[] A0u;
    public static final Interpolator A0v;
    public static final C1892ho A0w;
    public static final Comparator<C1885hh> A0x;
    public int A00;
    public AbstractC1865hM A01;
    public float A02;
    public float A03;
    public float A04;
    public float A05;
    public float A06;
    public float A07;
    public int A08;
    public int A09;
    public int A0A;
    public int A0B;
    public int A0C;
    public int A0D;
    public int A0E;
    public int A0F;
    public int A0G;
    public int A0H;
    public int A0I;
    public int A0J;
    public int A0K;
    public int A0L;
    public int A0M;
    public int A0N;
    public int A0O;
    public int A0P;
    public int A0Q;
    public int A0R;
    public Drawable A0S;
    public Parcelable A0T;
    public VelocityTracker A0U;
    public EdgeEffect A0V;
    public EdgeEffect A0W;
    public Scroller A0X;
    public InterfaceC1888hk A0Y;
    public C1890hm A0Z;
    public ClassLoader A0a;
    public ArrayList<View> A0b;
    public List<ViewPager.OnAdapterChangeListener> A0c;
    public List<InterfaceC1888hk> A0d;
    public boolean A0e;
    public boolean A0f;
    public boolean A0g;
    public boolean A0h;
    public boolean A0i;
    public boolean A0j;
    public boolean A0k;
    public boolean A0l;
    public boolean A0m;
    public boolean A0n;
    public final Rect A0o;
    public final C1885hh A0p;
    public final Runnable A0q;
    public final ArrayList<C1885hh> A0r;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 12 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private C1885hh A05() {
        int clientWidth = getClientWidth();
        float scrollX = clientWidth > 0 ? getScrollX() / clientWidth : 0.0f;
        float f11 = clientWidth > 0 ? this.A0M / clientWidth : 0.0f;
        int i5 = -1;
        float f12 = 0.0f;
        float f13 = 0.0f;
        boolean z11 = true;
        C1885hh c1885hh = null;
        int i11 = 0;
        while (i11 < this.A0r.size()) {
            C1885hh c1885hh2 = this.A0r.get(i11);
            if (!z11 && c1885hh2.A02 != i5 + 1) {
                c1885hh2 = this.A0p;
                c1885hh2.A00 = f12 + f13 + f11;
                c1885hh2.A02 = i5 + 1;
                c1885hh2.A01 = this.A01.A00(c1885hh2.A02);
                i11--;
            }
            f12 = c1885hh2.A00;
            float f14 = c1885hh2.A01 + f12 + f11;
            if (!z11) {
                String[] strArr = A0t;
                if (strArr[4].length() != strArr[5].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0t;
                strArr2[3] = "VrUwTTzuyHD2SkMMCenWDHvarMqbXCCI";
                strArr2[6] = "LX2NnyEsDXWEx3dFbPH8p7fzI1U1dTZ8";
                if (scrollX < f12) {
                    return c1885hh;
                }
            }
            if (scrollX >= f14) {
                int size = this.A0r.size() - 1;
                String[] strArr3 = A0t;
                if (strArr3[3].charAt(15) != strArr3[6].charAt(15)) {
                    A0t[2] = "sbP3P6ChvdnfvWI";
                    if (i11 != size) {
                        z11 = false;
                        i5 = c1885hh2.A02;
                        f13 = c1885hh2.A01;
                        c1885hh = c1885hh2;
                        i11++;
                    }
                } else {
                    A0t[1] = "kvGf4Zg53U8bz7GLeUNnCLzy4o";
                    if (i11 != size) {
                        z11 = false;
                        i5 = c1885hh2.A02;
                        f13 = c1885hh2.A01;
                        c1885hh = c1885hh2;
                        i11++;
                    }
                }
            }
            return c1885hh2;
        }
        return c1885hh;
    }

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0s, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 104);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0E() {
        A0s = new byte[]{-99, -70, -69, -99, -62, -14, 3, 9, 7, 20, -62, 5, 14, 3, 21, 21, -36, -62, -48, 0, 17, 23, 21, 34, -48, 25, 20, -22, -48, -34, 14, 48, 45, 32, 42, 35, 43, 31, 50, 39, 33, -34, 31, 34, 31, 46, 50, 35, 48, -8, -34, -30, 54, 49, 49, -30, 53, 47, 35, 46, 46, -3, -30, 38, 39, 40, 35, 55, 46, 54, 43, 48, 41, -30, 54, 49, -30, -66, -78, -8, 1, 7, 0, -10, -52, -78, -69, -39, -26, -26, -25, -20, -104, -39, -36, -36, -104, -24, -39, -33, -35, -22, -104, -36, -35, -37, -25, -22, -104, -18, -31, -35, -17, -104, -36, -19, -22, -31, -26, -33, -104, -28, -39, -15, -25, -19, -20, -10, 9, 21, 25, 9, 23, 24, 9, 8, -60, 19, 10, 10, 23, 7, 22, 9, 9, 18, -60, 20, 5, 11, 9, -60, 16, 13, 17, 13, 24, -60, -10, 10, 7, -62, 3, 18, 18, 14, 11, 5, 3, 22, 11, 17, 16, -55, 21, -62, -14, 3, 9, 7, 20, -29, 6, 3, 18, 22, 7, 20, -62, 5, 10, 3, 16, 9, 7, 6, -62, 22, 10, 7, -62, 3, 6, 3, 18, 22, 7, 20, -55, 21, -62, 5, 17, 16, 22, 7, 16, 22, 21, -62, 25, 11, 22, 10, 17, 23, 22, -62, 5, 3, 14, 14, 11, 16, 9, -62, -14, 3, 9, 7, 20, -29, 6, 3, 18, 22, 7, 20, -59, 16, 17, 22, 11, 8, 27, -26, 3, 22, 3, -11, 7, 22, -27, 10, 3, 16, 9, 7, 6, -61, -62, -25, 26, 18, 7, 5, 22, 7, 6, -62, 3, 6, 3, 18, 22, 7, 20, -62, 11, 22, 7, 15, -62, 5, 17, 23, 16, 22, -36, -62, -19, 0, -4, 14, -25, -8, -2, -4, 9, 25, 42, 42, 39, 47, 11, 27, 42, 39, 36, 36, -40, 44, 42, 33, 29, 28, -40, 44, 39, -40, 30, 33, 38, 28, -40, 30, 39, 27, 45, 43, -40, 26, 25, 43, 29, 28, -40, 39, 38, -40, 38, 39, 38, -27, 27, 32, 33, 36, 28, -40, 27, 45, 42, 42, 29, 38, 44, -40, 30, 39, 27, 45, 43, 29, 28, -40, 46, 33, 29, 47, -40, 76, 75, 30, 65, 62, 77, 81, 66, 79, 32, 69, 62, 75, 68, 66, 65, 19, 18, -12, 5, 11, 9, -9, 7, 22, 19, 16, 16, 9, 8, -60, 8, 13, 8, -60, 18, 19, 24, -60, 7, 5, 16, 16, -60, 23, 25, 20, 9, 22, 7, 16, 5, 23, 23, -60, 13, 17, 20, 16, 9, 17, 9, 18, 24, 5, 24, 13, 19, 18, 85, 83, 66, 79, 84, 71, 80, 83, 78, 49, 66, 72, 70};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 21 out of bounds for length 17
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private final void A0L(int i5, int i11, int i12) throws Resources.NotFoundException {
        int scrollX;
        int iAbs;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if ((this.A0X == null || this.A0X.isFinished()) ? false : true) {
            scrollX = this.A0j ? this.A0X.getCurrX() : this.A0X.getStartX();
            this.A0X.abortAnimation();
            setScrollingCacheEnabled(false);
        } else {
            scrollX = getScrollX();
        }
        int scrollY = getScrollY();
        int i13 = i5 - scrollX;
        int i14 = i11 - scrollY;
        if (i13 == 0 && i14 == 0) {
            A0T(false);
            A0h();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int clientWidth = getClientWidth();
        int i15 = clientWidth / 2;
        float fA02 = i15 + (i15 * A02(Math.min(1.0f, (Math.abs(i13) * 1.0f) / clientWidth)));
        int iAbs2 = Math.abs(i12);
        if (iAbs2 > 0) {
            float f11 = fA02 / iAbs2;
            if (A0t[1].length() == 12) {
                throw new RuntimeException();
            }
            String[] strArr = A0t;
            strArr[4] = b.f42142b;
            strArr[5] = b.f42142b;
            iAbs = Math.round(Math.abs(f11) * 1000.0f) * 4;
        } else {
            iAbs = (int) ((1.0f + (Math.abs(i13) / (this.A0M + (clientWidth * this.A01.A00(this.A00))))) * 100.0f);
        }
        int iMin = Math.min(iAbs, 600);
        this.A0j = false;
        this.A0X.startScroll(scrollX, scrollY, i13, i14, iMin);
        AbstractC1880hb.A07(this);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // android.view.ViewGroup, android.view.View
    public final void addTouchables(ArrayList<View> arrayList) {
        C1885hh c1885hhA09;
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() == 0 && (c1885hhA09 = A09(childAt)) != null && c1885hhA09.A02 == this.A00) {
                childAt.addTouchables(arrayList);
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 18 out of bounds for length 18
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // android.view.View
    public void onMeasure(int i5, int i11) throws Resources.NotFoundException {
        C1886hi c1886hi;
        int i12;
        int i13;
        setMeasuredDimension(getDefaultSize(0, i5), getDefaultSize(0, i11));
        int measuredWidth = getMeasuredWidth();
        this.A0I = Math.min(measuredWidth / 10, this.A0E);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int i14 = 0;
        while (true) {
            if (i14 >= childCount) {
                this.A0B = View.MeasureSpec.makeMeasureSpec(paddingLeft, 1073741824);
                this.A0A = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
                this.A0h = true;
                A0h();
                this.A0h = false;
                int childCount2 = getChildCount();
                for (int i15 = 0; i15 < childCount2; i15++) {
                    View childAt = getChildAt(i15);
                    if (childAt.getVisibility() != 8 && ((c1886hi = (C1886hi) childAt.getLayoutParams()) == null || !c1886hi.A05)) {
                        float f11 = paddingLeft;
                        String[] strArr = A0t;
                        if (strArr[4].length() == strArr[5].length()) {
                            A0t[1] = "11cm9STM7FlxGR3";
                            childAt.measure(View.MeasureSpec.makeMeasureSpec((int) (f11 * c1886hi.A00), 1073741824), this.A0A);
                        }
                    }
                }
                return;
            }
            View childAt2 = getChildAt(i14);
            if (childAt2.getVisibility() != 8) {
                C1886hi c1886hi2 = (C1886hi) childAt2.getLayoutParams();
                if (A0t[1].length() == 12) {
                    break;
                }
                String[] strArr2 = A0t;
                strArr2[4] = b.f42142b;
                strArr2[5] = b.f42142b;
                if (c1886hi2 != null && c1886hi2.A05) {
                    int i16 = c1886hi2.A04 & 7;
                    int i17 = c1886hi2.A04 & 112;
                    int i18 = Integer.MIN_VALUE;
                    int i19 = Integer.MIN_VALUE;
                    boolean z11 = i17 == 48 || i17 == 80;
                    boolean z12 = i16 == 3 || i16 == 5;
                    if (z11) {
                        i18 = 1073741824;
                    } else if (z12) {
                        i19 = 1073741824;
                    }
                    if (c1886hi2.width != -2) {
                        i18 = 1073741824;
                        i12 = c1886hi2.width != -1 ? c1886hi2.width : paddingLeft;
                    } else {
                        i12 = paddingLeft;
                    }
                    if (c1886hi2.height != -2) {
                        i19 = 1073741824;
                        if (c1886hi2.height != -1) {
                            i13 = c1886hi2.height;
                            if (A0t[1].length() != 12) {
                                A0t[1] = "VKsSzAx6pk9J5wmYrW5ACp";
                            }
                        } else {
                            i13 = measuredHeight;
                        }
                    } else {
                        i13 = measuredHeight;
                    }
                    childAt2.measure(View.MeasureSpec.makeMeasureSpec(i12, i18), View.MeasureSpec.makeMeasureSpec(i13, i19));
                    if (z11) {
                        measuredHeight -= childAt2.getMeasuredHeight();
                    } else if (z12) {
                        paddingLeft -= childAt2.getMeasuredWidth();
                    }
                }
            }
            i14++;
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 16 out of bounds for length 11
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00cf  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) throws Resources.NotFoundException {
        if (this.A0f) {
            return true;
        }
        if ((motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) || this.A01 == null || this.A01.A01() == 0) {
            return false;
        }
        if (this.A0U == null) {
            this.A0U = VelocityTracker.obtain();
        }
        this.A0U.addMovement(motionEvent);
        boolean zA0W = false;
        switch (motionEvent.getAction() & 255) {
            case 0:
                this.A0X.abortAnimation();
                this.A0m = false;
                A0h();
                float x11 = motionEvent.getX();
                this.A03 = x11;
                this.A05 = x11;
                float y11 = motionEvent.getY();
                this.A04 = y11;
                this.A06 = y11;
                this.A08 = motionEvent.getPointerId(0);
                break;
            case 1:
                if (this.A0i) {
                    VelocityTracker velocityTracker = this.A0U;
                    velocityTracker.computeCurrentVelocity(1000, this.A0J);
                    int xVelocity = (int) velocityTracker.getXVelocity(this.A08);
                    this.A0m = true;
                    int clientWidth = getClientWidth();
                    int scrollX = getScrollX();
                    C1885hh c1885hhA05 = A05();
                    A0Q(A03(c1885hhA05.A02, ((scrollX / clientWidth) - c1885hhA05.A00) / (c1885hhA05.A01 + (this.A0M / clientWidth)), xVelocity, (int) (motionEvent.getX(motionEvent.findPointerIndex(this.A08)) - this.A03)), true, true, xVelocity);
                    zA0W = A0W();
                    break;
                }
                break;
            case 2:
                if (!this.A0i) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.A08);
                    if (iFindPointerIndex == -1) {
                        zA0W = A0W();
                        break;
                    } else {
                        float x12 = motionEvent.getX(iFindPointerIndex);
                        float fAbs = Math.abs(x12 - this.A05);
                        float y12 = motionEvent.getY(iFindPointerIndex);
                        float fAbs2 = Math.abs(y12 - this.A06);
                        if (fAbs > this.A0R && fAbs > fAbs2) {
                            this.A0i = true;
                            A0V(true);
                            this.A05 = x12 - this.A03 > 0.0f ? this.A03 + this.A0R : this.A03 - this.A0R;
                            this.A06 = y12;
                            setScrollState(1);
                            setScrollingCacheEnabled(true);
                            ViewParent parent = getParent();
                            if (parent != null) {
                                parent.requestDisallowInterceptTouchEvent(true);
                            }
                        }
                        if (this.A0i) {
                        }
                    }
                } else if (this.A0i) {
                    zA0W = false | A0Z(motionEvent.getX(motionEvent.findPointerIndex(this.A08)));
                    break;
                }
                break;
            case 3:
                if (this.A0i) {
                    A0O(this.A00, true, 0, false);
                    zA0W = A0W();
                    break;
                }
                break;
            case 5:
                int actionIndex = motionEvent.getActionIndex();
                this.A05 = motionEvent.getX(actionIndex);
                this.A08 = motionEvent.getPointerId(actionIndex);
                break;
            case 6:
                A0R(motionEvent);
                this.A05 = motionEvent.getX(motionEvent.findPointerIndex(this.A08));
                break;
        }
        if (zA0W) {
            AbstractC1880hb.A07(this);
        }
        return true;
    }

    static {
        A0E();
        A0u = new int[]{16842931};
        A0x = new C1882hd();
        A0v = new InterpolatorC1883he();
        A0w = new C1892ho();
    }

    public C1893hp(Context context) {
        super(context);
        this.A0r = new ArrayList<>();
        this.A0p = new C1885hh();
        this.A0o = new Rect();
        this.A0O = -1;
        this.A0T = null;
        this.A0a = null;
        this.A02 = -3.4028235E38f;
        this.A07 = Float.MAX_VALUE;
        this.A0L = 1;
        this.A08 = -1;
        this.A0g = true;
        this.A0l = false;
        this.A0q = new RunnableC1884hf(this);
        this.A0P = 0;
        A0F();
    }

    private final float A02(float f11) {
        return (float) Math.sin((f11 - 0.5f) * 0.47123894f);
    }

    private int A03(int i5, float f11, int i11, int i12) {
        if (Math.abs(i12) > this.A0H && Math.abs(i11) > this.A0K) {
            if (i11 <= 0) {
                i5++;
            }
        } else {
            int targetPage = this.A00;
            float truncator = i5 >= targetPage ? 0.4f : 0.6f;
            i5 = ((int) (f11 + truncator)) + i5;
        }
        int targetPage2 = this.A0r.size();
        if (targetPage2 > 0) {
            C1885hh lastItem = this.A0r.get(0);
            ArrayList<C1885hh> arrayList = this.A0r;
            int targetPage3 = this.A0r.size();
            C1885hh c1885hh = arrayList.get(targetPage3 - 1);
            int i13 = lastItem.A02;
            int targetPage4 = c1885hh.A02;
            return Math.max(i13, Math.min(i5, targetPage4));
        }
        return i5;
    }

    private Rect A04(Rect rect, View view) {
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
            rect.left += viewGroup.getLeft();
            rect.right += viewGroup.getRight();
            rect.top += viewGroup.getTop();
            rect.bottom += viewGroup.getBottom();
            parent = viewGroup.getParent();
        }
        return rect;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final C1885hh A06(int i5) {
        for (int i11 = 0; i11 < i; i11++) {
            C1885hh ii2 = this.A0r.get(i11);
            int i12 = ii2.A02;
            if (i12 == i5) {
                return ii2;
            }
        }
        return null;
    }

    private final C1885hh A07(int i5, int i11) {
        C1885hh c1885hh = new C1885hh();
        c1885hh.A02 = i5;
        c1885hh.A03 = this.A01.A04(this, i5);
        c1885hh.A01 = this.A01.A00(i5);
        if (i11 < 0 || i11 >= this.A0r.size()) {
            this.A0r.add(c1885hh);
        } else {
            this.A0r.add(i11, c1885hh);
        }
        return c1885hh;
    }

    private final C1885hh A08(View view) {
        while (true) {
            Object parent = view.getParent();
            if (parent != this) {
                if (parent == null || !(parent instanceof View)) {
                    return null;
                }
                view = (View) parent;
            } else {
                return A09(view);
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final C1885hh A09(View view) {
        for (int i5 = 0; i5 < i; i5++) {
            C1885hh c1885hh = this.A0r.get(i5);
            if (this.A01.A08(view, c1885hh.A03)) {
                return c1885hh;
            }
        }
        String[] strArr = A0t;
        if (strArr[4].length() != strArr[5].length()) {
            throw new RuntimeException();
        }
        A0t[1] = "T6ty";
        return null;
    }

    private void A0B() {
        this.A0i = false;
        this.A0k = false;
        if (this.A0U != null) {
            this.A0U.recycle();
            String[] strArr = A0t;
            if (strArr[7].charAt(10) != strArr[0].charAt(10)) {
                throw new RuntimeException();
            }
            A0t[1] = "yoRarqzFlsm2scdQtgnfRphmjo";
            this.A0U = null;
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0C() {
        int i5 = 0;
        while (i5 < i) {
            if (!((C1886hi) getChildAt(i5).getLayoutParams()).A05) {
                removeViewAt(i5);
                i5--;
            }
            i5++;
        }
    }

    private void A0D() {
        if (this.A0F != 0) {
            if (this.A0b == null) {
                this.A0b = new ArrayList<>();
            } else {
                this.A0b.clear();
            }
            int childCount = getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                this.A0b.add(getChildAt(i5));
            }
            Collections.sort(this.A0b, A0w);
        }
    }

    private final void A0F() {
        setWillNotDraw(false);
        setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        setFocusable(true);
        Context context = getContext();
        this.A0X = new Scroller(context, A0v);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        float f11 = context.getResources().getDisplayMetrics().density;
        this.A0R = viewConfiguration.getScaledPagingTouchSlop();
        this.A0K = (int) (400.0f * f11);
        this.A0J = viewConfiguration.getScaledMaximumFlingVelocity();
        this.A0V = new EdgeEffect(context);
        this.A0W = new EdgeEffect(context);
        this.A0H = (int) (25.0f * f11);
        this.A0C = (int) (2.0f * f11);
        this.A0E = (int) (16.0f * f11);
        AbstractC1880hb.A0B(this, new JK(this));
        if (AbstractC1880hb.A00(this) == 0) {
            AbstractC1880hb.A09(this, 1);
        }
        AbstractC1880hb.A0C(this, new JL(this));
    }

    private void A0G(int i5) {
        if (this.A0d != null) {
            int z11 = this.A0d.size();
            for (int i11 = 0; i11 < z11; i11++) {
                this.A0d.get(i11);
            }
        }
    }

    private void A0H(int i5) {
        if (this.A0d != null) {
            int z11 = this.A0d.size();
            for (int i11 = 0; i11 < z11; i11++) {
                this.A0d.get(i11);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:71:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x019a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A0I(int i5) throws Resources.NotFoundException {
        String hexString;
        C1885hh c1885hhA08;
        C1885hh c1885hh;
        float f11;
        C1885hh ii2;
        float leftWidthNeeded;
        C1885hh curItem = null;
        if (this.A00 != i5) {
            curItem = A06(this.A00);
            this.A00 = i5;
        }
        if (this.A01 == null) {
            A0D();
            return;
        }
        if (this.A0m) {
            A0D();
            return;
        }
        if (getWindowToken() == null) {
            return;
        }
        int i11 = this.A0L;
        int pos = Math.max(0, this.A00 - i11);
        int startPos = this.A01.A01();
        int endPos = Math.min(startPos - 1, this.A00 + i11);
        if (startPos == this.A0G) {
            C1885hh c1885hhA07 = null;
            if (A0t[2].length() != 14) {
                A0t[1] = "Tot0RAE";
                int pageLimit = 0;
                while (true) {
                    int curIndex = this.A0r.size();
                    if (pageLimit >= curIndex) {
                        break;
                    }
                    C1885hh c1885hh2 = this.A0r.get(pageLimit);
                    int i12 = c1885hh2.A02;
                    int curIndex2 = this.A00;
                    if (i12 >= curIndex2) {
                        int i13 = c1885hh2.A02;
                        int curIndex3 = this.A00;
                        if (i13 == curIndex3) {
                            c1885hhA07 = c1885hh2;
                        }
                    } else {
                        pageLimit++;
                    }
                }
                if (c1885hhA07 == null && startPos > 0) {
                    int N = this.A00;
                    if (A0t[1].length() != 12) {
                        A0t[2] = "0";
                        c1885hhA07 = A07(N, pageLimit);
                    } else {
                        String[] strArr = A0t;
                        strArr[4] = b.f42142b;
                        strArr[5] = b.f42142b;
                        c1885hhA07 = A07(N, pageLimit);
                    }
                }
                if (c1885hhA07 != null) {
                    float f12 = 0.0f;
                    int i14 = pageLimit - 1;
                    if (i14 >= 0) {
                        C1885hh c1885hh3 = this.A0r.get(i14);
                        String[] strArr2 = A0t;
                        String str = strArr2[3];
                        String str2 = strArr2[6];
                        int iCharAt = str.charAt(15);
                        int curIndex4 = str2.charAt(15);
                        if (iCharAt != curIndex4) {
                            A0t[1] = "VNMCyWdkMCax4jTa2KYBa9F64T8dlp";
                            c1885hh = c1885hh3;
                        }
                    } else {
                        c1885hh = null;
                    }
                    int clientWidth = getClientWidth();
                    if (clientWidth <= 0) {
                        f11 = 0.0f;
                    } else {
                        float f13 = 2.0f - c1885hhA07.A01;
                        int curIndex5 = getPaddingLeft();
                        f11 = f13 + (curIndex5 / clientWidth);
                    }
                    int curIndex6 = this.A00;
                    for (int itemIndex = curIndex6 - 1; itemIndex >= 0; itemIndex--) {
                        if (f12 >= f11 && itemIndex < pos) {
                            if (c1885hh == null) {
                                break;
                            }
                            int curIndex7 = c1885hh.A02;
                            if (itemIndex == curIndex7 && !c1885hh.A04) {
                                this.A0r.remove(i14);
                                this.A01.A07(this, itemIndex, c1885hh.A03);
                                i14--;
                                pageLimit--;
                                c1885hh = i14 >= 0 ? this.A0r.get(i14) : null;
                            }
                        } else if (c1885hh != null && itemIndex == c1885hh.A02) {
                            f12 += c1885hh.A01;
                            String[] strArr3 = A0t;
                            if (strArr3[7].charAt(10) == strArr3[0].charAt(10)) {
                                String[] strArr4 = A0t;
                                strArr4[4] = b.f42142b;
                                strArr4[5] = b.f42142b;
                                i14--;
                                c1885hh = i14 >= 0 ? this.A0r.get(i14) : null;
                            }
                        } else {
                            f12 += A07(itemIndex, i14 + 1).A01;
                            pageLimit++;
                            c1885hh = i14 >= 0 ? this.A0r.get(i14) : null;
                        }
                    }
                    float f14 = c1885hhA07.A01;
                    int i15 = pageLimit + 1;
                    if (f14 < 2.0f) {
                        int curIndex8 = this.A0r.size();
                        if (i15 < curIndex8) {
                            ii2 = this.A0r.get(i15);
                        } else {
                            ii2 = null;
                        }
                        if (clientWidth <= 0) {
                            leftWidthNeeded = 0.0f;
                        } else {
                            int curIndex9 = getPaddingRight();
                            float f15 = curIndex9;
                            float rightWidthNeeded = clientWidth;
                            String[] strArr5 = A0t;
                            String str3 = strArr5[4];
                            String str4 = strArr5[5];
                            int length = str3.length();
                            int curIndex10 = str4.length();
                            if (length != curIndex10) {
                                throw new RuntimeException();
                            }
                            String[] strArr6 = A0t;
                            strArr6[4] = b.f42142b;
                            strArr6[5] = b.f42142b;
                            leftWidthNeeded = (f15 / rightWidthNeeded) + 2.0f;
                        }
                        int curIndex11 = this.A00;
                        for (int i16 = curIndex11 + 1; i16 < startPos; i16++) {
                            if (f14 >= leftWidthNeeded && i16 > endPos) {
                                if (ii2 == null) {
                                    break;
                                }
                                int curIndex12 = ii2.A02;
                                if (i16 == curIndex12 && !ii2.A04) {
                                    this.A0r.remove(i15);
                                    this.A01.A07(this, i16, ii2.A03);
                                    int curIndex13 = this.A0r.size();
                                    if (i15 < curIndex13) {
                                        C1885hh ii3 = this.A0r.get(i15);
                                        ii2 = ii3;
                                    } else {
                                        ii2 = null;
                                    }
                                }
                            } else if (ii2 != null) {
                                int curIndex14 = ii2.A02;
                                if (i16 == curIndex14) {
                                    f14 += ii2.A01;
                                    i15++;
                                    int curIndex15 = this.A0r.size();
                                    if (i15 < curIndex15) {
                                        C1885hh ii4 = this.A0r.get(i15);
                                        ii2 = ii4;
                                    } else {
                                        ii2 = null;
                                    }
                                } else {
                                    C1885hh c1885hhA072 = A07(i16, i15);
                                    i15++;
                                    f14 += c1885hhA072.A01;
                                    int curIndex16 = this.A0r.size();
                                    if (i15 < curIndex16) {
                                        C1885hh ii5 = this.A0r.get(i15);
                                        ii2 = ii5;
                                    } else {
                                        ii2 = null;
                                    }
                                }
                            }
                        }
                    }
                    A0S(c1885hhA07, pageLimit, curItem);
                }
                int N2 = getChildCount();
                for (int i17 = 0; i17 < N2; i17++) {
                    View childAt = getChildAt(i17);
                    C1886hi c1886hi = (C1886hi) childAt.getLayoutParams();
                    c1886hi.A01 = i17;
                    if (!c1886hi.A05 && c1886hi.A00 == 0.0f) {
                        C1885hh c1885hhA09 = A09(childAt);
                        String[] strArr7 = A0t;
                        String str5 = strArr7[7];
                        String str6 = strArr7[0];
                        int iCharAt2 = str5.charAt(10);
                        int curIndex17 = str6.charAt(10);
                        if (iCharAt2 != curIndex17) {
                            if (c1885hhA09 != null) {
                                c1886hi.A00 = c1885hhA09.A01;
                                int curIndex18 = c1885hhA09.A02;
                                c1886hi.A02 = curIndex18;
                            }
                        } else {
                            A0t[1] = "EEa7ILjnbFiKaMBJBW0FEjvS9loAIL";
                            if (c1885hhA09 != null) {
                            }
                        }
                    }
                }
                A0D();
                String[] strArr8 = A0t;
                String str7 = strArr8[4];
                String resName = strArr8[5];
                if (str7.length() != resName.length()) {
                    throw new RuntimeException();
                }
                String[] strArr9 = A0t;
                strArr9[7] = "fAvJTe45YQ8jwRLJzle6w88GhXZAW5fe";
                strArr9[0] = "XHTmtVqtTM8ykl9XiQ4ZuPNQzfhQsr72";
                if (hasFocus()) {
                    View currentFocused = findFocus();
                    String[] strArr10 = A0t;
                    if (strArr10[3].charAt(15) == strArr10[6].charAt(15)) {
                        throw new RuntimeException();
                    }
                    String[] strArr11 = A0t;
                    strArr11[3] = "98nQxxcA6vj5924MyChW7mkeiNJnWKv2";
                    strArr11[6] = "ju5RZqhAYuaQhiOPGNIJcLOaoEeV3OP8";
                    if (currentFocused != null) {
                        c1885hhA08 = A08(currentFocused);
                    } else {
                        c1885hhA08 = null;
                    }
                    if (c1885hhA08 == null || c1885hhA08.A02 != this.A00) {
                        for (int i18 = 0; i18 < getChildCount(); i18++) {
                            View childAt2 = getChildAt(i18);
                            C1885hh c1885hhA092 = A09(childAt2);
                            if (c1885hhA092 != null && c1885hhA092.A02 == this.A00 && childAt2.requestFocus(2)) {
                                return;
                            }
                        }
                        return;
                    }
                    return;
                }
                return;
            }
        } else {
            try {
                Resources resources = getResources();
                int curIndex19 = getId();
                hexString = resources.getResourceName(curIndex19);
            } catch (Resources.NotFoundException unused) {
                int curIndex20 = getId();
                hexString = Integer.toHexString(curIndex20);
                if (A0t[2].length() != 14) {
                    A0t[2] = "3cJ8G";
                }
            }
            StringBuilder sb2 = new StringBuilder();
            String resName2 = A0A(158, 142, 58);
            StringBuilder sbAppend = sb2.append(resName2).append(this.A0G);
            String resName3 = A0A(77, 9, 42);
            StringBuilder sbAppend2 = sbAppend.append(resName3).append(startPos);
            String resName4 = A0A(18, 11, 72);
            StringBuilder sbAppend3 = sbAppend2.append(resName4).append(hexString);
            String resName5 = A0A(4, 14, 58);
            StringBuilder sbAppend4 = sbAppend3.append(resName5).append(getClass());
            String resName6 = A0A(29, 22, 86);
            throw new IllegalStateException(sbAppend4.append(resName6).append(this.A01.getClass()).toString());
        }
        throw new RuntimeException();
    }

    private void A0J(int i5, float f11, int i11) {
        if (this.A0d != null) {
            int z11 = this.A0d.size();
            for (int i12 = 0; i12 < z11; i12++) {
                this.A0d.get(i12);
            }
        }
    }

    private final void A0K(int childLeft, float f11, int i5) {
        int iMax;
        if (this.A0D > 0) {
            int hgrav = getScrollX();
            int width = getPaddingLeft();
            int paddingRight = getPaddingRight();
            if (A0t[1].length() != 12) {
                String[] strArr = A0t;
                strArr[3] = "hSwONVQ9BwzgmNPK4tziO3X6uj4eQvsQ";
                strArr[6] = "gKhZoL4mhYlFRC9fFMXnjqdiW6EOuKfZ";
                int paddingLeft = getWidth();
                int scrollX = getChildCount();
                for (int childCount = 0; childCount < scrollX; childCount++) {
                    View childAt = getChildAt(childCount);
                    C1886hi c1886hi = (C1886hi) childAt.getLayoutParams();
                    if (c1886hi.A05) {
                        int paddingRight2 = c1886hi.A04;
                        switch (paddingRight2 & 7) {
                            case 1:
                                int paddingRight3 = childAt.getMeasuredWidth();
                                iMax = Math.max((paddingLeft - paddingRight3) / 2, width);
                                break;
                            case 2:
                            case 4:
                            default:
                                iMax = width;
                                break;
                            case 3:
                                iMax = width;
                                int paddingRight4 = childAt.getWidth();
                                width += paddingRight4;
                                break;
                            case 5:
                                int paddingRight5 = childAt.getMeasuredWidth();
                                iMax = (paddingLeft - paddingRight) - paddingRight5;
                                int paddingRight6 = childAt.getMeasuredWidth();
                                paddingRight += paddingRight6;
                                break;
                        }
                        int paddingRight7 = childAt.getLeft();
                        int i11 = (iMax + hgrav) - paddingRight7;
                        if (i11 != 0) {
                            childAt.offsetLeftAndRight(i11);
                        }
                    }
                }
            } else {
                throw new RuntimeException();
            }
        }
        A0J(childLeft, f11, i5);
        if (0 != 0) {
            getScrollX();
            int childCount2 = getChildCount();
            for (int i12 = 0; i12 < childCount2; i12++) {
                View childAt2 = getChildAt(i12);
                if (!((C1886hi) childAt2.getLayoutParams()).A05) {
                    childAt2.getLeft();
                    getClientWidth();
                    throw new NullPointerException(A0A(450, 13, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
                }
            }
        }
        this.A0e = true;
    }

    private void A0M(int i5, int i11, int i12, int i13) {
        if (i11 > 0) {
            ArrayList<C1885hh> arrayList = this.A0r;
            String[] strArr = A0t;
            if (strArr[7].charAt(10) != strArr[0].charAt(10)) {
                throw new RuntimeException();
            }
            A0t[1] = "xS6wP2kv8Ukjp2mlI4OFB7EI";
            if (!arrayList.isEmpty()) {
                boolean zIsFinished = this.A0X.isFinished();
                if (A0t[1].length() == 12) {
                    throw new RuntimeException();
                }
                A0t[2] = "M3IvNYMGgF0qb538wmgDMK0nNkgqAt";
                if (!zIsFinished) {
                    this.A0X.setFinalX(getCurrentItem() * getClientWidth());
                    return;
                }
                int paddingLeft = ((i5 - getPaddingLeft()) - getPaddingRight()) + i12;
                int widthWithMargin = getPaddingLeft();
                int i14 = i11 - widthWithMargin;
                int widthWithMargin2 = getPaddingRight();
                int i15 = (i14 - widthWithMargin2) + i13;
                int widthWithMargin3 = getScrollX();
                int oldWidthWithMargin = (int) (paddingLeft * (widthWithMargin3 / i15));
                int widthWithMargin4 = getScrollY();
                scrollTo(oldWidthWithMargin, widthWithMargin4);
                return;
            }
        }
        C1885hh ii2 = A06(this.A00);
        float scrollOffset = ii2 != null ? Math.min(ii2.A00, this.A07) : 0.0f;
        int paddingLeft2 = (int) (((i5 - getPaddingLeft()) - getPaddingRight()) * scrollOffset);
        if (paddingLeft2 != getScrollX()) {
            A0T(false);
            scrollTo(paddingLeft2, getScrollY());
        }
    }

    private final void A0N(int i5, boolean z11) throws Resources.NotFoundException {
        this.A0m = false;
        A0P(i5, z11, false);
    }

    private void A0O(int i5, boolean z11, int i11, boolean z12) throws Resources.NotFoundException {
        C1885hh c1885hhA06 = A06(i5);
        int clientWidth = 0;
        if (c1885hhA06 != null) {
            clientWidth = (int) (getClientWidth() * Math.max(this.A02, Math.min(c1885hhA06.A00, this.A07)));
        }
        int destX = A0t[2].length();
        if (destX == 14) {
            throw new RuntimeException();
        }
        String[] strArr = A0t;
        strArr[3] = "qWyJthdIKprwmupmlWytZXkwKuTz6nwm";
        strArr[6] = "fDmSwMvEmt93O90vXMKXMmFP8biUMO95";
        if (z11) {
            A0L(clientWidth, 0, i11);
            if (z12) {
                A0G(i5);
                return;
            }
            return;
        }
        if (z12) {
            A0G(i5);
        }
        A0T(false);
        scrollTo(clientWidth, 0);
        A0b(clientWidth);
    }

    private final void A0P(int i5, boolean z11, boolean z12) throws Resources.NotFoundException {
        A0Q(i5, z11, z12, 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x006a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A0Q(int i5, boolean z11, boolean z12, int i11) throws Resources.NotFoundException {
        if (this.A01 == null || this.A01.A01() <= 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (!z12 && this.A00 == i5 && this.A0r.size() != 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (i5 < 0) {
            i5 = 0;
        } else if (i5 >= this.A01.A01()) {
            i5 = this.A01.A01() - 1;
        }
        int i12 = this.A0L;
        if (i5 <= this.A00 + i12) {
            int i13 = this.A00;
            String[] strArr = A0t;
            if (strArr[7].charAt(10) != strArr[0].charAt(10)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0t;
            strArr2[3] = "HdD8kb8A1NTv0LjA3C8pNf8B8Uhf5Rjf";
            strArr2[6] = "hEPxY7plOgAB5ujpSYVhyDABeqG0KedF";
            if (i5 < i13 - i12) {
                for (int i14 = 0; i14 < this.A0r.size(); i14++) {
                    this.A0r.get(i14).A04 = true;
                }
            }
        }
        boolean z13 = this.A00 != i5;
        boolean dispatchSelected = this.A0g;
        if (dispatchSelected) {
            this.A00 = i5;
            if (z13) {
                A0G(i5);
            }
            requestLayout();
            return;
        }
        A0I(i5);
        A0O(i5, z11, i11, z13);
    }

    private void A0R(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        int pointerId = motionEvent.getPointerId(actionIndex);
        int pointerIndex = this.A08;
        if (pointerId == pointerIndex) {
            int i5 = actionIndex == 0 ? 1 : 0;
            this.A05 = motionEvent.getX(i5);
            String[] strArr = A0t;
            String str = strArr[4];
            String str2 = strArr[5];
            int pointerId2 = str.length();
            int pointerIndex2 = str2.length();
            if (pointerId2 != pointerIndex2) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0t;
            strArr2[4] = b.f42142b;
            strArr2[5] = b.f42142b;
            int pointerIndex3 = motionEvent.getPointerId(i5);
            this.A08 = pointerIndex3;
            if (this.A0U != null) {
                this.A0U.clear();
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:10:0x0024 */
    /* JADX WARN: Incorrect condition in loop: B:20:0x0051 */
    /* JADX WARN: Incorrect condition in loop: B:32:0x0095 */
    /* JADX WARN: Incorrect condition in loop: B:58:0x011f */
    /* JADX WARN: Incorrect condition in loop: B:70:0x015e */
    /* JADX WARN: Removed duplicated region for block: B:76:0x018b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0S(C1885hh c1885hh, int i5, C1885hh c1885hh2) {
        float f11;
        float f12;
        C1885hh c1885hh3;
        C1885hh c1885hh4;
        int iA01 = this.A01.A01();
        int width = getClientWidth();
        if (width > 0) {
            int N = this.A0M;
            f11 = N / width;
        } else {
            f11 = 0.0f;
        }
        if (c1885hh2 != null) {
            int width2 = c1885hh2.A02;
            int N2 = c1885hh.A02;
            if (width2 < N2) {
                int i11 = 0;
                float fA00 = c1885hh2.A00 + c1885hh2.A01 + f11;
                int i12 = width2 + 1;
                while (i12 <= N) {
                    int N3 = this.A0r.size();
                    if (i11 >= N3) {
                        break;
                    }
                    C1885hh c1885hh5 = this.A0r.get(i11);
                    while (true) {
                        c1885hh4 = c1885hh5;
                        int N4 = c1885hh4.A02;
                        if (i12 <= N4) {
                            break;
                        }
                        int N5 = this.A0r.size();
                        if (i11 >= N5 - 1) {
                            break;
                        }
                        i11++;
                        c1885hh5 = this.A0r.get(i11);
                    }
                    while (i12 < N) {
                        AbstractC1865hM abstractC1865hM = this.A01;
                        if (A0t[2].length() == 14) {
                            throw new RuntimeException();
                        }
                        A0t[2] = "unjnr1JPHveRA3A";
                        fA00 += abstractC1865hM.A00(i12) + f11;
                        i12++;
                    }
                    c1885hh4.A00 = fA00;
                    fA00 += c1885hh4.A01 + f11;
                    i12++;
                }
            } else {
                int N6 = c1885hh.A02;
                if (width2 > N6) {
                    int N7 = this.A0r.size();
                    int i13 = N7 - 1;
                    float fA002 = c1885hh2.A00;
                    int i14 = width2 - 1;
                    while (i14 >= N && i13 >= 0) {
                        C1885hh c1885hh6 = this.A0r.get(i13);
                        while (true) {
                            c1885hh3 = c1885hh6;
                            int N8 = c1885hh3.A02;
                            if (i14 >= N8 || i13 <= 0) {
                                break;
                            }
                            i13--;
                            c1885hh6 = this.A0r.get(i13);
                        }
                        while (true) {
                            int i15 = c1885hh3.A02;
                            String[] strArr = A0t;
                            String str = strArr[4];
                            String str2 = strArr[5];
                            int width3 = str.length();
                            int N9 = str2.length();
                            if (width3 != N9) {
                                A0t[1] = "tUoZSKhLB59JJ";
                                if (i14 > i15) {
                                    fA002 -= this.A01.A00(i14) + f11;
                                    i14--;
                                }
                            } else {
                                A0t[2] = "eK1wjFwqyv9CJUk";
                                if (i14 > i15) {
                                    fA002 -= this.A01.A00(i14) + f11;
                                    i14--;
                                }
                            }
                        }
                        fA002 -= c1885hh3.A01 + f11;
                        c1885hh3.A00 = fA002;
                        i14--;
                    }
                }
            }
        }
        int i16 = this.A0r.size();
        float offset = c1885hh.A00;
        int N10 = c1885hh.A02;
        int pos = N10 - 1;
        int N11 = c1885hh.A02;
        this.A02 = N11 == 0 ? c1885hh.A00 : -3.4028235E38f;
        int N12 = iA01 - 1;
        if (c1885hh.A02 == N12) {
            f12 = (c1885hh.A00 + c1885hh.A01) - 1.0f;
        } else {
            f12 = Float.MAX_VALUE;
        }
        this.A07 = f12;
        int i17 = i5 - 1;
        while (i17 >= 0) {
            C1885hh c1885hh7 = this.A0r.get(i17);
            while (pos > N) {
                offset -= this.A01.A00(pos) + f11;
                pos--;
            }
            offset -= c1885hh7.A01 + f11;
            c1885hh7.A00 = offset;
            int N13 = c1885hh7.A02;
            if (N13 == 0) {
                this.A02 = offset;
            }
            i17--;
            pos--;
        }
        float offset2 = c1885hh.A00;
        float offset3 = offset2 + c1885hh.A01 + f11;
        int N14 = c1885hh.A02;
        int i18 = N14 + 1;
        int i19 = i5 + 1;
        while (i19 < i16) {
            C1885hh c1885hh8 = this.A0r.get(i19);
            while (i18 < N) {
                offset3 += this.A01.A00(i18) + f11;
                i18++;
            }
            int i21 = c1885hh8.A02;
            if (A0t[2].length() != 14) {
                String[] strArr2 = A0t;
                strArr2[3] = "LKMrFShf3NXE5XfaxsCGHUW3hns0S8Wh";
                strArr2[6] = "xptjAJKkekqR5TDnJjimQZvUd22mQJJ9";
                int N15 = iA01 - 1;
                if (i21 == N15) {
                    this.A07 = (c1885hh8.A01 + offset3) - 1.0f;
                }
            } else {
                int N16 = iA01 - 1;
                if (i21 == N16) {
                }
            }
            c1885hh8.A00 = offset3;
            offset3 += c1885hh8.A01 + f11;
            i19++;
            i18++;
        }
        this.A0l = false;
    }

    private void A0T(boolean z11) {
        boolean z12 = this.A0P == 2;
        if (z12) {
            setScrollingCacheEnabled(false);
            boolean needPopulate = this.A0X.isFinished();
            if (!needPopulate) {
                this.A0X.abortAnimation();
                if (A0t[1].length() == 12) {
                    throw new RuntimeException();
                }
                A0t[1] = "La7";
                int scrollX = getScrollX();
                int oldX = getScrollY();
                int currX = this.A0X.getCurrX();
                int currY = this.A0X.getCurrY();
                if (scrollX != currX || oldX != currY) {
                    scrollTo(currX, currY);
                    if (currX != scrollX) {
                        A0b(currX);
                    }
                }
            }
        }
        this.A0m = false;
        for (int i5 = 0; i5 < this.A0r.size(); i5++) {
            C1885hh c1885hh = this.A0r.get(i5);
            boolean needPopulate2 = c1885hh.A04;
            if (needPopulate2) {
                z12 = true;
                c1885hh.A04 = false;
            }
        }
        if (z12) {
            if (z11) {
                AbstractC1880hb.A0D(this, this.A0q);
            } else {
                this.A0q.run();
            }
        }
    }

    private void A0U(boolean z11) {
        int layerType;
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            if (z11) {
                layerType = this.A0N;
            } else {
                layerType = 0;
            }
            getChildAt(i5).setLayerType(layerType, null);
        }
    }

    private void A0V(boolean z11) {
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(z11);
        }
    }

    private boolean A0W() {
        this.A08 = -1;
        A0B();
        this.A0V.onRelease();
        this.A0W.onRelease();
        return this.A0V.isFinished() || this.A0W.isFinished();
    }

    private final boolean A0X() throws Resources.NotFoundException {
        if (this.A00 > 0) {
            A0N(this.A00 - 1, true);
            return true;
        }
        return false;
    }

    private final boolean A0Y() throws Resources.NotFoundException {
        if (this.A01 != null && this.A00 < this.A01.A01() - 1) {
            A0N(this.A00 + 1, true);
            return true;
        }
        if (A0t[2].length() == 14) {
            throw new RuntimeException();
        }
        String[] strArr = A0t;
        strArr[7] = "AXA5EDUbYu85ntxkUdYhY3hIIlQIUQar";
        strArr[0] = "7HhQN1X94o8BEMOAnE9vO9t08zapWTmy";
        return false;
    }

    private boolean A0Z(float f11) {
        boolean z11 = false;
        float f12 = this.A05 - f11;
        this.A05 = f11;
        float scrollX = getScrollX() + f12;
        int clientWidth = getClientWidth();
        float f13 = clientWidth * this.A02;
        float deltaX = clientWidth;
        float deltaX2 = deltaX * this.A07;
        boolean rightAbsolute = true;
        boolean leftAbsolute = true;
        C1885hh c1885hh = this.A0r.get(0);
        C1885hh c1885hh2 = this.A0r.get(this.A0r.size() - 1);
        if (c1885hh.A02 != 0) {
            rightAbsolute = false;
            float f14 = c1885hh.A00;
            if (A0t[1].length() == 12) {
                throw new RuntimeException();
            }
            A0t[1] = "a";
            f13 = f14 * clientWidth;
        }
        if (c1885hh2.A02 != this.A01.A01() - 1) {
            leftAbsolute = false;
            float deltaX3 = c1885hh2.A00;
            deltaX2 = deltaX3 * clientWidth;
        }
        if (scrollX < f13) {
            if (rightAbsolute) {
                this.A0V.onPull(Math.abs(f13 - scrollX) / clientWidth);
                z11 = true;
            }
            scrollX = f13;
        } else if (scrollX > deltaX2) {
            if (leftAbsolute) {
                EdgeEffect edgeEffect = this.A0W;
                float fAbs = Math.abs(scrollX - deltaX2);
                float scrollX2 = clientWidth;
                String[] strArr = A0t;
                if (strArr[4].length() != strArr[5].length()) {
                    edgeEffect.onPull(fAbs / scrollX2);
                    z11 = true;
                } else {
                    A0t[1] = "TwKB2lBmR";
                    edgeEffect.onPull(fAbs / scrollX2);
                    z11 = true;
                }
            }
            scrollX = deltaX2;
        }
        this.A05 += scrollX - ((int) scrollX);
        scrollTo((int) scrollX, getScrollY());
        A0b((int) scrollX);
        return z11;
    }

    private final boolean A0a(float f11, float f12) {
        if (f11 >= this.A0I || f12 <= 0.0f) {
            if (f11 > getWidth() - this.A0I) {
                if (A0t[2].length() == 14) {
                    throw new RuntimeException();
                }
                String[] strArr = A0t;
                strArr[3] = "LoLbwLodEQ0RZhoADzk4YxqyeMxGbPNe";
                strArr[6] = "uXFtlpuRRgamX4n9Zkql1HjWorEkSQ7b";
                if (f12 < 0.0f) {
                }
            }
            return false;
        }
        return true;
    }

    private boolean A0b(int i5) {
        int size = this.A0r.size();
        String strA0A = A0A(397, 53, 60);
        if (size == 0) {
            if (this.A0g) {
                return false;
            }
            this.A0e = false;
            A0K(0, 0.0f, 0);
            String[] strArr = A0t;
            if (strArr[4].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            A0t[2] = "c3ramapljB1reDSufYjA";
            if (this.A0e) {
                return false;
            }
            throw new IllegalStateException(strA0A);
        }
        C1885hh c1885hhA05 = A05();
        int clientWidth = getClientWidth();
        int currentPage = this.A0M + clientWidth;
        float marginOffset = this.A0M / clientWidth;
        int i11 = c1885hhA05.A02;
        float f11 = ((i5 / clientWidth) - c1885hhA05.A00) / (c1885hhA05.A01 + marginOffset);
        this.A0e = false;
        A0K(i11, f11, (int) (currentPage * f11));
        if (this.A0e) {
            return true;
        }
        throw new IllegalStateException(strA0A);
    }

    private final boolean A0c(int i5) throws Resources.NotFoundException {
        View viewFindFocus = findFocus();
        if (viewFindFocus == this) {
            viewFindFocus = null;
        } else if (viewFindFocus != null) {
            boolean z11 = false;
            ViewParent parent = viewFindFocus.getParent();
            while (true) {
                if (!(parent instanceof ViewGroup)) {
                    break;
                }
                if (parent == this) {
                    z11 = true;
                    break;
                }
                parent = parent.getParent();
            }
            if (!z11) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(viewFindFocus.getClass().getSimpleName());
                for (ViewParent parent2 = viewFindFocus.getParent(); parent2 instanceof ViewGroup; parent2 = parent2.getParent()) {
                    sb2.append(A0A(0, 4, 21)).append(parent2.getClass().getSimpleName());
                }
                Log.e(A0A(300, 9, 47), A0A(Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE, 72, 80) + sb2.toString());
                viewFindFocus = null;
            }
        }
        boolean zA0X = false;
        View nextFocused = FocusFinder.getInstance().findNextFocus(this, viewFindFocus, i5);
        if (nextFocused != null && nextFocused != viewFindFocus) {
            if (i5 == 17) {
                zA0X = (viewFindFocus == null || A04(this.A0o, nextFocused).left < A04(this.A0o, viewFindFocus).left) ? nextFocused.requestFocus() : A0X();
            } else if (i5 == 66) {
                zA0X = (viewFindFocus == null || A04(this.A0o, nextFocused).left > A04(this.A0o, viewFindFocus).left) ? nextFocused.requestFocus() : A0Y();
            }
        } else if (i5 == 17 || i5 == 1) {
            zA0X = A0X();
        } else if (i5 == 66 || i5 == 2) {
            zA0X = A0Y();
        }
        if (zA0X) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i5));
        }
        return zA0X;
    }

    private final boolean A0d(KeyEvent keyEvent) {
        if (keyEvent.getAction() != 0) {
            return false;
        }
        switch (keyEvent.getKeyCode()) {
            case 21:
                boolean handled = keyEvent.hasModifiers(2);
                if (handled) {
                    return A0X();
                }
                return A0c(17);
            case 22:
                boolean zHasModifiers = keyEvent.hasModifiers(2);
                String[] strArr = A0t;
                if (strArr[4].length() != strArr[5].length()) {
                    throw new RuntimeException();
                }
                A0t[1] = "lC1XoLB2bpdljamdt6Vm";
                if (zHasModifiers) {
                    return A0Y();
                }
                return A0c(66);
            case 61:
                boolean handled2 = keyEvent.hasNoModifiers();
                if (handled2) {
                    return A0c(2);
                }
                boolean handled3 = keyEvent.hasModifiers(1);
                if (!handled3) {
                    return false;
                }
                return A0c(1);
            default:
                return false;
        }
    }

    public static boolean A0e(View view) {
        return view.getClass().getAnnotation(ViewPager$DecorView.class) != null;
    }

    private final boolean A0f(View view, boolean z11, int i5, int i11, int i12) {
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                if (i11 + scrollX >= childAt.getLeft() && i11 + scrollX < childAt.getRight() && i12 + scrollY >= childAt.getTop() && i12 + scrollY < childAt.getBottom()) {
                    int left = (i11 + scrollX) - childAt.getLeft();
                    int i13 = i12 + scrollY;
                    int i14 = childAt.getTop();
                    if (A0t[1].length() == 12) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A0t;
                    strArr[4] = b.f42142b;
                    strArr[5] = b.f42142b;
                    if (A0f(childAt, true, i5, left, i13 - i14)) {
                        return true;
                    }
                }
            }
        }
        return z11 && view.canScrollHorizontally(-i5);
    }

    /* JADX WARN: Incorrect condition in loop: B:9:0x002a */
    /* JADX WARN: Removed duplicated region for block: B:27:0x007b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0g() throws Resources.NotFoundException {
        boolean z11;
        int iA01 = this.A01.A01();
        this.A0G = iA01;
        int size = this.A0r.size();
        int adapterCount = this.A0L;
        if (size < (adapterCount * 2) + 1) {
            int adapterCount2 = this.A0r.size();
            z11 = adapterCount2 < iA01;
        }
        int i5 = this.A00;
        boolean z12 = false;
        int newCurrItem = 0;
        while (newCurrItem < adapterCount) {
            C1885hh c1885hh = this.A0r.get(newCurrItem);
            int iA02 = this.A01.A02(c1885hh.A03);
            if (iA02 != -1) {
                if (iA02 == -2) {
                    this.A0r.remove(newCurrItem);
                    newCurrItem--;
                    if (!z12) {
                        z12 = true;
                    }
                    this.A01.A07(this, c1885hh.A02, c1885hh.A03);
                    z11 = true;
                    int i11 = this.A00;
                    int adapterCount3 = c1885hh.A02;
                    if (i11 == adapterCount3) {
                        int adapterCount4 = iA01 - 1;
                        i5 = Math.max(0, Math.min(this.A00, adapterCount4));
                        z11 = true;
                    }
                } else {
                    int adapterCount5 = c1885hh.A02;
                    if (adapterCount5 != iA02) {
                        int i12 = c1885hh.A02;
                        int adapterCount6 = this.A00;
                        if (i12 == adapterCount6) {
                            i5 = iA02;
                        }
                        c1885hh.A02 = iA02;
                        z11 = true;
                    }
                }
            }
            newCurrItem++;
        }
        Collections.sort(this.A0r, A0x);
        if (z11) {
            int childCount = getChildCount();
            for (int newCurrItem2 = 0; newCurrItem2 < childCount; newCurrItem2++) {
                C1886hi c1886hi = (C1886hi) getChildAt(newCurrItem2).getLayoutParams();
                if (!c1886hi.A05) {
                    c1886hi.A00 = 0.0f;
                }
            }
            A0P(i5, false, true);
            if (A0t[2].length() == 14) {
                throw new RuntimeException();
            }
            A0t[2] = "iBz2AIJ6C";
            requestLayout();
        }
    }

    public final void A0h() throws Resources.NotFoundException {
        A0I(this.A00);
    }

    /* JADX WARN: Incorrect condition in loop: B:6:0x0011 */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void addFocusables(ArrayList<View> arrayList, int i5, int i11) {
        C1885hh c1885hhA09;
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i12 = 0; i12 < focusableCount; i12++) {
                View childAt = getChildAt(i12);
                int focusableCount = childAt.getVisibility();
                if (focusableCount == 0 && (c1885hhA09 = A09(childAt)) != null) {
                    int descendantFocusability2 = c1885hhA09.A02;
                    int focusableCount2 = this.A00;
                    if (descendantFocusability2 == focusableCount2) {
                        childAt.addFocusables(arrayList, i5, i11);
                    }
                }
            }
        }
        if (descendantFocusability == 262144) {
            int focusableCount3 = arrayList.size();
            if (size != focusableCount3) {
                return;
            }
        }
        if (!isFocusable()) {
            return;
        }
        int descendantFocusability3 = i11 & 1;
        if ((descendantFocusability3 != 1 || !isInTouchMode() || isFocusableInTouchMode()) && arrayList != null) {
            arrayList.add(this);
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (!checkLayoutParams(layoutParams)) {
            layoutParams = generateLayoutParams(layoutParams);
        }
        C1886hi c1886hi = (C1886hi) layoutParams;
        c1886hi.A05 |= A0e(view);
        if (this.A0h) {
            if (c1886hi == null || !c1886hi.A05) {
                c1886hi.A03 = true;
                if (A0t[2].length() == 14) {
                    throw new RuntimeException();
                }
                A0t[1] = "XL6oa3uLuKs2IOpHyjfCXdHiJnTalh";
                addViewInLayout(view, i5, layoutParams);
                return;
            }
            throw new IllegalStateException(A0A(86, 41, 16));
        }
        super.addView(view, i5, layoutParams);
    }

    @Override // android.view.View
    public final boolean canScrollHorizontally(int i5) {
        if (this.A01 == null) {
            return false;
        }
        int width = getClientWidth();
        int scrollX = getScrollX();
        return i5 < 0 ? scrollX > ((int) (((float) width) * this.A02)) : i5 > 0 && scrollX < ((int) (((float) width) * this.A07));
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof C1886hi) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.View
    public final void computeScroll() {
        this.A0j = true;
        if (!this.A0X.isFinished() && this.A0X.computeScrollOffset()) {
            int scrollX = getScrollX();
            int y11 = getScrollY();
            int x11 = this.A0X.getCurrX();
            int oldY = this.A0X.getCurrY();
            if (scrollX != x11 || y11 != oldY) {
                scrollTo(x11, oldY);
                if (!A0b(x11)) {
                    this.A0X.abortAnimation();
                    scrollTo(0, oldY);
                }
            }
            AbstractC1880hb.A07(this);
            return;
        }
        A0T(true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || A0d(keyEvent);
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        C1885hh c1885hhA09;
        if (accessibilityEvent.getEventType() == 4096) {
            return super.dispatchPopulateAccessibilityEvent(accessibilityEvent);
        }
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            int childCount2 = childAt.getVisibility();
            if (childCount2 == 0 && (c1885hhA09 = A09(childAt)) != null) {
                int i11 = c1885hhA09.A02;
                String[] strArr = A0t;
                String str = strArr[7];
                String str2 = strArr[0];
                int i12 = str.charAt(10);
                int childCount3 = str2.charAt(10);
                if (i12 != childCount3) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0t;
                strArr2[4] = b.f42142b;
                strArr2[5] = b.f42142b;
                int childCount4 = this.A00;
                if (i11 == childCount4 && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0096  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void draw(Canvas canvas) {
        boolean needsInvalidate;
        super.draw(canvas);
        boolean z11 = false;
        int overScrollMode = getOverScrollMode();
        if (overScrollMode == 0) {
            boolean zIsFinished = this.A0V.isFinished();
            int overScrollMode2 = A0t[1].length();
            if (overScrollMode2 != 12) {
                A0t[1] = "sR19g1oBfMrUqPxbyG4ArbsnA";
                if (!zIsFinished) {
                    int iSave = canvas.save();
                    int width = (getHeight() - getPaddingTop()) - getPaddingBottom();
                    int height = getWidth();
                    canvas.rotate(270.0f);
                    int overScrollMode3 = -width;
                    canvas.translate(overScrollMode3 + getPaddingTop(), this.A02 * height);
                    this.A0V.setSize(width, height);
                    boolean needsInvalidate2 = this.A0V.draw(canvas);
                    z11 = false | needsInvalidate2;
                    canvas.restoreToCount(iSave);
                }
                needsInvalidate = this.A0W.isFinished();
                if (!needsInvalidate) {
                    int width2 = canvas.save();
                    int width3 = getWidth();
                    int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                    canvas.rotate(90.0f);
                    canvas.translate(-getPaddingTop(), (-(this.A07 + 1.0f)) * width3);
                    this.A0W.setSize(height2, width3);
                    boolean needsInvalidate3 = this.A0W.draw(canvas);
                    z11 |= needsInvalidate3;
                    canvas.restoreToCount(width2);
                }
            } else {
                String[] strArr = A0t;
                strArr[4] = b.f42142b;
                strArr[5] = b.f42142b;
                if (!zIsFinished) {
                }
                needsInvalidate = this.A0W.isFinished();
                if (!needsInvalidate) {
                }
            }
        } else {
            if (overScrollMode == 1) {
                AbstractC1865hM abstractC1865hM = this.A01;
                String[] strArr2 = A0t;
                String str = strArr2[7];
                String str2 = strArr2[0];
                int overScrollMode4 = str.charAt(10);
                if (overScrollMode4 != str2.charAt(10)) {
                    throw new RuntimeException();
                }
                A0t[1] = "uCo1AgFx4bPu4bwpitwpleYcuNfeFds";
                if (abstractC1865hM == null || this.A01.A01() <= 1) {
                }
            }
            this.A0V.finish();
            this.A0W.finish();
        }
        if (z11) {
            AbstractC1880hb.A07(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.A0S;
        if (drawable != null && drawable.isStateful()) {
            drawable.setState(getDrawableState());
        }
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new C1886hi();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new C1886hi(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return generateDefaultLayoutParams();
    }

    public AbstractC1865hM getAdapter() {
        return this.A01;
    }

    @Override // android.view.ViewGroup
    public final int getChildDrawingOrder(int i5, int i11) {
        int result = this.A0F == 2 ? (i5 - 1) - i11 : i11;
        int index = ((C1886hi) this.A0b.get(result).getLayoutParams()).A01;
        return index;
    }

    private int getClientWidth() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    public int getCurrentItem() {
        return this.A00;
    }

    public int getOffscreenPageLimit() {
        return this.A0L;
    }

    public int getPageMargin() {
        return this.A0M;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.A0g = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        removeCallbacks(this.A0q);
        if (this.A0X != null && !this.A0X.isFinished()) {
            this.A0X.abortAnimation();
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        float f11;
        super.onDraw(canvas);
        if (this.A0M > 0 && this.A0S != null && this.A0r.size() > 0 && this.A01 != null) {
            int lastPos = getScrollX();
            int firstPos = getWidth();
            float f12 = this.A0M / firstPos;
            int i5 = 0;
            C1885hh c1885hh = this.A0r.get(0);
            float f13 = c1885hh.A00;
            int size = this.A0r.size();
            int i11 = this.A0r.get(size - 1).A02;
            loop0: for (int itemIndex = c1885hh.A02; itemIndex < i11; itemIndex++) {
                while (itemIndex > c1885hh.A02 && i5 < size) {
                    i5++;
                    C1885hh c1885hh2 = this.A0r.get(i5);
                    String[] strArr = A0t;
                    String str = strArr[7];
                    String str2 = strArr[0];
                    int scrollX = str.charAt(10);
                    if (scrollX != str2.charAt(10)) {
                        break loop0;
                    }
                    A0t[2] = "Qpfq";
                    c1885hh = c1885hh2;
                }
                if (itemIndex == c1885hh.A02) {
                    f11 = (c1885hh.A00 + c1885hh.A01) * firstPos;
                    f13 = c1885hh.A00 + c1885hh.A01 + f12;
                } else {
                    float fA00 = this.A01.A00(itemIndex);
                    f11 = (f13 + fA00) * firstPos;
                    f13 += fA00 + f12;
                }
                if (this.A0M + f11 > lastPos) {
                    Drawable drawable = this.A0S;
                    int iRound = Math.round(f11);
                    int i12 = this.A0Q;
                    int scrollX2 = Math.round(this.A0M + f11);
                    drawable.setBounds(iRound, i12, scrollX2, this.A09);
                    Drawable drawable2 = this.A0S;
                    String[] strArr2 = A0t;
                    String str3 = strArr2[7];
                    String str4 = strArr2[0];
                    int scrollX3 = str3.charAt(10);
                    if (scrollX3 != str4.charAt(10)) {
                        A0t[1] = b.f42142b;
                        drawable2.draw(canvas);
                    } else {
                        String[] strArr3 = A0t;
                        strArr3[4] = b.f42142b;
                        strArr3[5] = b.f42142b;
                        drawable2.draw(canvas);
                    }
                }
                int i13 = lastPos + firstPos;
                int scrollX4 = A0t[1].length();
                if (scrollX4 == 12) {
                    throw new RuntimeException();
                }
                A0t[1] = "DrXdt";
                if (f11 > i13) {
                    return;
                }
            }
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) throws Resources.NotFoundException {
        float f11;
        int action = motionEvent.getAction() & 255;
        if (action == 3 || action == 1) {
            A0W();
            String[] strArr = A0t;
            if (strArr[4].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            A0t[2] = "iW5W";
            return false;
        }
        if (action != 0) {
            if (this.A0i) {
                return true;
            }
            if (this.A0k) {
                return false;
            }
        }
        switch (action) {
            case 0:
                float x11 = motionEvent.getX();
                this.A03 = x11;
                this.A05 = x11;
                float y11 = motionEvent.getY();
                this.A04 = y11;
                this.A06 = y11;
                this.A08 = motionEvent.getPointerId(0);
                this.A0k = false;
                this.A0j = true;
                this.A0X.computeScrollOffset();
                if (this.A0P != 2 || Math.abs(this.A0X.getFinalX() - this.A0X.getCurrX()) <= this.A0C) {
                    A0T(false);
                    this.A0i = false;
                    break;
                } else {
                    this.A0X.abortAnimation();
                    this.A0m = false;
                    A0h();
                    this.A0i = true;
                    A0V(true);
                    setScrollState(1);
                    break;
                }
                break;
            case 2:
                int i5 = this.A08;
                if (i5 != -1) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(i5);
                    float x12 = motionEvent.getX(iFindPointerIndex);
                    float f12 = x12 - this.A05;
                    float y12 = Math.abs(f12);
                    float y13 = motionEvent.getY(iFindPointerIndex);
                    float fAbs = Math.abs(y13 - this.A04);
                    if (f12 != 0.0f && !A0a(this.A05, f12) && A0f(this, false, (int) f12, (int) x12, (int) y13)) {
                        this.A05 = x12;
                        this.A06 = y13;
                        this.A0k = true;
                        return false;
                    }
                    if (y12 > this.A0R && 0.5f * y12 > fAbs) {
                        this.A0i = true;
                        A0V(true);
                        setScrollState(1);
                        if (f12 <= 0.0f) {
                            f11 = this.A03 - this.A0R;
                        } else {
                            float f13 = this.A03;
                            int i11 = this.A0R;
                            String[] strArr2 = A0t;
                            if (strArr2[7].charAt(10) != strArr2[0].charAt(10)) {
                                f11 = f13 + i11;
                            } else {
                                String[] strArr3 = A0t;
                                strArr3[7] = "WpQimEPBWZ8vG05HKhTxshBMY3NNEur0";
                                strArr3[0] = "BEtp4ufX6D8x3OZlDxdpMoFh1oKQqP0t";
                                f11 = f13 + i11;
                            }
                        }
                        this.A05 = f11;
                        this.A06 = y13;
                        setScrollingCacheEnabled(true);
                    } else if (fAbs > this.A0R) {
                        this.A0k = true;
                    }
                    if (this.A0i && A0Z(x12)) {
                        AbstractC1880hb.A07(this);
                        break;
                    }
                }
                break;
            case 6:
                A0R(motionEvent);
                break;
        }
        VelocityTracker velocityTracker = this.A0U;
        if (A0t[2].length() != 14) {
            String[] strArr4 = A0t;
            strArr4[3] = "qZEBvpK5WM51NnTYZj9Wv9V85vPNkfCF";
            strArr4[6] = "8DoAZte0LwUXg2aXlHvSBWFBy3vUeqDy";
            if (velocityTracker == null) {
                this.A0U = VelocityTracker.obtain();
            }
            this.A0U.addMovement(motionEvent);
            return this.A0i;
        }
        throw new RuntimeException();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) throws Resources.NotFoundException {
        boolean z12;
        C1885hh c1885hhA09;
        int iMax;
        int count;
        int paddingLeft = getChildCount();
        int paddingRight = i12 - i5;
        int i14 = i13 - i11;
        int scrollX = getPaddingLeft();
        int decorCount = getPaddingTop();
        int childLeft = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int hgrav = getScrollX();
        int paddingBottom2 = 0;
        int i15 = 0;
        while (true) {
            int i16 = 8;
            String[] strArr = A0t;
            String str = strArr[4];
            String str2 = strArr[5];
            int count2 = str.length();
            if (count2 == str2.length()) {
                A0t[1] = b.f42142b;
                if (i15 < paddingLeft) {
                    View childAt = getChildAt(i15);
                    if (childAt.getVisibility() != 8) {
                        C1886hi c1886hi = (C1886hi) childAt.getLayoutParams();
                        if (c1886hi.A05) {
                            int count3 = c1886hi.A04 & 7;
                            int childTop = c1886hi.A04 & 112;
                            switch (count3) {
                                case 1:
                                    iMax = Math.max((paddingRight - childAt.getMeasuredWidth()) / 2, scrollX);
                                    break;
                                case 2:
                                case 4:
                                default:
                                    iMax = scrollX;
                                    break;
                                case 3:
                                    iMax = scrollX;
                                    scrollX += childAt.getMeasuredWidth();
                                    break;
                                case 5:
                                    int i17 = paddingRight - childLeft;
                                    int measuredWidth = childAt.getMeasuredWidth();
                                    String[] strArr2 = A0t;
                                    String str3 = strArr2[7];
                                    String str4 = strArr2[0];
                                    int count4 = str3.charAt(10);
                                    if (count4 == str4.charAt(10)) {
                                        A0t[1] = "51Hkg";
                                        iMax = i17 - measuredWidth;
                                        childLeft += childAt.getMeasuredWidth();
                                        break;
                                    } else {
                                        break;
                                    }
                            }
                            switch (childTop) {
                                case 16:
                                    count = Math.max((i14 - childAt.getMeasuredHeight()) / 2, decorCount);
                                    break;
                                case 48:
                                    count = decorCount;
                                    decorCount += childAt.getMeasuredHeight();
                                    break;
                                case 80:
                                    int count5 = i14 - paddingBottom;
                                    count = count5 - childAt.getMeasuredHeight();
                                    paddingBottom += childAt.getMeasuredHeight();
                                    break;
                                default:
                                    count = decorCount;
                                    break;
                            }
                            int i18 = iMax + hgrav;
                            int width = i18 + childAt.getMeasuredWidth();
                            childAt.layout(i18, count, width, childAt.getMeasuredHeight() + count);
                            paddingBottom2++;
                        } else {
                            continue;
                        }
                    }
                    i15++;
                } else {
                    int paddingRight2 = (paddingRight - scrollX) - childLeft;
                    int i19 = 0;
                    while (i19 < paddingLeft) {
                        View childAt2 = getChildAt(i19);
                        if (childAt2.getVisibility() != i16) {
                            C1886hi c1886hi2 = (C1886hi) childAt2.getLayoutParams();
                            if (!c1886hi2.A05 && (c1885hhA09 = A09(childAt2)) != null) {
                                int childWidth = scrollX + ((int) (paddingRight2 * c1885hhA09.A00));
                                if (c1886hi2.A03) {
                                    c1886hi2.A03 = false;
                                    int widthSpec = View.MeasureSpec.makeMeasureSpec((int) (paddingRight2 * c1886hi2.A00), 1073741824);
                                    childAt2.measure(widthSpec, View.MeasureSpec.makeMeasureSpec((i14 - decorCount) - paddingBottom, 1073741824));
                                }
                                int heightSpec = childAt2.getMeasuredWidth();
                                int widthSpec2 = childAt2.getMeasuredHeight();
                                int i21 = decorCount;
                                childAt2.layout(childWidth, i21, heightSpec + childWidth, widthSpec2 + i21);
                            }
                        }
                        i19++;
                        i16 = 8;
                    }
                    this.A0Q = decorCount;
                    this.A09 = i14 - paddingBottom;
                    this.A0D = paddingBottom2;
                    if (this.A0g) {
                        int i22 = this.A00;
                        z12 = false;
                        String[] strArr3 = A0t;
                        if (strArr3[4].length() != strArr3[5].length()) {
                            throw new RuntimeException();
                        }
                        String[] strArr4 = A0t;
                        strArr4[4] = b.f42142b;
                        strArr4[5] = b.f42142b;
                        A0O(i22, false, 0, false);
                    } else {
                        z12 = false;
                    }
                    this.A0g = z12;
                    return;
                }
            }
        }
        throw new RuntimeException();
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i5, Rect rect) {
        int end;
        int i11;
        C1885hh c1885hhA09;
        int i12 = getChildCount();
        int count = i5 & 2;
        if (count != 0) {
            end = 0;
            i11 = 1;
        } else {
            end = i12 - 1;
            i11 = -1;
            i12 = -1;
        }
        while (end != i12) {
            View child = getChildAt(end);
            int index = A0t[2].length();
            if (index == 14) {
                throw new RuntimeException();
            }
            String[] strArr = A0t;
            strArr[3] = "wvs0VrXDMEHK1ZrgMliCmQkmYIqFRPYZ";
            strArr[6] = "yeuyy9yC0QSIfk9tyj8D1No5khczL5F7";
            int count2 = child.getVisibility();
            if (count2 == 0 && (c1885hhA09 = A09(child)) != null) {
                int index2 = c1885hhA09.A02;
                int count3 = this.A00;
                if (index2 == count3 && child.requestFocus(i5, rect)) {
                    return true;
                }
            }
            end += i11;
        }
        return false;
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) throws Resources.NotFoundException {
        if (!(parcelable instanceof WrappedParcelable)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        ClassLoader classLoader = getClass().getClassLoader();
        if (classLoader == null) {
            Context context = getContext();
            String[] strArr = A0t;
            if (strArr[3].charAt(15) == strArr[6].charAt(15)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0t;
            strArr2[7] = "Ly8LvMv3iU8o2fiJAVqvd6K7Aqz3gZKY";
            strArr2[0] = "HcNmsPXina8Ul250FP3kUGj1pgK53N1r";
            classLoader = context.getClassLoader();
        }
        Parcelable state = ((WrappedParcelable) parcelable).unwrap(classLoader);
        if (!(state instanceof ViewPager$SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        ViewPager$SavedState viewPager$SavedState = (ViewPager$SavedState) state;
        super.onRestoreInstanceState(viewPager$SavedState.A04());
        if (this.A01 != null) {
            A0P(viewPager$SavedState.A00, false, true);
            return;
        }
        this.A0O = viewPager$SavedState.A00;
        this.A0T = viewPager$SavedState.A01;
        this.A0a = viewPager$SavedState.A02;
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        ViewPager$SavedState ss2 = new ViewPager$SavedState(superState);
        ss2.A00 = this.A00;
        if (this.A01 != null) {
            Parcelable superState2 = this.A01.A03();
            ss2.A01 = superState2;
        }
        Parcelable superState3 = new WrappedParcelable(ss2);
        return superState3;
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        if (i5 != i12) {
            A0M(i5, i12, this.A0M, this.A0M);
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        if (this.A0h) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:6:0x0012 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void setAdapter(AbstractC1865hM abstractC1865hM) throws Resources.NotFoundException {
        if (this.A01 != null) {
            this.A01.A06(null);
            for (int i5 = 0; i5 < i; i5++) {
                C1885hh c1885hh = this.A0r.get(i5);
                this.A01.A07(this, c1885hh.A02, c1885hh.A03);
            }
            this.A0r.clear();
            A0C();
            this.A00 = 0;
            scrollTo(0, 0);
        }
        this.A01 = abstractC1865hM;
        this.A0G = 0;
        AbstractC1865hM oldAdapter = this.A01;
        if (oldAdapter != null) {
            if (this.A0Z == null) {
                this.A0Z = new C1890hm(this);
            }
            this.A01.A06(this.A0Z);
            this.A0m = false;
            boolean z11 = this.A0g;
            this.A0g = true;
            AbstractC1865hM oldAdapter2 = this.A01;
            this.A0G = oldAdapter2.A01();
            if (this.A0O >= 0) {
                A0P(this.A0O, false, true);
                this.A0O = -1;
                this.A0T = null;
                this.A0a = null;
            } else if (!z11) {
                A0h();
            } else {
                requestLayout();
            }
        }
        if (this.A0c != null && !this.A0c.isEmpty() && 0 < this.A0c.size()) {
            this.A0c.get(0);
            throw new NullPointerException(A0A(381, 16, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        }
    }

    public void setCurrentItem(int i5) throws Resources.NotFoundException {
        this.A0m = false;
        A0P(i5, !this.A0g, false);
    }

    public void setOffscreenPageLimit(int i5) throws Resources.NotFoundException {
        if (i5 < 1) {
            Log.w(A0A(300, 9, 47), A0A(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 31, 60) + i5 + A0A(51, 26, 90) + 1);
            i5 = 1;
        }
        if (i5 != this.A0L) {
            this.A0L = i5;
            A0h();
        }
    }

    @Deprecated
    public void setOnPageChangeListener(InterfaceC1888hk interfaceC1888hk) {
        this.A0Y = interfaceC1888hk;
    }

    public void setPageMargin(int i5) {
        int width = this.A0M;
        this.A0M = i5;
        int oldMargin = getWidth();
        A0M(oldMargin, oldMargin, i5, width);
        requestLayout();
    }

    public void setPageMarginDrawable(int i5) {
        setPageMarginDrawable(AbstractC1836gs.A00(getContext(), i5));
    }

    public void setPageMarginDrawable(Drawable drawable) {
        this.A0S = drawable;
        if (drawable != null) {
            refreshDrawableState();
        }
        setWillNotDraw(drawable == null);
        invalidate();
    }

    public void setScrollState(int i5) {
        if (this.A0P == i5) {
            return;
        }
        this.A0P = i5;
        if (0 != 0) {
            A0U(i5 != 0);
        }
        A0H(i5);
    }

    private void setScrollingCacheEnabled(boolean z11) {
        if (this.A0n != z11) {
            this.A0n = z11;
        }
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.A0S;
    }
}
