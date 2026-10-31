package com.stripe.android.view;

import android.content.Context;
import android.content.res.Resources;
import android.text.InputFilter;
import android.util.AttributeSet;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/view/CvcEditText;", "Lcom/stripe/android/view/StripeEditText;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class CvcEditText extends StripeEditText {

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ int f45474x = 0;

    /* renamed from: v, reason: collision with root package name */
    public ft.b f45475v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ ww.e f45476w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public CvcEditText(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 2130969140);
        Intrinsics.g(context, "context");
        ft.b bVar = ft.b.f55894x;
        this.f45475v = bVar;
        this.f45476w = new ww.e(2);
        this.f45511q = getResources().getString(2132019812);
        setHint(2132019763);
        setMaxLines(1);
        setFilters(new InputFilter[]{new InputFilter.LengthFilter(bVar.a())});
        e();
        setAutofillHints("creditCardSecurityCode");
        addTextChangedListener(new d9.e(this, 3));
        this.f45513s.add(new fk.a(this, 4));
        setLayoutDirection(0);
    }

    @Override // com.stripe.android.view.StripeEditText
    public final String c() throws Resources.NotFoundException {
        String string = getResources().getString(2132019621, getText());
        Intrinsics.f(string, "getString(...)");
        return string;
    }
}
