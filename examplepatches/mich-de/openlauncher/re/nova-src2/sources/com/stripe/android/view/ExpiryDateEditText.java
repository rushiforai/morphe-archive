package com.stripe.android.view;

import android.content.Context;
import android.content.res.Resources;
import android.text.InputFilter;
import android.util.AttributeSet;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.properties.Delegates;
import kotlin.reflect.KProperty;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ww.b0;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/view/ExpiryDateEditText;", "Lcom/stripe/android/view/StripeEditText;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ExpiryDateEditText extends StripeEditText {

    /* renamed from: z, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f45477z = {Reflection.f71864a.mutableProperty1(new MutablePropertyReference1Impl(ExpiryDateEditText.class, "includeSeparatorGaps", "getIncludeSeparatorGaps$payments_core_release()Z", 0))};

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Function0 f45478v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f45479w;

    /* renamed from: x, reason: collision with root package name */
    public final int f45480x;

    /* renamed from: y, reason: collision with root package name */
    public final String f45481y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ExpiryDateEditText(@NotNull Context context, @Nullable AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 2130969140);
        Intrinsics.g(context, "context");
        this.f45478v = new ww.e(3);
        int i5 = Delegates.f71888a;
        int integer = context.getResources().getInteger(2131492967);
        this.f45480x = integer;
        this.f45481y = "/";
        e();
        this.f45481y = "/";
        setFilters((InputFilter[]) ul.b.P(new InputFilter.LengthFilter(this.f45481y.length() + integer)).toArray(new InputFilter.LengthFilter[0]));
        addTextChangedListener(new b0(this));
        setAutofillHints("creditCardExpirationDate");
        this.f45513s.add(new fk.a(this, 5));
        setLayoutDirection(0);
    }

    @Override // com.stripe.android.view.StripeEditText
    public final String c() throws Resources.NotFoundException {
        String string = getResources().getString(2132019623, getText());
        Intrinsics.f(string, "getString(...)");
        return string;
    }
}
