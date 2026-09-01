package defpackage;

import android.R;
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
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class r30 extends TextView implements lmd {
    public final e8 a;
    public final n30 b;
    public final lig c;
    public m20 d;
    public boolean e;
    public zg7 f;
    public Future g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r30(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        imd.a(context);
        this.e = false;
        this.f = null;
        wkd.a(this, getContext());
        e8 e8Var = new e8(this);
        this.a = e8Var;
        e8Var.k(attributeSet, i);
        n30 n30Var = new n30(this);
        this.b = n30Var;
        n30Var.f(attributeSet, i);
        n30Var.b();
        lig ligVar = new lig(8);
        ligVar.b = this;
        this.c = ligVar;
        getEmojiTextViewHelper().a(attributeSet, i);
    }

    private m20 getEmojiTextViewHelper() {
        m20 m20Var = this.d;
        if (m20Var != null) {
            return m20Var;
        }
        m20 m20Var2 = new m20(this);
        this.d = m20Var2;
        return m20Var2;
    }

    @Override // android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.a();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public int getAutoSizeMaxTextSize() {
        if (bwe.c) {
            return super.getAutoSizeMaxTextSize();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return Math.round(n30Var.i.e);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int getAutoSizeMinTextSize() {
        if (bwe.c) {
            return super.getAutoSizeMinTextSize();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return Math.round(n30Var.i.d);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int getAutoSizeStepGranularity() {
        if (bwe.c) {
            return super.getAutoSizeStepGranularity();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return Math.round(n30Var.i.c);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int[] getAutoSizeTextAvailableSizes() {
        if (bwe.c) {
            return super.getAutoSizeTextAvailableSizes();
        }
        n30 n30Var = this.b;
        return n30Var != null ? n30Var.i.f : new int[0];
    }

    @Override // android.widget.TextView
    public int getAutoSizeTextType() {
        if (bwe.c) {
            return super.getAutoSizeTextType() == 1 ? 1 : 0;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return n30Var.i.a;
        }
        return 0;
    }

    @Override // android.widget.TextView
    public ActionMode.Callback getCustomSelectionActionModeCallback() {
        return vn7.h0(super.getCustomSelectionActionModeCallback());
    }

    @Override // android.widget.TextView
    public int getFirstBaselineToTopHeight() {
        return getPaddingTop() - getPaint().getFontMetricsInt().top;
    }

    @Override // android.widget.TextView
    public int getLastBaselineToBottomHeight() {
        return getPaddingBottom() + getPaint().getFontMetricsInt().bottom;
    }

    public o30 getSuperCaller() {
        zg7 zg7Var = this.f;
        if (zg7Var != null) {
            return zg7Var;
        }
        int i = Build.VERSION.SDK_INT;
        if (i >= 34) {
            q30 q30Var = new q30(this);
            this.f = q30Var;
            return q30Var;
        }
        if (i >= 28) {
            p30 p30Var = new p30(this);
            this.f = p30Var;
            return p30Var;
        }
        if (i < 26) {
            return zg7Var;
        }
        zg7 zg7Var2 = new zg7(10, this);
        this.f = zg7Var2;
        return zg7Var2;
    }

    public ColorStateList getSupportBackgroundTintList() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.h();
        }
        return null;
    }

    public PorterDuff.Mode getSupportBackgroundTintMode() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.i();
        }
        return null;
    }

    public ColorStateList getSupportCompoundDrawablesTintList() {
        return this.b.d();
    }

    public PorterDuff.Mode getSupportCompoundDrawablesTintMode() {
        return this.b.e();
    }

    @Override // android.widget.TextView
    public CharSequence getText() {
        Future future = this.g;
        if (future != null) {
            try {
                this.g = null;
                if (future.get() != null) {
                    throw new ClassCastException();
                }
                if (Build.VERSION.SDK_INT >= 29) {
                    throw null;
                }
                vn7.E(this);
                throw null;
            } catch (InterruptedException | ExecutionException unused) {
            }
        }
        return super.getText();
    }

    @Override // android.widget.TextView
    public TextClassifier getTextClassifier() {
        lig ligVar;
        if (Build.VERSION.SDK_INT >= 28 || (ligVar = this.c) == null) {
            return super.getTextClassifier();
        }
        TextClassifier textClassifier = (TextClassifier) ligVar.c;
        return textClassifier == null ? g30.a((TextView) ligVar.b) : textClassifier;
    }

    public vx9 getTextMetricsParamsCompat() {
        return vn7.E(this);
    }

    @Override // android.widget.TextView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        this.b.getClass();
        if (Build.VERSION.SDK_INT < 30 && inputConnectionOnCreateInputConnection != null) {
            ev3.c(editorInfo, getText());
        }
        flb.o0(inputConnectionOnCreateInputConnection, editorInfo, this);
        return inputConnectionOnCreateInputConnection;
    }

    @Override // android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        int i = Build.VERSION.SDK_INT;
        if (i < 30 || i >= 33 || !onCheckIsTextEditor()) {
            return;
        }
        ((InputMethodManager) getContext().getSystemService("input_method")).isActive(this);
    }

    @Override // android.widget.TextView, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        n30 n30Var = this.b;
        if (n30Var == null || bwe.c) {
            return;
        }
        n30Var.i.a();
    }

    @Override // android.widget.TextView, android.view.View
    public void onMeasure(int i, int i2) {
        Future future = this.g;
        if (future != null) {
            try {
                this.g = null;
                if (future.get() != null) {
                    throw new ClassCastException();
                }
                if (Build.VERSION.SDK_INT >= 29) {
                    throw null;
                }
                vn7.E(this);
                throw null;
            } catch (InterruptedException | ExecutionException unused) {
            }
        }
        super.onMeasure(i, i2);
    }

    @Override // android.widget.TextView
    public final void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        super.onTextChanged(charSequence, i, i2, i3);
        n30 n30Var = this.b;
        if (n30Var != null) {
            w30 w30Var = n30Var.i;
            if (bwe.c || !w30Var.f()) {
                return;
            }
            w30Var.a();
        }
    }

    @Override // android.widget.TextView
    public void setAllCaps(boolean z) {
        super.setAllCaps(z);
        getEmojiTextViewHelper().b(z);
    }

    @Override // android.widget.TextView
    public final void setAutoSizeTextTypeUniformWithConfiguration(int i, int i2, int i3, int i4) {
        if (bwe.c) {
            super.setAutoSizeTextTypeUniformWithConfiguration(i, i2, i3, i4);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.h(i, i2, i3, i4);
        }
    }

    @Override // android.widget.TextView
    public final void setAutoSizeTextTypeUniformWithPresetSizes(int[] iArr, int i) {
        if (bwe.c) {
            super.setAutoSizeTextTypeUniformWithPresetSizes(iArr, i);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.i(iArr, i);
        }
    }

    @Override // android.widget.TextView
    public void setAutoSizeTextTypeWithDefaults(int i) {
        if (bwe.c) {
            super.setAutoSizeTextTypeWithDefaults(i);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.j(i);
        }
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.m();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.n(i);
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelativeWithIntrinsicBounds(int i, int i2, int i3, int i4) {
        Context context = getContext();
        setCompoundDrawablesRelativeWithIntrinsicBounds(i != 0 ? guc.E(context, i) : null, i2 != 0 ? guc.E(context, i2) : null, i3 != 0 ? guc.E(context, i3) : null, i4 != 0 ? guc.E(context, i4) : null);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesWithIntrinsicBounds(int i, int i2, int i3, int i4) {
        Context context = getContext();
        setCompoundDrawablesWithIntrinsicBounds(i != 0 ? guc.E(context, i) : null, i2 != 0 ? guc.E(context, i2) : null, i3 != 0 ? guc.E(context, i3) : null, i4 != 0 ? guc.E(context, i4) : null);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(vn7.k0(callback, this));
    }

    public void setEmojiCompatEnabled(boolean z) {
        getEmojiTextViewHelper().c(z);
    }

    @Override // android.widget.TextView
    public void setFilters(InputFilter[] inputFilterArr) {
        super.setFilters(((xz5) getEmojiTextViewHelper().b.b).T(inputFilterArr));
    }

    @Override // android.widget.TextView
    public void setFirstBaselineToTopHeight(int i) {
        if (Build.VERSION.SDK_INT >= 28) {
            getSuperCaller().Z(i);
        } else {
            vn7.X(this, i);
        }
    }

    @Override // android.widget.TextView
    public void setLastBaselineToBottomHeight(int i) {
        if (Build.VERSION.SDK_INT >= 28) {
            getSuperCaller().F(i);
        } else {
            vn7.Y(this, i);
        }
    }

    @Override // android.widget.TextView
    public final void setLineHeight(int i, float f) {
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 34) {
            getSuperCaller().a0(i, f);
        } else if (i2 >= 34) {
            m4.G(this, i, f);
        } else {
            vn7.Z(this, Math.round(TypedValue.applyDimension(i, f, getResources().getDisplayMetrics())));
        }
    }

    public void setPrecomputedText(wx9 wx9Var) {
        if (Build.VERSION.SDK_INT >= 29) {
            throw null;
        }
        vn7.E(this);
        throw null;
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.s(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.t(mode);
        }
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintList(ColorStateList colorStateList) {
        n30 n30Var = this.b;
        n30Var.k(colorStateList);
        n30Var.b();
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintMode(PorterDuff.Mode mode) {
        n30 n30Var = this.b;
        n30Var.l(mode);
        n30Var.b();
    }

    @Override // android.widget.TextView
    public void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.g(context, i);
        }
    }

    @Override // android.widget.TextView
    public void setTextClassifier(TextClassifier textClassifier) {
        lig ligVar;
        if (Build.VERSION.SDK_INT >= 28 || (ligVar = this.c) == null) {
            super.setTextClassifier(textClassifier);
        } else {
            ligVar.c = textClassifier;
        }
    }

    public void setTextFuture(Future<wx9> future) {
        this.g = future;
        if (future != null) {
            requestLayout();
        }
    }

    public void setTextMetricsParamsCompat(vx9 vx9Var) {
        TextDirectionHeuristic textDirectionHeuristic;
        TextDirectionHeuristic textDirectionHeuristic2 = vx9Var.b;
        TextDirectionHeuristic textDirectionHeuristic3 = TextDirectionHeuristics.FIRSTSTRONG_RTL;
        int i = 1;
        if (textDirectionHeuristic2 != textDirectionHeuristic3 && textDirectionHeuristic2 != (textDirectionHeuristic = TextDirectionHeuristics.FIRSTSTRONG_LTR)) {
            if (textDirectionHeuristic2 == TextDirectionHeuristics.ANYRTL_LTR) {
                i = 2;
            } else if (textDirectionHeuristic2 == TextDirectionHeuristics.LTR) {
                i = 3;
            } else if (textDirectionHeuristic2 == TextDirectionHeuristics.RTL) {
                i = 4;
            } else if (textDirectionHeuristic2 == TextDirectionHeuristics.LOCALE) {
                i = 5;
            } else if (textDirectionHeuristic2 == textDirectionHeuristic) {
                i = 6;
            } else if (textDirectionHeuristic2 == textDirectionHeuristic3) {
                i = 7;
            }
        }
        setTextDirection(i);
        getPaint().set(vx9Var.a);
        setBreakStrategy(vx9Var.c);
        setHyphenationFrequency(vx9Var.d);
    }

    @Override // android.widget.TextView
    public final void setTextSize(int i, float f) {
        boolean z = bwe.c;
        if (z) {
            super.setTextSize(i, f);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            w30 w30Var = n30Var.i;
            if (z || w30Var.f()) {
                return;
            }
            w30Var.g(i, f);
        }
    }

    @Override // android.widget.TextView
    public final void setTypeface(Typeface typeface, int i) {
        Typeface typefaceCreate;
        if (this.e) {
            return;
        }
        if (typeface == null || i <= 0) {
            typefaceCreate = null;
        } else {
            Context context = getContext();
            il7 il7Var = txd.a;
            if (context == null) {
                ay0.e("Context cannot be null");
                return;
            }
            typefaceCreate = Typeface.create(typeface, i);
        }
        this.e = true;
        if (typefaceCreate != null) {
            typeface = typefaceCreate;
        }
        try {
            super.setTypeface(typeface, i);
        } finally {
            this.e = false;
        }
    }

    @Override // android.widget.TextView
    public void setLineHeight(int i) {
        vn7.Z(this, i);
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelativeWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    public r30(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.textViewStyle);
    }
}
