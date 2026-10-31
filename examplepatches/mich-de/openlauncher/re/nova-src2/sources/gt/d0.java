package gt;

import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.i6;
import com.tiktok.util.TTConst;
import java.util.Iterator;
import kotlin.NoWhenBranchMatchedException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public abstract class d0 implements dr.b {
    public static StripeIntent.NextActionData a(JSONObject jSONObject) {
        Object next;
        dr.b tVar;
        i6 i6Var = StripeIntent.NextActionType.f43965b;
        String strOptString = jSONObject.optString(TTConst.TRACK_TYPE);
        i6Var.getClass();
        Iterator it = StripeIntent.NextActionType.f43978q.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((StripeIntent.NextActionType) next).f43979a.equals(strOptString)) {
                break;
            }
        }
        StripeIntent.NextActionType nextActionType = (StripeIntent.NextActionType) next;
        switch (nextActionType == null ? -1 : c0.f57788a[nextActionType.ordinal()]) {
            case -1:
                return null;
            case 0:
            default:
                throw new NoWhenBranchMatchedException();
            case 1:
                tVar = new t();
                break;
            case 2:
                tVar = new q();
                break;
            case 3:
                tVar = new r();
                break;
            case 4:
                tVar = new s();
                break;
            case 5:
                tVar = new u();
                break;
            case 6:
                tVar = new v();
                break;
            case 7:
                tVar = new w();
                break;
            case 8:
                tVar = new x();
                break;
            case 9:
                tVar = new n();
                break;
            case 10:
                tVar = new o();
                break;
            case 11:
                tVar = new b0();
                break;
            case 12:
                tVar = new a0();
                break;
            case 13:
                tVar = new z();
                break;
            case 14:
                tVar = new p();
                break;
            case 15:
                tVar = new y();
                break;
        }
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(nextActionType.f43979a);
        if (jSONObjectOptJSONObject == null) {
            jSONObjectOptJSONObject = new JSONObject();
        }
        return (StripeIntent.NextActionData) tVar.s(jSONObjectOptJSONObject);
    }
}
