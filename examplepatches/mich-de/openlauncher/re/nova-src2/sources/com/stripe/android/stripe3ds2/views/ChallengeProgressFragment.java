package com.stripe.android.stripe3ds2.views;

import ab.e0;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.fragment.app.h0;
import androidx.fragment.app.m0;
import com.google.android.material.progressindicator.CircularProgressIndicator;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.stripe.android.stripe3ds2.observability.Stripe3ds2ErrorReporterConfig;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import tv.c;
import zv.a;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Lcom/stripe/android/stripe3ds2/views/ChallengeProgressFragment;", "Landroidx/fragment/app/h0;", b.f42142b, "directoryServerName", "Lcom/stripe/android/stripe3ds2/transaction/SdkTransactionId;", "sdkTransactionId", b.f42142b, "accentColor", "<init>", "(Ljava/lang/String;Lcom/stripe/android/stripe3ds2/transaction/SdkTransactionId;Ljava/lang/Integer;)V", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ChallengeProgressFragment extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f45241a;

    /* renamed from: b, reason: collision with root package name */
    public final SdkTransactionId f45242b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f45243c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ChallengeProgressFragment(@NotNull String directoryServerName, @NotNull SdkTransactionId sdkTransactionId, @Nullable Integer num) {
        super(2131624425);
        Intrinsics.g(directoryServerName, "directoryServerName");
        Intrinsics.g(sdkTransactionId, "sdkTransactionId");
        this.f45241a = directoryServerName;
        this.f45242b = sdkTransactionId;
        this.f45243c = num;
    }

    @Override // androidx.fragment.app.h0
    public final void onViewCreated(View view, Bundle bundle) {
        Intrinsics.g(view, "view");
        int i5 = 2131427588;
        ImageView imageView = (ImageView) e0.x(2131427588, view);
        if (imageView != null) {
            i5 = 2131428653;
            CircularProgressIndicator circularProgressIndicator = (CircularProgressIndicator) e0.x(2131428653, view);
            if (circularProgressIndicator != null) {
                Context contextRequireContext = requireContext();
                Intrinsics.f(contextRequireContext, "requireContext(...)");
                c cVar = new c(contextRequireContext, new Stripe3ds2ErrorReporterConfig(this.f45242b), null, null, 252);
                zv.b.f98686e.getClass();
                zv.b bVarA = a.a(this.f45241a, cVar);
                m0 activity = getActivity();
                imageView.setImageDrawable(activity != null ? activity.getDrawable(bVarA.f98691b) : null);
                Integer num = bVarA.f98692c;
                imageView.setContentDescription(num != null ? getString(num.intValue()) : null);
                if (bVarA.f98693d) {
                    ViewGroup.LayoutParams layoutParams = imageView.getLayoutParams();
                    if (layoutParams == null) {
                        throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.LayoutParams");
                    }
                    layoutParams.width = -2;
                    layoutParams.height = -2;
                    imageView.setLayoutParams(layoutParams);
                }
                imageView.setVisibility(0);
                Integer num2 = this.f45243c;
                if (num2 != null) {
                    circularProgressIndicator.e(num2.intValue());
                    return;
                }
                return;
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(view.getResources().getResourceName(i5)));
    }
}
