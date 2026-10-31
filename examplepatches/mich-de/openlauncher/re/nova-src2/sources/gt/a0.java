package gt;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class a0 implements dr.b {
    @Override // dr.b
    public final StripeModel s(JSONObject jSONObject) {
        Object next;
        long jOptLong = jSONObject.optLong("arrival_date");
        String strOptString = jSONObject.optString("hosted_verification_url");
        Intrinsics.f(strOptString, "optString(...)");
        Iterator it = ft.f0.f55944d.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((ft.f0) next).f55945a.equals(jSONObject.optString("microdeposit_type"))) {
                break;
            }
        }
        ft.f0 f0Var = (ft.f0) next;
        if (f0Var == null) {
            f0Var = ft.f0.f55942b;
        }
        return new StripeIntent.NextActionData.VerifyWithMicrodeposits(jOptLong, strOptString, f0Var);
    }
}
