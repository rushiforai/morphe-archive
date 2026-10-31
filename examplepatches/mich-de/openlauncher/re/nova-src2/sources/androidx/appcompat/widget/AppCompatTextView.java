package androidx.appcompat.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.InputFilter;
import android.text.TextDirectionHeuristic;
import android.text.TextDirectionHeuristics;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.view.textclassifier.TextClassifier;
import android.widget.TextView;
import cl.k0;
import e10.z2;
import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import p50.i;
import p6.g;
import r.c2;
import r.d2;
import r.h0;
import r.i0;
import r.m;
import r.n0;
import r.o0;
import r.p0;
import r.p2;
import r.q0;
import r.r;
import r.v0;
import y4.d;

/* loaded from: classes2.dex */
public class AppCompatTextView extends TextView implements e5.b {
    private final m mBackgroundTintHelper;
    private r mEmojiTextViewHelper;
    private boolean mIsSetTypefaceProcessing;
    private Future<d> mPrecomputedTextFuture;
    private o0 mSuperCaller;
    private final i0 mTextClassifierHelper;
    private final n0 mTextHelper;

    public AppCompatTextView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 16842884);
    }

    @Override // android.widget.TextView, android.view.View
    public void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.mBackgroundTintHelper;
        if (mVar != null) {
            mVar.a();
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    public final r e() {
        if (this.mEmojiTextViewHelper == null) {
            this.mEmojiTextViewHelper = new r(this);
        }
        return this.mEmojiTextViewHelper;
    }

    @Override // android.widget.TextView
    public int getAutoSizeMaxTextSize() {
        if (p2.f84840c) {
            return super.getAutoSizeMaxTextSize();
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            return Math.round(n0Var.f84822i.f84894e);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int getAutoSizeMinTextSize() {
        if (p2.f84840c) {
            return super.getAutoSizeMinTextSize();
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            return Math.round(n0Var.f84822i.f84893d);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int getAutoSizeStepGranularity() {
        if (p2.f84840c) {
            return super.getAutoSizeStepGranularity();
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            return Math.round(n0Var.f84822i.f84892c);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int[] getAutoSizeTextAvailableSizes() {
        if (p2.f84840c) {
            return super.getAutoSizeTextAvailableSizes();
        }
        n0 n0Var = this.mTextHelper;
        return n0Var != null ? n0Var.f84822i.f84895f : new int[0];
    }

    @Override // android.widget.TextView
    @SuppressLint({"WrongConstant"})
    public int getAutoSizeTextType() {
        if (p2.f84840c) {
            return super.getAutoSizeTextType() == 1 ? 1 : 0;
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            return n0Var.f84822i.f84890a;
        }
        return 0;
    }

    @Override // android.widget.TextView
    public ActionMode.Callback getCustomSelectionActionModeCallback() {
        return android.support.v4.media.session.b.p0(super.getCustomSelectionActionModeCallback());
    }

    @Override // android.widget.TextView
    public int getFirstBaselineToTopHeight() {
        return getPaddingTop() - getPaint().getFontMetricsInt().top;
    }

    @Override // android.widget.TextView
    public int getLastBaselineToBottomHeight() {
        return getPaddingBottom() + getPaint().getFontMetricsInt().bottom;
    }

    public o0 getSuperCaller() {
        if (this.mSuperCaller == null) {
            int i5 = Build.VERSION.SDK_INT;
            if (i5 >= 34) {
                this.mSuperCaller = new q0(this);
            } else if (i5 >= 28) {
                this.mSuperCaller = new p0(this);
            } else {
                this.mSuperCaller = new q.c(this, 9);
            }
        }
        return this.mSuperCaller;
    }

    public ColorStateList getSupportBackgroundTintList() {
        m mVar = this.mBackgroundTintHelper;
        if (mVar != null) {
            return mVar.b();
        }
        return null;
    }

    public PorterDuff.Mode getSupportBackgroundTintMode() {
        m mVar = this.mBackgroundTintHelper;
        if (mVar != null) {
            return mVar.c();
        }
        return null;
    }

    public ColorStateList getSupportCompoundDrawablesTintList() {
        g gVar = this.mTextHelper.f84821h;
        if (gVar != null) {
            return (ColorStateList) gVar.f82168c;
        }
        return null;
    }

    public PorterDuff.Mode getSupportCompoundDrawablesTintMode() {
        g gVar = this.mTextHelper.f84821h;
        if (gVar != null) {
            return (PorterDuff.Mode) gVar.f82169d;
        }
        return null;
    }

    @Override // android.widget.TextView
    public CharSequence getText() {
        Future<d> future = this.mPrecomputedTextFuture;
        if (future != null) {
            try {
                this.mPrecomputedTextFuture = null;
                if (future.get() != null) {
                    throw new ClassCastException();
                }
                if (Build.VERSION.SDK_INT >= 29) {
                    throw null;
                }
                android.support.v4.media.session.b.a0(this);
                throw null;
            } catch (InterruptedException | ExecutionException unused) {
            }
        }
        return super.getText();
    }

    @Override // android.widget.TextView
    public TextClassifier getTextClassifier() {
        i0 i0Var;
        if (Build.VERSION.SDK_INT >= 28 || (i0Var = this.mTextClassifierHelper) == null) {
            return super.getTextClassifier();
        }
        TextClassifier textClassifier = i0Var.f84745b;
        return textClassifier == null ? h0.a(i0Var.f84744a) : textClassifier;
    }

    public y4.c getTextMetricsParamsCompat() {
        return android.support.v4.media.session.b.a0(this);
    }

    public boolean isEmojiCompatEnabled() {
        return ((k0) e().f84850b.f267b).G();
    }

    @Override // android.widget.TextView, android.view.View
    public InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        this.mTextHelper.getClass();
        if (Build.VERSION.SDK_INT < 30 && inputConnectionOnCreateInputConnection != null) {
            t2.c.M(editorInfo, getText());
        }
        ph.a.t(inputConnectionOnCreateInputConnection, editorInfo, this);
        return inputConnectionOnCreateInputConnection;
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        int i5 = Build.VERSION.SDK_INT;
        if (i5 < 30 || i5 >= 33 || !onCheckIsTextEditor()) {
            return;
        }
        ((InputMethodManager) getContext().getSystemService("input_method")).isActive(this);
    }

    @Override // android.widget.TextView, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        n0 n0Var = this.mTextHelper;
        if (n0Var == null || p2.f84840c) {
            return;
        }
        n0Var.f84822i.a();
    }

    @Override // android.widget.TextView, android.view.View
    public void onMeasure(int i5, int i11) {
        Future<d> future = this.mPrecomputedTextFuture;
        if (future != null) {
            try {
                this.mPrecomputedTextFuture = null;
                if (future.get() != null) {
                    throw new ClassCastException();
                }
                if (Build.VERSION.SDK_INT >= 29) {
                    throw null;
                }
                android.support.v4.media.session.b.a0(this);
                throw null;
            } catch (InterruptedException | ExecutionException unused) {
            }
        }
        super.onMeasure(i5, i11);
    }

    @Override // android.widget.TextView
    public void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        super.onTextChanged(charSequence, i5, i11, i12);
        n0 n0Var = this.mTextHelper;
        if (n0Var == null || p2.f84840c || !n0Var.f84822i.f()) {
            return;
        }
        this.mTextHelper.f84822i.a();
    }

    @Override // android.widget.TextView
    public void setAllCaps(boolean z11) {
        super.setAllCaps(z11);
        e().c(z11);
    }

    @Override // android.widget.TextView, e5.b
    public void setAutoSizeTextTypeUniformWithConfiguration(int i5, int i11, int i12, int i13) throws IllegalArgumentException {
        if (p2.f84840c) {
            super.setAutoSizeTextTypeUniformWithConfiguration(i5, i11, i12, i13);
            return;
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.f(i5, i11, i12, i13);
        }
    }

    @Override // android.widget.TextView
    public void setAutoSizeTextTypeUniformWithPresetSizes(int[] iArr, int i5) throws IllegalArgumentException {
        if (p2.f84840c) {
            super.setAutoSizeTextTypeUniformWithPresetSizes(iArr, i5);
            return;
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.g(iArr, i5);
        }
    }

    @Override // android.widget.TextView
    public void setAutoSizeTextTypeWithDefaults(int i5) {
        if (p2.f84840c) {
            super.setAutoSizeTextTypeWithDefaults(i5);
            return;
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.h(i5);
        }
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.mBackgroundTintHelper;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.mBackgroundTintHelper;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesRelativeWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(android.support.v4.media.session.b.q0(callback, this));
    }

    public void setEmojiCompatEnabled(boolean z11) {
        ((k0) e().f84850b.f267b).S(z11);
    }

    @Override // android.widget.TextView
    public void setFilters(InputFilter[] inputFilterArr) {
        super.setFilters(e().a(inputFilterArr));
    }

    @Override // android.widget.TextView
    public void setFirstBaselineToTopHeight(int i5) {
        if (Build.VERSION.SDK_INT >= 28) {
            getSuperCaller().g(i5);
        } else {
            android.support.v4.media.session.b.h0(this, i5);
        }
    }

    @Override // android.widget.TextView
    public void setLastBaselineToBottomHeight(int i5) {
        if (Build.VERSION.SDK_INT >= 28) {
            getSuperCaller().d(i5);
        } else {
            android.support.v4.media.session.b.i0(this, i5);
        }
    }

    @Override // android.widget.TextView
    public void setLineHeight(int i5) {
        android.support.v4.media.session.b.j0(this, i5);
    }

    public void setPrecomputedText(d dVar) {
        if (Build.VERSION.SDK_INT >= 29) {
            throw null;
        }
        android.support.v4.media.session.b.a0(this);
        throw null;
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        m mVar = this.mBackgroundTintHelper;
        if (mVar != null) {
            mVar.h(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        m mVar = this.mBackgroundTintHelper;
        if (mVar != null) {
            mVar.i(mode);
        }
    }

    public void setSupportCompoundDrawablesTintList(ColorStateList colorStateList) {
        n0 n0Var = this.mTextHelper;
        if (n0Var.f84821h == null) {
            n0Var.f84821h = new g();
        }
        g gVar = n0Var.f84821h;
        gVar.f82168c = colorStateList;
        gVar.f82167b = colorStateList != null;
        n0Var.f84815b = gVar;
        n0Var.f84816c = gVar;
        n0Var.f84817d = gVar;
        n0Var.f84818e = gVar;
        n0Var.f84819f = gVar;
        n0Var.f84820g = gVar;
        n0Var.b();
    }

    public void setSupportCompoundDrawablesTintMode(PorterDuff.Mode mode) {
        n0 n0Var = this.mTextHelper;
        if (n0Var.f84821h == null) {
            n0Var.f84821h = new g();
        }
        g gVar = n0Var.f84821h;
        gVar.f82169d = mode;
        gVar.f82166a = mode != null;
        n0Var.f84815b = gVar;
        n0Var.f84816c = gVar;
        n0Var.f84817d = gVar;
        n0Var.f84818e = gVar;
        n0Var.f84819f = gVar;
        n0Var.f84820g = gVar;
        n0Var.b();
    }

    @Override // android.widget.TextView
    public void setTextAppearance(Context context, int i5) {
        super.setTextAppearance(context, i5);
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.e(context, i5);
        }
    }

    @Override // android.widget.TextView
    public void setTextClassifier(TextClassifier textClassifier) {
        i0 i0Var;
        if (Build.VERSION.SDK_INT >= 28 || (i0Var = this.mTextClassifierHelper) == null) {
            super.setTextClassifier(textClassifier);
        } else {
            i0Var.f84745b = textClassifier;
        }
    }

    public void setTextFuture(Future<d> future) {
        this.mPrecomputedTextFuture = future;
        if (future != null) {
            requestLayout();
        }
    }

    public void setTextMetricsParamsCompat(y4.c cVar) {
        TextDirectionHeuristic textDirectionHeuristic;
        TextDirectionHeuristic textDirectionHeuristic2 = cVar.f96642b;
        TextDirectionHeuristic textDirectionHeuristic3 = TextDirectionHeuristics.FIRSTSTRONG_RTL;
        int i5 = 1;
        if (textDirectionHeuristic2 != textDirectionHeuristic3 && textDirectionHeuristic2 != (textDirectionHeuristic = TextDirectionHeuristics.FIRSTSTRONG_LTR)) {
            if (textDirectionHeuristic2 == TextDirectionHeuristics.ANYRTL_LTR) {
                i5 = 2;
            } else if (textDirectionHeuristic2 == TextDirectionHeuristics.LTR) {
                i5 = 3;
            } else if (textDirectionHeuristic2 == TextDirectionHeuristics.RTL) {
                i5 = 4;
            } else if (textDirectionHeuristic2 == TextDirectionHeuristics.LOCALE) {
                i5 = 5;
            } else if (textDirectionHeuristic2 == textDirectionHeuristic) {
                i5 = 6;
            } else if (textDirectionHeuristic2 == textDirectionHeuristic3) {
                i5 = 7;
            }
        }
        setTextDirection(i5);
        getPaint().set(cVar.f96641a);
        setBreakStrategy(cVar.f96643c);
        setHyphenationFrequency(cVar.f96644d);
    }

    @Override // android.widget.TextView
    public void setTextSize(int i5, float f11) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        boolean z11 = p2.f84840c;
        if (z11) {
            super.setTextSize(i5, f11);
            return;
        }
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            v0 v0Var = n0Var.f84822i;
            if (z11 || v0Var.f()) {
                return;
            }
            v0Var.g(f11, i5);
        }
    }

    @Override // android.widget.TextView
    public void setTypeface(Typeface typeface, int i5) {
        Typeface typefaceCreate;
        if (this.mIsSetTypefaceProcessing) {
            return;
        }
        if (typeface == null || i5 <= 0) {
            typefaceCreate = null;
        } else {
            Context context = getContext();
            i iVar = r4.c.f85480a;
            if (context == null) {
                throw new IllegalArgumentException("Context cannot be null");
            }
            typefaceCreate = Typeface.create(typeface, i5);
        }
        this.mIsSetTypefaceProcessing = true;
        if (typefaceCreate != null) {
            typeface = typefaceCreate;
        }
        try {
            super.setTypeface(typeface, i5);
        } finally {
            this.mIsSetTypefaceProcessing = false;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AppCompatTextView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        d2.a(context);
        this.mIsSetTypefaceProcessing = false;
        this.mSuperCaller = null;
        c2.a(getContext(), this);
        m mVar = new m(this);
        this.mBackgroundTintHelper = mVar;
        mVar.d(attributeSet, i5);
        n0 n0Var = new n0(this);
        this.mTextHelper = n0Var;
        n0Var.d(attributeSet, i5);
        n0Var.b();
        i0 i0Var = new i0();
        i0Var.f84744a = this;
        this.mTextClassifierHelper = i0Var;
        e().b(attributeSet, i5);
    }

    @Override // android.widget.TextView
    public void setLineHeight(int i5, float f11) {
        int i11 = Build.VERSION.SDK_INT;
        if (i11 >= 34) {
            getSuperCaller().f(i5, f11);
        } else if (i11 >= 34) {
            a5.k0.m(this, i5, f11);
        } else {
            android.support.v4.media.session.b.j0(this, Math.round(TypedValue.applyDimension(i5, f11, getResources().getDisplayMetrics())));
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesRelativeWithIntrinsicBounds(int i5, int i11, int i12, int i13) {
        Context context = getContext();
        setCompoundDrawablesRelativeWithIntrinsicBounds(i5 != 0 ? z2.b0(context, i5) : null, i11 != 0 ? z2.b0(context, i11) : null, i12 != 0 ? z2.b0(context, i12) : null, i13 != 0 ? z2.b0(context, i13) : null);
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesWithIntrinsicBounds(int i5, int i11, int i12, int i13) {
        Context context = getContext();
        setCompoundDrawablesWithIntrinsicBounds(i5 != 0 ? z2.b0(context, i5) : null, i11 != 0 ? z2.b0(context, i11) : null, i12 != 0 ? z2.b0(context, i12) : null, i13 != 0 ? z2.b0(context, i13) : null);
        n0 n0Var = this.mTextHelper;
        if (n0Var != null) {
            n0Var.b();
        }
    }
}
