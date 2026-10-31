package l30;

import a5.a1;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import b.c0;
import com.teslacoilsw.launcher.widget.SpinnerTabView;
import java.util.WeakHashMap;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import o9.s2;

/* loaded from: classes.dex */
public final class r implements p, View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final ViewGroup f74676a;

    /* renamed from: b, reason: collision with root package name */
    public View f74677b;

    /* renamed from: c, reason: collision with root package name */
    public ViewGroup f74678c;

    /* renamed from: h, reason: collision with root package name */
    public int f74683h;

    /* renamed from: i, reason: collision with root package name */
    public float f74684i;

    /* renamed from: j, reason: collision with root package name */
    public s2 f74685j;

    /* renamed from: m, reason: collision with root package name */
    public int[] f74688m;
    public int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f74689p;

    /* renamed from: q, reason: collision with root package name */
    public final int f74690q;

    /* renamed from: r, reason: collision with root package name */
    public int f74691r;

    /* renamed from: d, reason: collision with root package name */
    public final AccelerateInterpolator f74679d = new AccelerateInterpolator();

    /* renamed from: e, reason: collision with root package name */
    public final float[] f74680e = new float[3];

    /* renamed from: f, reason: collision with root package name */
    public int f74681f = 255;

    /* renamed from: g, reason: collision with root package name */
    public final Paint f74682g = new Paint();

    /* renamed from: k, reason: collision with root package name */
    public int f74686k = 3;

    /* renamed from: l, reason: collision with root package name */
    public boolean f74687l = true;

    public r(ViewGroup viewGroup, TypedArray typedArray) {
        this.f74676a = viewGroup;
        new ColorStateList(new int[][]{new int[0]}, new int[]{-1});
        new ColorStateList(new int[][]{new int[0]}, new int[]{-1});
        this.o = -1;
        this.f74690q = typedArray.getDimensionPixelSize(2, 6);
        this.o = typedArray.getDimensionPixelSize(1, -1);
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x01bd  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x021f  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0226  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x022f  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x0548  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0171  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Canvas canvas) {
        View childAt;
        View childAt2;
        float f11;
        int iE;
        int iH;
        int iE2;
        int iH2;
        ViewGroup viewGroup;
        int bottom;
        int top;
        int i5;
        int iC;
        int iC2;
        int i11;
        int i12;
        int iC3;
        int iO;
        int i13;
        float f12;
        ViewGroup viewGroup2;
        int i14;
        float f13;
        int i15;
        int i16;
        int i17;
        int i18;
        float f14;
        int i19;
        int i21;
        int i22;
        int i23;
        View view;
        int i24;
        r rVar;
        int i25;
        r rVar2;
        r rVar3 = this;
        s2 s2Var = rVar3.f74685j;
        boolean zS = s2Var == null ? false : s2Var.S();
        int i26 = rVar3.f74686k;
        int i27 = rVar3.f74690q;
        int iK = i26 == 3 ? w20.e.k(3) : i27;
        ViewGroup viewGroup3 = rVar3.f74678c;
        if (viewGroup3 == null) {
            Intrinsics.m("tabs");
            throw null;
        }
        int childCount = viewGroup3.getChildCount();
        if (rVar3.f74691r != childCount) {
            rVar3.l();
            rVar3.f74691r = childCount;
        }
        if (childCount <= 0) {
            return;
        }
        if (rVar3.f74684i < 0.0f) {
            ViewGroup viewGroup4 = rVar3.f74678c;
            if (viewGroup4 == null) {
                Intrinsics.m("tabs");
                throw null;
            }
            childAt = viewGroup4.getChildAt(rVar3.g());
            ViewGroup viewGroup5 = rVar3.f74678c;
            if (viewGroup5 == null) {
                Intrinsics.m("tabs");
                throw null;
            }
            childAt2 = viewGroup5.getChildAt(rVar3.f74683h);
            f11 = 1 + rVar3.f74684i;
        } else {
            ViewGroup viewGroup6 = rVar3.f74678c;
            if (viewGroup6 == null) {
                Intrinsics.m("tabs");
                throw null;
            }
            childAt = viewGroup6.getChildAt(rVar3.f74683h);
            ViewGroup viewGroup7 = rVar3.f74678c;
            if (viewGroup7 == null) {
                Intrinsics.m("tabs");
                throw null;
            }
            childAt2 = viewGroup7.getChildAt(rVar3.f());
            f11 = childAt2 == null ? 0.0f : rVar3.f74684i;
        }
        float f15 = f11;
        View view2 = childAt2;
        View view3 = childAt;
        if (view3 == null && view2 == null) {
            return;
        }
        View view4 = rVar3.f74677b;
        int scrollY = view4 == null ? 0 : rVar3.f74687l ? view4.getScrollY() : view4.getScrollX();
        boolean z11 = rVar3.f74687l;
        ViewGroup viewGroup8 = rVar3.f74676a;
        int scrollY2 = scrollY - (z11 ? viewGroup8.getScrollY() : viewGroup8.getScrollX());
        if (view3 == null) {
            iE = 0;
            iH = 0;
        } else {
            iE = rVar3.e(view3) - scrollY2;
            iH = rVar3.h(view3) - scrollY2;
        }
        if (view2 == null) {
            iE2 = rVar3.h(view3) - scrollY2;
            iH2 = iE2;
        } else {
            iE2 = rVar3.e(view2) - scrollY2;
            iH2 = rVar3.h(view2) - scrollY2;
        }
        int iE3 = rVar3.e(rVar3.f74677b);
        int i28 = iE + iE3;
        int i29 = iH + iE3;
        int i31 = iE2 + iE3;
        int i32 = iH2 + iE3;
        if (rVar3.f74689p) {
            viewGroup = viewGroup8;
            if (rVar3.f74686k != 1) {
                i5 = iK;
            }
            if (rVar3.f74684i >= 0.0f) {
                int iC4 = rVar3.c(rVar3.f74683h);
                int iG = rVar3.g();
                iC2 = (iG < 0 || iG >= childCount) ? iC4 : rVar3.c(rVar3.g());
                i11 = childCount;
                iC = iC4;
            } else {
                int iC5 = rVar3.c(rVar3.f74683h);
                int iF = rVar3.f();
                iC = (iF < 0 || iF >= childCount) ? iC5 : rVar3.c(rVar3.f());
                iC2 = iC5;
                i11 = childCount;
            }
            boolean z12 = zS;
            int i33 = rVar3.f74686k;
            int i34 = (i33 != 1 || rVar3.f74689p) ? 0 : i5 - iK;
            float[] fArr = rVar3.f74680e;
            if (view2 == null) {
                i12 = 2;
                if (view3 != null) {
                    iC3 = iC2;
                } else if (z12) {
                    iC3 = rVar3.c(rVar3.i() ? 0 : i11 - 1);
                } else if (i33 == 1) {
                    Color.colorToHSV(iC, fArr);
                    fArr[2] = fArr[2] * 1.2f;
                    int iHSVToColor = Color.HSVToColor(fArr);
                    iO = i5 - (rVar3.f74687l ? viewGroup.getWidth() : viewGroup.getHeight());
                    iC3 = iHSVToColor;
                    i13 = iC;
                    f12 = f15;
                } else if (rVar3.f74689p) {
                    iC3 = iC;
                    i13 = iC3;
                    f12 = f15;
                    iO = 0;
                } else {
                    iO = i5 - x7.f.O(((1 - f15) * i27) + (iK * f15));
                    iC3 = iC;
                    i13 = iC3;
                    f12 = f15;
                }
                i13 = iC;
                f12 = f15;
                iO = i34;
            } else if (z12) {
                i12 = 2;
                iC3 = iC2;
                i13 = iC;
                f12 = f15;
                iO = i34;
            } else {
                i12 = 2;
                if (i33 == 1) {
                    Color.colorToHSV(iC2, fArr);
                    fArr[2] = fArr[2] * 1.2f;
                    iC3 = Color.HSVToColor(fArr);
                    i13 = iC2;
                    iO = i5 - (rVar3.f74687l ? viewGroup.getWidth() : viewGroup.getHeight());
                    f12 = 1 - f15;
                } else if (rVar3.f74689p) {
                    iC3 = iC2;
                    i13 = iC3;
                    f12 = f15;
                    iO = 0;
                } else {
                    iO = i5 - x7.f.O((i27 * f15) + ((1 - f15) * iK));
                    iC3 = iC2;
                    i13 = iC3;
                    f12 = f15;
                }
            }
            int i35 = i5 - iO;
            float interpolation = rVar3.f74679d.getInterpolation(f12);
            int height = !rVar3.f74687l ? viewGroup.getHeight() : viewGroup.getWidth();
            int i36 = iO;
            viewGroup2 = rVar3.f74678c;
            if (viewGroup2 != null) {
                Intrinsics.m("tabs");
                throw null;
            }
            int iMax = Math.max(height, rVar3.f74687l ? viewGroup2.getHeight() : viewGroup2.getWidth());
            int iC6 = c0.c(i32, i31, i12, i31);
            int iMax2 = Math.max(iC6, iMax - iC6);
            float f16 = iC6;
            float f17 = iMax2 * interpolation;
            int iY = x7.f.y(f16 - f17);
            if (iY < 0) {
                iY = 0;
            }
            int iMin = Math.min(iMax, x7.f.t(f16 + f17));
            int iK2 = rVar3.o;
            if (iK2 == -1) {
                int iF2 = c0.F(rVar3.f74686k);
                if (iF2 == 0) {
                    iK2 = w20.e.k(3);
                } else if (iF2 == 1) {
                    iK2 = w20.e.k(2);
                } else {
                    if (iF2 != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    iK2 = 0;
                }
            }
            int i37 = iY;
            float f18 = 1 - f15;
            int iO2 = x7.f.O((i31 * f15) + (i28 * f18));
            int iO3 = x7.f.O((i32 * f15) + (i29 * f18));
            if (!z12 && view2 == null) {
                i31 = i28;
            }
            int i38 = rVar3.n;
            Paint paint = rVar3.f74682g;
            if (i38 != 0) {
                paint.setColor(r4.a.n(rVar3.n, (Color.alpha(i38) * rVar3.f74681f) / 255));
                if (rVar3.f74689p) {
                    i14 = iK2;
                    f13 = f12;
                    i15 = i36;
                    i17 = iMin;
                    i18 = i32;
                    f14 = f15;
                    i23 = iO2;
                    i22 = iMax;
                    i16 = i35;
                    i19 = scrollY2;
                    i21 = i37;
                    view = view2;
                    i24 = iO3;
                    rVar3.b(0.0f, 0.0f, iMax, iK2, canvas, paint);
                    rVar3 = this;
                } else {
                    i14 = iK2;
                    f13 = f12;
                    i15 = i36;
                    i17 = iMin;
                    i18 = i32;
                    f14 = f15;
                    i23 = iO2;
                    i22 = iMax;
                    i16 = i35;
                    i19 = scrollY2;
                    i21 = i37;
                    view = view2;
                    i24 = iO3;
                    rVar3 = this;
                    rVar3.b(0.0f, i5 - i14, i22, i5, canvas, paint);
                }
            } else {
                i14 = iK2;
                f13 = f12;
                i15 = i36;
                i16 = i35;
                i17 = iMin;
                i18 = i32;
                f14 = f15;
                i19 = scrollY2;
                i21 = i37;
                i22 = iMax;
                i23 = iO2;
                view = view2;
                i24 = iO3;
            }
            paint.setColor(iC3);
            paint.setAlpha(rVar3.f74681f);
            if (rVar3.f74686k != 1) {
                if (i23 < i21) {
                    rVar3.b(i23, i15, Math.min(i24, i21), i5, canvas, paint);
                }
                rVar = this;
            } else {
                rVar = this;
                rVar.b(i23, i15, i24, i5, canvas, paint);
            }
            paint.setColor(i13);
            paint.setAlpha(rVar.f74681f);
            if (rVar.f74686k != 1) {
                if (i21 < i24) {
                    rVar.b(Math.max(i23, i21), i15, i24, i5, canvas, paint);
                }
                rVar2 = this;
                i25 = i17;
            } else {
                float f19 = i5;
                i25 = i17;
                rVar2 = this;
                rVar2.b(Math.max(i21, i31), f19 - (i16 * f13), Math.min(i25, i18), f19, canvas, paint);
            }
            if (i14 > 0 && rVar2.n == 0) {
                paint.setColor(iC3);
                paint.setAlpha(rVar2.f74681f);
                float f21 = i5 - i14;
                float f22 = i5;
                rVar2.b(0.0f, f21, i22, f22, canvas, paint);
                paint.setColor(i13);
                paint.setAlpha(rVar2.f74681f);
                rVar2.b(i21, f21, i25, f22, canvas, paint);
            }
            if (z12) {
                if (rVar2.i()) {
                    if (view3 != null) {
                        if (view == null) {
                            ViewGroup viewGroup9 = rVar2.f74678c;
                            if (viewGroup9 == null) {
                                Intrinsics.m("tabs");
                                throw null;
                            }
                            int iE4 = rVar2.e(viewGroup9.getChildAt(viewGroup9.getChildCount() - 1)) + iE3;
                            int iB = MathKt.b((rVar2.e(r1) * f18) + (rVar2.h(r1) * f14)) + iE3;
                            if (iB - iE4 > 0) {
                                rVar2.b(iE4, i15, iB, i5, canvas, paint);
                                return;
                            }
                            return;
                        }
                        return;
                    }
                    ViewGroup viewGroup10 = rVar2.f74678c;
                    if (viewGroup10 == null) {
                        Intrinsics.m("tabs");
                        throw null;
                    }
                    View childAt3 = viewGroup10.getChildAt(0);
                    int iH3 = rVar2.h(rVar2.f74677b);
                    int iMin2 = Math.min(iH3, MathKt.b(((childAt3.getRight() - i19) * f14) + ((rVar2.e(childAt3) - i19) * f18)) + iE3);
                    int iMin3 = Math.min(iH3, (rVar2.h(childAt3) + iE3) - i19);
                    if (iMin3 - iMin2 > 0) {
                        if (i25 <= iMin2) {
                            paint.setColor(iC3);
                            paint.setAlpha(rVar2.f74681f);
                            rVar2.b(iMin2, i15, iMin3, i5, canvas, paint);
                            return;
                        }
                        paint.setColor(i13);
                        paint.setAlpha(rVar2.f74681f);
                        float f23 = i15;
                        float f24 = i5;
                        rVar2.b(iMin2, f23, Math.min(i25, iMin3), f24, canvas, paint);
                        if (i25 < iMin3) {
                            paint.setColor(iC3);
                            paint.setAlpha(rVar2.f74681f);
                            rVar2.b(Math.max(iMin2, i25), f23, iMin3, f24, canvas, paint);
                            return;
                        }
                        return;
                    }
                    return;
                }
                if (view3 != null) {
                    if (view == null) {
                        ViewGroup viewGroup11 = rVar2.f74678c;
                        if (viewGroup11 == null) {
                            Intrinsics.m("tabs");
                            throw null;
                        }
                        int iE5 = rVar2.e(viewGroup11.getChildAt(0));
                        int iB2 = MathKt.b((rVar2.e(r1) * f18) + (rVar2.h(r1) * f14));
                        if (iB2 - iE5 > 0) {
                            rVar2.b(iE5, i15, iB2, i5, canvas, paint);
                            return;
                        }
                        return;
                    }
                    return;
                }
                ViewGroup viewGroup12 = rVar2.f74678c;
                if (viewGroup12 == null) {
                    Intrinsics.m("tabs");
                    throw null;
                }
                View childAt4 = viewGroup12.getChildAt(viewGroup12.getChildCount() - 1);
                int iH4 = rVar2.h(rVar2.f74677b);
                int iMin4 = Math.min(iH4, MathKt.b(((childAt4.getRight() - i19) * f14) + ((rVar2.e(childAt4) - i19) * f18)));
                int iMin5 = Math.min(iH4, rVar2.h(childAt4) - i19);
                if (iMin5 - iMin4 > 0) {
                    if (i25 <= iMin4) {
                        paint.setColor(iC3);
                        paint.setAlpha(rVar2.f74681f);
                        rVar2.b(iMin4, i15, iMin5, i5, canvas, paint);
                        return;
                    }
                    paint.setColor(i13);
                    paint.setAlpha(rVar2.f74681f);
                    float f25 = i15;
                    float f26 = i5;
                    rVar2.b(iMin4, f25, Math.min(i25, iMin5), f26, canvas, paint);
                    if (i25 < iMin5) {
                        paint.setColor(iC3);
                        paint.setAlpha(rVar2.f74681f);
                        rVar2.b(Math.max(iMin4, i25), f25, iMin5, f26, canvas, paint);
                        return;
                    }
                    return;
                }
                return;
            }
            return;
        }
        viewGroup = viewGroup8;
        if (rVar3.f74687l) {
            bottom = viewGroup.getRight();
            top = viewGroup.getLeft();
        } else {
            bottom = viewGroup.getBottom();
            top = viewGroup.getTop();
        }
        i5 = bottom - top;
        if (rVar3.f74684i >= 0.0f) {
        }
        boolean z122 = zS;
        int i332 = rVar3.f74686k;
        int i342 = (i332 != 1 || rVar3.f74689p) ? 0 : i5 - iK;
        float[] fArr2 = rVar3.f74680e;
        if (view2 == null) {
        }
        int i352 = i5 - iO;
        float interpolation2 = rVar3.f74679d.getInterpolation(f12);
        if (!rVar3.f74687l) {
        }
        int i362 = iO;
        viewGroup2 = rVar3.f74678c;
        if (viewGroup2 != null) {
        }
    }

    public final void b(float f11, float f12, float f13, float f14, Canvas canvas, Paint paint) {
        if (this.f74687l) {
            canvas.drawRect(f12, f11, f14, f13, paint);
        } else {
            canvas.drawRect(f11, f12, f13, f14, paint);
        }
    }

    public final int c(int i5) {
        int[] iArr = this.f74688m;
        if (iArr != null) {
            Intrinsics.d(iArr);
            return iArr[i5];
        }
        if (i5 == 0) {
            return -16750900;
        }
        if (i5 == 1) {
            return -30720;
        }
        if (i5 == 2) {
            return -10053376;
        }
        if (i5 != 3) {
            return i5 != 4 ? -1 : -3407872;
        }
        return -6736948;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0079  */
    @Override // l30.p
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(float f11, int i5) {
        int iO;
        View view;
        View childAt;
        View childAt2;
        float f12;
        int iE;
        int iH;
        int iE2;
        int iH2;
        if (f11 < 0.0f && i5 > 0) {
            i5--;
            f11++;
        }
        float fMax = Math.max(0.0f, Math.min(f11, 1.0f));
        if (i5 == this.f74683h && this.f74684i == fMax) {
            return;
        }
        this.f74683h = i5;
        this.f74684i = fMax;
        ViewGroup viewGroup = this.f74678c;
        if (viewGroup == null) {
            Intrinsics.m("tabs");
            throw null;
        }
        if (viewGroup.getChildCount() <= 0) {
            iO = -1;
        } else {
            if (this.f74684i < 0.0f) {
                ViewGroup viewGroup2 = this.f74678c;
                if (viewGroup2 == null) {
                    Intrinsics.m("tabs");
                    throw null;
                }
                childAt = viewGroup2.getChildAt(g());
                ViewGroup viewGroup3 = this.f74678c;
                if (viewGroup3 == null) {
                    Intrinsics.m("tabs");
                    throw null;
                }
                childAt2 = viewGroup3.getChildAt(this.f74683h);
                f12 = 1 + this.f74684i;
            } else {
                ViewGroup viewGroup4 = this.f74678c;
                if (viewGroup4 == null) {
                    Intrinsics.m("tabs");
                    throw null;
                }
                childAt = viewGroup4.getChildAt(this.f74683h);
                ViewGroup viewGroup5 = this.f74678c;
                if (viewGroup5 == null) {
                    Intrinsics.m("tabs");
                    throw null;
                }
                childAt2 = viewGroup5.getChildAt(f());
                f12 = this.f74684i;
            }
            if (childAt != null || childAt2 != null) {
                s2 s2Var = this.f74685j;
                Intrinsics.d(s2Var);
                boolean zS = s2Var.S();
                ViewGroup viewGroup6 = this.f74678c;
                if (viewGroup6 == null) {
                    Intrinsics.m("tabs");
                    throw null;
                }
                View childAt3 = viewGroup6.getChildAt(viewGroup6.getChildCount() - 1);
                ViewGroup viewGroup7 = this.f74678c;
                if (viewGroup7 == null) {
                    Intrinsics.m("tabs");
                    throw null;
                }
                View childAt4 = viewGroup7.getChildAt(0);
                if (childAt != null) {
                    iE = e(childAt);
                    iH = h(childAt);
                } else if (!zS) {
                    iE = i() ? h(childAt2) : 0;
                    iH = iE;
                } else if (f12 < 0.4f) {
                    if (i()) {
                        childAt3 = childAt4;
                    }
                    iO = (h(childAt3) + e(childAt3)) / 2;
                } else if (f12 > 0.6f) {
                    if (!i()) {
                        childAt3 = childAt4;
                    }
                    iO = (h(childAt3) + e(childAt3)) / 2;
                }
                if (childAt2 != null) {
                    iE2 = e(childAt2);
                    iH2 = h(childAt2);
                } else if (!zS) {
                    if (i()) {
                        ViewGroup viewGroup8 = this.f74678c;
                        if (viewGroup8 == null) {
                            Intrinsics.m("tabs");
                            throw null;
                        }
                        iE2 = this.f74687l ? viewGroup8.getHeight() : viewGroup8.getWidth();
                    } else {
                        iE2 = h(childAt);
                    }
                    iH2 = iE2;
                } else if (f12 < 0.4f) {
                    if (i()) {
                        childAt3 = childAt4;
                    }
                    iO = (h(childAt3) + e(childAt3)) / 2;
                } else if (f12 > 0.6f) {
                    if (!i()) {
                        childAt3 = childAt4;
                    }
                    iO = (h(childAt3) + e(childAt3)) / 2;
                }
                float f13 = 1 - f12;
                iO = (x7.f.O((iH2 * f12) + (iH * f13)) + x7.f.O((iE2 * f12) + (iE * f13))) / 2;
            }
        }
        ViewGroup viewGroup9 = this.f74676a;
        if (iO != -1 && (view = this.f74677b) != null) {
            int height = iO - (((this.f74687l ? viewGroup9.getHeight() : viewGroup9.getWidth()) - e(this.f74677b)) / 2);
            if (this.f74687l) {
                view.scrollTo(0, height);
            } else {
                view.scrollTo(height, 0);
            }
        }
        l();
        viewGroup9.invalidate();
    }

    public final int e(View view) {
        if (view == null) {
            return 0;
        }
        return this.f74687l ? view.getTop() : view.getLeft();
    }

    public final int f() {
        return i() ? this.f74683h - 1 : this.f74683h + 1;
    }

    public final int g() {
        return i() ? this.f74683h + 1 : this.f74683h - 1;
    }

    public final int h(View view) {
        if (view == null) {
            return 0;
        }
        return this.f74687l ? view.getBottom() : view.getRight();
    }

    public final boolean i() {
        ViewGroup viewGroup = this.f74678c;
        if (viewGroup != null) {
            WeakHashMap weakHashMap = a1.f250a;
            return viewGroup.getLayoutDirection() == 1;
        }
        Intrinsics.m("tabs");
        throw null;
    }

    public final void j() {
        ViewGroup viewGroup = this.f74676a;
        View viewFindViewById = viewGroup instanceof HorizontalScrollView ? (HorizontalScrollView) viewGroup : null;
        if (viewFindViewById == null) {
            ScrollView scrollView = viewGroup instanceof ScrollView ? (ScrollView) viewGroup : null;
            viewFindViewById = scrollView != null ? scrollView : viewGroup.findViewById(2131428969);
        }
        this.f74677b = viewFindViewById;
        View viewFindViewById2 = viewGroup.findViewById(16908307);
        Intrinsics.e(viewFindViewById2, "null cannot be cast to non-null type android.view.ViewGroup");
        ViewGroup viewGroup2 = (ViewGroup) viewFindViewById2;
        this.f74678c = viewGroup2;
        boolean z11 = true;
        if (!(this.f74677b instanceof ScrollView) && (!(viewGroup2 instanceof LinearLayout) || ((LinearLayout) viewGroup2).getOrientation() != 1)) {
            z11 = false;
        }
        this.f74687l = z11;
    }

    public final void k(float f11) {
        int iO = x7.f.O(f11 * 255);
        this.f74681f = iO;
        this.f74682g.setAlpha(iO);
        this.f74676a.invalidate();
    }

    public final void l() {
        int iMax = this.f74683h;
        if (this.f74684i > 0.5f) {
            int i5 = iMax + 1;
            ViewGroup viewGroup = this.f74678c;
            if (viewGroup == null) {
                Intrinsics.m("tabs");
                throw null;
            }
            iMax = Math.max(0, Math.min(i5, viewGroup.getChildCount() - 1));
        }
        ViewGroup viewGroup2 = this.f74678c;
        if (viewGroup2 == null) {
            Intrinsics.m("tabs");
            throw null;
        }
        int childCount = viewGroup2.getChildCount();
        int i11 = 0;
        while (i11 < childCount) {
            ViewGroup viewGroup3 = this.f74678c;
            if (viewGroup3 == null) {
                Intrinsics.m("tabs");
                throw null;
            }
            viewGroup3.getChildAt(i11).setSelected(iMax == i11);
            i11++;
        }
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        SpinnerTabView spinnerTabView;
        e eVar;
        ViewGroup viewGroup = this.f74678c;
        if (viewGroup == null) {
            Intrinsics.m("tabs");
            throw null;
        }
        int iIndexOfChild = viewGroup.indexOfChild(view);
        s2 s2Var = this.f74685j;
        if (s2Var != null && iIndexOfChild != s2Var.G()) {
            s2 s2Var2 = this.f74685j;
            Intrinsics.d(s2Var2);
            s2Var2.l0(iIndexOfChild);
        } else {
            if (!(view instanceof SpinnerTabView) || (eVar = (spinnerTabView = (SpinnerTabView) view).f46486a) == null) {
                return;
            }
            if (eVar.f84883z.isShowing()) {
                spinnerTabView.f46486a.dismiss();
            }
            spinnerTabView.f46486a.show();
        }
    }
}
