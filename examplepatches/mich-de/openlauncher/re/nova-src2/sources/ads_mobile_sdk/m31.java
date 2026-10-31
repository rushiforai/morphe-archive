package ads_mobile_sdk;

import b.t2;
import java.util.Map;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class m31 {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f6999b = {t2.C(m31.class, "impressionData", "getImpressionData()Ljava/util/Map;")};

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.e3 f7000a = new io.sentry.e3((Boolean) null);

    public final String a() {
        KProperty[] kPropertyArr = f6999b;
        KProperty kProperty = kPropertyArr[0];
        io.sentry.e3 e3Var = this.f7000a;
        Map map = (Map) e3Var.getValue(this, kProperty);
        Object obj = map != null ? map.get("targetAppId") : null;
        String str = obj instanceof String ? (String) obj : null;
        if (str != null) {
            return str;
        }
        Map map2 = (Map) e3Var.getValue(this, kPropertyArr[0]);
        Object obj2 = map2 != null ? map2.get("targetPackageName") : null;
        if (obj2 instanceof String) {
            return (String) obj2;
        }
        return null;
    }
}
