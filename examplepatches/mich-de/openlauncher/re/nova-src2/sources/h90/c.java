package h90;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import kotlin.collections.MapsKt;
import x80.e0;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final CopyOnWriteArraySet f59548a = new CopyOnWriteArraySet();

    /* renamed from: b, reason: collision with root package name */
    public static final Map f59549b;

    static {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Package r22 = e0.class.getPackage();
        String name = r22 != null ? r22.getName() : null;
        if (name != null) {
            linkedHashMap.put(name, "OkHttp");
        }
        linkedHashMap.put(e0.class.getName(), "okhttp.OkHttpClient");
        linkedHashMap.put(e90.e.class.getName(), "okhttp.Http2");
        linkedHashMap.put(a90.e.class.getName(), "okhttp.TaskRunner");
        linkedHashMap.put("okhttp3.mockwebserver.MockWebServer", "okhttp.MockWebServer");
        f59549b = MapsKt.s0(linkedHashMap);
    }
}
