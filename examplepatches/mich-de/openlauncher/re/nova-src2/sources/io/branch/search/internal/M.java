package io.branch.search.internal;

import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import java.util.Collection;
import java.util.Iterator;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final /* synthetic */ class M extends FunctionReferenceImpl implements Function3<String, Collection<JSONObject>, JSONObject, Collection<JSONObject>> {

    /* renamed from: a, reason: collision with root package name */
    public static final M f62856a = new M();

    public M() {
        super(3, P.class, "failureCompressionAlgo", "failureCompressionAlgo(Ljava/lang/String;Ljava/util/Collection;Lorg/json/JSONObject;)Ljava/util/Collection;", 1);
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) throws JSONException {
        Object next;
        String p02 = (String) obj;
        Collection p12 = (Collection) obj2;
        JSONObject p22 = (JSONObject) obj3;
        Intrinsics.g(p02, "p0");
        Intrinsics.g(p12, "p1");
        Intrinsics.g(p22, "p2");
        if (!p02.equals("failures")) {
            p12.add(p22);
            return p12;
        }
        Object objOpt = p22.opt(Plan.AMP_PLAN_SOURCE);
        Object objOpt2 = p22.opt(PglCryptUtils.KEY_MESSAGE);
        Iterator it = p12.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            JSONObject jSONObject = (JSONObject) next;
            if (Intrinsics.b(jSONObject.opt(Plan.AMP_PLAN_SOURCE), objOpt) && Intrinsics.b(jSONObject.opt(PglCryptUtils.KEY_MESSAGE), objOpt2)) {
                break;
            }
        }
        JSONObject jSONObject2 = (JSONObject) next;
        if (jSONObject2 == null) {
            p12.add(p22);
            return p12;
        }
        try {
            JSONObject jSONObjectOptJSONObject = jSONObject2.optJSONObject("extras");
            if (jSONObjectOptJSONObject == null) {
                jSONObjectOptJSONObject = new JSONObject();
            }
            jSONObjectOptJSONObject.put("count", jSONObjectOptJSONObject.optInt("count", 1) + 1);
            jSONObject2.put("extras", jSONObjectOptJSONObject);
            return p12;
        } catch (Exception e3) {
            C3309p1.a(EnumC3131e9.Others, e3);
            return p12;
        }
    }
}
