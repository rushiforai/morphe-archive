package gt;

import android.net.Uri;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class n implements dr.b {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x005d  */
    /* JADX WARN: Type inference failed for: r2v3, types: [kotlin.Result$Failure] */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v6, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r2v7 */
    @Override // dr.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final StripeModel s(JSONObject jSONObject) throws JSONException {
        ?? A;
        String string = jSONObject.getString("native_data");
        Intrinsics.f(string, "getString(...)");
        String string2 = jSONObject.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        Intrinsics.f(string2, "getString(...)");
        String strN = vh.a.N("return_url", jSONObject);
        try {
            int i5 = Result.f71687b;
            A = Uri.parse("alipay://url?".concat(string)).getQueryParameter("return_url");
            if (A != 0) {
                Uri uri = Uri.parse(A);
                boolean z11 = false;
                if (Intrinsics.b(uri.getScheme(), "https")) {
                    String host = uri.getHost();
                    if (Intrinsics.b(host, "stripe.com")) {
                        z11 = true;
                    } else {
                        if (host != null ? r70.j.A0(host, ".stripe.com", false) : false) {
                        }
                    }
                }
                if (!z11) {
                    A = 0;
                }
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            A = ResultKt.a(th2);
        }
        String str = A instanceof Result.Failure ? null : A;
        Uri uri2 = Uri.parse(string2);
        Intrinsics.f(uri2, "parse(...)");
        return new StripeIntent.NextActionData.AlipayRedirect(string, str, uri2, strN);
    }
}
