package gt;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class x implements dr.b {
    /* JADX WARN: Removed duplicated region for block: B:17:0x0064  */
    @Override // dr.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final StripeModel s(JSONObject jSONObject) {
        List listU1;
        String strN = vh.a.N(TTConst.TRACK_TYPE, jSONObject);
        if (!Intrinsics.b(strN, "stripe_3ds2_fingerprint")) {
            if (Intrinsics.b(strN, "intent_confirmation_challenge")) {
                return StripeIntent.NextActionData.SdkData.IntentConfirmationChallenge.f43948a;
            }
            return null;
        }
        String strOptString = jSONObject.optString("three_d_secure_2_source");
        Intrinsics.f(strOptString, "optString(...)");
        String strOptString2 = jSONObject.optString("directory_server_name");
        Intrinsics.f(strOptString2, "optString(...)");
        String strOptString3 = jSONObject.optString("server_transaction_id");
        Intrinsics.f(strOptString3, "optString(...)");
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("directory_server_encryption");
        if (jSONObjectOptJSONObject == null) {
            jSONObjectOptJSONObject = new JSONObject();
        }
        ArrayList arrayListD = vh.a.D(jSONObjectOptJSONObject.optJSONArray("root_certificate_authorities"));
        if (arrayListD != null) {
            listU1 = EmptyList.f71733a;
            Iterator it = arrayListD.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (next instanceof String) {
                    listU1 = b70.g.u1(listU1, next);
                }
            }
            if (listU1 == null) {
                listU1 = EmptyList.f71733a;
            }
        }
        String strOptString4 = jSONObjectOptJSONObject.optString("directory_server_id");
        Intrinsics.f(strOptString4, "optString(...)");
        String strOptString5 = jSONObjectOptJSONObject.optString("certificate");
        Intrinsics.f(strOptString5, "optString(...)");
        return new StripeIntent.NextActionData.SdkData.Use3DS2(strOptString, strOptString2, strOptString3, new StripeIntent.NextActionData.SdkData.Use3DS2.DirectoryServerEncryption(strOptString4, strOptString5, listU1, jSONObjectOptJSONObject.optString("key_id")), vh.a.N("three_d_secure_2_intent", jSONObject), vh.a.N("publishable_key", jSONObject));
    }
}
