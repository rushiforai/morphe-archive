package ai;

import b.hb;
import b.kc;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class x {
    public static final w A;
    public static final w A0;
    public static final w B;
    public static final w B0;
    public static final w C;
    public static final w C0;
    public static final w D;
    public static final w D0;
    public static final w E;
    public static final w E0;
    public static final w F;
    public static final w F0;
    public static final w G;
    public static final w G0;
    public static final w H;
    public static final w H0;
    public static final w I;
    public static final w I0;
    public static final w J;
    public static final w J0;
    public static final w K;
    public static final w K0;
    public static final w L;
    public static final w L0;
    public static final w M;
    public static final w M0;
    public static final w N;
    public static final w N0;
    public static final w O;
    public static final w O0;
    public static final w P;
    public static final w P0;
    public static final w Q;
    public static final w Q0;
    public static final w R;
    public static final w R0;
    public static final w S;
    public static final w S0;
    public static final w T;
    public static final w T0;
    public static final w U;
    public static final w U0;
    public static final w V;
    public static final w V0;
    public static final w W;
    public static final w W0;
    public static final w X;
    public static final w X0;
    public static final w Y;
    public static final w Y0;
    public static final w Z;
    public static final w Z0;

    /* renamed from: a, reason: collision with root package name */
    public static final List f13400a = Collections.synchronizedList(new ArrayList());

    /* renamed from: a0, reason: collision with root package name */
    public static final w f13401a0;

    /* renamed from: a1, reason: collision with root package name */
    public static final w f13402a1;

    /* renamed from: b, reason: collision with root package name */
    public static final w f13403b;

    /* renamed from: b0, reason: collision with root package name */
    public static final w f13404b0;

    /* renamed from: b1, reason: collision with root package name */
    public static final w f13405b1;

    /* renamed from: c, reason: collision with root package name */
    public static final w f13406c;

    /* renamed from: c0, reason: collision with root package name */
    public static final w f13407c0;

    /* renamed from: c1, reason: collision with root package name */
    public static final w f13408c1;

    /* renamed from: d, reason: collision with root package name */
    public static final w f13409d;

    /* renamed from: d0, reason: collision with root package name */
    public static final w f13410d0;

    /* renamed from: d1, reason: collision with root package name */
    public static final w f13411d1;

    /* renamed from: e, reason: collision with root package name */
    public static final w f13412e;

    /* renamed from: e0, reason: collision with root package name */
    public static final w f13413e0;

    /* renamed from: e1, reason: collision with root package name */
    public static final w f13414e1;

    /* renamed from: f, reason: collision with root package name */
    public static final w f13415f;

    /* renamed from: f0, reason: collision with root package name */
    public static final w f13416f0;

    /* renamed from: f1, reason: collision with root package name */
    public static final w f13417f1;

    /* renamed from: g, reason: collision with root package name */
    public static final w f13418g;

    /* renamed from: g0, reason: collision with root package name */
    public static final w f13419g0;
    public static final w g1;

    /* renamed from: h, reason: collision with root package name */
    public static final w f13420h;

    /* renamed from: h0, reason: collision with root package name */
    public static final w f13421h0;
    public static final w h1;

    /* renamed from: i, reason: collision with root package name */
    public static final w f13422i;

    /* renamed from: i0, reason: collision with root package name */
    public static final w f13423i0;
    public static final w i1;

    /* renamed from: j, reason: collision with root package name */
    public static final w f13424j;

    /* renamed from: j0, reason: collision with root package name */
    public static final w f13425j0;

    /* renamed from: j1, reason: collision with root package name */
    public static final w f13426j1;

    /* renamed from: k, reason: collision with root package name */
    public static final w f13427k;

    /* renamed from: k0, reason: collision with root package name */
    public static final w f13428k0;

    /* renamed from: l, reason: collision with root package name */
    public static final w f13429l;

    /* renamed from: l0, reason: collision with root package name */
    public static final w f13430l0;

    /* renamed from: m, reason: collision with root package name */
    public static final w f13431m;

    /* renamed from: m0, reason: collision with root package name */
    public static final w f13432m0;
    public static final w n;

    /* renamed from: n0, reason: collision with root package name */
    public static final w f13433n0;
    public static final w o;

    /* renamed from: o0, reason: collision with root package name */
    public static final w f13434o0;

    /* renamed from: p, reason: collision with root package name */
    public static final w f13435p;

    /* renamed from: p0, reason: collision with root package name */
    public static final w f13436p0;

    /* renamed from: q, reason: collision with root package name */
    public static final w f13437q;

    /* renamed from: q0, reason: collision with root package name */
    public static final w f13438q0;

    /* renamed from: r, reason: collision with root package name */
    public static final w f13439r;

    /* renamed from: r0, reason: collision with root package name */
    public static final w f13440r0;

    /* renamed from: s, reason: collision with root package name */
    public static final w f13441s;

    /* renamed from: s0, reason: collision with root package name */
    public static final w f13442s0;

    /* renamed from: t, reason: collision with root package name */
    public static final w f13443t;

    /* renamed from: t0, reason: collision with root package name */
    public static final w f13444t0;

    /* renamed from: u, reason: collision with root package name */
    public static final w f13445u;

    /* renamed from: u0, reason: collision with root package name */
    public static final w f13446u0;

    /* renamed from: v, reason: collision with root package name */
    public static final w f13447v;

    /* renamed from: v0, reason: collision with root package name */
    public static final w f13448v0;

    /* renamed from: w, reason: collision with root package name */
    public static final w f13449w;

    /* renamed from: w0, reason: collision with root package name */
    public static final w f13450w0;

    /* renamed from: x, reason: collision with root package name */
    public static final w f13451x;

    /* renamed from: x0, reason: collision with root package name */
    public static final w f13452x0;

    /* renamed from: y, reason: collision with root package name */
    public static final w f13453y;

    /* renamed from: y0, reason: collision with root package name */
    public static final w f13454y0;

    /* renamed from: z, reason: collision with root package name */
    public static final w f13455z;

    /* renamed from: z0, reason: collision with root package name */
    public static final w f13456z0;

    static {
        Collections.synchronizedSet(new HashSet());
        Long lValueOf = Long.valueOf(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
        f13403b = a("measurement.ad_id_cache_time", lValueOf, bt.f.f18477x, false);
        f13406c = a("measurement.app_uninstalled_additional_ad_id_cache_time", 3600000L, bt.f.f18458c, false);
        f13409d = a("measurement.monitoring.sample_period_millis", 86400000L, io.sentry.hints.i.f67280f, false);
        f13412e = a("measurement.config.cache_time", 86400000L, hb.f15870h, false);
        f13415f = a("measurement.config.url_scheme", "https", kc.f15920j, false);
        f13418g = a("measurement.config.url_authority", "app-measurement.com", bk.e.f17952m, false);
        f13420h = a("measurement.upload.max_bundles", 100, bt.f.o, false);
        Integer numValueOf = Integer.valueOf(SQLiteDatabase.OPEN_FULLMUTEX);
        f13422i = a("measurement.upload.max_batch_size", numValueOf, io.sentry.hints.i.f67289q, false);
        f13424j = a("measurement.upload.max_bundle_size", numValueOf, hb.f15879s, false);
        f13427k = a("measurement.upload.max_events_per_bundle", 1000, kc.f15929u, false);
        f13429l = a("measurement.upload.max_events_per_day", 100000, bk.e.f17961x, false);
        f13431m = a("measurement.upload.max_error_events_per_day", 1000, io.sentry.hints.i.f67278d, false);
        n = a("measurement.upload.max_public_events_per_day", 50000, hb.f15866d, false);
        o = a("measurement.upload.max_conversions_per_day", 10000, kc.f15914d, false);
        f13435p = a("measurement.upload.max_realtime_events_per_day", 10, bk.e.f17944e, false);
        f13437q = a("measurement.store.max_stored_events_per_app", 100000, bt.f.f18460e, false);
        f13439r = a("measurement.upload.url", "https://app-measurement.com/a", io.sentry.hints.i.f67279e, false);
        f13441s = a("measurement.sgtm.google_signal.url", "https://app-measurement.com/s/d", hb.f15867e, false);
        f13443t = a("measurement.sgtm.service_upload_apps_list", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, kc.f15915e, false);
        f13445u = a("measurement.sgtm.upload.backoff_http_codes", "404,429,503,504", bk.e.f17945f, false);
        Long lValueOf2 = Long.valueOf(TTAdConstant.AD_MAX_EVENT_TIME);
        f13447v = a("measurement.sgtm.upload.retry_interval", lValueOf2, bt.f.f18461f, false);
        f13449w = a("measurement.sgtm.upload.retry_max_wait", 21600000L, hb.f15868f, false);
        f13451x = a("measurement.sgtm.batch.retry_interval", 1800000L, kc.f15916f, false);
        f13453y = a("measurement.sgtm.batch.retry_max_wait", 21600000L, bk.e.f17946g, false);
        f13455z = a("measurement.sgtm.batch.retry_max_count", 10, bt.f.f18462g, false);
        A = a("measurement.sgtm.upload.max_queued_batches", 5000, io.sentry.hints.i.f67281g, false);
        B = a("measurement.sgtm.upload.batches_retrieval_limit", 5, hb.f15869g, false);
        C = a("measurement.sgtm.upload.min_delay_after_startup", 5000L, kc.f15917g, false);
        D = a("measurement.sgtm.upload.min_delay_after_broadcast", 1000L, bk.e.f17947h, false);
        E = a("measurement.sgtm.upload.min_delay_after_background", lValueOf2, bt.f.f18463h, false);
        F = a("measurement.sgtm.batch.long_queuing_threshold", 14400000L, io.sentry.hints.i.f67282h, false);
        G = a("measurement.upload.backoff_period", 43200000L, kc.f15918h, false);
        a("measurement.upload.window_interval", 3600000L, bk.e.f17948i, false);
        H = a("measurement.upload.interval", 3600000L, bt.f.f18464i, false);
        I = a("measurement.upload.realtime_upload_interval", lValueOf, io.sentry.hints.i.f67283i, false);
        J = a("measurement.upload.debug_upload_interval", 1000L, hb.f15871i, false);
        K = a("measurement.upload.minimum_delay", 500L, kc.f15919i, false);
        L = a("measurement.alarm_manager.minimum_interval", 60000L, bk.e.f17949j, false);
        M = a("measurement.upload.stale_data_deletion_interval", 86400000L, bt.f.f18465j, false);
        N = a("measurement.upload.refresh_blacklisted_config_interval", 604800000L, io.sentry.hints.i.f67284j, false);
        O = a("measurement.upload.initial_upload_delay_time", 15000L, hb.f15872j, false);
        P = a("measurement.upload.retry_time", 1800000L, bk.e.f17950k, false);
        Q = a("measurement.upload.retry_count", 6, bt.f.f18466k, false);
        R = a("measurement.upload.max_queue_time", 518400000L, io.sentry.hints.i.f67285k, false);
        S = a("measurement.upload.google_signal_max_queue_time", 300000L, hb.f15873k, false);
        T = a("measurement.lifetimevalue.max_currency_tracked", 4, kc.f15921k, false);
        U = a("measurement.audience.filter_result_max_count", 200, bk.e.f17951l, false);
        V = a("measurement.upload.max_public_user_properties", 100, null, false);
        W = a("measurement.upload.max_event_name_cardinality", 2000, null, false);
        X = a("measurement.upload.max_public_event_params", 100, null, false);
        Y = a("measurement.service_client.idle_disconnect_millis", 5000L, bt.f.f18467l, false);
        Z = a("measurement.service_client.reconnect_millis", 1000L, io.sentry.hints.i.f67286l, false);
        Boolean bool = Boolean.FALSE;
        f13401a0 = a("measurement.test.test_boolean_flag", bool, hb.f15874l, false);
        f13404b0 = a("measurement.test.test_string_flag", "---", kc.f15922l, false);
        f13407c0 = a("measurement.test.test_long_flag", -1L, bt.f.f18468m, false);
        a("measurement.test.test_cached_long_flag", -1L, io.sentry.hints.i.f67287m, true);
        f13410d0 = a("measurement.test.test_int_flag", -2, hb.f15875m, false);
        f13413e0 = a("measurement.test.test_double_flag", Double.valueOf(-3.0d), kc.f15923m, false);
        a("measurement.experiment.max_ids", 50, bk.e.n, false);
        f13416f0 = a("measurement.upload.max_item_scoped_custom_parameters", 27, bt.f.n, false);
        f13419g0 = a("measurement.upload.max_event_parameter_value_length", 500, io.sentry.hints.i.n, true);
        f13421h0 = a("measurement.max_bundles_per_iteration", 100, hb.n, false);
        f13423i0 = a("measurement.sdk.attribution.cache.ttl", 604800000L, kc.n, false);
        f13425j0 = a("measurement.redaction.app_instance_id.ttl", 7200000L, bk.e.o, false);
        f13428k0 = a("measurement.rb.attribution.client.min_ad_services_version", 7, io.sentry.hints.i.o, false);
        f13430l0 = a("measurement.dma_consent.max_daily_dcu_realtime_events", 1, hb.o, false);
        f13432m0 = a("measurement.rb.attribution.uri_scheme", "https", kc.o, false);
        f13433n0 = a("measurement.rb.attribution.uri_authority", "google-analytics.com", bk.e.f17953p, false);
        f13434o0 = a("measurement.rb.attribution.uri_path", "privacy-sandbox/register-app-conversion", bt.f.f18469p, false);
        f13436p0 = a("measurement.session.engagement_interval", 3600000L, io.sentry.hints.i.f67288p, false);
        f13438q0 = a("measurement.rb.attribution.app_allowlist", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, hb.f15876p, false);
        f13440r0 = a("measurement.rb.attribution.user_properties", "_npa,npa|_fot,fot", kc.f15924p, false);
        f13442s0 = a("measurement.rb.attribution.event_params", "value|currency", bk.e.f17954q, false);
        f13444t0 = a("measurement.rb.attribution.query_parameters_to_remove", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, bt.f.f18470q, false);
        f13446u0 = a("measurement.rb.attribution.max_queue_time", 864000000L, hb.f15877q, false);
        f13448v0 = a("measurement.rb.attribution.max_retry_delay_seconds", 16, kc.f15925q, false);
        f13450w0 = a("measurement.rb.attribution.client.min_time_after_boot_seconds", 90, bk.e.f17955r, false);
        a("measurement.rb.attribution.max_trigger_uris_queried_at_once", 0, bt.f.f18471r, false);
        f13452x0 = a("measurement.rb.max_trigger_registrations_per_day", 1000, io.sentry.hints.i.f67290r, false);
        Boolean bool2 = Boolean.TRUE;
        f13454y0 = a("measurement.config.bundle_for_all_apps_on_backgrounded", bool2, hb.f15878r, false);
        f13456z0 = a("measurement.config.notify_trigger_uris_on_backgrounded", bool2, kc.f15926r, false);
        A0 = a("measurement.rb.attribution.notify_app_delay_millis", 3000, bk.e.f17956s, false);
        a("measurement.config.default_flag_values", bool2, bt.f.f18472s, false);
        B0 = a("measurement.upload.diagnostic_upload_interval", 3600000L, io.sentry.hints.i.f67291s, false);
        C0 = a("measurement.quality.checksum", bool, null, false);
        D0 = a("measurement.audience.use_bundle_end_timestamp_for_non_sequence_property_filters", bool, kc.f15927s, false);
        E0 = a("measurement.audience.refresh_event_count_filters_timestamp", bool, bk.e.f17957t, false);
        F0 = a("measurement.audience.use_bundle_timestamp_for_event_count_filters", bool, bt.f.f18473t, true);
        G0 = a("measurement.sdk.collection.last_deep_link_referrer_campaign2", bool, io.sentry.hints.i.f67292t, false);
        H0 = a("measurement.integration.disable_firebase_instance_id", bool, hb.f15880t, false);
        I0 = a("measurement.collection.service.update_with_analytics_fix", bool, kc.f15928t, false);
        J0 = a("measurement.service.storage_consent_support_version", 203600, bk.e.f17958u, false);
        K0 = a("measurement.service.store_null_safelist", bool2, bt.f.f18474u, false);
        L0 = a("measurement.service.store_safelist", bool2, io.sentry.hints.i.f67293u, false);
        M0 = a("measurement.session_stitching_token_enabled", bool, hb.f15881u, false);
        N0 = a("measurement.sgtm.client.upload_on_backgrounded.dev", bool, bk.e.f17959v, true);
        O0 = a("measurement.rb.attribution.service", bool2, bt.f.f18475v, true);
        P0 = a("measurement.rb.attribution.client2", bool2, io.sentry.hints.i.f67294v, true);
        Q0 = a("measurement.rb.attribution.uuid_generation", bool2, hb.f15882v, false);
        R0 = a("measurement.rb.attribution.enable_trigger_redaction", bool2, kc.f15930v, false);
        S0 = a("measurement.client.sessions.enable_fix_background_engagement", bool2, bt.f.f18478y, false);
        a("measurement.rb.attribution.service.enable_max_trigger_uris_queried_at_once", bool2, bk.e.f17960w, false);
        a("measurement.remove_conflicting_first_party_apis.dev", bool, bt.f.f18476w, false);
        T0 = a("measurement.rb.attribution.service.trigger_uris_high_priority", bool2, io.sentry.hints.i.f67295w, false);
        U0 = a("measurement.experiment.enable_phenotype_experiment_reporting", bool2, hb.f15883w, false);
        V0 = a("measurement.experiment.enable_passthrough_experiment_reporting", bool2, kc.f15931w, false);
        W0 = a("measurement.set_default_event_parameters.fix_service_request_ordering", bool, io.sentry.hints.i.f67276b, false);
        X0 = a("measurement.set_default_event_parameters.fix_app_update_logging", bool2, bt.f.f18457b, false);
        Y0 = a("measurement.service.fix_stop_bundling_bug", bool2, bk.e.f17942c, false);
        Z0 = a("measurement.gbraid_campaign.stop_lgclid", bool, hb.f15884x, false);
        f13402a1 = a("measurement.gbraid_campaign.deep_link_url", bool, io.sentry.hints.i.f67296x, false);
        f13405b1 = a("measurement.gbraid_compaign.compaign_params_triggering_info_update", "gclid,gbraid,gad_campaignid", io.sentry.hints.i.f67277c, false);
        f13408c1 = a("measurement.edpb.service", bool, kc.f15912b, false);
        f13411d1 = a("measurement.edpb.events_cached_in_no_data_mode", "_f,_v,_cmp", hb.f15865c, false);
        f13414e1 = a("measurement.robust_time_source_2", bool, bk.e.f17962y, false);
        f13417f1 = a("measurement.manual_iap_logging.client_service", bool, kc.f15932x, false);
        g1 = a("measurement.dsid_consent_only.app_allowlist1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, kc.f15913c, false);
        h1 = a("measurement.dsid_consent_only.app_allowlist2", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, bk.e.f17943d, false);
        i1 = a("measurement.dsid_consent_only.app_allowlist3", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, bt.f.f18459d, false);
        f13426j1 = a("measurement.diagnostics.enabled", bool, hb.f15864b, false);
    }

    public static w a(String str, Object obj, s sVar, boolean z11) {
        w wVar = new w(str, obj, sVar);
        if (z11) {
            f13400a.add(wVar);
        }
        return wVar;
    }
}
