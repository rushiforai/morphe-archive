package h50;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.SerializersCacheKt;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;
import kotlinx.serialization.json.JsonElementSerializer;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final /* synthetic */ class i1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59208a;

    public /* synthetic */ i1(int i5) {
        this.f59208a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws JSONException {
        switch (this.f59208a) {
            case 0:
                i50.b createClientPlugin = (i50.b) obj;
                Intrinsics.g(createClientPlugin, "$this$createClientPlugin");
                h1 h1Var = (h1) createClientPlugin.f61374b;
                createClientPlugin.a(i50.g.f61389c, new k1(h1Var.f59203a, h1Var.f59204b, h1Var.f59205c, null));
                return Unit.f71706a;
            case 1:
                i50.b createClientPlugin2 = (i50.b) obj;
                Intrinsics.g(createClientPlugin2, "$this$createClientPlugin");
                createClientPlugin2.a(i50.g.f61388b, new s1(((q1) createClientPlugin2.f61374b).f59267a, null));
                return Unit.f71706a;
            case 2:
                return ((JSONObject) obj).getJSONArray("data");
            case 3:
                String string = ((JSONObject) obj).getString("title");
                if (string.length() == 0) {
                    return null;
                }
                return string;
            case 4:
                return ((JSONObject) obj).getJSONArray("data");
            case 5:
                String string2 = ((JSONObject) obj).getString("title");
                if (string2.length() == 0) {
                    return null;
                }
                return string2;
            case 6:
                String string3 = ((JSONObject) obj).getString("link");
                if (string3.length() == 0) {
                    return null;
                }
                return string3;
            case 7:
                return ((JSONObject) obj).getJSONObject("album").getString("cover_medium");
            case 8:
                String string4 = ((JSONObject) obj).getString("link");
                if (string4.length() == 0) {
                    return null;
                }
                return string4;
            case 9:
                return ((JSONObject) obj).getString("cover_medium");
            case 10:
                return ((JSONObject) obj).getJSONArray("data");
            case 11:
                String string5 = ((JSONObject) obj).getString(PendingUpgradeStore.KEY_NAME);
                if (string5.length() == 0) {
                    return null;
                }
                return string5;
            case 12:
                String string6 = ((JSONObject) obj).getString("link");
                if (string6.length() == 0) {
                    return null;
                }
                return string6;
            case 13:
                return ((JSONObject) obj).getJSONArray("data");
            case 14:
                return ((JSONObject) obj).getString("picture_medium");
            case 15:
                String string7 = ((JSONObject) obj).getString("title");
                if (string7.length() == 0) {
                    return null;
                }
                return string7;
            case 16:
                String string8 = ((JSONObject) obj).getString("link");
                if (string8.length() == 0) {
                    return null;
                }
                return string8;
            case 17:
                return ((JSONObject) obj).getString("picture_medium");
            case 18:
                String[] strArr = j20.h.f68759f;
                return null;
            case 19:
                return ((JSONObject) obj).getJSONArray("data");
            case 20:
                String string9 = ((JSONObject) obj).getString("title");
                if (string9.length() == 0) {
                    return null;
                }
                return string9;
            case 21:
                int iOptInt = ((JSONObject) obj).optInt("id");
                if (iOptInt != 0) {
                    return b.c0.h(iOptInt, "https://deezer.com/track/");
                }
                return null;
            case 22:
                return ((JSONObject) obj).getJSONObject("album").getString("cover_medium");
            case 23:
                return EmptyList.f71733a;
            case 24:
                return Unit.f71706a;
            case 25:
                return Unit.f71706a;
            case 26:
                return Unit.f71706a;
            case 27:
                return SerializersCacheKt.SERIALIZERS_CACHE$lambda$0((KClass) obj);
            case 28:
                return SerializersCacheKt.SERIALIZERS_CACHE_NULLABLE$lambda$1((KClass) obj);
            default:
                return JsonElementSerializer.descriptor$lambda$5((ClassSerialDescriptorBuilder) obj);
        }
    }
}
