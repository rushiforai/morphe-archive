package io.branch.search.internal;

import android.os.Process;
import android.os.UserManager;
import com.amplitude.android.TrackingOptions;
import io.branch.search.internal.C3222k;
import io.branch.search.internal.E5;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;

/* renamed from: io.branch.search.internal.oe, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3305oe extends AbstractC3324q {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final P1 f65436d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final F4 f65437e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final R5 f65438f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final A9 f65439g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final C3295o4 f65440h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final Q5 f65441i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final F5 f65442j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final F2 f65443k;

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.SqlAdsDataSource", f = "SqlAdsDataSource.kt", l = {103}, m = "getSearchAds")
    /* renamed from: io.branch.search.internal.oe$a */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f65444a;

        /* renamed from: c, reason: collision with root package name */
        public int f65446c;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65444a = obj;
            this.f65446c |= Integer.MIN_VALUE;
            return C3305oe.this.a((C3084bd) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.SqlAdsDataSource", f = "SqlAdsDataSource.kt", l = {88}, m = "getSearchDemoAds")
    /* renamed from: io.branch.search.internal.oe$b */
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f65447a;

        /* renamed from: c, reason: collision with root package name */
        public int f65449c;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65447a = obj;
            this.f65449c |= Integer.MIN_VALUE;
            return C3305oe.this.a((C3169gd) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.SqlAdsDataSource", f = "SqlAdsDataSource.kt", l = {140}, m = "getSuggestedAppsAds")
    /* renamed from: io.branch.search.internal.oe$c */
    public static final class c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f65450a;

        /* renamed from: c, reason: collision with root package name */
        public int f65452c;

        public c(Continuation<? super c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65450a = obj;
            this.f65452c |= Integer.MIN_VALUE;
            return C3305oe.this.a((Fe) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.SqlAdsDataSource", f = "SqlAdsDataSource.kt", l = {55}, m = "getZeroStateAds")
    /* renamed from: io.branch.search.internal.oe$d */
    public static final class d extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f65453a;

        /* renamed from: c, reason: collision with root package name */
        public int f65455c;

        public d(Continuation<? super d> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65453a = obj;
            this.f65455c |= Integer.MIN_VALUE;
            return C3305oe.this.a((Bf) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.SqlAdsDataSource", f = "SqlAdsDataSource.kt", l = {44}, m = "getZeroStateDemoAds")
    /* renamed from: io.branch.search.internal.oe$e */
    public static final class e extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f65456a;

        /* renamed from: c, reason: collision with root package name */
        public int f65458c;

        public e(Continuation<? super e> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65456a = obj;
            this.f65458c |= Integer.MIN_VALUE;
            return C3305oe.this.a((dg) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.SqlAdsDataSource", f = "SqlAdsDataSource.kt", l = {196}, m = "getZeroStateSqlDemoAds")
    /* renamed from: io.branch.search.internal.oe$f */
    public static final class f extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f65459a;

        /* renamed from: c, reason: collision with root package name */
        public int f65461c;

        public f(Continuation<? super f> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65459a = obj;
            this.f65461c |= Integer.MIN_VALUE;
            return C3305oe.this.b(null, this);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3305oe(@NotNull C3454xb state, @NotNull I analyticalBufferRepository, @NotNull t70.j1 coroutineDispatcher, @NotNull P1 branchConfiguration, @NotNull F4 contextDelegate, @NotNull R5 deviceInfoDataSource, @NotNull B9 networkRepository, @NotNull C3295o4 branchConfigurationDataMapper, @NotNull Q5 deviceInfoDataMapper, @NotNull F5 demoModeDataSource, @NotNull G2 remoteConfigManager) {
        super(state, analyticalBufferRepository, coroutineDispatcher);
        Intrinsics.g(state, "state");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(coroutineDispatcher, "coroutineDispatcher");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(deviceInfoDataSource, "deviceInfoDataSource");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(branchConfigurationDataMapper, "branchConfigurationDataMapper");
        Intrinsics.g(deviceInfoDataMapper, "deviceInfoDataMapper");
        Intrinsics.g(demoModeDataSource, "demoModeDataSource");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        this.f65436d = branchConfiguration;
        this.f65437e = contextDelegate;
        this.f65438f = deviceInfoDataSource;
        this.f65439g = networkRepository;
        this.f65440h = branchConfigurationDataMapper;
        this.f65441i = deviceInfoDataMapper;
        this.f65442j = demoModeDataSource;
        this.f65443k = remoteConfigManager;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    @Override // io.branch.search.internal.AbstractC3324q
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull C3084bd c3084bd, @NotNull Continuation<? super List<C3205j>> continuation) throws Throwable {
        a aVar;
        Throwable th2;
        String str;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f65446c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f65446c = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        a aVar2 = aVar;
        Object objA = aVar2.f65444a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = aVar2.f65446c;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (Intrinsics.b(c3084bd.f64033d, "\"")) {
                return EmptyList.f71733a;
            }
            P5 p5A = this.f65438f.a();
            EnumC3285nb enumC3285nb = EnumC3285nb.AdsLocalSearch;
            Pair pair = new Pair("user_query", c3084bd.f64033d);
            Pair pair2 = new Pair("user_query_raw", c3084bd.f64030a);
            Pair pair3 = new Pair("user_query_wildcard", h6.c1.t(new StringBuilder(), c3084bd.f64033d, '%'));
            Pair pair4 = new Pair("request_id", c3084bd.f64031b);
            Pair pair5 = new Pair("user_id", String.valueOf(((UserManager) this.f65437e.f62438a.getSystemService(UserManager.class)).getSerialNumberForUser(Process.myUserHandle())));
            Pair pair6 = new Pair("gaid", this.f65436d.a().f65330q);
            C3342r1 c3342r1 = p5A.f63067a;
            if (c3342r1 != null) {
                th2 = null;
                str = c3342r1.f65597p;
            } else {
                th2 = null;
                str = null;
            }
            Pair pair7 = new Pair("user_agent", str);
            Pair pair8 = new Pair(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, c3342r1 != null ? new Integer(c3342r1.f65591h) : th2);
            C3342r1 c3342r12 = p5A.f63067a;
            Map mapJ0 = MapsKt.j0(pair, pair2, pair3, pair4, pair5, pair6, pair7, pair8, new Pair("locale", c3342r12 != null ? c3342r12.f65587d : th2), new Pair("tracking_status", this.f65436d.a().f65328m));
            LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(mapJ0.size()));
            for (Map.Entry entry : mapJ0.entrySet()) {
                linkedHashMap.put(entry.getKey(), String.valueOf(entry.getValue()));
            }
            String str2 = c3084bd.f64031b;
            List<C3186hd> list = c3084bd.f64034e;
            HashSet hashSet = new HashSet();
            ArrayList arrayList = new ArrayList();
            for (Object obj2 : list) {
                if (hashSet.add(((C3186hd) obj2).f64672j)) {
                    arrayList.add(obj2);
                }
            }
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it = arrayList.iterator();
            int i12 = 0;
            while (it.hasNext()) {
                Object next = it.next();
                int i13 = i12 + 1;
                if (i12 < 0) {
                    ul.b.e0();
                    throw th2;
                }
                arrayList2.add(MapsKt.j0(new Pair("package_name", String.valueOf(((C3186hd) next).f64672j)), new Pair("ranking", String.valueOf(i12))));
                i12 = i13;
            }
            String str3 = c3084bd.f64035f;
            Boolean bool = Boolean.TRUE;
            aVar2.f65446c = 1;
            objA = a(str3, enumC3285nb, linkedHashMap, bool, arrayList2, bool, (Long) null, str2, "ads_local_search", aVar2);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        Iterable iterable = (List) objA;
        if (iterable == null) {
            iterable = EmptyList.f71733a;
        }
        ArrayList arrayList3 = new ArrayList(b70.c.u0(iterable, 10));
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            arrayList3.add(C3205j.a((C3205j) it2.next(), Boolean.FALSE, null, null, null, -1048577, 63));
        }
        return arrayList3;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(dg dgVar, Continuation<? super List<C3205j>> continuation) throws JSONException {
        f fVar;
        if (continuation instanceof f) {
            fVar = (f) continuation;
            int i5 = fVar.f65461c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f65461c = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(continuation);
            }
        }
        f fVar2 = fVar;
        Object objB = fVar2.f65459a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = fVar2.f65461c;
        if (i11 == 0) {
            ResultKt.b(objB);
            Map mapJ0 = MapsKt.j0(new Pair("sa_row_size", String.valueOf(dgVar.f64352d)), new Pair("sl_row_count", String.valueOf(dgVar.f64351c)));
            String str = dgVar.f64350b;
            List listI1 = b70.g.I1(this.f65442j.a());
            ArrayList arrayList = new ArrayList(b70.c.u0(listI1, 10));
            Iterator it = listI1.iterator();
            while (it.hasNext()) {
                arrayList.add(((E5) it.next()).a());
            }
            Map mapE0 = b70.k.e0(new Pair("demo_instructions", arrayList));
            this.f65442j.getClass();
            List listB = F5.b();
            C3222k.a aVar = C3222k.f64905a;
            String str2 = dgVar.f64353e;
            Boolean bool = Boolean.FALSE;
            fVar2.f65461c = 1;
            objB = b(str2, "WITH demo_matches_without_notifications AS (\n  SELECT description, 0 AS is_notification, linking, app_package_name AS app_store_id, image_url, app_icon_url, app_name, user_targeting_type, original_description, click_tracking_link, sa_slot, sl_slot\n    FROM (\n      SELECT\n        'Ad · ' || ad.app_name AS description,\n        ad.linking, ad.app_package_name, ad.image_url, ad.image_url AS app_icon_url, ad.app_name, ad.user_targeting_type, ad.description AS original_description, ad.click_tracking_link, CAST(? as INTEGER) as sa_slot, CAST(? as INTEGER) as sl_slot\n      FROM demo_instructions di\n      LEFT JOIN lc2_ads ad ON\n        (di.param_type = 'app_name'  AND (lower(di.adv) = lower(ad.app_name) OR replace(lower(di.adv), ' ', '') = replace(lower(ad.app_name), ' ', '')))\n        OR (di.param_type = 'pkg'  AND lower(di.adv) = lower(ad.app_package_name))\n        OR (di.param_type = 'ad_id' AND di.adv = ad.ad_id)\n        OR (di.param_type = 'campaign_id' AND di.adv = ad.campaign_id)\n      LEFT JOIN local_packages lp ON\n        ad.app_package_name = lp.package_name\n      WHERE (\n        (lp.normalized_name IS NOT NULL AND ad.user_targeting_type = 'RE_ENGAGEMENT')\n        OR\n        (lp.normalized_name IS NULL AND ad.user_targeting_type = 'INSTALL')\n        )\n      AND ad.placements LIKE '%ZERO_STATE%'\n      ORDER BY di.instr_ts DESC\n      LIMIT 1\n    ) admatches\n)\n,suggested_apps AS (\n  SELECT\n    null as ANR_cohort_id,\n    'suggested_apps' as query_id,\n    0.0 as ANR_lcs_experiment_id,\n    2 as bucket_rank,\n    original_description as description,\n    sa_slot as slot,\n    1 as can_use_uncached_images,\n    'featured' as ranking_hint,\n    json_array('is_app_local','local_p15n_score','was_personalized','entity_source',\n      'local_p15n_link_score','link_score_debug','shortcut_name','ad_winner_id','is_ad',\n      'nullify_ad_mode','target_package_name','ANL_campaign_type','is_freq_capped','frequency_score',\n      'ads_participated_in_auction_count','install_ads_participated_in_auction_count','server_score',\n      'ecpm','ectr','score_method','score_aggregation_level','score_model_version','engagement_score',\n      'p15n_rank','ad_type','tier_priority','tier_label','impression_cap_by_tier',\n      'capping_window_by_tier','impressed_frequency','is_target_app_local','first_install_ts',\n      'last_open_ts','target_last_open_ts','zs_channel_type')\n    as ANL_json_keys,\n    json_array(null,null,null,null,null,null,null,null,1,null,app_store_id,user_targeting_type,null,null,null,\n      null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'suggested_apps')\n    as ANL_json_values,\n    1 as order_slot,\n    CASE\n      WHEN user_targeting_type = 'INSTALL' THEN 'NOT_INSTALLED'\n      WHEN user_targeting_type = 'RE_ENGAGEMENT' THEN 'INSTALLED'\n      ELSE NULL\n    END as ad_state,\n    image_url as image_url,\n    linking as linking,\n    null as ANL_local_p15n_score,\n    app_store_id as app_store_id,\n    1 as order_rank,\n    app_icon_url as app_icon_url,\n    app_store_id||':ad_demo' as entity_id,\n    null as ANL_ad_winner_id,\n    null as version,\n    null as boost_adified,\n    null as is_homepage_link,\n    app_name as app_name,\n    click_tracking_link as click_tracking_url,\n    null as ANL_ad_type,\n    'app' as entity_type,\n    0 as user_id,\n    1 as ANL_is_ad,\n    app_name as name,\n    'suggested_apps' as container_type,\n    null as ANR_experiment_ids,\n    true as is_ad,\n    true as validated_linking,\n    8 as resultId\n  FROM demo_matches_without_notifications\n)\n,suggested_links AS (\n  SELECT\n    null as ANR_cohort_id,\n    'suggested_links' as query_id,\n    0.0 as ANR_lcs_experiment_id,\n    4 as bucket_rank,\n    original_description as description,\n    sl_slot as slot,\n    1 as can_use_uncached_images,\n    'featured' as ranking_hint,\n    json_array('is_app_local','local_p15n_score','was_personalized','entity_source',\n      'local_p15n_link_score','link_score_debug','shortcut_name','ad_winner_id','is_ad',\n      'nullify_ad_mode','target_package_name','ANL_campaign_type','is_freq_capped','frequency_score',\n      'ads_participated_in_auction_count','install_ads_participated_in_auction_count','server_score',\n      'ecpm','ectr','score_method','score_aggregation_level','score_model_version','engagement_score',\n      'p15n_rank','ad_type','tier_priority','tier_label','impression_cap_by_tier',\n      'capping_window_by_tier','impressed_frequency','is_target_app_local','first_install_ts',\n      'last_open_ts','target_last_open_ts','zs_channel_type')\n    as ANL_json_keys,\n    json_array(null,null,null,null,null,null,null,null,1,null,app_store_id,user_targeting_type,null,null,null,\n      null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'suggested_links')\n    as ANL_json_values,\n    1 as order_slot,\n    CASE\n      WHEN user_targeting_type = 'INSTALL' THEN 'NOT_INSTALLED'\n      WHEN user_targeting_type = 'RE_ENGAGEMENT' THEN 'INSTALLED'\n      ELSE NULL\n    END as ad_state,\n    image_url as image_url,\n    linking as linking,\n    null as ANL_local_p15n_score,\n    app_store_id as app_store_id,\n    1 as order_rank,\n    app_icon_url as app_icon_url,\n    app_store_id||':ad_demo' as entity_id,\n    null as ANL_ad_winner_id,\n    null as version,\n    null as boost_adified,\n    null as is_homepage_link,\n    app_name as app_name,\n    click_tracking_link as click_tracking_url,\n    null as ANL_ad_type,\n    'shortcut' as entity_type,\n    0 as user_id,\n    1 as ANL_is_ad,\n    app_name as name,\n    'suggested_links' as container_type,\n    null as ANR_experiment_ids,\n    true as is_ad,\n    false as validated_linking,\n    8 as resultId\n  FROM demo_matches_without_notifications\n)\nSELECT * FROM suggested_apps\nUNION ALL\nSELECT * FROM suggested_links", "sa_row_size,sl_row_count", mapJ0, bool, listB, str, mapE0, aVar, fVar2);
            if (objB == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
        }
        List list = (List) objB;
        list.size();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            Objects.toString((C3205j) it2.next());
        }
        return list;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0020  */
    @Override // io.branch.search.internal.AbstractC3324q
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull C3169gd c3169gd, @NotNull Continuation<? super List<C3205j>> continuation) throws JSONException {
        b bVar;
        Integer numU0;
        Integer numU02;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f65449c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f65449c = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object objA = bVar.f65447a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = bVar.f65449c;
        if (i11 == 0) {
            ResultKt.b(objA);
            F5 f52 = this.f65442j;
            String query = c3169gd.f64593a;
            f52.getClass();
            Intrinsics.g(query, "query");
            if (r70.j.I0(query, "demo", false)) {
                if (query.equals("demo:enable")) {
                    C3309p1.a("DemoStateDataSource", "Enabling demo state");
                    f52.f62445a.a("DEMO_SCOPE", "demo", Boolean.TRUE, 1800000L);
                } else if (query.equals("demo:disable")) {
                    C3309p1.a("DemoStateDataSource", "Disabling demo state");
                    f52.f62445a.a("DEMO_SCOPE", "demo", Boolean.FALSE, 1800000L);
                    f52.f62445a.a("DEMO_SCOPE", "demo_instructions", new LinkedHashSet(), 1800000L);
                } else if (r70.j.I0(query, "demo:pkg=", false)) {
                    Set<E5> setA = f52.a();
                    String strA1 = r70.k.a1(query, "demo:pkg=");
                    if (r70.j.A0(query, ":add", false)) {
                        String strB1 = r70.k.b1(strA1, ":add");
                        setA.add(new E5.d(strB1, System.currentTimeMillis()));
                        C3309p1.a("DemoStateDataSource", "Added pkg=" + strB1 + " to demo state");
                    } else if (r70.j.A0(query, ":remove", false)) {
                        String strB12 = r70.k.b1(strA1, ":remove");
                        b70.d.D0(setA, new G5(strB12));
                        C3309p1.a("DemoStateDataSource", "Removed pkg=" + strB12 + " from demo state");
                    }
                } else if (r70.j.I0(query, "demo:app_name=", false)) {
                    Set<E5> setA2 = f52.a();
                    String strB13 = r70.k.b1(r70.k.a1(query, "demo:app_name="), ":add");
                    if (r70.j.A0(query, ":add", false)) {
                        String strB14 = r70.k.b1(strB13, ":add");
                        setA2.add(new E5.c(strB14, System.currentTimeMillis()));
                        C3309p1.a("DemoStateDataSource", "Added app_name=" + strB14 + " to demo state");
                    } else if (r70.j.A0(query, ":remove", false)) {
                        String strB15 = r70.k.b1(strB13, ":remove");
                        b70.d.D0(setA2, new H5(strB15));
                        C3309p1.a("DemoStateDataSource", "Removed app_name=" + strB15 + " from demo state");
                    }
                } else if (r70.j.I0(query, "demo:ad_id=", false)) {
                    Set<E5> setA3 = f52.a();
                    String strA12 = r70.k.a1(query, "demo:ad_id=");
                    if (r70.j.A0(query, ":add", false)) {
                        Integer numU03 = r70.i.u0(r70.k.b1(strA12, ":add"));
                        if (numU03 != null) {
                            setA3.add(new E5.a(System.currentTimeMillis(), numU03.intValue()));
                            C3309p1.a("DemoStateDataSource", "Added adId=" + numU03 + " to demo state");
                        }
                    } else if (r70.j.A0(query, ":remove", false) && (numU02 = r70.i.u0(r70.k.b1(strA12, ":remove"))) != null) {
                        b70.d.D0(setA3, new I5(numU02));
                        C3309p1.a("DemoStateDataSource", "Removed adId=" + numU02 + " from demo state");
                    }
                } else if (r70.j.I0(query, "demo:campaign_id=", false)) {
                    Set<E5> setA4 = f52.a();
                    String strA13 = r70.k.a1(query, "demo:campaign_id=");
                    if (r70.j.A0(query, ":add", false)) {
                        Integer numU04 = r70.i.u0(r70.k.b1(strA13, ":add"));
                        if (numU04 != null) {
                            setA4.add(new E5.b(System.currentTimeMillis(), numU04.intValue()));
                            C3309p1.a("DemoStateDataSource", "Added campaignId=" + numU04 + " to demo state");
                        }
                    } else if (r70.j.A0(query, ":remove", false) && (numU0 = r70.i.u0(r70.k.b1(strA13, ":remove"))) != null) {
                        b70.d.D0(setA4, new J5(numU0));
                        C3309p1.a("DemoStateDataSource", "Removed campaignId=" + numU0 + " from demo state");
                    }
                }
            }
            Boolean bool = (Boolean) this.f65442j.f62445a.a("DEMO_SCOPE", "demo");
            if (bool != null && bool.booleanValue()) {
                String str = c3169gd.f64595c;
                String str2 = c3169gd.f64596d;
                bVar.f65449c = 1;
                objA = a(str, str2, bVar);
                if (objA == obj) {
                    return obj;
                }
            } else {
                return EmptyList.f71733a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        List list = (List) objA;
        C3309p1.a("SqlAdsDataSource", "Demo ads in search - size: " + list.size());
        return list;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, Continuation continuation) throws JSONException {
        C3322pe c3322pe;
        if (continuation instanceof C3322pe) {
            c3322pe = (C3322pe) continuation;
            int i5 = c3322pe.f65489c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3322pe.f65489c = i5 - Integer.MIN_VALUE;
            } else {
                c3322pe = new C3322pe(this, continuation);
            }
        }
        C3322pe c3322pe2 = c3322pe;
        Object objB = c3322pe2.f65487a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c3322pe2.f65489c;
        if (i11 == 0) {
            ResultKt.b(objB);
            List listI1 = b70.g.I1(this.f65442j.a());
            ArrayList arrayList = new ArrayList(b70.c.u0(listI1, 10));
            Iterator it = listI1.iterator();
            while (it.hasNext()) {
                arrayList.add(((E5) it.next()).a());
            }
            Map mapE0 = b70.k.e0(new Pair("demo_instructions", arrayList));
            this.f65442j.getClass();
            List listB = F5.b();
            C3222k.a aVar = C3222k.f64905a;
            Boolean bool = Boolean.FALSE;
            c3322pe2.f65489c = 1;
            objB = b(str2, "WITH demo_matches AS (\n  SELECT\n    'Ad · ' || ad.app_name AS description,\n    ad.linking,\n    ad.app_package_name AS app_store_id,\n    ad.image_url,\n    ad.image_url AS app_icon_url,\n    ad.app_name,\n    ad.user_targeting_type,\n    ad.description AS original_description,\n    ad.click_tracking_link,\n    ad.container_placements AS container_placements\n  FROM demo_instructions di\n  LEFT JOIN lc2_ads ad ON\n    (di.param_type = 'app_name' AND (lower(di.adv) = lower(ad.app_name) OR replace(lower(di.adv), ' ', '') = replace(lower(ad.app_name), ' ', '')))\n    OR (di.param_type = 'pkg' AND lower(di.adv) = lower(ad.app_package_name))\n    OR (di.param_type = 'ad_id' AND di.adv = ad.ad_id)\n    OR (di.param_type = 'campaign_id' AND di.adv = ad.campaign_id)\n  LEFT JOIN local_packages lp ON\n    ad.app_package_name = lp.package_name\n  WHERE (\n    (lp.normalized_name IS NOT NULL AND ad.user_targeting_type = 'RE_ENGAGEMENT')\n    OR\n    (lp.normalized_name IS NULL AND ad.user_targeting_type = 'INSTALL')\n  )\n  AND ad.placements LIKE '%SEARCH%'\n  ORDER BY di.instr_ts DESC\n  LIMIT 1\n),\nplacements_split AS (\n  SELECT\n    dm.description,\n    dm.linking,\n    dm.app_store_id,\n    dm.image_url,\n    dm.app_icon_url,\n    dm.app_name,\n    dm.user_targeting_type,\n    dm.original_description,\n    dm.click_tracking_link,\n    json_each.value AS container_placements,\n    CASE json_each.value\n      WHEN 'SEARCH_HERO' THEN 'hero_ad'\n      WHEN 'SEARCH_LOCAL' THEN 'local_search'\n      WHEN 'SEARCH_LOCAL_SHORTCUT' THEN 'shortcut_search'\n      WHEN 'SEARCH_RELATED_APPS' THEN 'related_apps'\n      WHEN 'APP_STORE' THEN 'app_store_search'\n      ELSE 'unknown'\n    END AS container_type\n  FROM demo_matches dm, json_each('[\"' || replace(dm.container_placements, ',', '\",\"') || '\"]') AS json_each\n  WHERE json_each.value IN ('SEARCH_HERO', 'SEARCH_LOCAL', 'SEARCH_LOCAL_SHORTCUT', 'SEARCH_RELATED_APPS', 'APP_STORE')\n)\nSELECT\n  description AS app_name,\n  app_store_id AS app_store_id,\n  app_icon_url AS app_icon_url,\n  'featured' AS ranking_hint,\n  app_store_id || ':' || container_type AS entity_id,\n  description AS name,\n  original_description AS description,\n  image_url AS image_url,\n  linking AS linking,\n  click_tracking_link AS click_tracking_url,\n  NULL AS impression_url,\n  NULL AS app_linking,\n  click_tracking_link AS app_click_tracking_url,\n  1 AS can_use_uncached_images,\n  container_type,\n  CASE\n    WHEN container_type IN ('shortcut_search', 'related_apps') THEN 'shortcut'\n    ELSE 'app'\n  END AS entity_type,\n  CASE\n    WHEN user_targeting_type = 'INSTALL' THEN 'Install'\n    WHEN user_targeting_type = 'RE_ENGAGEMENT' THEN 'Open'\n    ELSE ''\n  END AS call_to_action,\n  CASE\n    WHEN user_targeting_type = 'INSTALL' THEN 'NOT_INSTALLED'\n    WHEN user_targeting_type = 'RE_ENGAGEMENT' THEN 'INSTALLED'\n    ELSE NULL\n  END as ad_state,\n  NULL AS screenshot_url,\n  1 AS ANL_is_ad,\n  NULL AS ANL_ad_type,\n  NULL AS ANL_ad_winner_id,\n  NULL AS ANL_target_package_name,\n  NULL AS ANL_ecpm,\n  NULL AS ANL_ectr,\n  NULL AS ANL_score_method,\n  NULL AS ANL_score_aggregation_level,\n  NULL AS ANL_score_model_version,\n  NULL AS ANL_order_rank,\n  NULL AS ANL_order_subrank,\n  NULL AS _order_rank,\n  NULL AS ANA_p15n_model_version,\n  NULL AS ANA_static_group_number,\n  '{}' AS ANA_ineligible_ads,\n  '{}' AS ANL_ineligible_ads,\n  NULL AS ANL_p15n_model_version,\n  NULL AS ANL_static_group_number,\n  'organic_reengagement' AS ANL_ad_label,\n  container_placements\nFROM placements_split;", null, null, bool, listB, str, mapE0, aVar, c3322pe2);
            if (objB == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
        }
        return (List) objB;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    @Override // io.branch.search.internal.AbstractC3324q
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull Fe fe2, @NotNull Continuation<? super List<C3205j>> continuation) throws JSONException {
        c cVar;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f65452c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f65452c = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(continuation);
            }
        }
        c cVar2 = cVar;
        Object objA = cVar2.f65450a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = cVar2.f65452c;
        if (i11 == 0) {
            ResultKt.b(objA);
            String str = fe2.f62476a;
            String str2 = fe2.f62480e;
            EnumC3285nb enumC3285nb = EnumC3285nb.AdsSuggestedApps;
            long j11 = this.f65443k.a().f65372m;
            Map mapJ0 = MapsKt.j0(new Pair("request_id", fe2.f62477b), new Pair("ads_count", new Integer(fe2.f62478c)), new Pair("user_id", new Long(fe2.f62479d)), new Pair("is_connected", this.f65439g.isConnected() ? "1" : "0"));
            C3295o4 c3295o4 = this.f65440h;
            C3278n4 c3278n4A = this.f65436d.a();
            c3295o4.getClass();
            LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapJ0, C3198i8.a(C3295o4.a(c3278n4A)));
            Q5 q5 = this.f65441i;
            P5 p5A = this.f65438f.a();
            q5.getClass();
            LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, C3198i8.a(Q5.a(p5A)));
            LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(linkedHashMapM02.size()));
            for (Map.Entry entry : linkedHashMapM02.entrySet()) {
                linkedHashMap.put(entry.getKey(), String.valueOf(entry.getValue()));
            }
            String str3 = fe2.f62477b;
            List list = EmptyList.f71733a;
            Boolean bool = Boolean.TRUE;
            Long l9 = new Long(j11);
            cVar2.f65452c = 1;
            objA = a(str2, enumC3285nb, linkedHashMap, (Boolean) null, list, bool, l9, str3, str, cVar2);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        List list2 = (List) objA;
        return list2 == null ? EmptyList.f71733a : list2;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    @Override // io.branch.search.internal.AbstractC3324q
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull Bf bf2, @NotNull Continuation<? super List<C3205j>> continuation) throws JSONException {
        d dVar;
        int i5;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i11 = dVar.f65455c;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                dVar.f65455c = i11 - Integer.MIN_VALUE;
            } else {
                dVar = new d(continuation);
            }
        }
        d dVar2 = dVar;
        Object objA = dVar2.f65453a;
        Object obj = CoroutineSingletons.f71806a;
        int i12 = dVar2.f65455c;
        if (i12 == 0) {
            ResultKt.b(objA);
            String str = bf2.f62153b;
            EnumC3285nb enumC3285nb = EnumC3285nb.AdsZeroState;
            C3282n8 c3282n8A = this.f65443k.a();
            if (bf2.f62162k) {
                i5 = c3282n8A.f65368k;
            } else {
                i5 = c3282n8A.f65370l;
            }
            long j11 = i5;
            Map mapJ0 = MapsKt.j0(new Pair("request_id", bf2.f62152a), new Pair("sa_row_count", String.valueOf(bf2.f62154c)), new Pair("sa_row_size", new Integer(bf2.f62155d)), new Pair("sl_row_count", String.valueOf(bf2.f62156e)), new Pair("sl_row_size", new Integer(bf2.f62157f)), new Pair("si_row_count", String.valueOf(bf2.f62158g)), new Pair("si_row_size", new Integer(bf2.f62159h)), new Pair("is_connected", this.f65439g.isConnected() ? "1" : "0"), new Pair("user_id", bf2.f62160i));
            C3295o4 c3295o4 = this.f65440h;
            C3278n4 c3278n4A = this.f65436d.a();
            c3295o4.getClass();
            LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapJ0, C3198i8.a(C3295o4.a(c3278n4A)));
            Q5 q5 = this.f65441i;
            P5 p5A = this.f65438f.a();
            q5.getClass();
            LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, C3198i8.a(Q5.a(p5A)));
            LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(linkedHashMapM02.size()));
            for (Map.Entry entry : linkedHashMapM02.entrySet()) {
                linkedHashMap.put(entry.getKey(), String.valueOf(entry.getValue()));
            }
            String str2 = bf2.f62152a;
            List list = EmptyList.f71733a;
            String str3 = bf2.f62161j;
            Boolean bool = Boolean.TRUE;
            Long l9 = new Long(j11);
            dVar2.f65455c = 1;
            objA = a(str3, enumC3285nb, linkedHashMap, (Boolean) null, list, bool, l9, str2, str, dVar2);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        List list2 = (List) objA;
        return list2 == null ? EmptyList.f71733a : list2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.AbstractC3324q
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull dg dgVar, @NotNull Continuation<? super List<C3205j>> continuation) throws JSONException {
        e eVar;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i5 = eVar.f65458c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f65458c = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(continuation);
            }
        }
        Object objB = eVar.f65456a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = eVar.f65458c;
        if (i11 == 0) {
            ResultKt.b(objB);
            Boolean bool = (Boolean) this.f65442j.f62445a.a("DEMO_SCOPE", "demo");
            if (bool != null && bool.booleanValue()) {
                eVar.f65458c = 1;
                objB = b(dgVar, eVar);
                if (objB == obj) {
                    return obj;
                }
            } else {
                return EmptyList.f71733a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
        }
        List list = (List) objB;
        C3309p1.a("SqlAdsDataSource", "Demo ads in zero state - size: " + list.size());
        return list;
    }
}
