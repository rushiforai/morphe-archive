package gt;

import android.net.Uri;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class w implements dr.b {
    @Override // dr.b
    public final StripeModel s(JSONObject jSONObject) {
        if (!jSONObject.has(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL)) {
            return null;
        }
        Uri uri = Uri.parse(jSONObject.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
        Intrinsics.f(uri, "parse(...)");
        return new StripeIntent.NextActionData.RedirectToUrl(uri, jSONObject.optString("return_url"));
    }
}
