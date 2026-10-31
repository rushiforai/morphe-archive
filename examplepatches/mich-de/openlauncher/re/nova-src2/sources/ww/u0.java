package ww;

import com.stripe.android.view.StripeEditText;

/* loaded from: classes4.dex */
public final class u0 extends v0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ StripeEditText f94849a;

    public u0(StripeEditText stripeEditText) {
        this.f94849a = stripeEditText;
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        this.f94849a.f45505i = i12 == 0;
    }
}
