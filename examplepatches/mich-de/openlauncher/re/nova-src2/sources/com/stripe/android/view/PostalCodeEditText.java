package com.stripe.android.view;

import android.content.Context;
import android.text.InputFilter;
import android.text.method.TextKeyListener;
import android.util.AttributeSet;
import android.view.View;
import com.google.android.material.textfield.TextInputLayout;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.properties.Delegates;
import kotlin.reflect.KProperty;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ww.m0;
import ww.s;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/view/PostalCodeEditText;", "Lcom/stripe/android/view/StripeEditText;", "ww/m0", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PostalCodeEditText extends StripeEditText {

    /* renamed from: w, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f45491w = {Reflection.f71864a.mutableProperty1(new MutablePropertyReference1Impl(PostalCodeEditText.class, "config", "getConfig$payments_core_release()Lcom/stripe/android/view/PostalCodeEditText$Config;", 0))};

    /* renamed from: x, reason: collision with root package name */
    public static final Pattern f45492x = Pattern.compile("^[0-9]{5}$");

    /* renamed from: v, reason: collision with root package name */
    public final s f45493v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public PostalCodeEditText(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 2130969140);
        Intrinsics.g(context, "context");
        int i5 = Delegates.f71888a;
        m0 m0Var = m0.f94813a;
        this.f45493v = new s(this);
        this.f45511q = getResources().getString(2132019819);
        setMaxLines(1);
        addTextChangedListener(new d9.e(this, 4));
        setAutofillHints("postalCode");
    }

    public final void h(int i5) {
        TextInputLayout textInputLayout;
        Object parent = getParent();
        while (true) {
            if (!(parent instanceof View)) {
                textInputLayout = null;
                break;
            } else {
                if (parent instanceof TextInputLayout) {
                    textInputLayout = (TextInputLayout) parent;
                    break;
                }
                parent = ((View) parent).getParent();
            }
        }
        if (textInputLayout != null) {
            if (textInputLayout.C) {
                textInputLayout.p(getResources().getString(i5));
            } else {
                setHint(i5);
            }
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        h(2132019666);
        setKeyListener(TextKeyListener.getInstance());
        setInputType(112);
        setFilters(new InputFilter[0]);
    }
}
