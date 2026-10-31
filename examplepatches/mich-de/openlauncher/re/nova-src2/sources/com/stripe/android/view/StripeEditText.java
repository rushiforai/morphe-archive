package com.stripe.android.view;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.HideReturnsTransformationMethod;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;
import com.stripe.android.view.StripeEditText;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t5.d0;
import ww.a0;
import ww.m;
import ww.u0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0017\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/view/StripeEditText;", "Lcom/google/android/material/textfield/TextInputEditText;", "t5/d0", "ww/m", "ww/a0", "c5/b", "StripeEditTextState", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class StripeEditText extends TextInputEditText {

    /* renamed from: u, reason: collision with root package name */
    public static final /* synthetic */ int f45504u = 0;

    /* renamed from: i, reason: collision with root package name */
    public boolean f45505i;

    /* renamed from: j, reason: collision with root package name */
    public m f45506j;

    /* renamed from: k, reason: collision with root package name */
    public d0 f45507k;

    /* renamed from: l, reason: collision with root package name */
    public final ColorStateList f45508l;

    /* renamed from: m, reason: collision with root package name */
    public ColorStateList f45509m;
    public final int n;
    public final ArrayList o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f45510p;

    /* renamed from: q, reason: collision with root package name */
    public String f45511q;

    /* renamed from: r, reason: collision with root package name */
    public a0 f45512r;

    /* renamed from: s, reason: collision with root package name */
    public final ArrayList f45513s;

    /* renamed from: t, reason: collision with root package name */
    public View.OnFocusChangeListener f45514t;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/view/StripeEditText$StripeEditTextState;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class StripeEditTextState implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<StripeEditTextState> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final Parcelable f45515a;

        /* renamed from: b, reason: collision with root package name */
        public final String f45516b;

        /* renamed from: c, reason: collision with root package name */
        public final boolean f45517c;

        public StripeEditTextState(Parcelable parcelable, String str, boolean z11) {
            this.f45515a = parcelable;
            this.f45516b = str;
            this.f45517c = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof StripeEditTextState)) {
                return false;
            }
            StripeEditTextState stripeEditTextState = (StripeEditTextState) obj;
            return Intrinsics.b(this.f45515a, stripeEditTextState.f45515a) && Intrinsics.b(this.f45516b, stripeEditTextState.f45516b) && this.f45517c == stripeEditTextState.f45517c;
        }

        public final int hashCode() {
            Parcelable parcelable = this.f45515a;
            int iHashCode = (parcelable == null ? 0 : parcelable.hashCode()) * 31;
            String str = this.f45516b;
            return Boolean.hashCode(this.f45517c) + ((iHashCode + (str != null ? str.hashCode() : 0)) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("StripeEditTextState(superState=");
            sb2.append(this.f45515a);
            sb2.append(", errorMessage=");
            sb2.append(this.f45516b);
            sb2.append(", shouldShowError=");
            return a80.m.k(sb2, this.f45517c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f45515a, i5);
            dest.writeString(this.f45516b);
            dest.writeInt(this.f45517c ? 1 : 0);
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public StripeEditText(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 2130969140);
        Intrinsics.g(context, "context");
    }

    @Override // android.widget.TextView
    public final void addTextChangedListener(TextWatcher textWatcher) {
        ArrayList arrayList;
        super.addTextChangedListener(textWatcher);
        if (textWatcher == null || (arrayList = this.o) == null) {
            return;
        }
        arrayList.add(textWatcher);
    }

    public String c() {
        return null;
    }

    public final String d() {
        Editable text = getText();
        String string = text != null ? text.toString() : null;
        return string == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : string;
    }

    public final void e() {
        Typeface typeface = getTypeface();
        setInputType(18);
        setTypeface(typeface);
        setTransformationMethod(HideReturnsTransformationMethod.getInstance());
    }

    public final void f(boolean z11) {
        a0 a0Var;
        String str = this.f45511q;
        if (str != null && (a0Var = this.f45512r) != null) {
            if (!z11) {
                str = null;
            }
            TextInputLayout textInputLayout = a0Var.f94749a;
            if (str == null) {
                textInputLayout.m(null);
                textInputLayout.n(false);
            } else {
                textInputLayout.m(str);
            }
        }
        if (this.f45510p != z11) {
            if (z11) {
                super.setTextColor(this.n);
            } else {
                ColorStateList colorStateList = this.f45509m;
                if (colorStateList == null) {
                    colorStateList = this.f45508l;
                }
                super.setTextColor(colorStateList);
            }
            refreshDrawableState();
        }
        this.f45510p = z11;
    }

    public final void g(CharSequence charSequence) {
        ArrayList arrayList = this.o;
        if (arrayList != null) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                super.removeTextChangedListener((TextWatcher) it.next());
            }
        }
        setText(charSequence);
        if (arrayList != null) {
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                super.addTextChangedListener((TextWatcher) it2.next());
            }
        }
    }

    @Override // android.view.View
    public final View.OnFocusChangeListener getOnFocusChangeListener() {
        return this.f45514t;
    }

    @Override // com.google.android.material.textfield.TextInputEditText, r.q, android.widget.TextView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        Intrinsics.g(outAttrs, "outAttrs");
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(outAttrs);
        if (inputConnectionOnCreateInputConnection == null) {
            return null;
        }
        return new c5.b((b6.c) inputConnectionOnCreateInputConnection, this.f45507k);
    }

    @Override // com.google.android.material.textfield.TextInputEditText, android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        Intrinsics.g(info, "info");
        super.onInitializeAccessibilityNodeInfo(info);
        info.setContentInvalid(this.f45510p);
        String strC = c();
        if (strC != null) {
            info.setText(strC);
        }
        String str = this.f45511q;
        if (!this.f45510p) {
            str = null;
        }
        info.setError(str);
    }

    @Override // android.widget.TextView, android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof StripeEditTextState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        StripeEditTextState stripeEditTextState = (StripeEditTextState) parcelable;
        super.onRestoreInstanceState(stripeEditTextState.f45515a);
        this.f45511q = stripeEditTextState.f45516b;
        f(stripeEditTextState.f45517c);
    }

    @Override // android.widget.TextView, android.view.View
    public Parcelable onSaveInstanceState() {
        return new StripeEditTextState(super.onSaveInstanceState(), this.f45511q, this.f45510p);
    }

    @Override // android.widget.TextView
    public final void removeTextChangedListener(TextWatcher textWatcher) {
        ArrayList arrayList;
        super.removeTextChangedListener(textWatcher);
        if (textWatcher == null || (arrayList = this.o) == null) {
            return;
        }
        arrayList.remove(textWatcher);
    }

    @Override // android.view.View
    public final void setOnFocusChangeListener(View.OnFocusChangeListener onFocusChangeListener) {
        super.setOnFocusChangeListener(new fk.a(this, 6));
        this.f45514t = onFocusChangeListener;
    }

    @Override // android.widget.TextView
    public final void setTextColor(ColorStateList colorStateList) {
        super.setTextColor(colorStateList);
        this.f45509m = getTextColors();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StripeEditText(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
        u0 u0Var = new u0(this);
        ArrayList arrayList = new ArrayList();
        this.o = arrayList;
        setMaxLines(1);
        addTextChangedListener(new d9.e(this, 5));
        if (!arrayList.contains(u0Var)) {
            addTextChangedListener(u0Var);
        }
        setOnKeyListener(new View.OnKeyListener() { // from class: ww.t0
            @Override // android.view.View.OnKeyListener
            public final boolean onKey(View view, int i11, KeyEvent keyEvent) {
                t5.d0 d0Var;
                int i12 = StripeEditText.f45504u;
                if (keyEvent.getAction() == 0) {
                    boolean z11 = i11 == 67;
                    StripeEditText stripeEditText = this.f94845a;
                    stripeEditText.f45505i = z11;
                    if (z11 && stripeEditText.length() == 0 && (d0Var = stripeEditText.f45507k) != null) {
                        d0Var.C();
                    }
                }
                return false;
            }
        });
        ColorStateList textColors = getTextColors();
        this.f45508l = textColors;
        Context context2 = getContext();
        int defaultColor = textColors.getDefaultColor();
        this.n = context2.getColor(((((double) Color.blue(defaultColor)) * 0.114d) + ((((double) Color.green(defaultColor)) * 0.587d) + (((double) Color.red(defaultColor)) * 0.299d))) / ((double) 255) <= 0.5d ? 2131101152 : 2131101151);
        setOnFocusChangeListener(null);
        this.f45513s = new ArrayList();
    }

    @Override // android.widget.TextView
    public final void setTextColor(int i5) {
        setTextColor(ColorStateList.valueOf(i5));
    }
}
