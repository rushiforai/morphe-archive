package tu;

import android.view.View;
import android.widget.FrameLayout;
import com.stripe.android.paymentsheet.ui.PrimaryButton;

/* loaded from: classes4.dex */
public final class a implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FrameLayout f89598a;

    public a(FrameLayout frameLayout, PrimaryButton primaryButton) {
        this.f89598a = frameLayout;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f89598a;
    }
}
