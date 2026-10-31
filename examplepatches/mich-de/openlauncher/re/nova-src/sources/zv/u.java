package zv;

import android.content.Context;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final Context f98748a;

    /* renamed from: b, reason: collision with root package name */
    public final StripeUiCustomization f98749b;

    public u(Context context, StripeUiCustomization uiCustomization) {
        Intrinsics.g(uiCustomization, "uiCustomization");
        this.f98748a = context;
        this.f98749b = uiCustomization;
    }
}
