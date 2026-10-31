package ka;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.util.Pair;
import android.util.Property;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import b.l2;
import b00.b1;
import com.android.launcher3.notification.NotificationContainer;
import com.android.launcher3.shortcuts.DeepShortcutTextView;
import com.android.launcher3.shortcuts.DeepShortcutView;
import com.teslacoilsw.launcher.widget.DumbGridLayout;
import e10.n1;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import o9.g3;
import sg.h0;

/* loaded from: classes.dex */
public abstract class c extends o9.a {
    public static final /* synthetic */ int M = 0;
    public boolean A;
    public GradientDrawable B;
    public GradientDrawable C;
    public Runnable D;
    public int E;
    public final ArrayList F;
    public float G;
    public int H;
    public final String I;
    public GradientDrawable J;
    public boolean K;
    public n1 L;

    /* renamed from: c, reason: collision with root package name */
    public final int f71247c;

    /* renamed from: d, reason: collision with root package name */
    public final int f71248d;

    /* renamed from: e, reason: collision with root package name */
    public final int f71249e;

    /* renamed from: f, reason: collision with root package name */
    public final int f71250f;

    /* renamed from: g, reason: collision with root package name */
    public final int f71251g;

    /* renamed from: h, reason: collision with root package name */
    public final int f71252h;

    /* renamed from: i, reason: collision with root package name */
    public final int f71253i;

    /* renamed from: j, reason: collision with root package name */
    public final int f71254j;

    /* renamed from: k, reason: collision with root package name */
    public final Rect f71255k;

    /* renamed from: l, reason: collision with root package name */
    public final LayoutInflater f71256l;

    /* renamed from: m, reason: collision with root package name */
    public float f71257m;
    public final Context n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final int f71258p;

    /* renamed from: q, reason: collision with root package name */
    public int f71259q;

    /* renamed from: r, reason: collision with root package name */
    public final int f71260r;

    /* renamed from: s, reason: collision with root package name */
    public final int f71261s;

    /* renamed from: t, reason: collision with root package name */
    public final int f71262t;

    /* renamed from: u, reason: collision with root package name */
    public final View f71263u;

    /* renamed from: v, reason: collision with root package name */
    public int f71264v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f71265w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f71266x;

    /* renamed from: y, reason: collision with root package name */
    public int f71267y;

    /* renamed from: z, reason: collision with root package name */
    public AnimatorSet f71268z;

    /* JADX WARN: Multi-variable type inference failed */
    public c(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        this.f71247c = 276;
        this.f71248d = 38;
        this.f71249e = 38;
        this.f71250f = 76;
        this.f71251g = 200;
        this.f71252h = 140;
        this.f71253i = 50;
        this.f71254j = 140;
        this.f71255k = new Rect();
        this.D = new a10.a(6);
        this.f71256l = LayoutInflater.from(context);
        Context contextP = za.d.p(context);
        this.n = contextP;
        this.o = g3.p(getResources());
        this.H = -65281;
        this.E = -65281;
        this.G = getResources().getDimension(2131165365);
        Resources resources = getResources();
        this.f71264v = resources.getDimensionPixelSize(2131166355);
        int dimensionPixelSize = resources.getDimensionPixelSize(2131166354);
        this.f71260r = dimensionPixelSize;
        int dimensionPixelSize2 = resources.getDimensionPixelSize(2131166351);
        this.f71261s = dimensionPixelSize2;
        View view = new View(context);
        this.f71263u = view;
        view.setLayoutParams(new za.h(dimensionPixelSize, dimensionPixelSize2));
        this.f71258p = resources.getDimensionPixelSize(2131166353);
        this.f71259q = resources.getDimensionPixelSize(2131166352) - (dimensionPixelSize / 2);
        this.f71262t = resources.getDimensionPixelSize(2131166350);
        this.I = getContext().getString(2132019128);
        if (((za.d) contextP).n() && g3.f79853h && u9.b.f90691d.b()) {
            this.F = new ArrayList();
        } else {
            this.F = null;
        }
    }

    @Override // o9.a
    public View N() {
        return getChildCount() > 0 ? getChildAt(0) : this;
    }

    @Override // o9.a
    public final Pair O() {
        return Pair.create(this, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    @Override // o9.a
    public final void Q(boolean z11) {
        if (z11) {
            U();
        } else {
            X();
        }
    }

    public final void U() {
        if (this.f79742a) {
            AnimatorSet animatorSet = this.f71268z;
            if (animatorSet != null) {
                animatorSet.cancel();
            }
            this.f79742a = false;
            AnimatorSet animatorSetB0 = b0(false, this.f71251g, this.f71252h, this.f71253i, 0, this.f71254j, s9.k.o);
            this.f71268z = animatorSetB0;
            f0(animatorSetB0);
            this.f71268z.addListener(new b(this, 1));
            this.f71268z.start();
        }
    }

    public final void V() {
        setVisibility(0);
        AnimatorSet animatorSetB0 = b0(true, this.f71247c, 0, this.f71248d, this.f71249e, this.f71250f, s9.k.n);
        this.f71268z = animatorSetB0;
        animatorSetB0.addListener(new b(this, 0));
        this.f71268z.start();
    }

    /* JADX WARN: Removed duplicated region for block: B:83:0x01a6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void W(ViewGroup viewGroup, int i5) {
        int i11;
        float fH;
        float fH2;
        View viewFindViewById;
        int i12 = 1;
        int[] iArr = i5 == 0 ? new int[]{this.H} : null;
        int childCount = viewGroup.getChildCount();
        int i13 = 0;
        for (int i14 = 0; i14 < childCount; i14++) {
            View childAt = viewGroup.getChildAt(i14);
            if (childAt.getVisibility() == 0 && (childAt instanceof DeepShortcutView)) {
                i13++;
            }
        }
        AnimatorSet animatorSet = new AnimatorSet();
        int i15 = 0;
        int i16 = 0;
        int i17 = 0;
        View view = null;
        int iE = i5;
        while (i15 < childCount) {
            View childAt2 = viewGroup.getChildAt(i15);
            if (childAt2.getVisibility() == 0) {
                if (view != null) {
                    ((ViewGroup.MarginLayoutParams) view.getLayoutParams()).bottomMargin = this.f71264v;
                }
                ((ViewGroup.MarginLayoutParams) childAt2.getLayoutParams()).bottomMargin = 0;
                if (iArr != null) {
                    iE = iArr[i16 % iArr.length];
                }
                h0 h0Var = u9.b.f90691d;
                if (!h0Var.b()) {
                    boolean z11 = this.f71266x;
                    if ((!z11 && i16 == 0 && viewGroup == this) || z11) {
                        this.E = iE;
                    }
                    this.E = Z();
                }
                if (!this.K) {
                    childAt2.setElevation(0.0f);
                }
                if ((childAt2 instanceof ViewGroup) && this.I.equals(childAt2.getTag())) {
                    W((ViewGroup) childAt2, iE);
                    i16++;
                    i11 = i12;
                } else {
                    if (childAt2 instanceof DeepShortcutView) {
                        DeepShortcutTextView deepShortcutTextViewB = ((DeepShortcutView) childAt2).b();
                        deepShortcutTextViewB.setTextColor(this.L.d());
                        Drawable drawable = deepShortcutTextViewB.getCompoundDrawablesRelative()[2];
                        if (drawable != null) {
                            drawable.setTint(this.L.d());
                        }
                        if (i13 == i12) {
                            GradientDrawable gradientDrawable = new GradientDrawable();
                            gradientDrawable.setColor(this.H);
                            gradientDrawable.setCornerRadius(this.f71257m);
                            childAt2.setBackground(gradientDrawable);
                        } else if (i13 > i12) {
                            int i18 = this.f71264v == 0 ? i12 : 0;
                            if (i17 == 0) {
                                childAt2.setBackground(this.B.getConstantState().newDrawable());
                            } else if (i17 == i13 - 1) {
                                childAt2.setBackground(this.C.getConstantState().newDrawable());
                                i18 = 0;
                            } else {
                                childAt2.setBackground(this.J.getConstantState().newDrawable());
                            }
                            if (i18 != 0 && (viewFindViewById = childAt2.findViewById(2131427883)) != null) {
                                viewFindViewById.setVisibility(0);
                            }
                            i17++;
                        }
                    } else {
                        if ((childAt2 instanceof DumbGridLayout) && this.L.e() != 0) {
                            iE = this.L.e();
                            GradientDrawable gradientDrawable2 = new GradientDrawable();
                            gradientDrawable2.setColor(iE);
                            if (this.L.b() == 0) {
                                gradientDrawable2.setCornerRadius(this.L.h());
                                i11 = i12;
                            } else {
                                if (i15 == 0 && childCount == i12) {
                                    fH2 = this.L.h();
                                    i11 = i12;
                                    fH = fH2;
                                } else if (i15 == 0) {
                                    fH2 = this.L.h();
                                    i11 = i12;
                                    fH = 0.0f;
                                } else {
                                    i11 = i12;
                                    fH = this.L.h();
                                    fH2 = 0.0f;
                                }
                                float[] fArr = new float[8];
                                fArr[0] = fH2;
                                fArr[i11] = fH2;
                                fArr[2] = fH2;
                                fArr[3] = fH2;
                                fArr[4] = fH;
                                fArr[5] = fH;
                                fArr[6] = fH;
                                fArr[7] = fH;
                                gradientDrawable2.setCornerRadii(fArr);
                            }
                            childAt2.setBackground(gradientDrawable2);
                        }
                        if (!h0Var.b()) {
                            j0(childAt2, iE, animatorSet);
                        }
                        i16++;
                    }
                    i11 = i12;
                    if (!h0Var.b()) {
                    }
                    i16++;
                }
                view = childAt2;
            } else {
                i11 = i12;
            }
            i15++;
            i12 = i11;
        }
        animatorSet.setDuration(0L).start();
        measure(0, 0);
    }

    public void X() {
        AnimatorSet animatorSet = this.f71268z;
        if (animatorSet != null) {
            animatorSet.cancel();
            this.f71268z = null;
        }
        this.f79742a = false;
        this.A = false;
        c0().removeView(this);
        c0().removeView(this.f71263u);
        this.D.run();
        ArrayList arrayList = this.F;
        if (arrayList != null) {
            arrayList.forEach(new l2(9));
        }
    }

    public final void Y(ViewGroup viewGroup, float[] fArr, long j11, long j12, AnimatorSet animatorSet) {
        for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = viewGroup.getChildAt(childCount);
            if (childAt.getVisibility() == 0 && (childAt instanceof ViewGroup)) {
                if (this.I.equals(childAt.getTag())) {
                    Y((ViewGroup) childAt, fArr, j11, j12, animatorSet);
                } else {
                    boolean z11 = childAt instanceof NotificationContainer;
                    Property property = LinearLayout.ALPHA;
                    if (!z11) {
                        ViewGroup viewGroup2 = (ViewGroup) childAt;
                        for (int childCount2 = viewGroup2.getChildCount() - 1; childCount2 >= 0; childCount2--) {
                            View childAt2 = viewGroup2.getChildAt(childCount2);
                            childAt2.setAlpha(fArr[0]);
                            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(childAt2, (Property<View, Float>) property, fArr);
                            objectAnimatorOfFloat.setStartDelay(j11);
                            objectAnimatorOfFloat.setDuration(j12);
                            objectAnimatorOfFloat.setInterpolator(s9.k.f86788a);
                            animatorSet.play(objectAnimatorOfFloat);
                        }
                    } else if (childAt.getBackground() != null) {
                        childAt.setAlpha(fArr[0]);
                        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(childAt, (Property<View, Float>) property, fArr);
                        objectAnimatorOfFloat2.setStartDelay(j11);
                        objectAnimatorOfFloat2.setDuration(j12);
                        objectAnimatorOfFloat2.setInterpolator(s9.k.f86788a);
                        animatorSet.play(objectAnimatorOfFloat2);
                    } else {
                        Y((ViewGroup) childAt, fArr, j11, j12, animatorSet);
                    }
                }
            }
        }
    }

    public int Z() {
        return this.L.a();
    }

    public List a0() {
        return Collections.EMPTY_LIST;
    }

    public final AnimatorSet b0(boolean z11, int i5, int i11, int i12, int i13, int i14, Interpolator interpolator) {
        AnimatorSet animatorSet = new AnimatorSet();
        float[] fArr = new float[2];
        if (z11) {
            fArr[0] = 0.0f;
            fArr[1] = 1.0f;
        } else {
            fArr[0] = 1.0f;
            fArr[1] = 0.0f;
        }
        float[] fArr2 = z11 ? new float[]{0.5f, 1.0f} : new float[]{1.0f, 0.5f};
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(fArr);
        valueAnimatorOfFloat.setStartDelay(i11);
        valueAnimatorOfFloat.setDuration(i12);
        valueAnimatorOfFloat.setInterpolator(s9.k.f86788a);
        valueAnimatorOfFloat.addUpdateListener(new b1(this, 6));
        animatorSet.play(valueAnimatorOfFloat);
        setPivotX(this.f71265w ? 0.0f : getMeasuredWidth());
        setPivotY(this.f71266x ? getMeasuredHeight() : 0.0f);
        Animator animatorOfFloat = ObjectAnimator.ofFloat(this, (Property<c, Float>) View.SCALE_Y, fArr2);
        animatorOfFloat.setDuration(i5);
        animatorOfFloat.setInterpolator(interpolator);
        animatorSet.play(animatorOfFloat);
        Y(this, fArr, i13, i14, animatorSet);
        return animatorSet;
    }

    public final za.j c0() {
        return ((za.d) this.n).u();
    }

    public abstract void d0(Rect rect);

    public final View e0(ViewGroup viewGroup, int i5) {
        View viewInflate = this.f71256l.inflate(i5, viewGroup, false);
        viewGroup.addView(viewInflate);
        return viewInflate;
    }

    public void f0(AnimatorSet animatorSet) {
    }

    public void g0() {
        h0(true, true);
    }

    public final void h0(boolean z11, boolean z12) {
        int i5;
        int width;
        int i11;
        boolean z13;
        measure(0, 0);
        int i12 = this.f71261s;
        int i13 = this.f71258p;
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131166360) + i12 + i13;
        int i14 = 0;
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            if (getChildAt(childCount).getVisibility() == 0) {
                i14++;
            }
        }
        int measuredHeight = getMeasuredHeight() + dimensionPixelSize + ((i14 - 1) * this.f71264v);
        int paddingRight = getPaddingRight() + getPaddingLeft() + getMeasuredWidth();
        Rect rect = this.f71255k;
        d0(rect);
        za.j jVarC0 = c0();
        Rect rect2 = jVarC0.f20960a;
        int i15 = rect.left;
        int i16 = rect.right - paddingRight;
        boolean z14 = this.o;
        boolean z15 = !z14 ? z11 : !z12;
        this.f71265w = z15;
        int i17 = z15 ? i15 : i16;
        int iWidth = rect.width();
        int i18 = ((iWidth / 2) - this.f71259q) - (this.f71260r / 2);
        if (!this.f71265w) {
            i18 = -i18;
        }
        int i19 = i17 + i18;
        if (z11 || z12) {
            boolean z16 = (i19 + paddingRight) + rect2.left < jVarC0.getWidth() - rect2.right;
            boolean z17 = i19 > rect2.left;
            boolean z18 = this.f71265w;
            if ((!z18 || !z16) && (z18 || !z17)) {
                h0(z11 && !z18, z12 && z18);
                return;
            }
        }
        int iHeight = rect.height();
        int i21 = rect.top - measuredHeight;
        int top = jVarC0.getTop();
        int i22 = rect2.top;
        boolean z19 = i21 > top + i22;
        this.f71266x = z19;
        if (!z19) {
            i21 = rect.top + iHeight + dimensionPixelSize;
        }
        int i23 = i19 - rect2.left;
        int i24 = i21 - i22;
        this.f71267y = 0;
        if (measuredHeight + i24 > jVarC0.getBottom() - rect2.bottom) {
            this.f71267y = 16;
            int i25 = rect2.left;
            int i26 = (i15 + iWidth) - i25;
            int i27 = (i16 - iWidth) - i25;
            if (z14) {
                z13 = true;
                i5 = 0;
                if (i27 > jVarC0.getLeft()) {
                    this.f71265w = false;
                    i23 = i27;
                } else {
                    this.f71265w = true;
                    i23 = i26;
                }
            } else if (i26 + paddingRight < jVarC0.getRight()) {
                z13 = true;
                this.f71265w = true;
                i5 = 0;
                i23 = i26;
            } else {
                z13 = true;
                i5 = 0;
                this.f71265w = false;
                i23 = i27;
            }
            this.f71266x = z13;
        } else {
            i5 = 0;
        }
        boolean z21 = this.f71265w;
        if (z21 && i23 < 0) {
            this.f71259q += i23;
            width = i5;
        } else if (z21 || (i11 = i23 + paddingRight) <= jVarC0.getWidth()) {
            width = i23;
        } else {
            this.f71259q = (jVarC0.getWidth() - i11) + this.f71259q;
            width = jVarC0.getWidth() - paddingRight;
        }
        setX(width);
        if (Gravity.isVertical(this.f71267y)) {
            return;
        }
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) getLayoutParams();
        FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) this.f71263u.getLayoutParams();
        if (this.f71266x) {
            layoutParams.gravity = 80;
            layoutParams2.gravity = 80;
            int height = ((c0().getHeight() - i24) - getMeasuredHeight()) - rect2.top;
            layoutParams.bottomMargin = height;
            layoutParams2.bottomMargin = ((height - layoutParams2.height) - i13) - rect2.bottom;
            return;
        }
        layoutParams.gravity = 48;
        layoutParams2.gravity = 48;
        int i28 = rect2.top;
        int i29 = i24 + i28;
        layoutParams.topMargin = i29;
        layoutParams2.topMargin = ((i29 - i28) - layoutParams2.height) - i13;
    }

    public final void i0(int i5) {
        setVisibility(4);
        this.f79742a = true;
        c0().addView(this);
        g0();
        if (this.f71266x) {
            int childCount = getChildCount();
            ArrayList arrayList = new ArrayList(childCount);
            for (int i11 = 0; i11 < childCount; i11++) {
                if (i11 == i5) {
                    Collections.reverse(arrayList);
                }
                arrayList.add(getChildAt(i11));
            }
            Collections.reverse(arrayList);
            removeAllViews();
            for (int i12 = 0; i12 < childCount; i12++) {
                addView((View) arrayList.get(i12));
            }
        }
        W(this, 0);
        if (l0()) {
            za.j jVarC0 = c0();
            View view = this.f71263u;
            jVarC0.addView(view);
            float x11 = getX();
            boolean z11 = this.f71265w;
            int i13 = this.f71260r;
            view.setX(x11 + (z11 ? this.f71259q : (getMeasuredWidth() - this.f71259q) - i13));
            if (Gravity.isVertical(this.f71267y)) {
                view.setVisibility(4);
            } else {
                m0();
            }
            view.setPivotX(i13 / 2.0f);
            view.setPivotY(this.f71266x ? this.f71261s : 0.0f);
        }
        V();
    }

    public void j0(View view, int i5, AnimatorSet animatorSet) {
        Drawable background = view.getBackground();
        if (background instanceof GradientDrawable) {
            animatorSet.play(ObjectAnimator.ofArgb((GradientDrawable) background.mutate(), "color", ((GradientDrawable) background).getColor().getDefaultColor(), i5));
        } else if (background instanceof ColorDrawable) {
            animatorSet.play(ObjectAnimator.ofArgb((ColorDrawable) background.mutate(), "color", ((ColorDrawable) background).getColor(), i5));
        }
    }

    public final void k0(n1 n1Var) {
        this.L = n1Var;
        this.K = n1Var.b() == 0;
        this.f71257m = this.L.h();
        this.H = this.L.i();
        if (this.L.b() == 0) {
            setClipToOutline(false);
            setOutlineProvider(null);
        } else {
            setOutlineProvider(new ab.a(this, 2));
        }
        int iG = (int) this.L.g();
        GradientDrawable gradientDrawable = new GradientDrawable();
        this.B = gradientDrawable;
        gradientDrawable.setColor(this.H);
        GradientDrawable gradientDrawable2 = this.B;
        float f11 = this.f71257m;
        float f12 = iG;
        gradientDrawable2.setCornerRadii(new float[]{f11, f11, f11, f11, f12, f12, f12, f12});
        GradientDrawable gradientDrawable3 = new GradientDrawable();
        this.C = gradientDrawable3;
        gradientDrawable3.setColor(this.H);
        GradientDrawable gradientDrawable4 = this.C;
        float f13 = this.f71257m;
        gradientDrawable4.setCornerRadii(new float[]{f12, f12, f12, f12, f13, f13, f13, f13});
        GradientDrawable gradientDrawable5 = new GradientDrawable();
        this.J = gradientDrawable5;
        gradientDrawable5.setColor(this.H);
        this.J.setCornerRadius(f12);
        this.f71264v = n1Var.j();
    }

    public boolean l0() {
        return true;
    }

    public final void m0() {
        if (Gravity.isVertical(this.f71267y)) {
            return;
        }
        o oVar = new o(this.f71260r, this.f71261s, this.f71262t, this.f71257m, getMeasuredWidth(), getMeasuredHeight(), this.f71259q, -this.f71258p, !this.f71266x, this.f71265w, this.E);
        View view = this.f71263u;
        view.setBackground(oVar);
        setElevation(this.G);
        view.setElevation(this.G);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        Rect rect = c0().f20960a;
        if (getTranslationX() + i5 < rect.left || getTranslationX() + i12 > r4.getWidth() - rect.right) {
            this.f71267y |= 1;
        }
        if (Gravity.isHorizontal(this.f71267y)) {
            setX((r4.getWidth() / 2) - (getMeasuredWidth() / 2));
        }
        if (Gravity.isVertical(this.f71267y)) {
            setY((r4.getHeight() / 2) - (getMeasuredHeight() / 2));
        }
    }
}
