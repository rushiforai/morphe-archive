package zv;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Window;
import com.google.android.material.progressindicator.CircularProgressIndicator;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t extends Dialog {

    /* renamed from: a, reason: collision with root package name */
    public final StripeUiCustomization f98746a;

    /* renamed from: b, reason: collision with root package name */
    public final a70.d f98747b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(Context context, StripeUiCustomization uiCustomization) {
        super(context);
        Intrinsics.g(uiCustomization, "uiCustomization");
        this.f98746a = uiCustomization;
        this.f98747b = LazyKt.a(new xu.d(this, 11));
        setCancelable(false);
        Window window = getWindow();
        if (window != null) {
            window.clearFlags(2);
        }
        Window window2 = getWindow();
        if (window2 != null) {
            window2.setBackgroundDrawable(new ColorDrawable(0));
        }
    }

    @Override // android.app.Dialog
    public final void onStart() {
        String str;
        super.onStart();
        a70.d dVar = this.f98747b;
        setContentView(((qv.b) dVar.getValue()).f84330a);
        CircularProgressIndicator circularProgressIndicator = ((qv.b) dVar.getValue()).f84331b;
        StripeUiCustomization stripeUiCustomization = this.f98746a;
        if (stripeUiCustomization == null || (str = stripeUiCustomization.f45053f) == null) {
            return;
        }
        circularProgressIndicator.setIndeterminateTintList(ColorStateList.valueOf(Color.parseColor(str)));
    }
}
