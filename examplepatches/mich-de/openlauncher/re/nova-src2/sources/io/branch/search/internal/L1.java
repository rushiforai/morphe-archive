package io.branch.search.internal;

import android.content.ComponentName;
import android.content.Context;
import android.os.UserHandle;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.gson.Gson;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import io.branch.engage.sesame_lite.internal.IdHash;
import io.branch.search.internal.C4;
import io.branch.search.internal.D6;
import io.branch.search.internal.EnumC3075b4;
import io.branch.search.internal.P1;
import io.branch.search.internal.util.CorosKt;
import io.branch.search.ui.Impressable;
import io.branch.search.ui.ImpressionInfo;
import io.branch.search.ui.LauncherActivity;
import io.branch.search.ui.UiContext;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class L1 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f62813a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3492zf f62814b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3223k0 f62815c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final InterfaceC3257m0 f62816d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final H f62817e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3240l0 f62818f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Y5 f62819g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final M4 f62820h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final P1 f62821i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final C3282n8 f62822j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final I0 f62823k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final C3139f0 f62824l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final V f62825m;

    @NotNull
    public final C3356rf n;

    @NotNull
    public final Hd o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final V5 f62826p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public final E8 f62827q;

    public static final class a {
    }

    public interface b {
        void a(@NotNull Gd gd2, @NotNull U5 u5);
    }

    public static final class c implements b {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ JSONObject f62829b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f62830c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ String f62831d;

        public static final class a extends Lambda implements Function2<Boolean, J2, Unit> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ L1 f62832a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ String f62833b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(L1 l12, String str) {
                super(2);
                this.f62832a = l12;
                this.f62833b = str;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                String str;
                Throwable th2;
                J2 j22 = (J2) obj2;
                if (!((Boolean) obj).booleanValue()) {
                    if (j22 != null) {
                        str = "Analytics post failure error(" + j22.f62698a + ')' + j22.f62699b;
                        th2 = j22.f62700c;
                    } else {
                        str = "Analytics post failure";
                        th2 = null;
                    }
                    this.f62832a.f62817e.a(this.f62833b, str, th2);
                }
                return Unit.f71706a;
            }
        }

        public c(JSONObject jSONObject, String str, String str2) {
            this.f62829b = jSONObject;
            this.f62830c = str;
            this.f62831d = str2;
        }

        @Override // io.branch.search.internal.L1.b
        public final void a(@NotNull Gd sessionData, @NotNull U5 collector) throws JSONException {
            JSONObject jSONObject;
            JSONObject jSONObject2;
            JSONObject jSONObject3;
            JSONObject jSONObject4;
            JSONObject jSONObject5;
            V5 v52;
            String str;
            JSONObject jSONObject6;
            JSONObject jSONObject7;
            JSONObject jSONObject8;
            JSONObject jSONObject9;
            JSONObject jSONObject10;
            String str2 = "sessionData";
            Intrinsics.g(sessionData, "sessionData");
            Intrinsics.g(collector, "collector");
            V5 v53 = L1.this.f62826p;
            v53.getClass();
            N4 n42 = collector.f63426c;
            if (n42 != null) {
                v53.f63497c.getClass();
                JSONObject jSONObject11 = new JSONObject();
                List<G6> list = n42.f62969a;
                JSONArray jSONArray = new JSONArray();
                for (G6 model : list) {
                    Intrinsics.g(model, "model");
                    JSONObject jSONObject12 = new JSONObject();
                    jSONObject12.put(Plan.AMP_PLAN_SOURCE, model.f62514a);
                    jSONObject12.put(PglCryptUtils.KEY_MESSAGE, model.f62515b);
                    jSONObject12.put("timestamp", model.f62516c);
                    if (!model.f62517d.isEmpty()) {
                        Map<String, String> map = model.f62517d;
                        Intrinsics.e(map, "null cannot be cast to non-null type kotlin.collections.Map<kotlin.Any, kotlin.Any>");
                        jSONObject12.put("extras", new JSONObject(map));
                    }
                    jSONArray.put(jSONObject12);
                }
                jSONObject11.put("failures", jSONArray);
                jSONObject = jSONObject11;
            } else {
                jSONObject = new JSONObject();
            }
            C3127e5 c3127e5 = collector.f63427d;
            if (c3127e5 != null) {
                v53.f63498d.getClass();
                jSONObject2 = C3144f5.a(c3127e5);
            } else {
                jSONObject2 = new JSONObject();
            }
            JSONObject jSONObjectA = C3199i9.a(jSONObject, jSONObject2);
            C3245l5 c3245l5 = collector.f63428e;
            if (c3245l5 != null) {
                v53.f63499e.getClass();
                jSONObject3 = new JSONObject();
                JSONArray jSONArray2 = new JSONArray();
                jSONArray2.put(Bb.a(c3245l5.f64959a));
                Unit unit = Unit.f71706a;
                jSONObject3.put("database_versions", jSONArray2);
            } else {
                jSONObject3 = new JSONObject();
            }
            JSONObject jSONObjectA2 = C3199i9.a(jSONObjectA, jSONObject3);
            Vd vd2 = collector.f63429f;
            if (vd2 != null) {
                v53.f63500f.getClass();
                jSONObject4 = new JSONObject();
                if (!vd2.f63543a.isEmpty()) {
                    List<Xd> list2 = vd2.f63543a;
                    ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
                    for (Xd xd : list2) {
                        JSONObject jSONObject13 = new JSONObject();
                        jSONObject13.putOpt(PendingUpgradeStore.KEY_NAME, xd.f63673a);
                        jSONObject13.putOpt("full_name", xd.f63674b);
                        jSONObject13.putOpt("bytes", Long.valueOf(xd.f63675c));
                        arrayList.add(jSONObject13);
                    }
                    JSONArray jSONArray3 = new JSONArray();
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        jSONArray3.put((JSONObject) it.next());
                    }
                    jSONObject4.putOpt("shared_prefs", jSONArray3);
                }
            } else {
                jSONObject4 = new JSONObject();
            }
            JSONObject jSONObjectA3 = C3199i9.a(jSONObjectA2, jSONObject4);
            F7 f72 = collector.f63430g;
            if (f72 != null) {
                v53.f63501g.getClass();
                Set<Map.Entry<String, P3>> setEntrySet = f72.f62451a.entrySet();
                jSONObject5 = new JSONObject();
                Iterator<T> it2 = setEntrySet.iterator();
                while (it2.hasNext()) {
                    Map.Entry entry = (Map.Entry) it2.next();
                    String str3 = (String) entry.getKey();
                    P3 model2 = (P3) entry.getValue();
                    Intrinsics.g(model2, "model");
                    JSONObject jSONObject14 = new JSONObject();
                    jSONObject14.put("files", model2.f63063a);
                    jSONObject14.put("total_size", model2.f63064b);
                    jSONObject5.put(str3, jSONObject14);
                }
            } else {
                jSONObject5 = new JSONObject();
            }
            JSONObject jSONObjectA4 = C3199i9.a(jSONObjectA3, jSONObject5);
            C3435w9 c3435w9 = collector.f63431h;
            if (c3435w9 != null) {
                v53.f63502h.getClass();
                JSONObject jSONObject15 = new JSONObject();
                jSONObject15.put("interval", c3435w9.f66225a);
                C3384t9 model3 = c3435w9.f66226b;
                Intrinsics.g(model3, "model");
                JSONObject jSONObject16 = new JSONObject();
                Map<String, C9> map2 = model3.f65871a;
                ArrayList arrayList2 = new ArrayList(map2.size());
                for (Map.Entry<String, C9> entry2 : map2.entrySet()) {
                    String key = entry2.getKey();
                    C9 model4 = entry2.getValue();
                    Intrinsics.g(model4, "model");
                    JSONObject jSONObject17 = new JSONObject();
                    JSONObject jSONObject18 = jSONObject15;
                    jSONObject17.put("rxb", model4.f62303a);
                    jSONObject17.put("txb", model4.f62304b);
                    jSONObject17.put("rxp", model4.f62305c);
                    jSONObject17.put("txp", model4.f62306d);
                    arrayList2.add(new Pair(key, jSONObject17));
                    str2 = str2;
                    v53 = v53;
                    jSONObject15 = jSONObject18;
                }
                v52 = v53;
                JSONObject jSONObject19 = jSONObject15;
                str = str2;
                Iterator it3 = arrayList2.iterator();
                while (it3.hasNext()) {
                    Pair pair = (Pair) it3.next();
                    jSONObject16.put((String) pair.f71683a, (JSONObject) pair.f71684b);
                }
                List<C3417v8> list3 = model3.f65872b;
                ArrayList arrayList3 = new ArrayList(b70.c.u0(list3, 10));
                for (C3417v8 c3417v8 : list3) {
                    C3383t8 c3383t8 = c3417v8.f66175a;
                    Intrinsics.g(c3383t8, "<this>");
                    Object value = S4.f63334a.getValue();
                    Intrinsics.f(value, "<get-gson>(...)");
                    String json = ((Gson) value).toJson(c3383t8);
                    Intrinsics.f(json, "gson.toJson(this)");
                    JSONObject jSONObject20 = new JSONObject(json);
                    jSONObject20.put("bytes_remaining", c3417v8.f66176b);
                    arrayList3.add(jSONObject20);
                }
                JSONArray jSONArray4 = new JSONArray();
                Iterator it4 = arrayList3.iterator();
                while (it4.hasNext()) {
                    jSONArray4.put((JSONObject) it4.next());
                }
                jSONObject16.put("network_capping_rules", jSONArray4);
                jSONObject19.put("networks", jSONObject16);
                jSONObject6 = jSONObject19;
            } else {
                v52 = v53;
                str = "sessionData";
                jSONObject6 = new JSONObject();
            }
            JSONObject jSONObjectA5 = C3199i9.a(jSONObjectA4, jSONObject6);
            C3404uc c3404uc = collector.f63432i;
            if (c3404uc != null) {
                v52.f63503i.getClass();
                jSONObject7 = new JSONObject();
                JSONObject jSONObject21 = new JSONObject();
                jSONObject21.put("ssml_version_name", c3404uc.f66023a);
                jSONObject21.put("ssml_built_on", c3404uc.f66024b);
                jSONObject21.put("ssml_size_on_disk", c3404uc.f66025c);
                jSONObject21.put("ssml_shortcut_row_count", c3404uc.f66026d);
                jSONObject21.put("ssml_alias_row_count", c3404uc.f66027e);
                jSONObject21.put("ssml_last_update_time", c3404uc.f66028f);
                jSONObject21.put("ssml_search_timings", c3404uc.f66029g);
                jSONObject7.put("ssml", jSONObject21);
            } else {
                jSONObject7 = new JSONObject();
            }
            JSONObject jSONObjectA6 = C3199i9.a(jSONObjectA5, jSONObject7);
            M6 m62 = collector.f63433j;
            if (m62 != null) {
                v52.f63504j.getClass();
                jSONObject8 = L6.a(m62);
            } else {
                jSONObject8 = new JSONObject();
            }
            JSONObject jSONObjectA7 = C3199i9.a(jSONObjectA6, jSONObject8);
            JSONObject jSONObject22 = new JSONObject();
            P5 p52 = collector.f63424a;
            if (p52 != null) {
                v52.f63495a.getClass();
                jSONObject9 = Q5.a(p52);
            } else {
                jSONObject9 = new JSONObject();
            }
            jSONObject22.put("device_info", jSONObject9);
            JSONObject jSONObjectA8 = C3199i9.a(jSONObjectA7, jSONObject22);
            JSONObject jSONObject23 = new JSONObject();
            C3278n4 c3278n4 = collector.f63425b;
            if (c3278n4 != null) {
                v52.f63496b.getClass();
                jSONObject10 = C3295o4.a(c3278n4);
            } else {
                jSONObject10 = new JSONObject();
            }
            jSONObject23.put("config_info", jSONObject10);
            JSONObject diagnosticData = C3199i9.a(jSONObjectA8, jSONObject23);
            L1.this.f62821i.getClass();
            Boolean bool = C3308p0.f65464a;
            Intrinsics.f(bool, "AnalyticsUtil.doExportAnalyticsPayload");
            if (bool.booleanValue()) {
                Context context = L1.this.f62813a;
            }
            L1 l12 = L1.this;
            V v11 = l12.f62825m;
            String sessionIdCopy = this.f62830c;
            JSONObject jSONObject24 = this.f62829b;
            a aVar = new a(l12, sessionIdCopy);
            v11.getClass();
            Intrinsics.g(sessionIdCopy, "sessionIdCopy");
            Intrinsics.g(jSONObject24, str);
            Intrinsics.g(diagnosticData, "diagnosticData");
            t70.m0.t(CorosKt.getBNCScope(), a80.d.f488c, null, new U(v11, sessionIdCopy, jSONObject24, diagnosticData, aVar, null), 2);
            L1.this.f62815c.a(this.f62831d, this.f62830c);
        }
    }

    public L1(@NotNull Context context, @NotNull C3492zf versionAnalyticsManager, @NotNull C3223k0 analyticsSessionHistoryDataSource, @NotNull C3291o0 analyticsStateRepository, @NotNull I analyticalBufferRepository, @NotNull C3240l0 analyticsSessionRepository, @NotNull Y5 diagnosticDataSource, @NotNull M4 crashHelper, @NotNull P1 branchConfiguration, @NotNull C3282n8 remoteConfiguration, @NotNull I0 appUsageMonitor, @NotNull C3139f0 analyticsRepository, @NotNull V analyticsDataSource, @NotNull C3356rf userHandleRepository) {
        Intrinsics.g(context, "context");
        Intrinsics.g(versionAnalyticsManager, "versionAnalyticsManager");
        Intrinsics.g(analyticsSessionHistoryDataSource, "analyticsSessionHistoryDataSource");
        Intrinsics.g(analyticsStateRepository, "analyticsStateRepository");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        Intrinsics.g(diagnosticDataSource, "diagnosticDataSource");
        Intrinsics.g(crashHelper, "crashHelper");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfiguration, "remoteConfiguration");
        Intrinsics.g(appUsageMonitor, "appUsageMonitor");
        Intrinsics.g(analyticsRepository, "analyticsRepository");
        Intrinsics.g(analyticsDataSource, "analyticsDataSource");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        this.f62813a = context;
        this.f62814b = versionAnalyticsManager;
        this.f62815c = analyticsSessionHistoryDataSource;
        this.f62816d = analyticsStateRepository;
        this.f62817e = analyticalBufferRepository;
        this.f62818f = analyticsSessionRepository;
        this.f62819g = diagnosticDataSource;
        this.f62820h = crashHelper;
        this.f62821i = branchConfiguration;
        this.f62822j = remoteConfiguration;
        this.f62823k = appUsageMonitor;
        this.f62824l = analyticsRepository;
        this.f62825m = analyticsDataSource;
        this.n = userHandleRepository;
        this.o = new Hd(userHandleRepository);
        this.f62826p = new V5();
        this.f62827q = new E8(new M1(this));
    }

    /* JADX WARN: Type inference failed for: r9v5, types: [boolean, int] */
    public final void a(@NotNull String sessionId, @NotNull C4.i.d impressions) throws JSONException {
        C3190i0 c3190i0;
        ReentrantLock reentrantLock;
        EnumC3075b4 enumC3075b4;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(impressions, "impressions");
        C3308p0.a("Closing session ".concat(sessionId));
        if (this.f62817e.a()) {
            boolean z11 = impressions.f62248a.isEmpty() && impressions.f62249b.isEmpty();
            if (a(sessionId, z11)) {
                b(sessionId, impressions);
            } else {
                C3309p1.a("Skipping onClose of session");
            }
            if (this.f62817e.f(sessionId) && z11) {
                C3350r9<JSONObject> trackedAnalytics = this.f62817e.b(sessionId);
                Intrinsics.g(trackedAnalytics, "trackedAnalytics");
                ConcurrentHashMap concurrentHashMapC = trackedAnalytics.c();
                try {
                    if (!concurrentHashMapC.isEmpty()) {
                        ?? ContainsKey = concurrentHashMapC.containsKey("api_calls");
                        int i5 = ContainsKey;
                        if (concurrentHashMapC.containsKey("failures")) {
                            i5 = ContainsKey + 1;
                        }
                        if (concurrentHashMapC.size() > i5) {
                            trackedAnalytics.f65625i.clear();
                        } else {
                            Collection collection = (Collection) concurrentHashMapC.get("api_calls");
                            if (collection != null) {
                                Iterator it = collection.iterator();
                                while (it.hasNext()) {
                                    String apiType = ((JSONObject) it.next()).optString("channel");
                                    EnumC3075b4.a aVar = EnumC3075b4.Companion;
                                    Intrinsics.f(apiType, "apiType");
                                    aVar.getClass();
                                    EnumC3075b4[] enumC3075b4ArrValues = EnumC3075b4.values();
                                    int length = enumC3075b4ArrValues.length;
                                    int i11 = 0;
                                    while (true) {
                                        if (i11 >= length) {
                                            enumC3075b4 = null;
                                            break;
                                        }
                                        enumC3075b4 = enumC3075b4ArrValues[i11];
                                        if (Intrinsics.b(enumC3075b4.toString(), apiType)) {
                                            break;
                                        } else {
                                            i11++;
                                        }
                                    }
                                    if (enumC3075b4 == null) {
                                        enumC3075b4 = EnumC3075b4.C;
                                    }
                                    if (enumC3075b4.f64011e) {
                                        trackedAnalytics.f65625i.clear();
                                    }
                                }
                            }
                        }
                        C3240l0 c3240l0 = this.f62818f;
                        c3240l0.getClass();
                        C3190i0 c3190i02 = c3240l0.f64939d;
                        c3190i02.getClass();
                        c3190i02.f64695b.lock();
                        c3190i02.c(sessionId).f62475c = 0;
                        Unit unit = Unit.f71706a;
                        this.f62817e.a(sessionId, !a(sessionId, z11));
                    }
                    c3190i0.c(sessionId).f62475c++;
                    Unit unit2 = Unit.f71706a;
                    reentrantLock.unlock();
                    this.f62817e.a(sessionId, !a(sessionId, z11));
                } finally {
                }
                trackedAnalytics.f65625i.clear();
                C3240l0 c3240l02 = this.f62818f;
                c3240l02.getClass();
                c3190i0 = c3240l02.f64939d;
                c3190i0.getClass();
                reentrantLock = c3190i0.f64695b;
                reentrantLock.lock();
            } else {
                C3240l0 c3240l03 = this.f62818f;
                c3240l03.getClass();
                C3190i0 c3190i022 = c3240l03.f64939d;
                c3190i022.getClass();
                c3190i022.f64695b.lock();
                try {
                    c3190i022.c(sessionId).f62475c = 0;
                    Unit unit3 = Unit.f71706a;
                    this.f62817e.a(sessionId, !a(sessionId, z11));
                } finally {
                }
            }
        } else {
            C3309p1.a("Skipping onClose of session");
            this.f62817e.a(sessionId, false);
        }
        C3240l0 c3240l04 = this.f62818f;
        c3240l04.getClass();
        String callerId = c3240l04.f64939d.c(sessionId).f62473a;
        this.f62818f.a(sessionId);
        C3139f0 c3139f0 = this.f62824l;
        C3356rf userHandleDataSource = this.n;
        Intrinsics.g(userHandleDataSource, "userHandleDataSource");
        Intrinsics.g(callerId, "callerId");
        List<C4.i.a> list = impressions.f62248a;
        ArrayList arrayList = new ArrayList();
        Iterator<T> it2 = list.iterator();
        while (true) {
            int i12 = 10;
            if (!it2.hasNext()) {
                break;
            }
            List<C4.i.c> list2 = ((C4.i.a) it2.next()).f62231b;
            ArrayList arrayList2 = new ArrayList();
            for (C4.i.c cVar : list2) {
                List<C4.i.b> list3 = cVar.f62244j;
                ArrayList arrayList3 = new ArrayList(b70.c.u0(list3, i12));
                for (C4.i.b bVar : list3) {
                    ArrayList arrayList4 = arrayList3;
                    arrayList4.add(new C3103cf(cVar.f62235a, cVar.f62237c, cVar.f62236b, bVar.f62232a, bVar.f62233b, bVar.f62234c, sessionId, callerId, false));
                    arrayList3 = arrayList4;
                    arrayList = arrayList;
                    arrayList2 = arrayList2;
                    cVar = cVar;
                    c3139f0 = c3139f0;
                    userHandleDataSource = userHandleDataSource;
                    i12 = 10;
                }
                b70.d.z0(arrayList3, arrayList2);
                c3139f0 = c3139f0;
                i12 = 10;
            }
            b70.d.z0(arrayList2, arrayList);
            c3139f0 = c3139f0;
        }
        C3356rf c3356rf = userHandleDataSource;
        ArrayList arrayList5 = arrayList;
        C3139f0 c3139f02 = c3139f0;
        List<ImpressionInfo> list4 = impressions.f62249b;
        ArrayList arrayList6 = new ArrayList(b70.c.u0(list4, 10));
        for (ImpressionInfo impressionInfo : list4) {
            Impressable impressable = impressionInfo.f66488a;
            Intrinsics.e(impressable, "null cannot be cast to non-null type io.branch.search.ui.LauncherActivity");
            LauncherActivity launcherActivity = (LauncherActivity) impressable;
            ComponentName componentName = launcherActivity.f66494b;
            IdHash.Companion companion = IdHash.INSTANCE;
            String packageName = componentName.getPackageName();
            Intrinsics.f(packageName, "item.componentName.packageName");
            String className = componentName.getClassName();
            Intrinsics.f(className, "item.componentName.className");
            UserHandle userHandle = launcherActivity.f66495c;
            Intrinsics.g(userHandle, "userHandle");
            C3356rf c3356rf2 = c3356rf;
            Long userHandleId = c3356rf2.f65680a.getUserHandleId(userHandle);
            arrayList6.add(new C3103cf(sessionId, -1, companion.ofAppComponent(packageName, className, userHandleId != null ? userHandleId.longValue() : 0L).toString(), impressionInfo.f66490c, impressionInfo.f66491d, impressionInfo.f66492e, null, callerId, true));
            c3356rf = c3356rf2;
        }
        ArrayList arrayListT1 = b70.g.t1(arrayList6, arrayList5);
        c3139f02.getClass();
        c3139f02.f64449a.getClass();
        t70.m0.t(c3139f02.f64452d, null, null, new C3122e0(c3139f02, arrayListT1, null), 3);
    }

    @NotNull
    public final I0 b() {
        return this.f62823k;
    }

    public final void b(String str, C4.i.d dVar) throws JSONException {
        String str2;
        String str3;
        String str4;
        Gd gdA = this.f62818f.a(str, dVar);
        String str5 = gdA.f62537f;
        Hd hd2 = this.o;
        hd2.getClass();
        JSONObject jSONObject = new JSONObject();
        jSONObject.putOpt("timestamp", Long.valueOf(gdA.f62532a));
        jSONObject.putOpt("branch_key", gdA.f62533b);
        jSONObject.putOpt("detailed_analytics", Boolean.valueOf(gdA.f62534c));
        jSONObject.putOpt("client_type", gdA.f62535d);
        jSONObject.putOpt("caller_id", gdA.f62536e);
        String str6 = "analytics_window_id";
        jSONObject.putOpt("analytics_window_id", gdA.f62537f);
        jSONObject.putOpt("empty_sessions", Integer.valueOf(gdA.f62538g));
        jSONObject.putOpt("prev_analytics_window_id", gdA.f62539h);
        jSONObject.putOpt("device_first_seen_sdk_timestamp", Long.valueOf(gdA.f62540i));
        jSONObject.putOpt("device_first_seen_app_timestamp", Long.valueOf(gdA.f62541j));
        String sessionId = gdA.f62537f;
        List<Ke<? extends Object, ? extends Object>> trackedAnalyticsList = gdA.f62542k;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(trackedAnalyticsList, "trackedAnalyticsList");
        Iterator<T> it = trackedAnalyticsList.iterator();
        while (it.hasNext()) {
            Ke trackedAnalytics = (Ke) it.next();
            Intrinsics.g(trackedAnalytics, "trackedAnalytics");
            C3308p0.a(sessionId, jSONObject, trackedAnalytics.c(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            trackedAnalytics.d();
        }
        String sessionId2 = gdA.f62537f;
        Ke<? extends Object, ? extends Object> trackedAnalytics2 = gdA.f62543l;
        Intrinsics.g(sessionId2, "sessionId");
        Intrinsics.g(trackedAnalytics2, "trackedAnalytics");
        C3308p0.a(sessionId2, jSONObject, trackedAnalytics2.c(), "_clicks");
        trackedAnalytics2.d();
        String sessionId3 = gdA.f62537f;
        C3356rf userHandleRepository = hd2.f62590a;
        C4.i.d impressions = gdA.f62544m;
        Intrinsics.g(sessionId3, "sessionId");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        Intrinsics.g(impressions, "impressions");
        List<ImpressionInfo> list = impressions.f62249b;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Object obj : list) {
            UiContext uiContext = ((ImpressionInfo) obj).f66489b;
            Object arrayList = linkedHashMap.get(uiContext);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(uiContext, arrayList);
            }
            ((List) arrayList).add(obj);
        }
        ArrayList arrayList2 = new ArrayList(linkedHashMap.size());
        Iterator it2 = linkedHashMap.entrySet().iterator();
        while (it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it2.next();
            UiContext uiContext2 = (UiContext) entry.getKey();
            List list2 = (List) entry.getValue();
            int i5 = D6.a.f62340a[uiContext2.ordinal()];
            if (i5 == 1) {
                str2 = "zero_state";
            } else {
                if (i5 != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                str2 = "search";
            }
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            Iterator it3 = list2.iterator();
            while (true) {
                str3 = "userHandle";
                str4 = "null cannot be cast to non-null type io.branch.search.ui.LauncherActivity";
                if (!it3.hasNext()) {
                    break;
                }
                Iterator it4 = it2;
                Object next = it3.next();
                Iterator it5 = it3;
                Impressable impressable = ((ImpressionInfo) next).f66488a;
                Intrinsics.e(impressable, "null cannot be cast to non-null type io.branch.search.ui.LauncherActivity");
                LauncherActivity launcherActivity = (LauncherActivity) impressable;
                ComponentName componentName = launcherActivity.f66494b;
                IdHash.Companion companion = IdHash.INSTANCE;
                String str7 = sessionId3;
                String packageName = componentName.getPackageName();
                Gd gd2 = gdA;
                Intrinsics.f(packageName, "l.componentName.packageName");
                String className = componentName.getClassName();
                Intrinsics.f(className, "l.componentName.className");
                UserHandle userHandle = launcherActivity.f66495c;
                Intrinsics.g(userHandle, "userHandle");
                Long userHandleId = userHandleRepository.f65680a.getUserHandleId(userHandle);
                String string = companion.ofAppComponent(packageName, className, userHandleId != null ? userHandleId.longValue() : 0L).toString();
                Object arrayList3 = linkedHashMap2.get(string);
                if (arrayList3 == null) {
                    arrayList3 = new ArrayList();
                    linkedHashMap2.put(string, arrayList3);
                }
                ((List) arrayList3).add(next);
                it2 = it4;
                it3 = it5;
                sessionId3 = str7;
                gdA = gd2;
            }
            Gd gd3 = gdA;
            Iterator it6 = it2;
            String str8 = sessionId3;
            ArrayList arrayList4 = new ArrayList(linkedHashMap2.size());
            Iterator it7 = linkedHashMap2.entrySet().iterator();
            while (it7.hasNext()) {
                Map.Entry entry2 = (Map.Entry) it7.next();
                String str9 = (String) entry2.getKey();
                List list3 = (List) entry2.getValue();
                Impressable impressable2 = ((ImpressionInfo) b70.g.W0(list3)).f66488a;
                Intrinsics.e(impressable2, str4);
                LauncherActivity launcherActivity2 = (LauncherActivity) impressable2;
                String packageName2 = launcherActivity2.f66494b.getPackageName();
                Iterator it8 = it7;
                ArrayList arrayList5 = new ArrayList(b70.c.u0(list3, 10));
                for (Iterator it9 = list3.iterator(); it9.hasNext(); it9 = it9) {
                    ImpressionInfo impressionInfo = (ImpressionInfo) it9.next();
                    arrayList5.add(new C4.i.b(impressionInfo.f66490c, impressionInfo.f66491d, impressionInfo.f66492e));
                    str4 = str4;
                }
                UserHandle userHandle2 = launcherActivity2.f66495c;
                Intrinsics.g(userHandle2, str3);
                String str10 = str8;
                arrayList4.add(new C4.i.c(str10, str9, -1, str10, packageName2, "app", null, null, null, arrayList5, userHandleRepository.f65680a.getUserHandleId(userHandle2), b70.h.f17594a, true));
                str3 = str3;
                str4 = str4;
                str8 = str10;
                it7 = it8;
            }
            sessionId3 = str8;
            arrayList2.add(new C4.i.a(str2, arrayList4));
            it2 = it6;
            gdA = gd3;
        }
        Gd gd4 = gdA;
        int i11 = 10;
        ArrayList arrayListT1 = b70.g.t1(arrayList2, impressions.f62248a);
        LinkedHashMap linkedHashMap3 = new LinkedHashMap();
        Iterator it10 = arrayListT1.iterator();
        while (it10.hasNext()) {
            Object next2 = it10.next();
            String str11 = ((C4.i.a) next2).f62230a;
            Object arrayList6 = linkedHashMap3.get(str11);
            if (arrayList6 == null) {
                arrayList6 = new ArrayList();
                linkedHashMap3.put(str11, arrayList6);
            }
            ((List) arrayList6).add(next2);
        }
        LinkedHashMap linkedHashMap4 = new LinkedHashMap(b70.k.d0(linkedHashMap3.size()));
        Iterator it11 = linkedHashMap3.entrySet().iterator();
        while (it11.hasNext()) {
            Map.Entry entry3 = (Map.Entry) it11.next();
            Object key = entry3.getKey();
            Iterable iterable = (Iterable) entry3.getValue();
            ArrayList arrayList7 = new ArrayList();
            Iterator it12 = iterable.iterator();
            while (it12.hasNext()) {
                List<C4.i.c> list4 = ((C4.i.a) it12.next()).f62231b;
                ArrayList arrayList8 = new ArrayList(b70.c.u0(list4, i11));
                Iterator it13 = list4.iterator();
                while (it13.hasNext()) {
                    C4.i.c cVar = (C4.i.c) it13.next();
                    Intrinsics.g(cVar, "<this>");
                    JSONObject jSONObjectPutOpt = new JSONObject().putOpt("request_id", cVar.f62235a).putOpt("result_id", Integer.valueOf(cVar.f62237c)).putOpt("entity_id", cVar.f62236b).putOpt(str6, cVar.f62238d).putOpt("entity_type", cVar.f62240f).putOpt("container_type", cVar.f62241g).putOpt("package_name", cVar.f62239e).putOpt("bundle_source_id", cVar.f62242h).putOpt("autosuggestion", cVar.f62243i).putOpt("user_handle", cVar.f62245k).putOpt("extras", new JSONObject(cVar.f62246l));
                    List<C4.i.b> list5 = cVar.f62244j;
                    Iterator it14 = it11;
                    Iterator it15 = it12;
                    ArrayList arrayList9 = new ArrayList(b70.c.u0(list5, 10));
                    Iterator it16 = list5.iterator();
                    while (it16.hasNext()) {
                        C4.i.b bVar = (C4.i.b) it16.next();
                        Intrinsics.g(bVar, "<this>");
                        JSONObject jSONObjectPut = new JSONObject().put("area", Float.valueOf(bVar.f62232a)).put("start_time", bVar.f62233b).put("duration", bVar.f62234c);
                        Intrinsics.f(jSONObjectPut, "JSONObject().put(aArea, ….put(aDuration, duration)");
                        arrayList9.add(jSONObjectPut);
                        it16 = it16;
                        str6 = str6;
                        it13 = it13;
                    }
                    JSONObject jSONObjectPutOpt2 = jSONObjectPutOpt.putOpt("encounters", new JSONArray((Collection) arrayList9)).putOpt("external_organic", Boolean.valueOf(cVar.f62247m));
                    Intrinsics.f(jSONObjectPutOpt2, "JSONObject()\n        .pu…Organic, externalOrganic)");
                    arrayList8.add(jSONObjectPutOpt2);
                    it12 = it15;
                    it11 = it14;
                    str6 = str6;
                }
                b70.d.z0(arrayList8, arrayList7);
                i11 = 10;
            }
            linkedHashMap4.put(key, arrayList7);
            i11 = 10;
        }
        C3308p0.a(sessionId3, jSONObject, linkedHashMap4, "_impressions");
        Y5 y52 = this.f62819g;
        c cVar2 = new c(jSONObject, str5, str);
        y52.getClass();
        t70.m0.t(CorosKt.getBNCScope(), a80.d.f488c, null, new X5(y52, gd4, cVar2, null), 2);
    }

    @NotNull
    public final Fd a(@NotNull String callerId) {
        Intrinsics.g(callerId, "callerId");
        C3308p0.a("Start session for ".concat(callerId));
        C3240l0 c3240l0 = this.f62818f;
        c3240l0.getClass();
        c3240l0.f64939d.a(callerId);
        I0 i02 = this.f62823k;
        t70.m0.t(i02.f62645f, null, null, new J0(i02, null), 3);
        C3240l0 c3240l02 = this.f62818f;
        c3240l02.getClass();
        return c3240l02.f64939d.a(callerId);
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0081  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(@NotNull String sessionId, boolean z11) {
        boolean z12;
        boolean z13;
        boolean z14;
        EnumC3075b4 enumC3075b4;
        Intrinsics.g(sessionId, "sessionId");
        H6 h62 = this.f62822j.U.f62378e;
        P1 branchConfiguration = this.f62821i;
        h62.getClass();
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        P1.a aVar = branchConfiguration.f63055x.get();
        Intrinsics.f(aVar, "trackingStatus.get()");
        if (!h62.f62580a.a(new C3289nf(aVar))) {
            return false;
        }
        C3350r9<JSONObject> trackedAnalytics = this.f62817e.b(sessionId);
        Intrinsics.g(trackedAnalytics, "trackedAnalytics");
        ConcurrentHashMap concurrentHashMapC = trackedAnalytics.c();
        if (!concurrentHashMapC.isEmpty()) {
            Collection collection = (Collection) concurrentHashMapC.get("api_calls");
            Collection collection2 = (Collection) concurrentHashMapC.get("failures");
            if (collection == null || collection2 == null || concurrentHashMapC.size() <= 2) {
                if ((((collection != null) ^ (collection2 != null)) && concurrentHashMapC.size() > 1) || (collection == null && collection2 == null && !concurrentHashMapC.isEmpty())) {
                    trackedAnalytics.f65625i.clear();
                } else {
                    if (collection != null) {
                        Iterator it = collection.iterator();
                        loop0: while (true) {
                            z13 = true;
                            while (it.hasNext()) {
                                String apiType = ((JSONObject) it.next()).optString("channel");
                                if (z13) {
                                    EnumC3075b4.a aVar2 = EnumC3075b4.Companion;
                                    Intrinsics.f(apiType, "apiType");
                                    aVar2.getClass();
                                    EnumC3075b4[] enumC3075b4ArrValues = EnumC3075b4.values();
                                    int length = enumC3075b4ArrValues.length;
                                    int i5 = 0;
                                    while (true) {
                                        if (i5 >= length) {
                                            enumC3075b4 = null;
                                            break;
                                        }
                                        enumC3075b4 = enumC3075b4ArrValues[i5];
                                        if (Intrinsics.b(enumC3075b4.toString(), apiType)) {
                                            break;
                                        }
                                        i5++;
                                    }
                                    if (enumC3075b4 == null) {
                                        enumC3075b4 = EnumC3075b4.C;
                                    }
                                    if (enumC3075b4 == EnumC3075b4.f63994l) {
                                        break;
                                    }
                                }
                                z13 = false;
                            }
                        }
                    } else {
                        z13 = true;
                    }
                    if (collection2 != null) {
                        Iterator it2 = collection2.iterator();
                        loop3: while (true) {
                            z14 = true;
                            while (it2.hasNext()) {
                                String strOptString = ((JSONObject) it2.next()).optString(Plan.AMP_PLAN_SOURCE);
                                if (!z14 || (!"HttpPool.logAndReturnError".equals(strOptString) && !"BRANCH_RawSQLiteDB.update".equals(strOptString) && !"AnalyticsAndRetryInterceptor.intercept".equals(strOptString))) {
                                    z14 = false;
                                }
                            }
                        }
                    } else {
                        z14 = true;
                    }
                    trackedAnalytics.f65625i.clear();
                    if (!z13 || !z14) {
                    }
                }
            }
            return (!this.f62817e.f(sessionId) && z11 && z12 && this.f62817e.a(sessionId)) ? false : true;
        }
        trackedAnalytics.f65625i.clear();
        z12 = this.f62817e.e(sessionId);
        if (!this.f62817e.f(sessionId)) {
        }
    }

    public final void a(@NotNull String sessionId, long j11) {
        Intrinsics.g(sessionId, "sessionId");
        this.f62814b.a(j11);
        this.f62814b.a(sessionId, j11);
    }

    public final void a() {
        int i5 = 0;
        for (String callerId : this.f62818f.a()) {
            C3240l0 c3240l0 = this.f62818f;
            c3240l0.getClass();
            Intrinsics.g(callerId, "callerId");
            String session = c3240l0.f64939d.b(callerId);
            C3240l0 c3240l02 = this.f62818f;
            c3240l02.getClass();
            Intrinsics.g(session, "session");
            EmptyList emptyList = EmptyList.f71733a;
            Gd gdA = c3240l02.a(session, new C4.i.d(emptyList, emptyList, emptyList));
            this.f62819g.f63722a.a(session, new U5(i5));
            this.f62816d.a(session, this.f62822j.F, gdA.toString());
        }
    }
}
