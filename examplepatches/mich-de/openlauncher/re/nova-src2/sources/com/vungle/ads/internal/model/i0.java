package com.vungle.ads.internal.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.vungle.ads.AdConfig;
import com.vungle.ads.TpatError;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.text.Regex;
import kotlinx.serialization.ContextualSerializer;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.JsonElementBuildersKt;
import kotlinx.serialization.json.JsonObject;
import kotlinx.serialization.json.JsonObjectBuilder;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class i0 {

    @NotNull
    public static final p Companion = new p();

    /* renamed from: a, reason: collision with root package name */
    public final List f47045a;

    /* renamed from: b, reason: collision with root package name */
    public final w2 f47046b;

    /* renamed from: c, reason: collision with root package name */
    public Long f47047c;

    /* renamed from: d, reason: collision with root package name */
    public ConcurrentHashMap f47048d;

    /* renamed from: e, reason: collision with root package name */
    public Map f47049e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f47050f;

    /* renamed from: g, reason: collision with root package name */
    public AdConfig f47051g;

    /* renamed from: h, reason: collision with root package name */
    public com.vungle.ads.internal.util.s f47052h;

    /* renamed from: i, reason: collision with root package name */
    public String f47053i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f47054j;

    public /* synthetic */ i0(int i5, List list, w2 w2Var, Long l9, ConcurrentHashMap concurrentHashMap, Map map, boolean z11, String str) {
        if ((i5 & 1) == 0) {
            this.f47045a = null;
        } else {
            this.f47045a = list;
        }
        if ((i5 & 2) == 0) {
            this.f47046b = null;
        } else {
            this.f47046b = w2Var;
        }
        if ((i5 & 4) == 0) {
            this.f47047c = null;
        } else {
            this.f47047c = l9;
        }
        if ((i5 & 8) == 0) {
            this.f47048d = new ConcurrentHashMap();
        } else {
            this.f47048d = concurrentHashMap;
        }
        if ((i5 & 16) == 0) {
            this.f47049e = new HashMap();
        } else {
            this.f47049e = map;
        }
        if ((i5 & 32) == 0) {
            this.f47050f = false;
        } else {
            this.f47050f = z11;
        }
        this.f47051g = null;
        this.f47052h = null;
        if ((i5 & 64) == 0) {
            this.f47053i = null;
        } else {
            this.f47053i = str;
        }
        this.f47054j = new LinkedHashMap();
    }

    public static final void a(i0 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47045a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, new ArrayListSerializer(q.f47117a), self.f47045a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47046b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, v1.f47168a, self.f47046b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47047c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, LongSerializer.INSTANCE, self.f47047c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Intrinsics.b(self.f47048d, new ConcurrentHashMap())) {
            KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(ConcurrentHashMap.class);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            output.encodeSerializableElement(serialDesc, 3, new ContextualSerializer(orCreateKotlinClass, null, new KSerializer[]{stringSerializer, stringSerializer}), self.f47048d);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || !Intrinsics.b(self.f47049e, new HashMap())) {
            StringSerializer stringSerializer2 = StringSerializer.INSTANCE;
            output.encodeSerializableElement(serialDesc, 4, new LinkedHashMapSerializer(stringSerializer2, stringSerializer2), self.f47049e);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.f47050f) {
            output.encodeBooleanElement(serialDesc, 5, self.f47050f);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 6) && self.f47053i == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.f47053i);
    }

    public final boolean A() {
        return Intrinsics.b(G(), "native");
    }

    public final boolean B() {
        Boolean bool;
        i iVarK = k();
        return ((iVarK == null || (bool = iVarK.C) == null) ? false : bool.booleanValue()) && !A();
    }

    public final boolean C() {
        z zVar;
        c0 c0Var;
        Boolean bool;
        i iVarK = k();
        if (iVarK == null || (zVar = iVarK.f47037s) == null || (c0Var = zVar.f47202a) == null || (bool = c0Var.f46968a) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public final String D() {
        s sVarI = i();
        if (sVarI != null) {
            return sVarI.f47139a;
        }
        return null;
    }

    public final void E() {
        this.f47047c = Long.valueOf(System.currentTimeMillis());
    }

    public final void F() {
        this.f47050f = true;
    }

    public final String G() {
        i iVarK = k();
        if (iVarK != null) {
            return iVarK.f47038t;
        }
        return null;
    }

    public final boolean H() {
        i iVarK = k();
        return (iVarK != null ? Intrinsics.b(iVarK.l(), Boolean.TRUE) : false) && !A();
    }

    public final boolean b() {
        Boolean bool;
        i iVarK = k();
        if (iVarK == null || (bool = iVarK.f47028h) == null) {
            return true;
        }
        return bool.booleanValue();
    }

    public final i c() {
        return k();
    }

    public final int d() {
        f fVar;
        Integer num;
        i iVarK = k();
        if (iVarK == null || (fVar = iVarK.f47044z) == null || (num = fVar.f46999a) == null) {
            return 0;
        }
        return num.intValue();
    }

    public final String e() {
        i iVarK = k();
        if (iVarK != null) {
            return iVarK.f47041w;
        }
        return null;
    }

    public final w2 f() {
        return this.f47046b;
    }

    public final JsonObject g() {
        LinkedHashMap linkedHashMapS = s();
        JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
        for (Map.Entry entry : linkedHashMapS.entrySet()) {
            JsonElementBuildersKt.put(jsonObjectBuilder, (String) entry.getKey(), (String) entry.getValue());
        }
        return jsonObjectBuilder.build();
    }

    public final String h() {
        i iVarK = k();
        if (iVarK != null) {
            return iVarK.f47021a;
        }
        return null;
    }

    public final s i() {
        List list = this.f47045a;
        if (list == null || list.isEmpty()) {
            return null;
        }
        return (s) list.get(0);
    }

    public final AdConfig j() {
        return this.f47051g;
    }

    public final i k() {
        s sVarI = i();
        if (sVarI != null) {
            return sVarI.f47140b;
        }
        return null;
    }

    public final String l() {
        i iVarK = k();
        if (iVarK != null) {
            return iVarK.f47023c;
        }
        return null;
    }

    public final l m() {
        s sVarI = i();
        if (sVarI != null) {
            return sVarI.f47141c;
        }
        return null;
    }

    public final String n() {
        String str;
        i iVarK = k();
        return (iVarK == null || (str = iVarK.f47040v) == null) ? "unknown" : str;
    }

    public final String o() {
        v vVar;
        Map map;
        i iVarK = k();
        if (iVarK == null || (vVar = iVarK.f47039u) == null || (map = vVar.f47164a) == null) {
            return null;
        }
        return (String) map.get("OBSERVED_EXPERIMENTS");
    }

    public final String p() {
        return this.f47053i;
    }

    public final com.vungle.ads.internal.util.s q() {
        return this.f47052h;
    }

    public final List r() {
        l lVar;
        s sVarI = i();
        if (sVarI == null || (lVar = sVarI.f47141c) == null) {
            return null;
        }
        return lVar.f47078c;
    }

    public final LinkedHashMap s() {
        v vVar;
        Map map;
        v vVar2;
        Map map2;
        i iVarK = k();
        if ((iVarK != null ? iVarK.f47039u : null) == null) {
            throw new IllegalArgumentException("Advertisement does not have MRAID Arguments!");
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        i iVarK2 = k();
        if (iVarK2 != null && (vVar2 = iVarK2.f47039u) != null && (map2 = vVar2.f47164a) != null) {
            linkedHashMap.putAll(map2);
        }
        i iVarK3 = k();
        if (iVarK3 != null && (vVar = iVarK3.f47039u) != null && (map = vVar.f47165b) != null) {
            for (Map.Entry entry : map.entrySet()) {
                String str = ((o) entry.getValue()).f47102a;
                if (str != null) {
                    linkedHashMap.put(entry.getKey(), str);
                }
            }
        }
        if (!this.f47048d.isEmpty()) {
            linkedHashMap.putAll(this.f47048d);
        }
        if (!this.f47049e.isEmpty()) {
            linkedHashMap.putAll(this.f47049e);
        }
        return linkedHashMap;
    }

    public final String t() {
        i iVarK = k();
        if (iVarK != null) {
            return iVarK.f47029i;
        }
        return null;
    }

    public final String u() {
        i iVarK = k();
        if (iVarK != null) {
            return iVarK.o;
        }
        return null;
    }

    public final f0 v() {
        i iVarK = k();
        if (iVarK != null) {
            return iVarK.A;
        }
        return null;
    }

    public final List w() {
        l lVar;
        s sVarI = i();
        if (sVarI == null || (lVar = sVarI.f47141c) == null) {
            return null;
        }
        return lVar.f47077b;
    }

    public final boolean x() {
        i iVarK = k();
        if (iVarK == null) {
            return false;
        }
        Long l9 = this.f47047c;
        if (iVarK.f47025e != null && l9 != null) {
            if ((System.currentTimeMillis() - l9.longValue()) / 1000 > (iVarK.f47025e != null ? Long.valueOf(r0.intValue()) : null).longValue()) {
                return true;
            }
        } else if (iVarK.f47024d != null) {
            if (System.currentTimeMillis() / 1000 > (iVarK.f47024d != null ? Long.valueOf(r0.intValue()) : null).longValue()) {
                return true;
            }
        }
        return false;
    }

    public final boolean y() {
        v vVarJ;
        Map mapB;
        String str;
        i iVarK = k();
        return (iVarK == null || (vVarJ = iVarK.j()) == null || (mapB = vVarJ.b()) == null || (str = (String) mapB.get("AD_PODDING")) == null || !str.equalsIgnoreCase(InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) ? false : true;
    }

    public final boolean z() {
        Boolean bool;
        i iVarK = k();
        if (iVarK == null || (bool = iVarK.f47027g) == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public final boolean b(String failingUrl) {
        v vVarJ;
        Map mapA;
        Intrinsics.g(failingUrl, "failingUrl");
        if (!A()) {
            i iVarK = k();
            if (Intrinsics.b(iVarK != null ? iVarK.m() : null, failingUrl)) {
                return true;
            }
        }
        i iVarK2 = k();
        if (iVarK2 == null || (vVarJ = iVarK2.j()) == null || (mapA = vVarJ.a()) == null) {
            return false;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : mapA.entrySet()) {
            if (Intrinsics.b(((o) entry.getValue()).c(), failingUrl)) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return !linkedHashMap.isEmpty();
    }

    public final int a() {
        f fVar;
        Integer num;
        i iVarK = k();
        if (iVarK == null || (fVar = iVarK.f47044z) == null || (num = fVar.f47000b) == null) {
            return 0;
        }
        return num.intValue();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final List b(String event, String str, String str2) {
        Map mapK;
        Map mapK2;
        Intrinsics.g(event, "event");
        i iVarK = k();
        if (iVarK != null && (mapK2 = iVarK.k()) != null && !mapK2.containsKey(event)) {
            new TpatError(Sdk.SDKError.Reason.INVALID_TPAT_KEY, com.iab.omid.library.vungle.d.a("Arbitrary tpat key: ", event)).setLogEntry$vungle_ads_release(this.f47052h).logErrorNoReturnValue$vungle_ads_release();
            return null;
        }
        i iVarK2 = k();
        List list = (iVarK2 == null || (mapK = iVarK2.k()) == null) ? null : (List) mapK.get(event);
        if (list != null && !list.isEmpty()) {
            switch (event.hashCode()) {
                case -2125915830:
                    if (event.equals("checkpoint.0")) {
                        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                        Iterator it = list.iterator();
                        while (it.hasNext()) {
                            arrayList.add(a(a(a((String) it.next(), "{{{remote_play}}}", String.valueOf(!this.f47050f)), "{{{carrier}}}", str), "{{{vol}}}", str2));
                        }
                        return arrayList;
                    }
                    return list;
                case -747709511:
                    if (event.equals("video.length")) {
                        ArrayList arrayList2 = new ArrayList(b70.c.u0(list, 10));
                        Iterator it2 = list.iterator();
                        while (it2.hasNext()) {
                            arrayList2.add(a((String) it2.next(), "{{{vlen}}}", str));
                        }
                        return arrayList2;
                    }
                    return list;
                case -132489083:
                    if (event.equals("ad.loadDuration")) {
                        ArrayList arrayList3 = new ArrayList(b70.c.u0(list, 10));
                        Iterator it3 = list.iterator();
                        while (it3.hasNext()) {
                            arrayList3.add(a((String) it3.next(), "{{{time_dl}}}", str));
                        }
                        return arrayList3;
                    }
                    return list;
                case 1516630125:
                    if (event.equals("ad.close")) {
                        ArrayList arrayList4 = new ArrayList(b70.c.u0(list, 10));
                        Iterator it4 = list.iterator();
                        while (it4.hasNext()) {
                            arrayList4.add(a(a((String) it4.next(), "{{{dur}}}", str), "{{{vol}}}", str2));
                        }
                        return arrayList4;
                    }
                    return list;
                case 1940309120:
                    if (event.equals("deeplink.click")) {
                        ArrayList arrayList5 = new ArrayList(b70.c.u0(list, 10));
                        Iterator it5 = list.iterator();
                        while (it5.hasNext()) {
                            arrayList5.add(a((String) it5.next(), "{{{is_success}}}", str));
                        }
                        return arrayList5;
                    }
                    return list;
                default:
                    return list;
            }
        }
        new TpatError(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR, com.iab.omid.library.vungle.d.a("Empty tpat key: ", event)).setLogEntry$vungle_ads_release(this.f47052h).logErrorNoReturnValue$vungle_ads_release();
        return null;
    }

    public final void a(AdConfig adConfig) {
        this.f47051g = adConfig;
    }

    public final void a(com.vungle.ads.internal.util.s sVar) {
        this.f47052h = sVar;
    }

    public final b a(String remoteUrl) {
        Intrinsics.g(remoteUrl, "remoteUrl");
        return (b) this.f47054j.get(remoteUrl);
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0093  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ArrayList a(File dir) {
        Pair pair;
        v vVarJ;
        Map mapA;
        Pair pair2;
        i iVarK;
        String strM;
        String strA;
        File parentFile;
        Intrinsics.g(dir, "dir");
        ArrayList arrayList = new ArrayList();
        if (!A() && (iVarK = k()) != null && (strM = iVarK.m()) != null) {
            String str = com.vungle.ads.internal.util.n.a(strM) ? strM : null;
            if (str == null) {
                pair = null;
            } else {
                try {
                    int i5 = Result.f71687b;
                    String path = new URI(str).getPath();
                    Intrinsics.f(path, "URI(url).path");
                    List listH1 = r70.k.h1(r70.k.v1(path, '/'), new char[]{'/'}, 6);
                    strA = listH1.size() >= 2 ? b70.g.f1(b70.g.F1(2, listH1), "_", null, null, 0, null, 62) : "index.html";
                } catch (Throwable th2) {
                    int i11 = Result.f71687b;
                    strA = ResultKt.a(th2);
                }
                if (strA instanceof Result.Failure) {
                    strA = null;
                }
                String str2 = (String) strA;
                if (str2 != null && (parentFile = dir.getParentFile()) != null) {
                    pair = new Pair(str, new File(parentFile, str2));
                }
            }
        }
        if (pair != null) {
            String str3 = (String) pair.f71683a;
            File file = (File) pair.f71684b;
            this.f47053i = file.getAbsolutePath();
            if (!file.exists()) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("AdPayload", "No cacheable index file found, creating new one: " + file);
                String absolutePath = file.getAbsolutePath();
                Intrinsics.f(absolutePath, "indexFile.absolutePath");
                arrayList.add(new b(str3, absolutePath));
            }
        }
        i iVarK2 = k();
        if (iVarK2 != null && (vVarJ = iVarK2.j()) != null && (mapA = vVarJ.a()) != null) {
            for (Map.Entry entry : mapA.entrySet()) {
                String str4 = (String) entry.getKey();
                o oVar = (o) entry.getValue();
                String strC = oVar.c();
                if (strC != null && com.vungle.ads.internal.util.n.a(strC)) {
                    String filePath = new File(dir, com.vungle.ads.internal.util.n.a(strC, oVar.b())).getAbsolutePath();
                    Integer numA = oVar.a();
                    if (!A() && b()) {
                        if (!B()) {
                            pair2 = new Pair(Boolean.FALSE, null);
                        } else {
                            pair2 = new Pair(Boolean.TRUE, Integer.valueOf(Math.max(0, numA != null ? numA.intValue() : 0)));
                        }
                    } else {
                        pair2 = new Pair(Boolean.TRUE, null);
                    }
                    boolean zBooleanValue = ((Boolean) pair2.f71683a).booleanValue();
                    Integer num = (Integer) pair2.f71684b;
                    Intrinsics.f(filePath, "filePath");
                    b bVar = new b(str4, strC, filePath, zBooleanValue, num);
                    String strB = oVar.b();
                    if (strB != null) {
                        bVar.a(strB);
                    }
                    arrayList.add(bVar);
                    if (zBooleanValue && num != null) {
                        this.f47054j.put(strC, bVar);
                    }
                }
            }
        }
        if (arrayList.size() > 1) {
            b70.c.y0(arrayList, new h0());
        }
        return arrayList;
    }

    public static /* synthetic */ List a(i0 i0Var, String str, String str2, int i5) {
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        return i0Var.b(str, str2, null);
    }

    public final void a(String title, String body, String keepWatching, String close) {
        Intrinsics.g(title, "title");
        Intrinsics.g(body, "body");
        Intrinsics.g(keepWatching, "keepWatching");
        Intrinsics.g(close, "close");
        if (title.length() > 0) {
            this.f47049e.put("INCENTIVIZED_TITLE_TEXT", title);
        }
        if (body.length() > 0) {
            this.f47049e.put("INCENTIVIZED_BODY_TEXT", body);
        }
        if (keepWatching.length() > 0) {
            this.f47049e.put("INCENTIVIZED_CONTINUE_TEXT", keepWatching);
        }
        if (close.length() > 0) {
            this.f47049e.put("INCENTIVIZED_CLOSE_TEXT", close);
        }
    }

    public final int a(Boolean bool) {
        Integer numG;
        int iIntValue;
        Integer numH;
        if (Intrinsics.b(bool, Boolean.TRUE)) {
            i iVarK = k();
            if (iVarK == null || (numH = iVarK.h()) == null) {
                return 0;
            }
            iIntValue = numH.intValue();
        } else {
            i iVarK2 = k();
            if (iVarK2 == null || (numG = iVarK2.g()) == null) {
                return 0;
            }
            iIntValue = numG.intValue();
        }
        return iIntValue * 1000;
    }

    public static String a(String str, String str2, String str3) {
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String strQuote = Pattern.quote(str2);
        Intrinsics.f(strQuote, "quote(oldValue)");
        return new Regex(strQuote).g(str, new g0(str3));
    }

    public final synchronized void a(File localFile, String adIdentifier) {
        Intrinsics.g(adIdentifier, "adIdentifier");
        Intrinsics.g(localFile, "localFile");
        if (localFile.exists()) {
            ConcurrentHashMap concurrentHashMap = this.f47048d;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("file://");
            sbA.append(localFile.getAbsolutePath());
            concurrentHashMap.put(adIdentifier, sbA.toString());
        }
    }
}
