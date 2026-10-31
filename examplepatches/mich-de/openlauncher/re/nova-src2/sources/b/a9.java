package b;

import ads_mobile_sdk.p72;
import android.view.ViewTreeObserver;

/* loaded from: classes.dex */
public final class a9 implements ViewTreeObserver.OnWindowFocusChangeListener {
    @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
    public final void onWindowFocusChanged(boolean z11) {
        p72.a().getClass();
        ads_mobile_sdk.i6 i6Var = ads_mobile_sdk.i6.f4638d;
        boolean zA = i6Var.a();
        if (i6Var.f12550b != zA) {
            i6Var.f12550b = zA;
            if (i6Var.f12549a) {
                i6Var.a(zA);
                bd bdVar = i6Var.f12551c;
                if (bdVar != null) {
                    bdVar.a(zA);
                }
            }
        }
    }
}
