package dr;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.stripe.android.core.StripeError;
import com.stripe.android.core.model.StripeModel;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import kotlin.sequences.SequencesKt;
import org.json.JSONArray;
import org.json.JSONObject;
import q70.d;

/* loaded from: classes4.dex */
public final class a implements b {
    public static List a(JSONArray jSONArray) {
        if (jSONArray == null) {
            return EmptyList.f71733a;
        }
        IntRange intRangeM0 = kotlin.ranges.a.m0(0, jSONArray.length());
        ArrayList arrayList = new ArrayList(b70.c.u0(intRangeM0, 10));
        IntProgressionIterator it = intRangeM0.iterator();
        while (it.f71911c) {
            arrayList.add(jSONArray.getString(it.nextInt()));
        }
        return arrayList;
    }

    public static StripeError b(JSONObject jSONObject) {
        Object objA;
        Map mapT0;
        try {
            int i5 = Result.f71687b;
            JSONObject jSONObject2 = jSONObject.getJSONObject("error");
            String strN = vh.a.N("charge", jSONObject2);
            String strN2 = vh.a.N(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, jSONObject2);
            String strN3 = vh.a.N("decline_code", jSONObject2);
            String strN4 = vh.a.N(PglCryptUtils.KEY_MESSAGE, jSONObject2);
            String strN5 = vh.a.N("param", jSONObject2);
            String strN6 = vh.a.N(TTConst.TRACK_TYPE, jSONObject2);
            String strN7 = vh.a.N("doc_url", jSONObject2);
            JSONObject jSONObjectOptJSONObject = jSONObject2.optJSONObject("extra_fields");
            if (jSONObjectOptJSONObject != null) {
                Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                Intrinsics.f(itKeys, "keys(...)");
                mapT0 = MapsKt.t0(SequencesKt.y0(d.m0(itKeys), new c(jSONObjectOptJSONObject, 0)));
            } else {
                mapT0 = null;
            }
            objA = new StripeError(strN6, strN4, strN2, strN5, strN3, strN, strN7, mapT0);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Object stripeError = new StripeError(null, "An improperly formatted error response was found.", null, null, null, null, null, null);
        if (objA instanceof Result.Failure) {
            objA = stripeError;
        }
        return (StripeError) objA;
    }

    @Override // dr.b
    public /* bridge */ /* synthetic */ StripeModel s(JSONObject jSONObject) {
        return b(jSONObject);
    }
}
