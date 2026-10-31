package gt;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.MobileCardElementConfig;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class m implements dr.b {
    @Override // dr.b
    public final StripeModel s(JSONObject jSONObject) {
        return new MobileCardElementConfig(new MobileCardElementConfig.CardBrandChoice(jSONObject.getJSONObject("card_brand_choice").getBoolean("eligible")));
    }
}
