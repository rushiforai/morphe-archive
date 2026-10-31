package gt;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class y implements dr.b {
    @Override // dr.b
    public final StripeModel s(JSONObject jSONObject) {
        String strOptString = jSONObject.optString("mobile_auth_url");
        Intrinsics.f(strOptString, "optString(...)");
        return new StripeIntent.NextActionData.SwishRedirect(strOptString);
    }
}
