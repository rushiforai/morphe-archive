package com.stripe.android.view;

import android.content.Context;
import android.text.method.LinkMovementMethod;
import android.util.AttributeSet;
import androidx.appcompat.widget.AppCompatTextView;
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

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/view/BecsDebitMandateAcceptanceTextView;", "Landroidx/appcompat/widget/AppCompatTextView;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class BecsDebitMandateAcceptanceTextView extends AppCompatTextView {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f45430a = {Reflection.f71864a.mutableProperty1(new MutablePropertyReference1Impl(BecsDebitMandateAcceptanceTextView.class, "companyName", "getCompanyName()Ljava/lang/String;", 0))};

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public BecsDebitMandateAcceptanceTextView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 16842884);
        Intrinsics.g(context, "context");
        setMovementMethod(LinkMovementMethod.getInstance());
        int i5 = Delegates.f71888a;
    }
}
