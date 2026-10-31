package fk;

import a5.a1;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import androidx.appcompat.widget.AppCompatTextView;
import b.c0;
import b.u4;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.textfield.TextInputLayout;
import e10.z2;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.WeakHashMap;
import ps.f0;

/* loaded from: classes3.dex */
public final class m extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public final TextInputLayout f55203a;

    /* renamed from: b, reason: collision with root package name */
    public final FrameLayout f55204b;

    /* renamed from: c, reason: collision with root package name */
    public final CheckableImageButton f55205c;

    /* renamed from: d, reason: collision with root package name */
    public final ColorStateList f55206d;

    /* renamed from: e, reason: collision with root package name */
    public final PorterDuff.Mode f55207e;

    /* renamed from: f, reason: collision with root package name */
    public final CheckableImageButton f55208f;

    /* renamed from: g, reason: collision with root package name */
    public final l f55209g;

    /* renamed from: h, reason: collision with root package name */
    public int f55210h;

    /* renamed from: i, reason: collision with root package name */
    public final LinkedHashSet f55211i;

    /* renamed from: j, reason: collision with root package name */
    public final ColorStateList f55212j;

    /* renamed from: k, reason: collision with root package name */
    public final PorterDuff.Mode f55213k;

    /* renamed from: l, reason: collision with root package name */
    public final int f55214l;

    /* renamed from: m, reason: collision with root package name */
    public final CharSequence f55215m;
    public final AppCompatTextView n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public EditText f55216p;

    /* renamed from: q, reason: collision with root package name */
    public final AccessibilityManager f55217q;

    /* renamed from: r, reason: collision with root package name */
    public f10.o f55218r;

    /* renamed from: s, reason: collision with root package name */
    public final j f55219s;

    public m(TextInputLayout textInputLayout, x7.u uVar) {
        CharSequence text;
        super(textInputLayout.getContext());
        this.f55210h = 0;
        this.f55211i = new LinkedHashSet();
        this.f55219s = new j(this);
        k kVar = new k(this);
        this.f55217q = (AccessibilityManager) getContext().getSystemService("accessibility");
        this.f55203a = textInputLayout;
        setVisibility(8);
        setOrientation(0);
        setLayoutParams(new FrameLayout.LayoutParams(-2, -1, 8388613));
        FrameLayout frameLayout = new FrameLayout(getContext());
        this.f55204b = frameLayout;
        frameLayout.setVisibility(8);
        frameLayout.setLayoutParams(new LinearLayout.LayoutParams(-2, -1));
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(getContext());
        CheckableImageButton checkableImageButtonA = a(2131429013, layoutInflaterFrom, this);
        this.f55205c = checkableImageButtonA;
        CheckableImageButton checkableImageButtonA2 = a(2131429012, layoutInflaterFrom, frameLayout);
        this.f55208f = checkableImageButtonA2;
        l lVar = new l();
        lVar.f55201c = new SparseArray();
        lVar.f55202d = this;
        TypedArray typedArray = (TypedArray) uVar.f95209b;
        lVar.f55199a = typedArray.getResourceId(28, 0);
        lVar.f55200b = typedArray.getResourceId(52, 0);
        this.f55209g = lVar;
        AppCompatTextView appCompatTextView = new AppCompatTextView(getContext(), null);
        this.n = appCompatTextView;
        TypedArray typedArray2 = (TypedArray) uVar.f95209b;
        if (typedArray2.hasValue(38)) {
            this.f55206d = f0.n(getContext(), uVar, 38);
        }
        if (typedArray2.hasValue(39)) {
            this.f55207e = tj.i.g(typedArray2.getInt(39, -1), null);
        }
        if (typedArray2.hasValue(37)) {
            checkableImageButtonA.setImageDrawable(uVar.l(37));
            k();
            p7.u.E(textInputLayout, checkableImageButtonA, this.f55206d, this.f55207e);
        }
        checkableImageButtonA.setContentDescription(getResources().getText(2132017804));
        WeakHashMap weakHashMap = a1.f250a;
        checkableImageButtonA.setImportantForAccessibility(2);
        checkableImageButtonA.setClickable(false);
        checkableImageButtonA.f34316f = false;
        checkableImageButtonA.setFocusable(false);
        if (!typedArray2.hasValue(53)) {
            if (typedArray2.hasValue(32)) {
                this.f55212j = f0.n(getContext(), uVar, 32);
            }
            if (typedArray2.hasValue(33)) {
                this.f55213k = tj.i.g(typedArray2.getInt(33, -1), null);
            }
        }
        int i5 = 1;
        if (typedArray2.hasValue(30)) {
            g(typedArray2.getInt(30, 0));
            if (typedArray2.hasValue(27) && checkableImageButtonA2.getContentDescription() != (text = typedArray2.getText(27))) {
                checkableImageButtonA2.setContentDescription(text);
            }
            boolean z11 = typedArray2.getBoolean(26, true);
            if (checkableImageButtonA2.f34315e != z11) {
                checkableImageButtonA2.f34315e = z11;
                checkableImageButtonA2.sendAccessibilityEvent(0);
            }
        } else if (typedArray2.hasValue(53)) {
            if (typedArray2.hasValue(54)) {
                this.f55212j = f0.n(getContext(), uVar, 54);
            }
            if (typedArray2.hasValue(55)) {
                this.f55213k = tj.i.g(typedArray2.getInt(55, -1), null);
            }
            g(typedArray2.getBoolean(53, false) ? 1 : 0);
            CharSequence text2 = typedArray2.getText(51);
            if (checkableImageButtonA2.getContentDescription() != text2) {
                checkableImageButtonA2.setContentDescription(text2);
            }
        }
        int dimensionPixelSize = typedArray2.getDimensionPixelSize(29, getResources().getDimensionPixelSize(2131166202));
        if (dimensionPixelSize < 0) {
            throw new IllegalArgumentException("endIconSize cannot be less than 0");
        }
        if (dimensionPixelSize != this.f55214l) {
            this.f55214l = dimensionPixelSize;
            checkableImageButtonA2.setMinimumWidth(dimensionPixelSize);
            checkableImageButtonA2.setMinimumHeight(dimensionPixelSize);
            checkableImageButtonA.setMinimumWidth(dimensionPixelSize);
            checkableImageButtonA.setMinimumHeight(dimensionPixelSize);
        }
        if (typedArray2.hasValue(31)) {
            ImageView.ScaleType scaleTypeJ = p7.u.J(typedArray2.getInt(31, -1));
            checkableImageButtonA2.setScaleType(scaleTypeJ);
            checkableImageButtonA.setScaleType(scaleTypeJ);
        }
        appCompatTextView.setVisibility(8);
        appCompatTextView.setId(2131429021);
        appCompatTextView.setLayoutParams(new LinearLayout.LayoutParams(-2, -2, 80.0f));
        appCompatTextView.setAccessibilityLiveRegion(1);
        appCompatTextView.setTextAppearance(typedArray2.getResourceId(72, 0));
        if (typedArray2.hasValue(73)) {
            appCompatTextView.setTextColor(uVar.k(73));
        }
        CharSequence text3 = typedArray2.getText(71);
        this.f55215m = TextUtils.isEmpty(text3) ? null : text3;
        appCompatTextView.setText(text3);
        m();
        frameLayout.addView(checkableImageButtonA2);
        addView(appCompatTextView);
        addView(frameLayout);
        addView(checkableImageButtonA);
        textInputLayout.f34370d0.add(kVar);
        if (textInputLayout.f34369d != null) {
            kVar.a(textInputLayout);
        }
        addOnAttachStateChangeListener(new eb.f(this, i5));
    }

    public final CheckableImageButton a(int i5, LayoutInflater layoutInflater, ViewGroup viewGroup) {
        CheckableImageButton checkableImageButton = (CheckableImageButton) layoutInflater.inflate(2131624087, viewGroup, false);
        checkableImageButton.setId(i5);
        if (f0.v(getContext())) {
            ((ViewGroup.MarginLayoutParams) checkableImageButton.getLayoutParams()).setMarginStart(0);
        }
        return checkableImageButton;
    }

    public final n b() {
        n eVar;
        int i5 = this.f55210h;
        l lVar = this.f55209g;
        SparseArray sparseArray = (SparseArray) lVar.f55201c;
        n nVar = (n) sparseArray.get(i5);
        if (nVar != null) {
            return nVar;
        }
        m mVar = (m) lVar.f55202d;
        if (i5 == -1) {
            eVar = new e(mVar, 0);
        } else if (i5 == 0) {
            eVar = new e(mVar, 1);
        } else if (i5 == 1) {
            eVar = new u(mVar, lVar.f55200b);
        } else if (i5 == 2) {
            eVar = new d(mVar);
        } else {
            if (i5 != 3) {
                throw new IllegalArgumentException(c0.h(i5, "Invalid end icon mode: "));
            }
            eVar = new i(mVar);
        }
        sparseArray.append(i5, eVar);
        return eVar;
    }

    public final int c() {
        int marginStart;
        if (d() || e()) {
            CheckableImageButton checkableImageButton = this.f55208f;
            marginStart = ((ViewGroup.MarginLayoutParams) checkableImageButton.getLayoutParams()).getMarginStart() + checkableImageButton.getMeasuredWidth();
        } else {
            marginStart = 0;
        }
        WeakHashMap weakHashMap = a1.f250a;
        return this.n.getPaddingEnd() + getPaddingEnd() + marginStart;
    }

    public final boolean d() {
        return this.f55204b.getVisibility() == 0 && this.f55208f.getVisibility() == 0;
    }

    public final boolean e() {
        return this.f55205c.getVisibility() == 0;
    }

    public final void f(boolean z11) {
        boolean z12;
        boolean zIsActivated;
        boolean z13;
        n nVarB = b();
        boolean zJ = nVarB.j();
        boolean z14 = true;
        CheckableImageButton checkableImageButton = this.f55208f;
        if (!zJ || (z13 = checkableImageButton.f34314d) == nVarB.k()) {
            z12 = false;
        } else {
            checkableImageButton.setChecked(!z13);
            z12 = true;
        }
        if (!(nVarB instanceof i) || (zIsActivated = checkableImageButton.isActivated()) == ((i) nVarB).f55192l) {
            z14 = z12;
        } else {
            checkableImageButton.setActivated(!zIsActivated);
        }
        if (z11 || z14) {
            p7.u.W(this.f55203a, checkableImageButton, this.f55212j);
        }
    }

    public final void g(int i5) {
        if (this.f55210h == i5) {
            return;
        }
        n nVarB = b();
        f10.o oVar = this.f55218r;
        AccessibilityManager accessibilityManager = this.f55217q;
        if (oVar != null && accessibilityManager != null) {
            accessibilityManager.removeTouchExplorationStateChangeListener(new b5.b(oVar));
        }
        this.f55218r = null;
        nVarB.r();
        this.f55210h = i5;
        Iterator it = this.f55211i.iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        h(i5 != 0);
        n nVarB2 = b();
        int iD = this.f55209g.f55199a;
        if (iD == 0) {
            iD = nVarB2.d();
        }
        Drawable drawableB0 = iD != 0 ? z2.b0(getContext(), iD) : null;
        CheckableImageButton checkableImageButton = this.f55208f;
        checkableImageButton.setImageDrawable(drawableB0);
        PorterDuff.Mode mode = this.f55213k;
        ColorStateList colorStateList = this.f55212j;
        TextInputLayout textInputLayout = this.f55203a;
        if (drawableB0 != null) {
            p7.u.E(textInputLayout, checkableImageButton, colorStateList, mode);
            p7.u.W(textInputLayout, checkableImageButton, colorStateList);
        }
        int iC = nVarB2.c();
        CharSequence text = iC != 0 ? getResources().getText(iC) : null;
        if (checkableImageButton.getContentDescription() != text) {
            checkableImageButton.setContentDescription(text);
        }
        boolean zJ = nVarB2.j();
        if (checkableImageButton.f34315e != zJ) {
            checkableImageButton.f34315e = zJ;
            checkableImageButton.sendAccessibilityEvent(0);
        }
        if (!nVarB2.i(textInputLayout.O)) {
            throw new IllegalStateException("The current box background mode " + textInputLayout.O + " is not supported by the end icon mode " + i5);
        }
        nVarB2.q();
        f10.o oVarH = nVarB2.h();
        this.f55218r = oVarH;
        if (oVarH != null && accessibilityManager != null) {
            WeakHashMap weakHashMap = a1.f250a;
            if (isAttachedToWindow()) {
                accessibilityManager.addTouchExplorationStateChangeListener(new b5.b(this.f55218r));
            }
        }
        checkableImageButton.setOnClickListener(nVarB2.f());
        p7.u.X(checkableImageButton);
        EditText editText = this.f55216p;
        if (editText != null) {
            nVarB2.l(editText);
            i(nVarB2);
        }
        p7.u.E(textInputLayout, checkableImageButton, colorStateList, mode);
        f(true);
    }

    public final void h(boolean z11) {
        if (d() != z11) {
            this.f55208f.setVisibility(z11 ? 0 : 8);
            j();
            l();
            this.f55203a.z();
        }
    }

    public final void i(n nVar) {
        if (this.f55216p == null) {
            return;
        }
        if (nVar.e() != null) {
            this.f55216p.setOnFocusChangeListener(nVar.e());
        }
        if (nVar.g() != null) {
            this.f55208f.setOnFocusChangeListener(nVar.g());
        }
    }

    public final void j() {
        this.f55204b.setVisibility((this.f55208f.getVisibility() != 0 || e()) ? 8 : 0);
        setVisibility((d() || e() || !((this.f55215m == null || this.o) ? 8 : false)) ? 0 : 8);
    }

    public final void k() {
        CheckableImageButton checkableImageButton = this.f55205c;
        Drawable drawable = checkableImageButton.getDrawable();
        TextInputLayout textInputLayout = this.f55203a;
        checkableImageButton.setVisibility((drawable != null && textInputLayout.f34381j.f55243q && textInputLayout.u()) ? 0 : 8);
        j();
        l();
        if (this.f55210h != 0) {
            return;
        }
        textInputLayout.z();
    }

    public final void l() {
        int paddingEnd;
        TextInputLayout textInputLayout = this.f55203a;
        if (textInputLayout.f34369d == null) {
            return;
        }
        if (d() || e()) {
            paddingEnd = 0;
        } else {
            EditText editText = textInputLayout.f34369d;
            WeakHashMap weakHashMap = a1.f250a;
            paddingEnd = editText.getPaddingEnd();
        }
        int dimensionPixelSize = getContext().getResources().getDimensionPixelSize(2131166013);
        int paddingTop = textInputLayout.f34369d.getPaddingTop();
        int paddingBottom = textInputLayout.f34369d.getPaddingBottom();
        WeakHashMap weakHashMap2 = a1.f250a;
        this.n.setPaddingRelative(dimensionPixelSize, paddingTop, paddingEnd, paddingBottom);
    }

    public final void m() {
        AppCompatTextView appCompatTextView = this.n;
        int visibility = appCompatTextView.getVisibility();
        int i5 = (this.f55215m == null || this.o) ? 8 : 0;
        if (visibility != i5) {
            b().o(i5 == 0);
        }
        j();
        appCompatTextView.setVisibility(i5);
        this.f55203a.z();
    }
}
