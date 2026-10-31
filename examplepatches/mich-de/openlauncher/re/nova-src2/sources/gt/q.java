package gt;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class q implements dr.b {
    @Override // dr.b
    public final StripeModel s(JSONObject jSONObject) {
        return new StripeIntent.NextActionData.DisplayBoletoDetails(vh.a.N("hosted_voucher_url", jSONObject));
    }
}
