package q20;

import android.content.Intent;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import g0.d1;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.JsonBuilder;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import qx.r;
import r10.b1;
import t0.u1;

/* loaded from: classes.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83463a;

    public /* synthetic */ c(int i5) {
        this.f83463a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws JSONException {
        switch (this.f83463a) {
            case 0:
                String string = ((JSONObject) obj).getString(PendingUpgradeStore.KEY_NAME);
                if (string.length() == 0) {
                    return null;
                }
                return string;
            case 1:
                String string2 = ((JSONObject) obj).getString("uri");
                if (string2.length() == 0) {
                    return null;
                }
                return string2;
            case 2:
                JSONArray jSONArrayOptJSONArray = ((JSONObject) obj).optJSONArray("images");
                if (jSONArrayOptJSONArray == null) {
                    return null;
                }
                String[] strArr = p.f83512h;
                return o7.a.z(jSONArrayOptJSONArray);
            case 3:
                return UtilsKt.optStringNull(((JSONObject) obj).getJSONObject("artists"), "next");
            case 4:
                String string3 = ((JSONObject) obj).getJSONObject("track").getString("uri");
                if (string3.length() == 0) {
                    return null;
                }
                return string3;
            case 5:
                JSONArray jSONArrayOptJSONArray2 = ((JSONObject) obj).getJSONObject("track").getJSONObject("album").optJSONArray("images");
                if (jSONArrayOptJSONArray2 == null) {
                    return null;
                }
                String[] strArr2 = p.f83512h;
                return o7.a.z(jSONArrayOptJSONArray2);
            case 6:
                return UtilsKt.optStringNull((JSONObject) obj, "next");
            case 7:
                return ((JSONObject) obj).getJSONArray("items");
            case 8:
                String string4 = ((JSONObject) obj).getString(PendingUpgradeStore.KEY_NAME);
                if (string4.length() == 0) {
                    return null;
                }
                return string4;
            case 9:
                String string5 = ((JSONObject) obj).getString("uri");
                if (string5.length() == 0) {
                    return null;
                }
                return string5;
            case 10:
                JSONArray jSONArrayOptJSONArray3 = ((JSONObject) obj).optJSONArray("images");
                if (jSONArrayOptJSONArray3 == null) {
                    return null;
                }
                String[] strArr3 = p.f83512h;
                return o7.a.z(jSONArrayOptJSONArray3);
            case 11:
                return Boolean.valueOf(obj == null);
            case 12:
                JsonBuilder Json = (JsonBuilder) obj;
                Intrinsics.g(Json, "$this$Json");
                Json.setPrettyPrint(true);
                return Unit.f71706a;
            case 13:
                ((r) obj).f();
                return Unit.f71706a;
            case 14:
                ((r) obj).f();
                return Unit.f71706a;
            case 15:
                r rVar = (r) obj;
                return Boolean.valueOf(rVar.e() || rVar.f84589e);
            case 16:
                r rVar2 = (r) obj;
                return Boolean.valueOf(rVar2.e() || rVar2.f84589e);
            case 17:
                b1 b1Var = NovaSearchProvider.Companion;
                Intent intent = new Intent("android.intent.action.WEB_SEARCH");
                intent.setPackage("com.google.android.googlequicksearchbox");
                intent.putExtra("query", (String) obj);
                intent.setFlags(268435456);
                return intent;
            case 18:
                b1 b1Var2 = NovaSearchProvider.Companion;
                Intent intent2 = new Intent("android.intent.action.WEB_SEARCH");
                intent2.setPackage("com.google.android.apps.searchlite");
                intent2.putExtra("query", (String) obj);
                intent2.setFlags(268435456);
                return intent2;
            case 19:
                b1 b1Var3 = NovaSearchProvider.Companion;
                Intent intent3 = new Intent("android.intent.action.SEND");
                intent3.setPackage("com.google.android.apps.translate");
                intent3.setType("text/plain");
                intent3.putExtra("android.intent.extra.TEXT", (String) obj);
                intent3.setFlags(268435456);
                return intent3;
            case 20:
                b1 b1Var4 = NovaSearchProvider.Companion;
                Intent intent4 = new Intent("android.intent.action.SEND");
                intent4.setPackage("org.mozilla.focus");
                intent4.setType("text/plain");
                intent4.putExtra("android.intent.extra.TEXT", (String) obj);
                intent4.setFlags(268435456);
                return intent4;
            case 21:
                Map.Entry DelegatingMutableSet = (Map.Entry) obj;
                Intrinsics.g(DelegatingMutableSet, "$this$DelegatingMutableSet");
                return new s50.h(((s50.c) DelegatingMutableSet.getKey()).f86679a, DelegatingMutableSet.getValue());
            case 22:
                Map.Entry DelegatingMutableSet2 = (Map.Entry) obj;
                Intrinsics.g(DelegatingMutableSet2, "$this$DelegatingMutableSet");
                return new s50.h(x7.f.s((String) DelegatingMutableSet2.getKey()), DelegatingMutableSet2.getValue());
            case 23:
                s50.c DelegatingMutableSet3 = (s50.c) obj;
                Intrinsics.g(DelegatingMutableSet3, "$this$DelegatingMutableSet");
                return DelegatingMutableSet3.f86679a;
            case 24:
                String DelegatingMutableSet4 = (String) obj;
                Intrinsics.g(DelegatingMutableSet4, "$this$DelegatingMutableSet");
                return x7.f.s(DelegatingMutableSet4);
            case 25:
                return Unit.f71706a;
            case 26:
                return Unit.f71706a;
            case 27:
                return Unit.f71706a;
            case 28:
                return Unit.f71706a;
            default:
                List list = (List) obj;
                Object obj2 = list.get(1);
                Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.Boolean");
                d1 d1Var = ((Boolean) obj2).booleanValue() ? d1.f56493a : d1.f56494b;
                Object obj3 = list.get(0);
                Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.Float");
                return new u1(d1Var, ((Float) obj3).floatValue());
        }
    }
}
