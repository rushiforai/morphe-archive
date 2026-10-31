package gt;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.WeChat;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class b0 implements dr.b {
    @Override // dr.b
    public final StripeModel s(JSONObject jSONObject) {
        return new StripeIntent.NextActionData.WeChatPayRedirect(new WeChat(null, jSONObject.optString("app_id"), jSONObject.optString("nonce_str"), jSONObject.optString("package"), jSONObject.optString("partner_id"), jSONObject.optString("prepay_id"), jSONObject.optString("sign"), jSONObject.optString("timestamp"), null));
    }
}
