package uf;

import android.view.View;
import android.widget.ListPopupWindow;
import com.android.launcher3.views.WidgetsEduView;
import com.stripe.android.view.CardBrandView;
import com.teslacoilsw.launcher.novawidget.WeatherWidget;
import k30.h0;

/* loaded from: classes3.dex */
public final /* synthetic */ class p implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91189a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f91190b;

    public /* synthetic */ p(Object obj, int i5) {
        this.f91189a = i5;
        this.f91190b = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i5 = this.f91189a;
        Object obj = this.f91190b;
        switch (i5) {
            case 0:
                s sVar = (s) obj;
                sVar.f();
                if (view.getId() != 2131428006) {
                    if (view.getId() == 2131428005) {
                        sVar.f91211r.start();
                        break;
                    }
                } else {
                    sVar.f91210q.start();
                    break;
                }
                break;
            case 1:
                ListPopupWindow listPopupWindow = ((CardBrandView) obj).f45434c;
                if (!listPopupWindow.isShowing()) {
                    listPopupWindow.show();
                    break;
                } else {
                    listPopupWindow.dismiss();
                    break;
                }
            case 2:
                int i11 = WeatherWidget.C;
                h0 h0Var = h0.f70974r;
                lm.e.p(((WeatherWidget) obj).getContext()).f();
                break;
            default:
                int i12 = WidgetsEduView.n;
                ((WidgetsEduView) obj).K(true);
                break;
        }
    }
}
