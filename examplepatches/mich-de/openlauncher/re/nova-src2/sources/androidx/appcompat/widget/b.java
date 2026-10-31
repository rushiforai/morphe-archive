package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.ThemedSpinnerAdapter;
import androidx.appcompat.view.d;
import e10.z2;
import r.a0;
import r.b0;
import r.c0;
import r.c2;
import r.d0;
import r.f0;
import r.g0;
import r.m;
import x7.u;

/* loaded from: classes2.dex */
public final class b extends Spinner {

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f13830i = {16843505};

    /* renamed from: a, reason: collision with root package name */
    public final m f13831a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f13832b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f13833c;

    /* renamed from: d, reason: collision with root package name */
    public SpinnerAdapter f13834d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f13835e;

    /* renamed from: f, reason: collision with root package name */
    public final g0 f13836f;

    /* renamed from: g, reason: collision with root package name */
    public int f13837g;

    /* renamed from: h, reason: collision with root package name */
    public final Rect f13838h;

    /* JADX WARN: Removed duplicated region for block: B:26:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00d7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public b(Context context, AttributeSet attributeSet) throws Throwable {
        TypedArray typedArrayObtainStyledAttributes;
        CharSequence[] textArray;
        SpinnerAdapter spinnerAdapter;
        super(context, attributeSet, 2130970014);
        this.f13838h = new Rect();
        c2.a(getContext(), this);
        int[] iArr = l.a.f72906u;
        u uVarR = u.r(context, attributeSet, iArr, 2130970014);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        this.f13831a = new m(this);
        int resourceId = typedArray.getResourceId(4, 0);
        if (resourceId != 0) {
            this.f13832b = new d(context, resourceId);
        } else {
            this.f13832b = context;
        }
        int i5 = -1;
        TypedArray typedArray2 = null;
        try {
            typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, f13830i, 2130970014, 0);
            try {
                try {
                    if (typedArrayObtainStyledAttributes.hasValue(0)) {
                        i5 = typedArrayObtainStyledAttributes.getInt(0, 0);
                    }
                } catch (Exception e3) {
                    e = e3;
                    Log.i("AppCompatSpinner", "Could not read android:spinnerMode", e);
                    if (typedArrayObtainStyledAttributes != null) {
                        typedArrayObtainStyledAttributes.recycle();
                    }
                    if (i5 != 0) {
                    }
                    textArray = typedArray.getTextArray(0);
                    if (textArray != null) {
                    }
                    uVarR.s();
                    this.f13835e = true;
                    spinnerAdapter = this.f13834d;
                    if (spinnerAdapter != null) {
                    }
                    this.f13831a.d(attributeSet, 2130970014);
                }
            } catch (Throwable th2) {
                th = th2;
                typedArray2 = typedArrayObtainStyledAttributes;
                if (typedArray2 != null) {
                    typedArray2.recycle();
                }
                throw th;
            }
        } catch (Exception e11) {
            e = e11;
            typedArrayObtainStyledAttributes = null;
        } catch (Throwable th3) {
            th = th3;
            if (typedArray2 != null) {
            }
            throw th;
        }
        typedArrayObtainStyledAttributes.recycle();
        if (i5 != 0) {
            c0 c0Var = new c0(this);
            this.f13836f = c0Var;
            c0Var.f84681c = typedArray.getString(2);
        } else if (i5 == 1) {
            f0 f0Var = new f0(this, this.f13832b, attributeSet);
            u uVarR2 = u.r(this.f13832b, attributeSet, iArr, 2130970014);
            this.f13837g = ((TypedArray) uVarR2.f95209b).getLayoutDimension(3, -2);
            f0Var.l(uVarR2.l(1));
            f0Var.C = typedArray.getString(2);
            uVarR2.s();
            this.f13836f = f0Var;
            this.f13833c = new a0(this, this, f0Var);
        }
        textArray = typedArray.getTextArray(0);
        if (textArray != null) {
            ArrayAdapter arrayAdapter = new ArrayAdapter(context, 17367048, textArray);
            arrayAdapter.setDropDownViewResource(2131624432);
            setAdapter((SpinnerAdapter) arrayAdapter);
        }
        uVarR.s();
        this.f13835e = true;
        spinnerAdapter = this.f13834d;
        if (spinnerAdapter != null) {
            setAdapter(spinnerAdapter);
            this.f13834d = null;
        }
        this.f13831a.d(attributeSet, 2130970014);
    }

    public final int a(SpinnerAdapter spinnerAdapter, Drawable drawable) {
        int i5 = 0;
        if (spinnerAdapter == null) {
            return 0;
        }
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 0);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 0);
        int iMax = Math.max(0, getSelectedItemPosition());
        int iMin = Math.min(spinnerAdapter.getCount(), iMax + 15);
        View view = null;
        int iMax2 = 0;
        for (int iMax3 = Math.max(0, iMax - (15 - (iMin - iMax))); iMax3 < iMin; iMax3++) {
            int itemViewType = spinnerAdapter.getItemViewType(iMax3);
            if (itemViewType != i5) {
                view = null;
                i5 = itemViewType;
            }
            view = spinnerAdapter.getView(iMax3, view, this);
            if (view.getLayoutParams() == null) {
                view.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
            }
            view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
            iMax2 = Math.max(iMax2, view.getMeasuredWidth());
        }
        if (drawable == null) {
            return iMax2;
        }
        Rect rect = this.f13838h;
        drawable.getPadding(rect);
        return rect.left + rect.right + iMax2;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f13831a;
        if (mVar != null) {
            mVar.a();
        }
    }

    @Override // android.widget.Spinner
    public final int getDropDownHorizontalOffset() {
        g0 g0Var = this.f13836f;
        return g0Var != null ? g0Var.a() : super.getDropDownHorizontalOffset();
    }

    @Override // android.widget.Spinner
    public final int getDropDownVerticalOffset() {
        g0 g0Var = this.f13836f;
        return g0Var != null ? g0Var.i() : super.getDropDownVerticalOffset();
    }

    @Override // android.widget.Spinner
    public final int getDropDownWidth() {
        return this.f13836f != null ? this.f13837g : super.getDropDownWidth();
    }

    @Override // android.widget.Spinner
    public final Drawable getPopupBackground() {
        g0 g0Var = this.f13836f;
        return g0Var != null ? g0Var.d() : super.getPopupBackground();
    }

    @Override // android.widget.Spinner
    public final Context getPopupContext() {
        return this.f13832b;
    }

    @Override // android.widget.Spinner
    public final CharSequence getPrompt() {
        g0 g0Var = this.f13836f;
        return g0Var != null ? g0Var.c() : super.getPrompt();
    }

    @Override // android.widget.Spinner, android.widget.AdapterView, android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        g0 g0Var = this.f13836f;
        if (g0Var == null || !g0Var.isShowing()) {
            return;
        }
        g0Var.dismiss();
    }

    @Override // android.widget.Spinner, android.widget.AbsSpinner, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (this.f13836f == null || View.MeasureSpec.getMode(i5) != Integer.MIN_VALUE) {
            return;
        }
        setMeasuredDimension(Math.min(Math.max(getMeasuredWidth(), a(getAdapter(), getBackground())), View.MeasureSpec.getSize(i5)), getMeasuredHeight());
    }

    @Override // android.widget.Spinner, android.widget.AbsSpinner, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        ViewTreeObserver viewTreeObserver;
        AppCompatSpinner$SavedState appCompatSpinner$SavedState = (AppCompatSpinner$SavedState) parcelable;
        super.onRestoreInstanceState(appCompatSpinner$SavedState.getSuperState());
        if (!appCompatSpinner$SavedState.f13761a || (viewTreeObserver = getViewTreeObserver()) == null) {
            return;
        }
        viewTreeObserver.addOnGlobalLayoutListener(new d9.d(this, 4));
    }

    @Override // android.widget.Spinner, android.widget.AbsSpinner, android.view.View
    public final Parcelable onSaveInstanceState() {
        AppCompatSpinner$SavedState appCompatSpinner$SavedState = new AppCompatSpinner$SavedState(super.onSaveInstanceState());
        g0 g0Var = this.f13836f;
        appCompatSpinner$SavedState.f13761a = g0Var != null && g0Var.isShowing();
        return appCompatSpinner$SavedState;
    }

    @Override // android.widget.Spinner, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        a0 a0Var = this.f13833c;
        if (a0Var == null || !a0Var.onTouch(this, motionEvent)) {
            return super.onTouchEvent(motionEvent);
        }
        return true;
    }

    @Override // android.widget.Spinner, android.view.View
    public final boolean performClick() {
        g0 g0Var = this.f13836f;
        if (g0Var == null) {
            return super.performClick();
        }
        if (g0Var.isShowing()) {
            return true;
        }
        g0Var.h(getTextDirection(), getTextAlignment());
        return true;
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f13831a;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f13831a;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.Spinner
    public final void setDropDownHorizontalOffset(int i5) {
        g0 g0Var = this.f13836f;
        if (g0Var == null) {
            super.setDropDownHorizontalOffset(i5);
        } else {
            g0Var.g(i5);
            g0Var.b(i5);
        }
    }

    @Override // android.widget.Spinner
    public final void setDropDownVerticalOffset(int i5) {
        g0 g0Var = this.f13836f;
        if (g0Var != null) {
            g0Var.f(i5);
        } else {
            super.setDropDownVerticalOffset(i5);
        }
    }

    @Override // android.widget.Spinner
    public final void setDropDownWidth(int i5) {
        if (this.f13836f != null) {
            this.f13837g = i5;
        } else {
            super.setDropDownWidth(i5);
        }
    }

    @Override // android.widget.Spinner
    public final void setPopupBackgroundDrawable(Drawable drawable) {
        g0 g0Var = this.f13836f;
        if (g0Var != null) {
            g0Var.l(drawable);
        } else {
            super.setPopupBackgroundDrawable(drawable);
        }
    }

    @Override // android.widget.Spinner
    public final void setPopupBackgroundResource(int i5) {
        setPopupBackgroundDrawable(z2.b0(this.f13832b, i5));
    }

    @Override // android.widget.Spinner
    public final void setPrompt(CharSequence charSequence) {
        g0 g0Var = this.f13836f;
        if (g0Var != null) {
            g0Var.e(charSequence);
        } else {
            super.setPrompt(charSequence);
        }
    }

    @Override // android.widget.AdapterView
    public final void setAdapter(SpinnerAdapter spinnerAdapter) {
        if (!this.f13835e) {
            this.f13834d = spinnerAdapter;
            return;
        }
        super.setAdapter(spinnerAdapter);
        g0 g0Var = this.f13836f;
        if (g0Var != null) {
            Context context = this.f13832b;
            if (context == null) {
                context = getContext();
            }
            Resources.Theme theme = context.getTheme();
            d0 d0Var = new d0();
            d0Var.f84694a = spinnerAdapter;
            if (spinnerAdapter instanceof ListAdapter) {
                d0Var.f84695b = (ListAdapter) spinnerAdapter;
            }
            if (theme != null && (spinnerAdapter instanceof ThemedSpinnerAdapter)) {
                b0.a((ThemedSpinnerAdapter) spinnerAdapter, theme);
            }
            g0Var.j(d0Var);
        }
    }
}
