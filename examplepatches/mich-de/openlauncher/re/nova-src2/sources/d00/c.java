package d00;

import android.app.AlertDialog;
import android.webkit.WebView;
import b.z9;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import com.teslacoilsw.launcher.novamobile.NovaMobileActivity;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends g.s {
    public final /* synthetic */ int Y;
    public final /* synthetic */ Object Z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(Object obj, int i5) {
        super(true);
        this.Y = i5;
        this.Z = obj;
    }

    @Override // g.s
    public final void handleOnBackPressed() {
        switch (this.Y) {
            case 0:
                NovaMobileActivity novaMobileActivity = (NovaMobileActivity) this.Z;
                if (novaMobileActivity.f45917u != null) {
                    novaMobileActivity.b0();
                    return;
                }
                WebView webView = novaMobileActivity.f45913q;
                if (webView == null) {
                    Intrinsics.m("webView");
                    throw null;
                }
                if (!webView.canGoBack()) {
                    novaMobileActivity.finish();
                    return;
                }
                WebView webView2 = novaMobileActivity.f45913q;
                if (webView2 != null) {
                    webView2.goBack();
                    return;
                } else {
                    Intrinsics.m("webView");
                    throw null;
                }
            case 1:
                ((Function1) this.Z).invoke(this);
                return;
            case 2:
                ((p6.t) this.Z).o();
                return;
            case 3:
                FinancialConnectionsSheetLiteActivity financialConnectionsSheetLiteActivity = (FinancialConnectionsSheetLiteActivity) this.Z;
                new AlertDialog.Builder(financialConnectionsSheetLiteActivity).setTitle(2132019787).setMessage(2132019786).setCancelable(true).setPositiveButton(2132019785, new z9(financialConnectionsSheetLiteActivity, 4)).setNegativeButton(2132019784, new sr.n(0)).create().show();
                return;
            default:
                BottomSheetBehavior bottomSheetBehavior = ((NovaAiChatActivity) this.Z).A;
                if (bottomSheetBehavior != null) {
                    bottomSheetBehavior.J(4);
                    return;
                }
                return;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(Object obj, boolean z11, int i5) {
        super(false);
        this.Y = i5;
        this.Z = obj;
    }
}
