package gt;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class v implements dr.b {
    @Override // dr.b
    public final StripeModel s(JSONObject jSONObject) {
        return new StripeIntent.NextActionData.DisplayPromptPayDetails(vh.a.N("hosted_instructions_url", jSONObject));
    }
}
