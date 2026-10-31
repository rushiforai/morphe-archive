package pu;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONException;
import org.json.JSONObject;
import p6.x0;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83022a;

    public /* synthetic */ e(int i5) {
        this.f83022a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws JSONException {
        switch (this.f83022a) {
            case 0:
                p6.i navArgument = (p6.i) obj;
                Intrinsics.g(navArgument, "$this$navArgument");
                navArgument.f82181a.f82168c = x0.f82294j;
                return Unit.f71706a;
            case 1:
                List entries = (List) obj;
                Intrinsics.g(entries, "entries");
                return MapsKt.r0(entries);
            case 2:
                Map entries2 = (Map) obj;
                Intrinsics.g(entries2, "entries");
                if (!entries2.isEmpty()) {
                    Iterator it = entries2.entrySet().iterator();
                    while (it.hasNext()) {
                        if (!((pw.a) ((Map.Entry) it.next()).getValue()).f83106b) {
                            return null;
                        }
                    }
                }
                return entries2;
            case 3:
                List textFieldControllerIds = (List) obj;
                Intrinsics.g(textFieldControllerIds, "textFieldControllerIds");
                return (IdentifierSpec) b70.g.i1(textFieldControllerIds);
            case 4:
                return ((JSONObject) obj).getJSONArray("items");
            case 5:
                String string = ((JSONObject) obj).getString(PendingUpgradeStore.KEY_NAME);
                if (string.length() == 0) {
                    return null;
                }
                return string;
            case 6:
                String string2 = ((JSONObject) obj).getString("uri");
                if (string2.length() == 0) {
                    return null;
                }
                return string2;
            case 7:
                String[] strArr = q20.p.f83512h;
                return o7.a.z(((JSONObject) obj).getJSONArray("images"));
            case 8:
                return UtilsKt.optStringNull((JSONObject) obj, "next");
            case 9:
                return ((JSONObject) obj).getJSONArray("items");
            case 10:
                return ((JSONObject) obj).getJSONObject("track").getString(PendingUpgradeStore.KEY_NAME);
            case 11:
                return ((JSONObject) obj).getJSONObject("track").getString("uri");
            case 12:
                String[] strArr2 = q20.p.f83512h;
                return o7.a.z(((JSONObject) obj).getJSONObject("track").getJSONObject("album").getJSONArray("images"));
            case 13:
                String[] strArr3 = q20.p.f83512h;
                return null;
            case 14:
                return ((JSONObject) obj).getJSONArray("queue");
            case 15:
                return ((JSONObject) obj).getString(PendingUpgradeStore.KEY_NAME);
            case 16:
                return ((JSONObject) obj).getString("uri");
            case 17:
                JSONObject jSONObject = (JSONObject) obj;
                JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("album");
                if (jSONObjectOptJSONObject != null) {
                    jSONObject = jSONObjectOptJSONObject;
                }
                String[] strArr4 = q20.p.f83512h;
                return o7.a.z(jSONObject.getJSONArray("images"));
            case 18:
                q3.x xVar = (q3.x) obj;
                return "'" + xVar.b() + "' " + xVar.a();
            case 19:
                CharSequence it2 = (CharSequence) obj;
                Intrinsics.g(it2, "it");
                return Integer.valueOf(it2.length());
            case 20:
                o50.s it3 = (o50.s) obj;
                Intrinsics.g(it3, "it");
                return Integer.valueOf(it3.f79588a.length());
            case 21:
                Sequence it4 = (Sequence) obj;
                Intrinsics.g(it4, "it");
                return it4.getF71970a();
            case 22:
                return obj;
            case 23:
                Iterable it5 = (Iterable) obj;
                Intrinsics.g(it5, "it");
                return it5.iterator();
            case 24:
                kotlin.collections.c.o0(obj, null);
                throw null;
            case 25:
                return Boolean.valueOf(((qx.x0) obj).g() > 15000);
            case 26:
                ((qx.r) obj).f();
                return Unit.f71706a;
            case 27:
                ((qx.r) obj).f();
                return Unit.f71706a;
            case 28:
                ((qx.r) obj).f();
                return Unit.f71706a;
            default:
                ((qx.r) obj).f();
                return Unit.f71706a;
        }
    }

    public /* synthetic */ e(y3.e eVar) {
        this.f83022a = 18;
    }
}
