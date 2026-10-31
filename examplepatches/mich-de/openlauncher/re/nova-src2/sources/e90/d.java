package e90;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.io.IOException;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final a[] f52311a;

    /* renamed from: b, reason: collision with root package name */
    public static final Map f52312b;

    static {
        a aVar = new a(a.f52286i, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        m90.j jVar = a.f52283f;
        a aVar2 = new a(jVar, "GET");
        a aVar3 = new a(jVar, "POST");
        m90.j jVar2 = a.f52284g;
        a aVar4 = new a(jVar2, "/");
        a aVar5 = new a(jVar2, "/index.html");
        m90.j jVar3 = a.f52285h;
        a aVar6 = new a(jVar3, "http");
        a aVar7 = new a(jVar3, "https");
        m90.j jVar4 = a.f52282e;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, new a(jVar4, "200"), new a(jVar4, "204"), new a(jVar4, "206"), new a(jVar4, "304"), new a(jVar4, "400"), new a(jVar4, "404"), new a(jVar4, "500"), new a("accept-charset", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("accept-encoding", "gzip, deflate"), new a("accept-language", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("accept-ranges", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("accept", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("access-control-allow-origin", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a(InneractiveMediationDefs.KEY_AGE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("allow", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("authorization", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("cache-control", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("content-disposition", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("content-encoding", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("content-language", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("content-length", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("content-location", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("content-range", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("content-type", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("cookie", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("date", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("etag", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("expect", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("expires", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("from", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("host", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("if-match", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("if-modified-since", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("if-none-match", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("if-range", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("if-unmodified-since", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("last-modified", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("link", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("location", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("max-forwards", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("proxy-authenticate", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("proxy-authorization", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("range", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("referer", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("refresh", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("retry-after", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("server", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("set-cookie", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("strict-transport-security", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("transfer-encoding", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("user-agent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("vary", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("via", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a("www-authenticate", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)};
        f52311a = aVarArr;
        LinkedHashMap linkedHashMap = new LinkedHashMap(61);
        for (int i5 = 0; i5 < 61; i5++) {
            if (!linkedHashMap.containsKey(aVarArr[i5].f52287a)) {
                linkedHashMap.put(aVarArr[i5].f52287a, Integer.valueOf(i5));
            }
        }
        Map mapUnmodifiableMap = Collections.unmodifiableMap(linkedHashMap);
        Intrinsics.f(mapUnmodifiableMap, "unmodifiableMap(result)");
        f52312b = mapUnmodifiableMap;
    }

    public static void a(m90.j name) throws IOException {
        Intrinsics.g(name, "name");
        int iC = name.c();
        for (int i5 = 0; i5 < iC; i5++) {
            byte bJ = name.j(i5);
            if (65 <= bJ && bJ < 91) {
                throw new IOException("PROTOCOL_ERROR response malformed: mixed case name: ".concat(name.r()));
            }
        }
    }
}
