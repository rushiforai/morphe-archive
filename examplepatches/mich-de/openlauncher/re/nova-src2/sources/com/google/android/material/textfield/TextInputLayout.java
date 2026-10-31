package com.google.android.material.textfield;

import a5.u0;
import aa.x;
import ai.h;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStructure;
import android.view.ViewTreeObserver;
import android.view.animation.LinearInterpolator;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.customview.view.AbsSavedState;
import androidx.recyclerview.widget.a0;
import androidx.transition.Fade;
import androidx.transition.TransitionManager;
import b.c0;
import bk.e;
import bk.f;
import bk.g;
import bk.j;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.material.internal.CheckableImageButton;
import eb.o;
import ep.c;
import fk.i;
import fk.k;
import fk.m;
import fk.p;
import fk.s;
import fk.v;
import fk.w;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.WeakHashMap;
import p7.u;
import ps.e0;
import ps.f0;
import ps.l;
import r.a1;
import tj.b;

/* loaded from: classes3.dex */
public class TextInputLayout extends LinearLayout implements ViewTreeObserver.OnGlobalLayoutListener {
    public static final int[][] B0 = {new int[]{16842919}, new int[0]};
    public final ColorStateList A;
    public boolean A0;
    public final ColorStateList B;
    public final boolean C;
    public CharSequence D;
    public boolean E;
    public g F;
    public g G;
    public StateListDrawable H;
    public boolean I;
    public g J;
    public g K;
    public j L;
    public boolean M;
    public final int N;
    public int O;
    public int P;
    public int Q;
    public final int R;
    public final int S;
    public int T;
    public int U;
    public final Rect V;
    public final Rect W;

    /* renamed from: a, reason: collision with root package name */
    public final FrameLayout f34363a;

    /* renamed from: a0, reason: collision with root package name */
    public final RectF f34364a0;

    /* renamed from: b, reason: collision with root package name */
    public final v f34365b;

    /* renamed from: b0, reason: collision with root package name */
    public ColorDrawable f34366b0;

    /* renamed from: c, reason: collision with root package name */
    public final m f34367c;

    /* renamed from: c0, reason: collision with root package name */
    public int f34368c0;

    /* renamed from: d, reason: collision with root package name */
    public EditText f34369d;

    /* renamed from: d0, reason: collision with root package name */
    public final LinkedHashSet f34370d0;

    /* renamed from: e, reason: collision with root package name */
    public CharSequence f34371e;

    /* renamed from: e0, reason: collision with root package name */
    public ColorDrawable f34372e0;

    /* renamed from: f, reason: collision with root package name */
    public int f34373f;

    /* renamed from: f0, reason: collision with root package name */
    public int f34374f0;

    /* renamed from: g, reason: collision with root package name */
    public int f34375g;

    /* renamed from: g0, reason: collision with root package name */
    public Drawable f34376g0;

    /* renamed from: h, reason: collision with root package name */
    public int f34377h;

    /* renamed from: h0, reason: collision with root package name */
    public ColorStateList f34378h0;

    /* renamed from: i, reason: collision with root package name */
    public int f34379i;

    /* renamed from: i0, reason: collision with root package name */
    public ColorStateList f34380i0;

    /* renamed from: j, reason: collision with root package name */
    public final p f34381j;

    /* renamed from: j0, reason: collision with root package name */
    public final int f34382j0;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f34383k;

    /* renamed from: k0, reason: collision with root package name */
    public final int f34384k0;

    /* renamed from: l, reason: collision with root package name */
    public final int f34385l;

    /* renamed from: l0, reason: collision with root package name */
    public int f34386l0;

    /* renamed from: m, reason: collision with root package name */
    public boolean f34387m;

    /* renamed from: m0, reason: collision with root package name */
    public final ColorStateList f34388m0;
    public final c n;

    /* renamed from: n0, reason: collision with root package name */
    public final int f34389n0;
    public final AppCompatTextView o;

    /* renamed from: o0, reason: collision with root package name */
    public final int f34390o0;

    /* renamed from: p, reason: collision with root package name */
    public final int f34391p;

    /* renamed from: p0, reason: collision with root package name */
    public final int f34392p0;

    /* renamed from: q, reason: collision with root package name */
    public final int f34393q;

    /* renamed from: q0, reason: collision with root package name */
    public final int f34394q0;

    /* renamed from: r, reason: collision with root package name */
    public CharSequence f34395r;

    /* renamed from: r0, reason: collision with root package name */
    public final int f34396r0;

    /* renamed from: s, reason: collision with root package name */
    public boolean f34397s;

    /* renamed from: s0, reason: collision with root package name */
    public int f34398s0;

    /* renamed from: t, reason: collision with root package name */
    public AppCompatTextView f34399t;

    /* renamed from: t0, reason: collision with root package name */
    public boolean f34400t0;

    /* renamed from: u, reason: collision with root package name */
    public ColorStateList f34401u;

    /* renamed from: u0, reason: collision with root package name */
    public final b f34402u0;

    /* renamed from: v, reason: collision with root package name */
    public int f34403v;

    /* renamed from: v0, reason: collision with root package name */
    public final boolean f34404v0;

    /* renamed from: w, reason: collision with root package name */
    public Fade f34405w;

    /* renamed from: w0, reason: collision with root package name */
    public final boolean f34406w0;

    /* renamed from: x, reason: collision with root package name */
    public Fade f34407x;

    /* renamed from: x0, reason: collision with root package name */
    public ValueAnimator f34408x0;

    /* renamed from: y, reason: collision with root package name */
    public final ColorStateList f34409y;

    /* renamed from: y0, reason: collision with root package name */
    public boolean f34410y0;

    /* renamed from: z, reason: collision with root package name */
    public final ColorStateList f34411z;

    /* renamed from: z0, reason: collision with root package name */
    public boolean f34412z0;

    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public CharSequence f34413c;

        /* renamed from: d, reason: collision with root package name */
        public boolean f34414d;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f34413c = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.f34414d = parcel.readInt() == 1;
        }

        public final String toString() {
            return "TextInputLayout.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " error=" + ((Object) this.f34413c) + "}";
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            TextUtils.writeToParcel(this.f34413c, parcel, i5);
            parcel.writeInt(this.f34414d ? 1 : 0);
        }
    }

    public TextInputLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public static void l(ViewGroup viewGroup, boolean z11) {
        int childCount = viewGroup.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = viewGroup.getChildAt(i5);
            childAt.setEnabled(z11);
            if (childAt instanceof ViewGroup) {
                l((ViewGroup) childAt, z11);
            }
        }
    }

    public final void A() {
        Drawable background;
        AppCompatTextView appCompatTextView;
        EditText editText = this.f34369d;
        if (editText == null || this.O != 0 || (background = editText.getBackground()) == null) {
            return;
        }
        int[] iArr = a1.f84666a;
        Drawable drawableMutate = background.mutate();
        if (u()) {
            AppCompatTextView appCompatTextView2 = this.f34381j.f55244r;
            drawableMutate.setColorFilter(r.p.d(appCompatTextView2 != null ? appCompatTextView2.getCurrentTextColor() : -1, PorterDuff.Mode.SRC_IN));
        } else if (this.f34387m && (appCompatTextView = this.o) != null) {
            drawableMutate.setColorFilter(r.p.d(appCompatTextView.getCurrentTextColor(), PorterDuff.Mode.SRC_IN));
        } else {
            drawableMutate.clearColorFilter();
            this.f34369d.refreshDrawableState();
        }
    }

    public final void B() {
        Drawable rippleDrawable;
        EditText editText = this.f34369d;
        if (editText == null || this.F == null) {
            return;
        }
        if ((this.I || editText.getBackground() == null) && this.O != 0) {
            EditText editText2 = this.f34369d;
            if ((editText2 instanceof AutoCompleteTextView) && editText2.getInputType() == 0) {
                int iM = k0.m(2130968935, this.f34369d);
                int i5 = this.O;
                int[][] iArr = B0;
                if (i5 == 2) {
                    Context context = getContext();
                    g gVar = this.F;
                    TypedValue typedValueW = e0.w(context, 2130968977, "TextInputLayout");
                    int i11 = typedValueW.resourceId;
                    int color = i11 != 0 ? context.getColor(i11) : typedValueW.data;
                    g gVar2 = new g(gVar.f17980a.f17964a);
                    int iV = k0.v(0.1f, iM, color);
                    gVar2.l(new ColorStateList(iArr, new int[]{iV, 0}));
                    gVar2.setTint(color);
                    ColorStateList colorStateList = new ColorStateList(iArr, new int[]{iV, color});
                    g gVar3 = new g(gVar.f17980a.f17964a);
                    gVar3.setTint(-1);
                    rippleDrawable = new LayerDrawable(new Drawable[]{new RippleDrawable(colorStateList, gVar2, gVar3), gVar});
                } else if (i5 == 1) {
                    g gVar4 = this.F;
                    int i12 = this.U;
                    rippleDrawable = new RippleDrawable(new ColorStateList(iArr, new int[]{k0.v(0.1f, iM, i12), i12}), gVar4, gVar4);
                } else {
                    rippleDrawable = null;
                }
            } else {
                rippleDrawable = this.F;
            }
            EditText editText3 = this.f34369d;
            WeakHashMap weakHashMap = a5.a1.f250a;
            editText3.setBackground(rippleDrawable);
            this.I = true;
        }
    }

    public final void C() {
        if (this.O != 1) {
            FrameLayout frameLayout = this.f34363a;
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) frameLayout.getLayoutParams();
            int iC = c();
            if (iC != layoutParams.topMargin) {
                layoutParams.topMargin = iC;
                frameLayout.requestLayout();
            }
        }
    }

    public final void D(boolean z11, boolean z12) {
        ColorStateList colorStateList;
        AppCompatTextView appCompatTextView;
        boolean zIsEnabled = isEnabled();
        EditText editText = this.f34369d;
        boolean z13 = (editText == null || TextUtils.isEmpty(editText.getText())) ? false : true;
        EditText editText2 = this.f34369d;
        boolean z14 = editText2 != null && editText2.hasFocus();
        ColorStateList colorStateList2 = this.f34378h0;
        b bVar = this.f34402u0;
        if (colorStateList2 != null) {
            bVar.j(colorStateList2);
        }
        if (!zIsEnabled) {
            ColorStateList colorStateList3 = this.f34378h0;
            bVar.j(ColorStateList.valueOf(colorStateList3 != null ? colorStateList3.getColorForState(new int[]{-16842910}, this.f34396r0) : this.f34396r0));
        } else if (u()) {
            AppCompatTextView appCompatTextView2 = this.f34381j.f55244r;
            bVar.j(appCompatTextView2 != null ? appCompatTextView2.getTextColors() : null);
        } else if (this.f34387m && (appCompatTextView = this.o) != null) {
            bVar.j(appCompatTextView.getTextColors());
        } else if (z14 && (colorStateList = this.f34380i0) != null && bVar.o != colorStateList) {
            bVar.o = colorStateList;
            bVar.i(false);
        }
        m mVar = this.f34367c;
        v vVar = this.f34365b;
        boolean z15 = this.f34406w0;
        if (!z13 && this.f34404v0 && (!isEnabled() || !z14)) {
            if (z12 || !this.f34400t0) {
                ValueAnimator valueAnimator = this.f34408x0;
                if (valueAnimator != null && valueAnimator.isRunning()) {
                    this.f34408x0.cancel();
                }
                if (z11 && z15) {
                    a(0.0f);
                } else {
                    bVar.o(0.0f);
                }
                if (e() && !((fk.g) this.F).f55183y.f55181r.isEmpty() && e()) {
                    ((fk.g) this.F).q(0.0f, 0.0f, 0.0f, 0.0f);
                }
                this.f34400t0 = true;
                i();
                vVar.f55277h = true;
                vVar.c();
                mVar.o = true;
                mVar.m();
                return;
            }
            return;
        }
        if (z12 || this.f34400t0) {
            ValueAnimator valueAnimator2 = this.f34408x0;
            if (valueAnimator2 != null && valueAnimator2.isRunning()) {
                this.f34408x0.cancel();
            }
            if (z11 && z15) {
                a(1.0f);
            } else {
                bVar.o(1.0f);
            }
            this.f34400t0 = false;
            if (e()) {
                k();
            }
            EditText editText3 = this.f34369d;
            Editable text = editText3 != null ? editText3.getText() : null;
            this.n.getClass();
            if ((text != null ? text.length() : 0) != 0 || this.f34400t0) {
                i();
            } else {
                v();
            }
            vVar.f55277h = false;
            vVar.c();
            mVar.o = false;
            mVar.m();
        }
    }

    public final void E(boolean z11, boolean z12) {
        int defaultColor = this.f34388m0.getDefaultColor();
        int colorForState = this.f34388m0.getColorForState(new int[]{16843623, 16842910}, defaultColor);
        int colorForState2 = this.f34388m0.getColorForState(new int[]{16843518, 16842910}, defaultColor);
        if (z11) {
            this.T = colorForState2;
        } else if (z12) {
            this.T = colorForState;
        } else {
            this.T = defaultColor;
        }
    }

    public final void F() {
        AppCompatTextView appCompatTextView;
        EditText editText;
        EditText editText2;
        if (this.F == null || this.O == 0) {
            return;
        }
        boolean z11 = false;
        boolean z12 = isFocused() || ((editText2 = this.f34369d) != null && editText2.hasFocus());
        if (isHovered() || ((editText = this.f34369d) != null && editText.isHovered())) {
            z11 = true;
        }
        if (!isEnabled()) {
            this.T = this.f34396r0;
        } else if (u()) {
            if (this.f34388m0 != null) {
                E(z12, z11);
            } else {
                AppCompatTextView appCompatTextView2 = this.f34381j.f55244r;
                this.T = appCompatTextView2 != null ? appCompatTextView2.getCurrentTextColor() : -1;
            }
        } else if (!this.f34387m || (appCompatTextView = this.o) == null) {
            if (z12) {
                this.T = this.f34386l0;
            } else if (z11) {
                this.T = this.f34384k0;
            } else {
                this.T = this.f34382j0;
            }
        } else if (this.f34388m0 != null) {
            E(z12, z11);
        } else {
            this.T = appCompatTextView.getCurrentTextColor();
        }
        if (Build.VERSION.SDK_INT >= 29) {
            y();
        }
        m mVar = this.f34367c;
        mVar.k();
        CheckableImageButton checkableImageButton = mVar.f55208f;
        TextInputLayout textInputLayout = mVar.f55203a;
        u.W(textInputLayout, mVar.f55205c, mVar.f55206d);
        u.W(textInputLayout, checkableImageButton, mVar.f55212j);
        if (mVar.b() instanceof i) {
            if (!textInputLayout.u() || checkableImageButton.getDrawable() == null) {
                u.E(textInputLayout, checkableImageButton, mVar.f55212j, mVar.f55213k);
            } else {
                Drawable drawableMutate = checkableImageButton.getDrawable().mutate();
                AppCompatTextView appCompatTextView3 = textInputLayout.f34381j.f55244r;
                drawableMutate.setTint(appCompatTextView3 != null ? appCompatTextView3.getCurrentTextColor() : -1);
                checkableImageButton.setImageDrawable(drawableMutate);
            }
        }
        v vVar = this.f34365b;
        u.W(vVar.f55270a, vVar.f55273d, vVar.f55274e);
        if (this.O == 2) {
            int i5 = this.Q;
            if (z12 && isEnabled()) {
                this.Q = this.S;
            } else {
                this.Q = this.R;
            }
            if (this.Q != i5 && e() && !this.f34400t0) {
                if (e()) {
                    ((fk.g) this.F).q(0.0f, 0.0f, 0.0f, 0.0f);
                }
                k();
            }
        }
        if (this.O == 1) {
            if (!isEnabled()) {
                this.U = this.f34390o0;
            } else if (z11 && !z12) {
                this.U = this.f34394q0;
            } else if (z12) {
                this.U = this.f34392p0;
            } else {
                this.U = this.f34389n0;
            }
        }
        b();
    }

    public final void a(float f11) {
        b bVar = this.f34402u0;
        if (bVar.f89337b == f11) {
            return;
        }
        if (this.f34408x0 == null) {
            ValueAnimator valueAnimator = new ValueAnimator();
            this.f34408x0 = valueAnimator;
            valueAnimator.setInterpolator(l.r(getContext(), 2130969713, cj.a.f19952b));
            this.f34408x0.setDuration(l.q(getContext(), 2130969703, 167));
            this.f34408x0.addUpdateListener(new a0(this, 4));
        }
        this.f34408x0.setFloatValues(bVar.f89337b, f11);
        this.f34408x0.start();
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (!(view instanceof EditText)) {
            super.addView(view, i5, layoutParams);
            return;
        }
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(layoutParams);
        layoutParams2.gravity = (layoutParams2.gravity & (-113)) | 16;
        FrameLayout frameLayout = this.f34363a;
        frameLayout.addView(view, layoutParams2);
        frameLayout.setLayoutParams(layoutParams);
        C();
        EditText editText = (EditText) view;
        if (this.f34369d != null) {
            throw new IllegalArgumentException("We already have an EditText, can only have one");
        }
        m mVar = this.f34367c;
        if (mVar.f55210h != 3 && !(editText instanceof TextInputEditText)) {
            Log.i("TextInputLayout", "EditText added is not a TextInputEditText. Please switch to using that class instead.");
        }
        this.f34369d = editText;
        int i11 = this.f34373f;
        if (i11 != -1) {
            this.f34373f = i11;
            if (i11 != -1) {
                editText.setMinEms(i11);
            }
        } else {
            int i12 = this.f34377h;
            this.f34377h = i12;
            if (i12 != -1) {
                editText.setMinWidth(i12);
            }
        }
        int i13 = this.f34375g;
        if (i13 != -1) {
            this.f34375g = i13;
            EditText editText2 = this.f34369d;
            if (editText2 != null && i13 != -1) {
                editText2.setMaxEms(i13);
            }
        } else {
            int i14 = this.f34379i;
            this.f34379i = i14;
            EditText editText3 = this.f34369d;
            if (editText3 != null && i14 != -1) {
                editText3.setMaxWidth(i14);
            }
        }
        this.I = false;
        j();
        com.google.android.material.datepicker.l lVar = new com.google.android.material.datepicker.l(this);
        EditText editText4 = this.f34369d;
        if (editText4 != null) {
            a5.a1.k(editText4, lVar);
        }
        Typeface typeface = this.f34369d.getTypeface();
        b bVar = this.f34402u0;
        boolean zL = bVar.l(typeface);
        boolean zN = bVar.n(typeface);
        if (zL || zN) {
            bVar.i(false);
        }
        float textSize = this.f34369d.getTextSize();
        if (bVar.f89357l != textSize) {
            bVar.f89357l = textSize;
            bVar.i(false);
        }
        int i15 = Build.VERSION.SDK_INT;
        float letterSpacing = this.f34369d.getLetterSpacing();
        if (bVar.f89348g0 != letterSpacing) {
            bVar.f89348g0 = letterSpacing;
            bVar.i(false);
        }
        int gravity = this.f34369d.getGravity();
        int i16 = (gravity & (-113)) | 48;
        if (bVar.f89355k != i16) {
            bVar.f89355k = i16;
            bVar.i(false);
        }
        if (bVar.f89353j != gravity) {
            bVar.f89353j = gravity;
            bVar.i(false);
        }
        WeakHashMap weakHashMap = a5.a1.f250a;
        this.f34398s0 = editText.getMinimumHeight();
        this.f34369d.addTextChangedListener(new w(this, editText));
        if (this.f34378h0 == null) {
            this.f34378h0 = this.f34369d.getHintTextColors();
        }
        if (this.C) {
            if (TextUtils.isEmpty(this.D)) {
                CharSequence hint = this.f34369d.getHint();
                this.f34371e = hint;
                p(hint);
                this.f34369d.setHint((CharSequence) null);
            }
            this.E = true;
        }
        if (i15 >= 29) {
            y();
        }
        if (this.o != null) {
            w(this.f34369d.getText());
        }
        A();
        this.f34381j.b();
        this.f34365b.bringToFront();
        mVar.bringToFront();
        Iterator it = this.f34370d0.iterator();
        while (it.hasNext()) {
            ((k) it.next()).a(this);
        }
        mVar.l();
        if (!isEnabled()) {
            editText.setEnabled(false);
        }
        D(false, true);
    }

    public final void b() {
        int i5;
        int i11;
        g gVar = this.F;
        if (gVar == null) {
            return;
        }
        j jVar = gVar.f17980a.f17964a;
        j jVar2 = this.L;
        if (jVar != jVar2) {
            gVar.c(jVar2);
        }
        if (this.O == 2 && (i5 = this.Q) > -1 && (i11 = this.T) != 0) {
            g gVar2 = this.F;
            gVar2.f17980a.f17973j = i5;
            gVar2.invalidateSelf();
            ColorStateList colorStateListValueOf = ColorStateList.valueOf(i11);
            f fVar = gVar2.f17980a;
            if (fVar.f17967d != colorStateListValueOf) {
                fVar.f17967d = colorStateListValueOf;
                gVar2.onStateChange(gVar2.getState());
            }
        }
        int iJ = this.U;
        if (this.O == 1) {
            iJ = r4.a.j(this.U, k0.n(getContext(), 2130968977, 0));
        }
        this.U = iJ;
        this.F.l(ColorStateList.valueOf(iJ));
        g gVar3 = this.J;
        if (gVar3 != null && this.K != null) {
            if (this.Q > -1 && this.T != 0) {
                gVar3.l(this.f34369d.isFocused() ? ColorStateList.valueOf(this.f34382j0) : ColorStateList.valueOf(this.T));
                this.K.l(ColorStateList.valueOf(this.T));
            }
            invalidate();
        }
        B();
    }

    public final int c() {
        float fE;
        if (!this.C) {
            return 0;
        }
        int i5 = this.O;
        b bVar = this.f34402u0;
        if (i5 == 0) {
            fE = bVar.e();
        } else {
            if (i5 != 2) {
                return 0;
            }
            fE = bVar.e() / 2.0f;
        }
        return (int) fE;
    }

    public final Fade d() {
        Fade fade = new Fade();
        fade.setDuration(l.q(getContext(), 2130969705, 87));
        fade.setInterpolator(l.r(getContext(), 2130969715, cj.a.f19951a));
        return fade;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchProvideAutofillStructure(ViewStructure viewStructure, int i5) {
        EditText editText = this.f34369d;
        if (editText == null) {
            super.dispatchProvideAutofillStructure(viewStructure, i5);
            return;
        }
        if (this.f34371e != null) {
            boolean z11 = this.E;
            this.E = false;
            CharSequence hint = editText.getHint();
            this.f34369d.setHint(this.f34371e);
            try {
                super.dispatchProvideAutofillStructure(viewStructure, i5);
                return;
            } finally {
                this.f34369d.setHint(hint);
                this.E = z11;
            }
        }
        viewStructure.setAutofillId(getAutofillId());
        onProvideAutofillStructure(viewStructure, i5);
        onProvideAutofillVirtualStructure(viewStructure, i5);
        FrameLayout frameLayout = this.f34363a;
        viewStructure.setChildCount(frameLayout.getChildCount());
        for (int i11 = 0; i11 < frameLayout.getChildCount(); i11++) {
            View childAt = frameLayout.getChildAt(i11);
            ViewStructure viewStructureNewChild = viewStructure.newChild(i11);
            childAt.dispatchProvideAutofillStructure(viewStructureNewChild, i5);
            if (childAt == this.f34369d) {
                viewStructureNewChild.setHint(this.C ? this.D : null);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray sparseArray) {
        this.f34412z0 = true;
        super.dispatchRestoreInstanceState(sparseArray);
        this.f34412z0 = false;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        g gVar;
        super.draw(canvas);
        boolean z11 = this.C;
        b bVar = this.f34402u0;
        if (z11) {
            bVar.d(canvas);
        }
        if (this.K == null || (gVar = this.J) == null) {
            return;
        }
        gVar.draw(canvas);
        if (this.f34369d.isFocused()) {
            Rect bounds = this.K.getBounds();
            Rect bounds2 = this.J.getBounds();
            float f11 = bVar.f89337b;
            int iCenterX = bounds2.centerX();
            bounds.left = cj.a.c(f11, iCenterX, bounds2.left);
            bounds.right = cj.a.c(f11, iCenterX, bounds2.right);
            this.K.draw(canvas);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002f  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void drawableStateChanged() {
        boolean z11;
        ColorStateList colorStateList;
        if (this.f34410y0) {
            return;
        }
        this.f34410y0 = true;
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        b bVar = this.f34402u0;
        if (bVar != null) {
            bVar.R = drawableState;
            ColorStateList colorStateList2 = bVar.o;
            if ((colorStateList2 == null || !colorStateList2.isStateful()) && ((colorStateList = bVar.n) == null || !colorStateList.isStateful())) {
                z11 = false;
            } else {
                bVar.i(false);
                z11 = true;
            }
        }
        if (this.f34369d != null) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            D(isLaidOut() && isEnabled(), false);
        }
        A();
        F();
        if (z11) {
            invalidate();
        }
        this.f34410y0 = false;
    }

    public final boolean e() {
        return this.C && !TextUtils.isEmpty(this.D) && (this.F instanceof fk.g);
    }

    public final g f(boolean z11) throws Resources.NotFoundException {
        float dimensionPixelOffset = getResources().getDimensionPixelOffset(2131166236);
        float f11 = z11 ? dimensionPixelOffset : 0.0f;
        EditText editText = this.f34369d;
        float dimensionPixelOffset2 = editText instanceof s ? ((s) editText).f55261h : getResources().getDimensionPixelOffset(2131165770);
        int dimensionPixelOffset3 = getResources().getDimensionPixelOffset(2131166173);
        bk.i iVar = new bk.i();
        bk.i iVar2 = new bk.i();
        bk.i iVar3 = new bk.i();
        bk.i iVar4 = new bk.i();
        int i5 = 0;
        e eVar = new e(i5);
        e eVar2 = new e(i5);
        e eVar3 = new e(i5);
        e eVar4 = new e(i5);
        bk.a aVar = new bk.a(f11);
        bk.a aVar2 = new bk.a(f11);
        bk.a aVar3 = new bk.a(dimensionPixelOffset);
        bk.a aVar4 = new bk.a(dimensionPixelOffset);
        j jVar = new j();
        jVar.f18003a = iVar;
        jVar.f18004b = iVar2;
        jVar.f18005c = iVar3;
        jVar.f18006d = iVar4;
        jVar.f18007e = aVar;
        jVar.f18008f = aVar2;
        jVar.f18009g = aVar4;
        jVar.f18010h = aVar3;
        jVar.f18011i = eVar;
        jVar.f18012j = eVar2;
        jVar.f18013k = eVar3;
        jVar.f18014l = eVar4;
        EditText editText2 = this.f34369d;
        ColorStateList colorStateListValueOf = editText2 instanceof s ? ((s) editText2).f55262i : null;
        Context context = getContext();
        if (colorStateListValueOf == null) {
            Paint paint = g.f17979x;
            TypedValue typedValueW = e0.w(context, 2130968977, g.class.getSimpleName());
            int i11 = typedValueW.resourceId;
            colorStateListValueOf = ColorStateList.valueOf(i11 != 0 ? context.getColor(i11) : typedValueW.data);
        }
        g gVar = new g();
        gVar.j(context);
        gVar.l(colorStateListValueOf);
        gVar.k(dimensionPixelOffset2);
        gVar.c(jVar);
        f fVar = gVar.f17980a;
        if (fVar.f17970g == null) {
            fVar.f17970g = new Rect();
        }
        gVar.f17980a.f17970g.set(0, dimensionPixelOffset3, 0, dimensionPixelOffset3);
        gVar.invalidateSelf();
        return gVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x000e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int g(int i5, boolean z11) {
        int iC;
        if (!z11) {
            v vVar = this.f34365b;
            if (vVar.f55272c != null) {
                iC = vVar.a();
            } else if (z11) {
                m mVar = this.f34367c;
                iC = mVar.f55215m != null ? mVar.c() : this.f34369d.getCompoundPaddingLeft();
            }
        }
        return iC + i5;
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final int getBaseline() {
        EditText editText = this.f34369d;
        if (editText == null) {
            return super.getBaseline();
        }
        return c() + getPaddingTop() + editText.getBaseline();
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x000e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int h(int i5, boolean z11) {
        int iA;
        if (!z11) {
            m mVar = this.f34367c;
            if (mVar.f55215m != null) {
                iA = mVar.c();
            } else if (z11) {
                v vVar = this.f34365b;
                iA = vVar.f55272c != null ? vVar.a() : this.f34369d.getCompoundPaddingRight();
            }
        }
        return i5 - iA;
    }

    public final void i() {
        AppCompatTextView appCompatTextView = this.f34399t;
        if (appCompatTextView == null || !this.f34397s) {
            return;
        }
        appCompatTextView.setText((CharSequence) null);
        TransitionManager.beginDelayedTransition(this.f34363a, this.f34407x);
        this.f34399t.setVisibility(4);
    }

    public final void j() {
        int i5 = this.O;
        if (i5 == 0) {
            this.F = null;
            this.J = null;
            this.K = null;
        } else if (i5 == 1) {
            this.F = new g(this.L);
            this.J = new g();
            this.K = new g();
        } else {
            if (i5 != 2) {
                throw new IllegalArgumentException(c0.o(new StringBuilder(), this.O, " is illegal; only @BoxBackgroundMode constants are supported."));
            }
            if (!this.C || (this.F instanceof fk.g)) {
                this.F = new g(this.L);
            } else {
                j jVar = this.L;
                int i11 = fk.g.f55182z;
                if (jVar == null) {
                    jVar = new j(0);
                }
                fk.f fVar = new fk.f(jVar, new RectF());
                fk.g gVar = new fk.g(fVar);
                gVar.f55183y = fVar;
                this.F = gVar;
            }
            this.J = null;
            this.K = null;
        }
        B();
        F();
        if (this.O == 1) {
            if (getContext().getResources().getConfiguration().fontScale >= 2.0f) {
                this.P = getResources().getDimensionPixelSize(2131166009);
            } else if (f0.v(getContext())) {
                this.P = getResources().getDimensionPixelSize(2131166008);
            }
        }
        if (this.f34369d != null && this.O == 1) {
            if (getContext().getResources().getConfiguration().fontScale >= 2.0f) {
                EditText editText = this.f34369d;
                WeakHashMap weakHashMap = a5.a1.f250a;
                editText.setPaddingRelative(editText.getPaddingStart(), getResources().getDimensionPixelSize(2131166007), this.f34369d.getPaddingEnd(), getResources().getDimensionPixelSize(2131166006));
            } else if (f0.v(getContext())) {
                EditText editText2 = this.f34369d;
                WeakHashMap weakHashMap2 = a5.a1.f250a;
                editText2.setPaddingRelative(editText2.getPaddingStart(), getResources().getDimensionPixelSize(2131166005), this.f34369d.getPaddingEnd(), getResources().getDimensionPixelSize(2131166004));
            }
        }
        if (this.O != 0) {
            C();
        }
        EditText editText3 = this.f34369d;
        if (editText3 instanceof AutoCompleteTextView) {
            AutoCompleteTextView autoCompleteTextView = (AutoCompleteTextView) editText3;
            if (autoCompleteTextView.getDropDownBackground() == null) {
                int i12 = this.O;
                if (i12 == 2) {
                    if (this.G == null) {
                        this.G = f(true);
                    }
                    autoCompleteTextView.setDropDownBackgroundDrawable(this.G);
                } else if (i12 == 1) {
                    if (this.H == null) {
                        StateListDrawable stateListDrawable = new StateListDrawable();
                        this.H = stateListDrawable;
                        int[] iArr = {16842922};
                        if (this.G == null) {
                            this.G = f(true);
                        }
                        stateListDrawable.addState(iArr, this.G);
                        this.H.addState(new int[0], f(false));
                    }
                    autoCompleteTextView.setDropDownBackgroundDrawable(this.H);
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x008d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void k() {
        float f11;
        float f12;
        float f13;
        RectF rectF;
        float f14;
        int i5;
        float f15;
        int i11;
        if (e()) {
            int width = this.f34369d.getWidth();
            int gravity = this.f34369d.getGravity();
            b bVar = this.f34402u0;
            boolean zB = bVar.b(bVar.G);
            bVar.I = zB;
            Rect rect = bVar.f89349h;
            if (gravity != 17 && (gravity & 7) != 1) {
                if ((gravity & 8388613) == 8388613 || (gravity & 5) == 5) {
                    if (zB) {
                        i11 = rect.left;
                        f13 = i11;
                    } else {
                        f11 = rect.right;
                        f12 = bVar.f89354j0;
                    }
                } else if (zB) {
                    f11 = rect.right;
                    f12 = bVar.f89354j0;
                } else {
                    i11 = rect.left;
                    f13 = i11;
                }
                float fMax = Math.max(f13, rect.left);
                rectF = this.f34364a0;
                rectF.left = fMax;
                rectF.top = rect.top;
                if (gravity != 17 || (gravity & 7) == 1) {
                    f14 = (width / 2.0f) + (bVar.f89354j0 / 2.0f);
                } else if ((gravity & 8388613) == 8388613 || (gravity & 5) == 5) {
                    if (bVar.I) {
                        f15 = bVar.f89354j0;
                        f14 = f15 + fMax;
                    } else {
                        i5 = rect.right;
                        f14 = i5;
                    }
                } else if (bVar.I) {
                    i5 = rect.right;
                    f14 = i5;
                } else {
                    f15 = bVar.f89354j0;
                    f14 = f15 + fMax;
                }
                rectF.right = Math.min(f14, rect.right);
                rectF.bottom = bVar.e() + rect.top;
                if (rectF.width() > 0.0f || rectF.height() <= 0.0f) {
                }
                float f16 = rectF.left;
                float f17 = this.N;
                rectF.left = f16 - f17;
                rectF.right += f17;
                rectF.offset(-getPaddingLeft(), ((-getPaddingTop()) - (rectF.height() / 2.0f)) + this.Q);
                fk.g gVar = (fk.g) this.F;
                gVar.getClass();
                gVar.q(rectF.left, rectF.top, rectF.right, rectF.bottom);
                return;
            }
            f11 = width / 2.0f;
            f12 = bVar.f89354j0 / 2.0f;
            f13 = f11 - f12;
            float fMax2 = Math.max(f13, rect.left);
            rectF = this.f34364a0;
            rectF.left = fMax2;
            rectF.top = rect.top;
            if (gravity != 17) {
                f14 = (width / 2.0f) + (bVar.f89354j0 / 2.0f);
            }
            rectF.right = Math.min(f14, rect.right);
            rectF.bottom = bVar.e() + rect.top;
            if (rectF.width() > 0.0f) {
            }
        }
    }

    public final void m(CharSequence charSequence) {
        p pVar = this.f34381j;
        if (!pVar.f55243q) {
            if (TextUtils.isEmpty(charSequence)) {
                return;
            } else {
                n(true);
            }
        }
        if (TextUtils.isEmpty(charSequence)) {
            pVar.f();
            return;
        }
        pVar.c();
        pVar.f55242p = charSequence;
        pVar.f55244r.setText(charSequence);
        int i5 = pVar.n;
        if (i5 != 1) {
            pVar.o = 1;
        }
        pVar.i(i5, pVar.o, pVar.h(pVar.f55244r, charSequence));
    }

    public final void n(boolean z11) {
        p pVar = this.f34381j;
        TextInputLayout textInputLayout = pVar.f55236h;
        if (pVar.f55243q == z11) {
            return;
        }
        pVar.c();
        if (z11) {
            AppCompatTextView appCompatTextView = new AppCompatTextView(pVar.f55235g, null);
            pVar.f55244r = appCompatTextView;
            appCompatTextView.setId(2131429017);
            pVar.f55244r.setTextAlignment(5);
            int i5 = pVar.f55247u;
            pVar.f55247u = i5;
            AppCompatTextView appCompatTextView2 = pVar.f55244r;
            if (appCompatTextView2 != null) {
                pVar.f55236h.t(appCompatTextView2, i5);
            }
            ColorStateList colorStateList = pVar.f55248v;
            pVar.f55248v = colorStateList;
            AppCompatTextView appCompatTextView3 = pVar.f55244r;
            if (appCompatTextView3 != null && colorStateList != null) {
                appCompatTextView3.setTextColor(colorStateList);
            }
            CharSequence charSequence = pVar.f55245s;
            pVar.f55245s = charSequence;
            AppCompatTextView appCompatTextView4 = pVar.f55244r;
            if (appCompatTextView4 != null) {
                appCompatTextView4.setContentDescription(charSequence);
            }
            int i11 = pVar.f55246t;
            pVar.f55246t = i11;
            AppCompatTextView appCompatTextView5 = pVar.f55244r;
            if (appCompatTextView5 != null) {
                WeakHashMap weakHashMap = a5.a1.f250a;
                appCompatTextView5.setAccessibilityLiveRegion(i11);
            }
            pVar.f55244r.setVisibility(4);
            pVar.a(pVar.f55244r, 0);
        } else {
            pVar.f();
            pVar.g(pVar.f55244r, 0);
            pVar.f55244r = null;
            textInputLayout.A();
            textInputLayout.F();
        }
        pVar.f55243q = z11;
    }

    public final void o(boolean z11) {
        p pVar = this.f34381j;
        TextInputLayout textInputLayout = pVar.f55236h;
        if (pVar.f55250x == z11) {
            return;
        }
        pVar.c();
        int i5 = 1;
        if (z11) {
            AppCompatTextView appCompatTextView = new AppCompatTextView(pVar.f55235g, null);
            pVar.f55251y = appCompatTextView;
            appCompatTextView.setId(2131429018);
            pVar.f55251y.setTextAlignment(5);
            pVar.f55251y.setVisibility(4);
            AppCompatTextView appCompatTextView2 = pVar.f55251y;
            WeakHashMap weakHashMap = a5.a1.f250a;
            appCompatTextView2.setAccessibilityLiveRegion(1);
            int i11 = pVar.f55252z;
            pVar.f55252z = i11;
            AppCompatTextView appCompatTextView3 = pVar.f55251y;
            if (appCompatTextView3 != null) {
                appCompatTextView3.setTextAppearance(i11);
            }
            ColorStateList colorStateList = pVar.A;
            pVar.A = colorStateList;
            AppCompatTextView appCompatTextView4 = pVar.f55251y;
            if (appCompatTextView4 != null && colorStateList != null) {
                appCompatTextView4.setTextColor(colorStateList);
            }
            pVar.a(pVar.f55251y, 1);
            pVar.f55251y.setAccessibilityDelegate(new o(pVar, i5));
        } else {
            pVar.c();
            int i12 = pVar.n;
            if (i12 == 2) {
                pVar.o = 0;
            }
            pVar.i(i12, pVar.o, pVar.h(pVar.f55251y, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
            pVar.g(pVar.f55251y, 1);
            pVar.f55251y = null;
            textInputLayout.A();
            textInputLayout.F();
        }
        pVar.f55250x = z11;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.f34402u0.h(configuration);
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        int iMax;
        m mVar = this.f34367c;
        mVar.getViewTreeObserver().removeOnGlobalLayoutListener(this);
        boolean z11 = false;
        this.A0 = false;
        if (this.f34369d != null && this.f34369d.getMeasuredHeight() < (iMax = Math.max(mVar.getMeasuredHeight(), this.f34365b.getMeasuredHeight()))) {
            this.f34369d.setMinimumHeight(iMax);
            z11 = true;
        }
        boolean z12 = z();
        if (z11 || z12) {
            this.f34369d.post(new x(this, 28));
        }
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        EditText editText = this.f34369d;
        if (editText != null) {
            Rect rect = this.V;
            tj.c.a(this, editText, rect);
            g gVar = this.J;
            if (gVar != null) {
                int i14 = rect.bottom;
                gVar.setBounds(rect.left, i14 - this.R, rect.right, i14);
            }
            g gVar2 = this.K;
            if (gVar2 != null) {
                int i15 = rect.bottom;
                gVar2.setBounds(rect.left, i15 - this.S, rect.right, i15);
            }
            if (this.C) {
                float textSize = this.f34369d.getTextSize();
                b bVar = this.f34402u0;
                if (bVar.f89357l != textSize) {
                    bVar.f89357l = textSize;
                    bVar.i(false);
                }
                int gravity = this.f34369d.getGravity();
                int i16 = (gravity & (-113)) | 48;
                if (bVar.f89355k != i16) {
                    bVar.f89355k = i16;
                    bVar.i(false);
                }
                if (bVar.f89353j != gravity) {
                    bVar.f89353j = gravity;
                    bVar.i(false);
                }
                if (this.f34369d == null) {
                    throw new IllegalStateException();
                }
                boolean zE = tj.i.e(this);
                int i17 = rect.bottom;
                Rect rect2 = this.W;
                rect2.bottom = i17;
                int i18 = this.O;
                if (i18 == 1) {
                    rect2.left = g(rect.left, zE);
                    rect2.top = rect.top + this.P;
                    rect2.right = h(rect.right, zE);
                } else if (i18 != 2) {
                    rect2.left = g(rect.left, zE);
                    rect2.top = getPaddingTop();
                    rect2.right = h(rect.right, zE);
                } else {
                    rect2.left = this.f34369d.getPaddingLeft() + rect.left;
                    rect2.top = rect.top - c();
                    rect2.right = rect.right - this.f34369d.getPaddingRight();
                }
                int i19 = rect2.left;
                int i21 = rect2.top;
                int i22 = rect2.right;
                int i23 = rect2.bottom;
                Rect rect3 = bVar.f89349h;
                if (rect3.left != i19 || rect3.top != i21 || rect3.right != i22 || rect3.bottom != i23) {
                    rect3.set(i19, i21, i22, i23);
                    bVar.S = true;
                }
                if (this.f34369d == null) {
                    throw new IllegalStateException();
                }
                TextPaint textPaint = bVar.U;
                textPaint.setTextSize(bVar.f89357l);
                textPaint.setTypeface(bVar.f89374z);
                textPaint.setLetterSpacing(bVar.f89348g0);
                float f11 = -textPaint.ascent();
                rect2.left = this.f34369d.getCompoundPaddingLeft() + rect.left;
                rect2.top = (this.O != 1 || this.f34369d.getMinLines() > 1) ? rect.top + this.f34369d.getCompoundPaddingTop() : (int) (rect.centerY() - (f11 / 2.0f));
                rect2.right = rect.right - this.f34369d.getCompoundPaddingRight();
                int compoundPaddingBottom = (this.O != 1 || this.f34369d.getMinLines() > 1) ? rect.bottom - this.f34369d.getCompoundPaddingBottom() : (int) (rect2.top + f11);
                rect2.bottom = compoundPaddingBottom;
                int i24 = rect2.left;
                int i25 = rect2.top;
                int i26 = rect2.right;
                Rect rect4 = bVar.f89347g;
                if (rect4.left != i24 || rect4.top != i25 || rect4.right != i26 || rect4.bottom != compoundPaddingBottom) {
                    rect4.set(i24, i25, i26, compoundPaddingBottom);
                    bVar.S = true;
                }
                bVar.i(false);
                if (!e() || this.f34400t0) {
                    return;
                }
                k();
            }
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        EditText editText;
        super.onMeasure(i5, i11);
        boolean z11 = this.A0;
        m mVar = this.f34367c;
        if (!z11) {
            mVar.getViewTreeObserver().addOnGlobalLayoutListener(this);
            this.A0 = true;
        }
        if (this.f34399t != null && (editText = this.f34369d) != null) {
            this.f34399t.setGravity(editText.getGravity());
            this.f34399t.setPadding(this.f34369d.getCompoundPaddingLeft(), this.f34369d.getCompoundPaddingTop(), this.f34369d.getCompoundPaddingRight(), this.f34369d.getCompoundPaddingBottom());
        }
        mVar.l();
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.f14272a);
        m(savedState.f34413c);
        if (savedState.f34414d) {
            post(new h(this, 17));
        }
        requestLayout();
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onRtlPropertiesChanged(int i5) {
        super.onRtlPropertiesChanged(i5);
        boolean z11 = i5 == 1;
        if (z11 != this.M) {
            bk.c cVar = this.L.f18007e;
            RectF rectF = this.f34364a0;
            float fA = cVar.a(rectF);
            float fA2 = this.L.f18008f.a(rectF);
            float fA3 = this.L.f18010h.a(rectF);
            float fA4 = this.L.f18009g.a(rectF);
            j jVar = this.L;
            com.google.android.gms.internal.consent_sdk.e0 e0Var = jVar.f18003a;
            com.google.android.gms.internal.consent_sdk.e0 e0Var2 = jVar.f18004b;
            com.google.android.gms.internal.consent_sdk.e0 e0Var3 = jVar.f18006d;
            com.google.android.gms.internal.consent_sdk.e0 e0Var4 = jVar.f18005c;
            e eVar = new e(0);
            e eVar2 = new e(0);
            e eVar3 = new e(0);
            e eVar4 = new e(0);
            bk.a aVar = new bk.a(fA2);
            bk.a aVar2 = new bk.a(fA);
            bk.a aVar3 = new bk.a(fA4);
            bk.a aVar4 = new bk.a(fA3);
            j jVar2 = new j();
            jVar2.f18003a = e0Var2;
            jVar2.f18004b = e0Var;
            jVar2.f18005c = e0Var3;
            jVar2.f18006d = e0Var4;
            jVar2.f18007e = aVar;
            jVar2.f18008f = aVar2;
            jVar2.f18009g = aVar4;
            jVar2.f18010h = aVar3;
            jVar2.f18011i = eVar;
            jVar2.f18012j = eVar2;
            jVar2.f18013k = eVar3;
            jVar2.f18014l = eVar4;
            this.M = z11;
            g gVar = this.F;
            if (gVar == null || gVar.f17980a.f17964a == jVar2) {
                return;
            }
            this.L = jVar2;
            b();
        }
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        if (u()) {
            p pVar = this.f34381j;
            savedState.f34413c = pVar.f55243q ? pVar.f55242p : null;
        }
        m mVar = this.f34367c;
        savedState.f34414d = mVar.f55210h != 0 && mVar.f55208f.f34314d;
        return savedState;
    }

    public final void p(CharSequence charSequence) {
        if (this.C) {
            if (!TextUtils.equals(charSequence, this.D)) {
                this.D = charSequence;
                b bVar = this.f34402u0;
                if (charSequence == null || !TextUtils.equals(bVar.G, charSequence)) {
                    bVar.G = charSequence;
                    bVar.H = null;
                    Bitmap bitmap = bVar.K;
                    if (bitmap != null) {
                        bitmap.recycle();
                        bVar.K = null;
                    }
                    bVar.i(false);
                }
                if (!this.f34400t0) {
                    k();
                }
            }
            sendAccessibilityEvent(2048);
        }
    }

    public final void q(CharSequence charSequence) {
        if (this.f34399t == null) {
            AppCompatTextView appCompatTextView = new AppCompatTextView(getContext(), null);
            this.f34399t = appCompatTextView;
            appCompatTextView.setId(2131429019);
            AppCompatTextView appCompatTextView2 = this.f34399t;
            WeakHashMap weakHashMap = a5.a1.f250a;
            appCompatTextView2.setImportantForAccessibility(2);
            Fade fadeD = d();
            this.f34405w = fadeD;
            fadeD.setStartDelay(67L);
            this.f34407x = d();
            int i5 = this.f34403v;
            this.f34403v = i5;
            AppCompatTextView appCompatTextView3 = this.f34399t;
            if (appCompatTextView3 != null) {
                appCompatTextView3.setTextAppearance(i5);
            }
            r(this.f34401u);
        }
        if (TextUtils.isEmpty(charSequence)) {
            s(false);
        } else {
            if (!this.f34397s) {
                s(true);
            }
            this.f34395r = charSequence;
        }
        EditText editText = this.f34369d;
        Editable text = editText != null ? editText.getText() : null;
        this.n.getClass();
        if ((text != null ? text.length() : 0) != 0 || this.f34400t0) {
            i();
        } else {
            v();
        }
    }

    public final void r(ColorStateList colorStateList) {
        if (this.f34401u != colorStateList) {
            this.f34401u = colorStateList;
            AppCompatTextView appCompatTextView = this.f34399t;
            if (appCompatTextView == null || colorStateList == null) {
                return;
            }
            appCompatTextView.setTextColor(colorStateList);
        }
    }

    public final void s(boolean z11) {
        if (this.f34397s == z11) {
            return;
        }
        if (z11) {
            AppCompatTextView appCompatTextView = this.f34399t;
            if (appCompatTextView != null) {
                this.f34363a.addView(appCompatTextView);
                this.f34399t.setVisibility(0);
            }
        } else {
            AppCompatTextView appCompatTextView2 = this.f34399t;
            if (appCompatTextView2 != null) {
                appCompatTextView2.setVisibility(8);
            }
            this.f34399t = null;
        }
        this.f34397s = z11;
    }

    @Override // android.view.View
    public void setEnabled(boolean z11) {
        l(this, z11);
        super.setEnabled(z11);
    }

    public final void t(AppCompatTextView appCompatTextView, int i5) {
        try {
            appCompatTextView.setTextAppearance(i5);
            if (appCompatTextView.getTextColors().getDefaultColor() != -65281) {
                return;
            }
        } catch (Exception unused) {
        }
        appCompatTextView.setTextAppearance(2132083319);
        appCompatTextView.setTextColor(getContext().getColor(2131099892));
    }

    public final boolean u() {
        p pVar = this.f34381j;
        return (pVar.o != 1 || pVar.f55244r == null || TextUtils.isEmpty(pVar.f55242p)) ? false : true;
    }

    public final void v() {
        if (this.f34399t == null || !this.f34397s || TextUtils.isEmpty(this.f34395r)) {
            return;
        }
        this.f34399t.setText(this.f34395r);
        TransitionManager.beginDelayedTransition(this.f34363a, this.f34405w);
        this.f34399t.setVisibility(0);
        this.f34399t.bringToFront();
        announceForAccessibility(this.f34395r);
    }

    public final void w(Editable editable) {
        this.n.getClass();
        int length = editable != null ? editable.length() : 0;
        boolean z11 = this.f34387m;
        int i5 = this.f34385l;
        AppCompatTextView appCompatTextView = this.o;
        String string = null;
        SpannableStringBuilder spannableStringBuilder = null;
        if (i5 == -1) {
            appCompatTextView.setText(String.valueOf(length));
            appCompatTextView.setContentDescription(null);
            this.f34387m = false;
        } else {
            this.f34387m = length > i5;
            appCompatTextView.setContentDescription(getContext().getString(this.f34387m ? 2132017617 : 2132017616, Integer.valueOf(length), Integer.valueOf(i5)));
            if (z11 != this.f34387m) {
                x();
            }
            String str = y4.b.f96636b;
            y4.b bVar = TextUtils.getLayoutDirectionFromLocale(Locale.getDefault()) == 1 ? y4.b.f96639e : y4.b.f96638d;
            String string2 = getContext().getString(2132017618, Integer.valueOf(length), Integer.valueOf(i5));
            bVar.getClass();
            e30.j jVar = y4.f.f96646a;
            if (string2 != null) {
                bVar.getClass();
                e30.j jVar2 = y4.f.f96648c;
                String str2 = y4.b.f96637c;
                String str3 = y4.b.f96636b;
                boolean z12 = bVar.f96640a;
                if (string2 != null) {
                    boolean zL = jVar2.l(string2.length(), string2);
                    spannableStringBuilder = new SpannableStringBuilder();
                    boolean zL2 = (zL ? y4.f.f96647b : y4.f.f96646a).l(string2.length(), string2);
                    spannableStringBuilder.append((CharSequence) ((z12 || !(zL2 || y4.b.a(string2) == 1)) ? (!z12 || (zL2 && y4.b.a(string2) != -1)) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2 : str3));
                    if (zL != z12) {
                        spannableStringBuilder.append(zL ? (char) 8235 : (char) 8234);
                        spannableStringBuilder.append((CharSequence) string2);
                        spannableStringBuilder.append((char) 8236);
                    } else {
                        spannableStringBuilder.append((CharSequence) string2);
                    }
                    boolean zL3 = (zL ? y4.f.f96647b : y4.f.f96646a).l(string2.length(), string2);
                    if (!z12 && (zL3 || y4.b.b(string2) == 1)) {
                        str2 = str3;
                    } else if (!z12 || (zL3 && y4.b.b(string2) != -1)) {
                        str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    spannableStringBuilder.append((CharSequence) str2);
                }
                string = spannableStringBuilder.toString();
            }
            appCompatTextView.setText(string);
        }
        if (this.f34369d == null || z11 == this.f34387m) {
            return;
        }
        D(false, false);
        F();
        A();
    }

    public final void x() {
        ColorStateList colorStateList;
        ColorStateList colorStateList2;
        AppCompatTextView appCompatTextView = this.o;
        if (appCompatTextView != null) {
            t(appCompatTextView, this.f34387m ? this.f34391p : this.f34393q);
            if (!this.f34387m && (colorStateList2 = this.f34409y) != null) {
                this.o.setTextColor(colorStateList2);
            }
            if (!this.f34387m || (colorStateList = this.f34411z) == null) {
                return;
            }
            this.o.setTextColor(colorStateList);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void y() {
        ColorStateList colorStateList;
        ColorStateList colorStateListValueOf = this.A;
        if (colorStateListValueOf == null) {
            Context context = getContext();
            TypedValue typedValueU = e0.u(context, 2130968934);
            if (typedValueU != null) {
                int i5 = typedValueU.resourceId;
                if (i5 != 0) {
                    colorStateListValueOf = o4.a.b(context, i5);
                } else {
                    int i11 = typedValueU.data;
                    colorStateListValueOf = i11 != 0 ? ColorStateList.valueOf(i11) : null;
                }
            }
        }
        EditText editText = this.f34369d;
        if (editText == null || editText.getTextCursorDrawable() == null) {
            return;
        }
        Drawable drawableMutate = this.f34369d.getTextCursorDrawable().mutate();
        if ((u() || (this.o != null && this.f34387m)) && (colorStateList = this.B) != null) {
            colorStateListValueOf = colorStateList;
        }
        drawableMutate.setTintList(colorStateListValueOf);
    }

    public final boolean z() {
        boolean z11;
        if (this.f34369d == null) {
            return false;
        }
        v vVar = this.f34365b;
        CheckableImageButton checkableImageButton = null;
        boolean z12 = true;
        if ((vVar.f55273d.getDrawable() != null || (vVar.f55272c != null && vVar.f55271b.getVisibility() == 0)) && vVar.getMeasuredWidth() > 0) {
            int measuredWidth = vVar.getMeasuredWidth() - this.f34369d.getPaddingLeft();
            if (this.f34366b0 == null || this.f34368c0 != measuredWidth) {
                ColorDrawable colorDrawable = new ColorDrawable();
                this.f34366b0 = colorDrawable;
                this.f34368c0 = measuredWidth;
                colorDrawable.setBounds(0, 0, measuredWidth, 1);
            }
            Drawable[] compoundDrawablesRelative = this.f34369d.getCompoundDrawablesRelative();
            Drawable drawable = compoundDrawablesRelative[0];
            ColorDrawable colorDrawable2 = this.f34366b0;
            if (drawable != colorDrawable2) {
                this.f34369d.setCompoundDrawablesRelative(colorDrawable2, compoundDrawablesRelative[1], compoundDrawablesRelative[2], compoundDrawablesRelative[3]);
                z11 = true;
            }
            z11 = false;
        } else {
            if (this.f34366b0 != null) {
                Drawable[] compoundDrawablesRelative2 = this.f34369d.getCompoundDrawablesRelative();
                this.f34369d.setCompoundDrawablesRelative(null, compoundDrawablesRelative2[1], compoundDrawablesRelative2[2], compoundDrawablesRelative2[3]);
                this.f34366b0 = null;
                z11 = true;
            }
            z11 = false;
        }
        m mVar = this.f34367c;
        if ((mVar.e() || ((mVar.f55210h != 0 && mVar.d()) || mVar.f55215m != null)) && mVar.getMeasuredWidth() > 0) {
            int measuredWidth2 = mVar.n.getMeasuredWidth() - this.f34369d.getPaddingRight();
            if (mVar.e()) {
                checkableImageButton = mVar.f55205c;
            } else if (mVar.f55210h != 0 && mVar.d()) {
                checkableImageButton = mVar.f55208f;
            }
            if (checkableImageButton != null) {
                measuredWidth2 = ((ViewGroup.MarginLayoutParams) checkableImageButton.getLayoutParams()).getMarginStart() + checkableImageButton.getMeasuredWidth() + measuredWidth2;
            }
            Drawable[] compoundDrawablesRelative3 = this.f34369d.getCompoundDrawablesRelative();
            ColorDrawable colorDrawable3 = this.f34372e0;
            if (colorDrawable3 != null && this.f34374f0 != measuredWidth2) {
                this.f34374f0 = measuredWidth2;
                colorDrawable3.setBounds(0, 0, measuredWidth2, 1);
                this.f34369d.setCompoundDrawablesRelative(compoundDrawablesRelative3[0], compoundDrawablesRelative3[1], this.f34372e0, compoundDrawablesRelative3[3]);
                return true;
            }
            if (colorDrawable3 == null) {
                ColorDrawable colorDrawable4 = new ColorDrawable();
                this.f34372e0 = colorDrawable4;
                this.f34374f0 = measuredWidth2;
                colorDrawable4.setBounds(0, 0, measuredWidth2, 1);
            }
            Drawable drawable2 = compoundDrawablesRelative3[2];
            ColorDrawable colorDrawable5 = this.f34372e0;
            if (drawable2 != colorDrawable5) {
                this.f34376g0 = drawable2;
                this.f34369d.setCompoundDrawablesRelative(compoundDrawablesRelative3[0], compoundDrawablesRelative3[1], colorDrawable5, compoundDrawablesRelative3[3]);
                return true;
            }
        } else if (this.f34372e0 != null) {
            Drawable[] compoundDrawablesRelative4 = this.f34369d.getCompoundDrawablesRelative();
            if (compoundDrawablesRelative4[2] == this.f34372e0) {
                this.f34369d.setCompoundDrawablesRelative(compoundDrawablesRelative4[0], compoundDrawablesRelative4[1], this.f34376g0, compoundDrawablesRelative4[3]);
            } else {
                z12 = z11;
            }
            this.f34372e0 = null;
            return z12;
        }
        return z11;
    }

    public TextInputLayout(Context context, AttributeSet attributeSet, int i5) {
        int i11;
        ColorStateList colorStateListK;
        ColorStateList colorStateListK2;
        ColorStateList colorStateListK3;
        boolean z11;
        ColorStateList colorStateListN;
        super(hk.a.a(context, attributeSet, 2130970178, 2132083765), attributeSet, 2130970178);
        this.f34373f = -1;
        this.f34375g = -1;
        this.f34377h = -1;
        this.f34379i = -1;
        p pVar = new p(this);
        this.f34381j = pVar;
        this.n = new c(20);
        this.V = new Rect();
        this.W = new Rect();
        this.f34364a0 = new RectF();
        this.f34370d0 = new LinkedHashSet();
        b bVar = new b(this);
        this.f34402u0 = bVar;
        this.A0 = false;
        Context context2 = getContext();
        setOrientation(1);
        setWillNotDraw(false);
        setAddStatesFromChildren(true);
        FrameLayout frameLayout = new FrameLayout(context2);
        this.f34363a = frameLayout;
        frameLayout.setAddStatesFromChildren(true);
        LinearInterpolator linearInterpolator = cj.a.f19951a;
        bVar.W = linearInterpolator;
        bVar.i(false);
        bVar.V = linearInterpolator;
        bVar.i(false);
        if (bVar.f89355k != 8388659) {
            bVar.f89355k = 8388659;
            bVar.i(false);
        }
        tj.i.a(context2, attributeSet, 2130970178, 2132083765);
        int[] iArr = bj.a.M;
        tj.i.b(context2, attributeSet, iArr, 2130970178, 2132083765, 22, 20, 40, 45, 49);
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, iArr, 2130970178, 2132083765);
        x7.u uVar = new x7.u(context2, typedArrayObtainStyledAttributes);
        v vVar = new v(this, uVar);
        this.f34365b = vVar;
        this.C = typedArrayObtainStyledAttributes.getBoolean(48, true);
        p(typedArrayObtainStyledAttributes.getText(4));
        this.f34406w0 = typedArrayObtainStyledAttributes.getBoolean(47, true);
        this.f34404v0 = typedArrayObtainStyledAttributes.getBoolean(42, true);
        if (typedArrayObtainStyledAttributes.hasValue(6)) {
            int i12 = typedArrayObtainStyledAttributes.getInt(6, -1);
            this.f34373f = i12;
            EditText editText = this.f34369d;
            if (editText != null && i12 != -1) {
                editText.setMinEms(i12);
            }
        } else if (typedArrayObtainStyledAttributes.hasValue(3)) {
            int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(3, -1);
            this.f34377h = dimensionPixelSize;
            EditText editText2 = this.f34369d;
            if (editText2 != null && dimensionPixelSize != -1) {
                editText2.setMinWidth(dimensionPixelSize);
            }
        }
        if (typedArrayObtainStyledAttributes.hasValue(5)) {
            int i13 = typedArrayObtainStyledAttributes.getInt(5, -1);
            this.f34375g = i13;
            EditText editText3 = this.f34369d;
            if (editText3 != null && i13 != -1) {
                editText3.setMaxEms(i13);
            }
        } else if (typedArrayObtainStyledAttributes.hasValue(2)) {
            int dimensionPixelSize2 = typedArrayObtainStyledAttributes.getDimensionPixelSize(2, -1);
            this.f34379i = dimensionPixelSize2;
            EditText editText4 = this.f34369d;
            if (editText4 != null && dimensionPixelSize2 != -1) {
                editText4.setMaxWidth(dimensionPixelSize2);
            }
        }
        this.L = j.c(context2, attributeSet, 2130970178, 2132083765).a();
        this.N = context2.getResources().getDimensionPixelOffset(2131166262);
        this.P = typedArrayObtainStyledAttributes.getDimensionPixelOffset(9, 0);
        int dimensionPixelSize3 = typedArrayObtainStyledAttributes.getDimensionPixelSize(16, context2.getResources().getDimensionPixelSize(2131166263));
        this.R = dimensionPixelSize3;
        this.S = typedArrayObtainStyledAttributes.getDimensionPixelSize(17, context2.getResources().getDimensionPixelSize(2131166264));
        this.Q = dimensionPixelSize3;
        float dimension = typedArrayObtainStyledAttributes.getDimension(13, -1.0f);
        float dimension2 = typedArrayObtainStyledAttributes.getDimension(12, -1.0f);
        float dimension3 = typedArrayObtainStyledAttributes.getDimension(10, -1.0f);
        float dimension4 = typedArrayObtainStyledAttributes.getDimension(11, -1.0f);
        j jVarF = this.L.f();
        if (dimension >= 0.0f) {
            jVarF.f18007e = new bk.a(dimension);
        }
        if (dimension2 >= 0.0f) {
            jVarF.f18008f = new bk.a(dimension2);
        }
        if (dimension3 >= 0.0f) {
            jVarF.f18009g = new bk.a(dimension3);
        }
        if (dimension4 >= 0.0f) {
            jVarF.f18010h = new bk.a(dimension4);
        }
        this.L = jVarF.a();
        ColorStateList colorStateListN2 = f0.n(context2, uVar, 7);
        if (colorStateListN2 != null) {
            int defaultColor = colorStateListN2.getDefaultColor();
            this.f34389n0 = defaultColor;
            this.U = defaultColor;
            if (colorStateListN2.isStateful()) {
                this.f34390o0 = colorStateListN2.getColorForState(new int[]{-16842910}, -1);
                this.f34392p0 = colorStateListN2.getColorForState(new int[]{16842908, 16842910}, -1);
                this.f34394q0 = colorStateListN2.getColorForState(new int[]{16843623, 16842910}, -1);
            } else {
                this.f34392p0 = defaultColor;
                ColorStateList colorStateListB = o4.a.b(context2, 2131100616);
                this.f34390o0 = colorStateListB.getColorForState(new int[]{-16842910}, -1);
                this.f34394q0 = colorStateListB.getColorForState(new int[]{16843623}, -1);
            }
            i11 = 0;
        } else {
            i11 = 0;
            this.U = 0;
            this.f34389n0 = 0;
            this.f34390o0 = 0;
            this.f34392p0 = 0;
            this.f34394q0 = 0;
        }
        if (typedArrayObtainStyledAttributes.hasValue(1)) {
            ColorStateList colorStateListK4 = uVar.k(1);
            this.f34380i0 = colorStateListK4;
            this.f34378h0 = colorStateListK4;
        }
        ColorStateList colorStateListN3 = f0.n(context2, uVar, 14);
        this.f34386l0 = typedArrayObtainStyledAttributes.getColor(14, i11);
        this.f34382j0 = context2.getColor(2131100643);
        this.f34396r0 = context2.getColor(2131100644);
        this.f34384k0 = context2.getColor(2131100647);
        if (colorStateListN3 != null) {
            if (colorStateListN3.isStateful()) {
                this.f34382j0 = colorStateListN3.getDefaultColor();
                this.f34396r0 = colorStateListN3.getColorForState(new int[]{-16842910}, -1);
                this.f34384k0 = colorStateListN3.getColorForState(new int[]{16843623, 16842910}, -1);
                this.f34386l0 = colorStateListN3.getColorForState(new int[]{16842908, 16842910}, -1);
            } else if (this.f34386l0 != colorStateListN3.getDefaultColor()) {
                this.f34386l0 = colorStateListN3.getDefaultColor();
            }
            F();
        }
        if (typedArrayObtainStyledAttributes.hasValue(15) && this.f34388m0 != (colorStateListN = f0.n(context2, uVar, 15))) {
            this.f34388m0 = colorStateListN;
            F();
        }
        if (typedArrayObtainStyledAttributes.getResourceId(49, -1) != -1) {
            bVar.k(typedArrayObtainStyledAttributes.getResourceId(49, 0));
            this.f34380i0 = bVar.o;
            if (this.f34369d != null) {
                D(false, false);
                C();
            }
        }
        this.A = uVar.k(24);
        this.B = uVar.k(25);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(40, 0);
        CharSequence text = typedArrayObtainStyledAttributes.getText(35);
        int i14 = typedArrayObtainStyledAttributes.getInt(34, 1);
        boolean z12 = typedArrayObtainStyledAttributes.getBoolean(36, false);
        int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(45, 0);
        boolean z13 = typedArrayObtainStyledAttributes.getBoolean(44, false);
        CharSequence text2 = typedArrayObtainStyledAttributes.getText(43);
        int resourceId3 = typedArrayObtainStyledAttributes.getResourceId(57, 0);
        CharSequence text3 = typedArrayObtainStyledAttributes.getText(56);
        boolean z14 = typedArrayObtainStyledAttributes.getBoolean(18, false);
        int i15 = typedArrayObtainStyledAttributes.getInt(19, -1);
        if (this.f34385l != i15) {
            if (i15 > 0) {
                this.f34385l = i15;
            } else {
                this.f34385l = -1;
            }
            if (this.f34383k && this.o != null) {
                EditText editText5 = this.f34369d;
                w(editText5 == null ? null : editText5.getText());
            }
        }
        this.f34393q = typedArrayObtainStyledAttributes.getResourceId(22, 0);
        this.f34391p = typedArrayObtainStyledAttributes.getResourceId(20, 0);
        int i16 = typedArrayObtainStyledAttributes.getInt(8, 0);
        if (i16 != this.O) {
            this.O = i16;
            if (this.f34369d != null) {
                j();
            }
        }
        pVar.f55245s = text;
        AppCompatTextView appCompatTextView = pVar.f55244r;
        if (appCompatTextView != null) {
            appCompatTextView.setContentDescription(text);
        }
        pVar.f55246t = i14;
        AppCompatTextView appCompatTextView2 = pVar.f55244r;
        if (appCompatTextView2 != null) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            appCompatTextView2.setAccessibilityLiveRegion(i14);
        }
        pVar.f55252z = resourceId2;
        AppCompatTextView appCompatTextView3 = pVar.f55251y;
        if (appCompatTextView3 != null) {
            appCompatTextView3.setTextAppearance(resourceId2);
        }
        pVar.f55247u = resourceId;
        AppCompatTextView appCompatTextView4 = pVar.f55244r;
        if (appCompatTextView4 != null) {
            pVar.f55236h.t(appCompatTextView4, resourceId);
        }
        q(text3);
        this.f34403v = resourceId3;
        AppCompatTextView appCompatTextView5 = this.f34399t;
        if (appCompatTextView5 != null) {
            appCompatTextView5.setTextAppearance(resourceId3);
        }
        if (typedArrayObtainStyledAttributes.hasValue(41)) {
            ColorStateList colorStateListK5 = uVar.k(41);
            pVar.f55248v = colorStateListK5;
            AppCompatTextView appCompatTextView6 = pVar.f55244r;
            if (appCompatTextView6 != null && colorStateListK5 != null) {
                appCompatTextView6.setTextColor(colorStateListK5);
            }
        }
        if (typedArrayObtainStyledAttributes.hasValue(46)) {
            ColorStateList colorStateListK6 = uVar.k(46);
            pVar.A = colorStateListK6;
            AppCompatTextView appCompatTextView7 = pVar.f55251y;
            if (appCompatTextView7 != null && colorStateListK6 != null) {
                appCompatTextView7.setTextColor(colorStateListK6);
            }
        }
        if (typedArrayObtainStyledAttributes.hasValue(50) && this.f34380i0 != (colorStateListK3 = uVar.k(50))) {
            if (this.f34378h0 != null || bVar.o == colorStateListK3) {
                z11 = false;
            } else {
                bVar.o = colorStateListK3;
                z11 = false;
                bVar.i(false);
            }
            this.f34380i0 = colorStateListK3;
            if (this.f34369d != null) {
                D(z11, z11);
            }
        }
        if (typedArrayObtainStyledAttributes.hasValue(23) && this.f34409y != (colorStateListK2 = uVar.k(23))) {
            this.f34409y = colorStateListK2;
            x();
        }
        if (typedArrayObtainStyledAttributes.hasValue(21) && this.f34411z != (colorStateListK = uVar.k(21))) {
            this.f34411z = colorStateListK;
            x();
        }
        if (typedArrayObtainStyledAttributes.hasValue(58)) {
            r(uVar.k(58));
        }
        m mVar = new m(this, uVar);
        this.f34367c = mVar;
        boolean z15 = typedArrayObtainStyledAttributes.getBoolean(0, true);
        uVar.s();
        WeakHashMap weakHashMap2 = a5.a1.f250a;
        setImportantForAccessibility(2);
        u0.b(this, 1);
        frameLayout.addView(vVar);
        frameLayout.addView(mVar);
        addView(frameLayout);
        setEnabled(z15);
        o(z13);
        n(z12);
        if (this.f34383k != z14) {
            if (z14) {
                AppCompatTextView appCompatTextView8 = new AppCompatTextView(getContext(), null);
                this.o = appCompatTextView8;
                appCompatTextView8.setId(2131429016);
                this.o.setMaxLines(1);
                pVar.a(this.o, 2);
                ((ViewGroup.MarginLayoutParams) this.o.getLayoutParams()).setMarginStart(getResources().getDimensionPixelOffset(2131166265));
                x();
                if (this.o != null) {
                    EditText editText6 = this.f34369d;
                    w(editText6 != null ? editText6.getText() : null);
                }
            } else {
                pVar.g(this.o, 2);
                this.o = null;
            }
            this.f34383k = z14;
        }
        if (TextUtils.isEmpty(text2)) {
            if (pVar.f55250x) {
                o(false);
                return;
            }
            return;
        }
        if (!pVar.f55250x) {
            o(true);
        }
        pVar.c();
        pVar.f55249w = text2;
        pVar.f55251y.setText(text2);
        int i17 = pVar.n;
        if (i17 != 2) {
            pVar.o = 2;
        }
        pVar.i(i17, pVar.o, pVar.h(pVar.f55251y, text2));
    }
}
