package o0;

import com.instabridge.ai.proactive.AiDatabase;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;
import kotlinx.serialization.json.JsonArray;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final /* synthetic */ class m implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78767a;

    public /* synthetic */ m(int i5) {
        this.f78767a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws JSONException {
        switch (this.f78767a) {
            case 0:
                return Unit.f71706a;
            case 1:
                List list = (List) obj;
                return new z((int[]) list.get(0), (int[]) list.get(1));
            case 2:
                Pair it = (Pair) obj;
                Intrinsics.g(it, "it");
                String str = (String) it.f71683a;
                Object obj2 = it.f71684b;
                return obj2 == null ? str : a2.c.g('=', str, String.valueOf(obj2));
            case 3:
                ClassSerialDescriptorBuilder buildClassSerialDescriptor = (ClassSerialDescriptorBuilder) obj;
                Intrinsics.g(buildClassSerialDescriptor, "$this$buildClassSerialDescriptor");
                buildClassSerialDescriptor.element("clicks", JsonArray.INSTANCE.serializer().getDescriptor(), EmptyList.f71733a, false);
                return Unit.f71706a;
            case 4:
                Intrinsics.g((pp.w) obj, "it");
                return new LinkedHashMap();
            case 5:
                ClassSerialDescriptorBuilder buildClassSerialDescriptor2 = (ClassSerialDescriptorBuilder) obj;
                Intrinsics.g(buildClassSerialDescriptor2, "$this$buildClassSerialDescriptor");
                buildClassSerialDescriptor2.element(AiDatabase.COL_IMPRESSIONS, JsonArray.INSTANCE.serializer().getDescriptor(), EmptyList.f71733a, false);
                return Unit.f71706a;
            case 6:
                return ((JSONObject) obj).getJSONArray("items");
            case 7:
                return UtilsKt.optStringNull((JSONObject) obj, "next");
            case 8:
                String string = ((JSONObject) obj).getJSONObject("album").getString(PendingUpgradeStore.KEY_NAME);
                if (string.length() == 0) {
                    return null;
                }
                return string;
            case 9:
                return ((JSONObject) obj).getJSONArray("items");
            case 10:
                String string2 = ((JSONObject) obj).getJSONObject("show").getString(PendingUpgradeStore.KEY_NAME);
                if (string2.length() == 0) {
                    return null;
                }
                return string2;
            case 11:
                String string3 = ((JSONObject) obj).getJSONObject("show").getString("uri");
                if (string3.length() == 0) {
                    return null;
                }
                return string3;
            case 12:
                String[] strArr = q20.p.f83512h;
                return o7.a.z(((JSONObject) obj).getJSONObject("show").getJSONArray("images"));
            case 13:
                return UtilsKt.optStringNull((JSONObject) obj, "next");
            case 14:
                return ((JSONObject) obj).getJSONArray("items");
            case 15:
                String string4 = ((JSONObject) obj).getJSONObject("episode").getString(PendingUpgradeStore.KEY_NAME);
                if (string4.length() == 0) {
                    return null;
                }
                return string4;
            case 16:
                String string5 = ((JSONObject) obj).getJSONObject("episode").getString("uri");
                if (string5.length() == 0) {
                    return null;
                }
                return string5;
            case 17:
                return ((JSONObject) obj).getJSONArray("items");
            case 18:
                JSONArray jSONArrayOptJSONArray = ((JSONObject) obj).getJSONObject("episode").optJSONArray("images");
                if (jSONArrayOptJSONArray == null) {
                    return null;
                }
                String[] strArr2 = q20.p.f83512h;
                return o7.a.z(jSONArrayOptJSONArray);
            case 19:
                return UtilsKt.optStringNull((JSONObject) obj, "next");
            case 20:
                String string6 = ((JSONObject) obj).getJSONObject("album").getString("uri");
                if (string6.length() == 0) {
                    return null;
                }
                return string6;
            case 21:
                return ((JSONObject) obj).getJSONArray("items");
            case 22:
                String string7 = ((JSONObject) obj).getString(PendingUpgradeStore.KEY_NAME);
                if (string7.length() == 0) {
                    return null;
                }
                return string7;
            case 23:
                String string8 = ((JSONObject) obj).getString("uri");
                if (string8.length() == 0) {
                    return null;
                }
                return string8;
            case 24:
                JSONArray jSONArrayOptJSONArray2 = ((JSONObject) obj).optJSONArray("images");
                if (jSONArrayOptJSONArray2 == null) {
                    return null;
                }
                String[] strArr3 = q20.p.f83512h;
                return o7.a.z(jSONArrayOptJSONArray2);
            case 25:
                return UtilsKt.optStringNull((JSONObject) obj, "next");
            case 26:
                JSONArray jSONArrayOptJSONArray3 = ((JSONObject) obj).getJSONObject("album").optJSONArray("images");
                if (jSONArrayOptJSONArray3 == null) {
                    return null;
                }
                String[] strArr4 = q20.p.f83512h;
                return o7.a.z(jSONArrayOptJSONArray3);
            case 27:
                return UtilsKt.optStringNull((JSONObject) obj, "next");
            case 28:
                String string9 = ((JSONObject) obj).getJSONObject("track").getString(PendingUpgradeStore.KEY_NAME);
                if (string9.length() == 0) {
                    return null;
                }
                return string9;
            default:
                return ((JSONObject) obj).getJSONObject("artists").getJSONArray("items");
        }
    }
}
