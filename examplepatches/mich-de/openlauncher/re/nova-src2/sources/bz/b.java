package bz;

import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.widget.ProgressBar;
import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import com.teslacoilsw.launcher.games.GamesActivity;
import g.o;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b extends WebChromeClient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18679a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ o f18680b;

    public /* synthetic */ b(o oVar, int i5) {
        this.f18679a = i5;
        this.f18680b = oVar;
    }

    @Override // android.webkit.WebChromeClient
    public final void onProgressChanged(WebView webView, int i5) {
        switch (this.f18679a) {
            case 0:
                ProgressBar progressBar = ((GamesActivity) this.f18680b).f45759p;
                if (progressBar != null) {
                    progressBar.setProgress(i5);
                    return;
                } else {
                    Intrinsics.m("progressBar");
                    throw null;
                }
            default:
                FinancialConnectionsSheetLiteActivity financialConnectionsSheetLiteActivity = (FinancialConnectionsSheetLiteActivity) this.f18680b;
                ProgressBar progressBar2 = financialConnectionsSheetLiteActivity.f42694p;
                if (progressBar2 == null) {
                    Intrinsics.m("progressBar");
                    throw null;
                }
                progressBar2.setVisibility(i5 < 100 ? 0 : 8);
                ProgressBar progressBar3 = financialConnectionsSheetLiteActivity.f42694p;
                if (progressBar3 != null) {
                    progressBar3.setProgress(i5);
                    return;
                } else {
                    Intrinsics.m("progressBar");
                    throw null;
                }
        }
    }
}
