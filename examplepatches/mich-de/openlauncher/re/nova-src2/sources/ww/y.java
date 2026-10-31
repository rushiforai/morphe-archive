package ww;

import android.view.View;
import com.stripe.android.view.CountryTextInputLayout;

/* loaded from: classes4.dex */
public final class y implements View.OnLayoutChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ CountryTextInputLayout f94861a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f94862b;

    public y(CountryTextInputLayout countryTextInputLayout, boolean z11) {
        this.f94861a = countryTextInputLayout;
        this.f94862b = z11;
    }

    @Override // android.view.View.OnLayoutChangeListener
    public final void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        view.removeOnLayoutChangeListener(this);
        this.f94861a.D0.setEnabled(this.f94862b);
    }
}
