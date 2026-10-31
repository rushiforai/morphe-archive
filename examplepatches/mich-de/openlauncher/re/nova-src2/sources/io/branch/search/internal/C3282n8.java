package io.branch.search.internal;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.EnumC3107d2;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.n8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3282n8 implements InterfaceC3299o8 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: m0, reason: collision with root package name */
    @NotNull
    public static final List<C3383t8> f65345m0 = ul.b.Q(new C3383t8(1, 1000000, "ALL_LOCAL", "ALL_CELLULAR"), new C3383t8(7, 2500000, "ALL_LOCAL", "ALL_CELLULAR"), new C3383t8(1, 10000000, "ALL_LOCAL|ANALYTICS", null), new C3383t8(1, 100000, "ANALYTICS", "ALL_CELLULAR"));

    /* renamed from: n0, reason: collision with root package name */
    @NotNull
    public static final List<Integer> f65346n0 = ul.b.P(1);

    /* renamed from: o0, reason: collision with root package name */
    @JvmField
    @NotNull
    public static final C3282n8 f65347o0 = new C3282n8(0);
    public final int A;
    public final long B;
    public final int C;
    public final int D;
    public final long E;
    public final int F;
    public final boolean G;
    public final boolean H;
    public final boolean I;

    @NotNull
    public final String J;
    public final boolean K;
    public final long L;
    public final int M;

    @NotNull
    public final Map<String, String> N;
    public final boolean O;

    @NotNull
    public final List<String> P;
    public final long Q;

    @NotNull
    public final A3 R;

    @gn.c("retry_config")
    @NotNull
    public final Pb S;

    @Nullable
    public final Integer T;

    @gn.c("all_features")
    @NotNull
    public final E U;
    public final int V;
    public final int W;
    public final boolean X;

    @NotNull
    public final a50.b Y;
    public final long Z;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65348a;

    /* renamed from: a0, reason: collision with root package name */
    @NotNull
    public final Nf f65349a0;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f65350b;

    /* renamed from: b0, reason: collision with root package name */
    @NotNull
    public final List<String> f65351b0;

    /* renamed from: c, reason: collision with root package name */
    public final int f65352c;

    /* renamed from: c0, reason: collision with root package name */
    public final boolean f65353c0;

    /* renamed from: d, reason: collision with root package name */
    public final int f65354d;

    /* renamed from: d0, reason: collision with root package name */
    @NotNull
    public final C3135ed f65355d0;

    /* renamed from: e, reason: collision with root package name */
    public final int f65356e;

    /* renamed from: e0, reason: collision with root package name */
    public final float f65357e0;

    /* renamed from: f, reason: collision with root package name */
    public final int f65358f;

    /* renamed from: f0, reason: collision with root package name */
    @NotNull
    public final List<String> f65359f0;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f65360g;

    /* renamed from: g0, reason: collision with root package name */
    @NotNull
    public final List<String> f65361g0;

    /* renamed from: h, reason: collision with root package name */
    public final float f65362h;

    /* renamed from: h0, reason: collision with root package name */
    @NotNull
    public final Set<u40.a> f65363h0;

    /* renamed from: i, reason: collision with root package name */
    public final int f65364i;

    /* renamed from: i0, reason: collision with root package name */
    @NotNull
    public final Set<u40.a> f65365i0;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final Integer f65366j;

    /* renamed from: j0, reason: collision with root package name */
    @NotNull
    public final List<u40.a> f65367j0;

    /* renamed from: k, reason: collision with root package name */
    public final int f65368k;

    /* renamed from: k0, reason: collision with root package name */
    @NotNull
    public final List<u40.a> f65369k0;

    /* renamed from: l, reason: collision with root package name */
    public final int f65370l;

    /* renamed from: l0, reason: collision with root package name */
    public final boolean f65371l0;

    /* renamed from: m, reason: collision with root package name */
    public final int f65372m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final String f65373p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f65374q;

    /* renamed from: r, reason: collision with root package name */
    @NotNull
    public final List<C3383t8> f65375r;

    /* renamed from: s, reason: collision with root package name */
    @NotNull
    public final List<Integer> f65376s;

    /* renamed from: t, reason: collision with root package name */
    public final int f65377t;

    /* renamed from: u, reason: collision with root package name */
    public final int f65378u;

    /* renamed from: v, reason: collision with root package name */
    public final int f65379v;

    /* renamed from: w, reason: collision with root package name */
    @NotNull
    public final HashMap<String, HashMap<String, Integer>> f65380w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f65381x;

    /* renamed from: y, reason: collision with root package name */
    public final boolean f65382y;

    /* renamed from: z, reason: collision with root package name */
    public final boolean f65383z;

    /* renamed from: io.branch.search.internal.n8$a */
    public static final class a {
    }

    public C3282n8() {
        this(0);
    }

    @NotNull
    public final A3 a() {
        return this.R;
    }

    @NotNull
    public final List<String> b() {
        return this.P;
    }

    public final int c() {
        return this.o;
    }

    @NotNull
    public final Pb d() {
        return this.S;
    }

    public final int e() {
        return this.f65377t;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3282n8)) {
            return false;
        }
        C3282n8 c3282n8 = (C3282n8) obj;
        return Intrinsics.b(this.f65348a, c3282n8.f65348a) && Intrinsics.b(this.f65350b, c3282n8.f65350b) && this.f65352c == c3282n8.f65352c && this.f65354d == c3282n8.f65354d && this.f65356e == c3282n8.f65356e && this.f65358f == c3282n8.f65358f && this.f65360g == c3282n8.f65360g && Float.valueOf(this.f65362h).equals(Float.valueOf(c3282n8.f65362h)) && this.f65364i == c3282n8.f65364i && Intrinsics.b(this.f65366j, c3282n8.f65366j) && this.f65368k == c3282n8.f65368k && this.f65370l == c3282n8.f65370l && this.f65372m == c3282n8.f65372m && this.n == c3282n8.n && this.o == c3282n8.o && Intrinsics.b(this.f65373p, c3282n8.f65373p) && Intrinsics.b(this.f65374q, c3282n8.f65374q) && Intrinsics.b(this.f65375r, c3282n8.f65375r) && Intrinsics.b(this.f65376s, c3282n8.f65376s) && this.f65377t == c3282n8.f65377t && this.f65378u == c3282n8.f65378u && this.f65379v == c3282n8.f65379v && Intrinsics.b(this.f65380w, c3282n8.f65380w) && this.f65381x == c3282n8.f65381x && this.f65382y == c3282n8.f65382y && this.f65383z == c3282n8.f65383z && this.A == c3282n8.A && this.B == c3282n8.B && this.C == c3282n8.C && this.D == c3282n8.D && this.E == c3282n8.E && this.F == c3282n8.F && this.G == c3282n8.G && this.H == c3282n8.H && this.I == c3282n8.I && Intrinsics.b(this.J, c3282n8.J) && this.K == c3282n8.K && this.L == c3282n8.L && this.M == c3282n8.M && Intrinsics.b(this.N, c3282n8.N) && this.O == c3282n8.O && Intrinsics.b(this.P, c3282n8.P) && this.Q == c3282n8.Q && Intrinsics.b(this.R, c3282n8.R) && Intrinsics.b(this.S, c3282n8.S) && Intrinsics.b(this.T, c3282n8.T) && Intrinsics.b(this.U, c3282n8.U) && this.V == c3282n8.V && this.W == c3282n8.W && this.X == c3282n8.X && this.Y == c3282n8.Y && this.Z == c3282n8.Z && Intrinsics.b(this.f65349a0, c3282n8.f65349a0) && Intrinsics.b(this.f65351b0, c3282n8.f65351b0) && this.f65353c0 == c3282n8.f65353c0 && Intrinsics.b(this.f65355d0, c3282n8.f65355d0) && Float.valueOf(this.f65357e0).equals(Float.valueOf(c3282n8.f65357e0)) && Intrinsics.b(this.f65359f0, c3282n8.f65359f0) && Intrinsics.b(this.f65361g0, c3282n8.f65361g0) && Intrinsics.b(this.f65363h0, c3282n8.f65363h0) && Intrinsics.b(this.f65365i0, c3282n8.f65365i0) && Intrinsics.b(this.f65367j0, c3282n8.f65367j0) && Intrinsics.b(this.f65369k0, c3282n8.f65369k0) && this.f65371l0 == c3282n8.f65371l0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3214j8.a(this.f65358f, C3214j8.a(this.f65356e, C3214j8.a(this.f65354d, C3214j8.a(this.f65352c, C3248l8.a(this.f65350b, this.f65348a.hashCode() * 31, 31), 31), 31), 31), 31);
        boolean z11 = this.f65360g;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iA2 = C3214j8.a(this.f65364i, a80.m.d(this.f65362h, (iA + i5) * 31, 31), 31);
        Integer num = this.f65366j;
        int iHashCode = (this.f65380w.hashCode() + C3214j8.a(this.f65379v, C3214j8.a(this.f65378u, C3214j8.a(this.f65377t, C3265m8.a(this.f65376s, C3265m8.a(this.f65375r, x8.h.c(this.f65374q, C3248l8.a(this.f65373p, C3214j8.a(this.o, C3214j8.a(this.n, C3214j8.a(this.f65372m, C3214j8.a(this.f65370l, C3214j8.a(this.f65368k, (iA2 + (num == null ? 0 : num.hashCode())) * 31, 31), 31), 31), 31), 31), 31), 31), 31), 31), 31), 31), 31)) * 31;
        boolean z12 = this.f65381x;
        int i11 = z12;
        if (z12 != 0) {
            i11 = 1;
        }
        int i12 = (iHashCode + i11) * 31;
        boolean z13 = this.f65382y;
        int i13 = z13;
        if (z13 != 0) {
            i13 = 1;
        }
        int i14 = (i12 + i13) * 31;
        boolean z14 = this.f65383z;
        int i15 = z14;
        if (z14 != 0) {
            i15 = 1;
        }
        int iA3 = C3214j8.a(this.F, C3231k8.a(this.E, C3214j8.a(this.D, C3214j8.a(this.C, C3231k8.a(this.B, C3214j8.a(this.A, (i14 + i15) * 31, 31), 31), 31), 31), 31), 31);
        boolean z15 = this.G;
        int i16 = z15;
        if (z15 != 0) {
            i16 = 1;
        }
        int i17 = (iA3 + i16) * 31;
        boolean z16 = this.H;
        int i18 = z16;
        if (z16 != 0) {
            i18 = 1;
        }
        int i19 = (i17 + i18) * 31;
        boolean z17 = this.I;
        int i21 = z17;
        if (z17 != 0) {
            i21 = 1;
        }
        int iA4 = C3248l8.a(this.J, (i19 + i21) * 31, 31);
        boolean z18 = this.K;
        int i22 = z18;
        if (z18 != 0) {
            i22 = 1;
        }
        int iC = x8.h.c(this.N, C3214j8.a(this.M, C3231k8.a(this.L, (iA4 + i22) * 31, 31), 31), 31);
        boolean z19 = this.O;
        int i23 = z19;
        if (z19 != 0) {
            i23 = 1;
        }
        int iHashCode2 = (this.S.hashCode() + ((this.R.hashCode() + C3231k8.a(this.Q, C3265m8.a(this.P, (iC + i23) * 31, 31), 31)) * 31)) * 31;
        Integer num2 = this.T;
        int iA5 = C3214j8.a(this.W, C3214j8.a(this.V, (this.U.hashCode() + ((iHashCode2 + (num2 != null ? num2.hashCode() : 0)) * 31)) * 31, 31), 31);
        boolean z21 = this.X;
        int i24 = z21;
        if (z21 != 0) {
            i24 = 1;
        }
        int iA6 = C3265m8.a(this.f65351b0, C3248l8.a(this.f65349a0.f62997a, C3231k8.a(this.Z, (this.Y.hashCode() + ((iA5 + i24) * 31)) * 31, 31), 31), 31);
        boolean z22 = this.f65353c0;
        int i25 = z22;
        if (z22 != 0) {
            i25 = 1;
        }
        int iA7 = C3265m8.a(this.f65369k0, C3265m8.a(this.f65367j0, h6.c1.k(this.f65365i0, h6.c1.k(this.f65363h0, C3265m8.a(this.f65361g0, C3265m8.a(this.f65359f0, a80.m.d(this.f65357e0, (this.f65355d0.hashCode() + ((iA6 + i25) * 31)) * 31, 31), 31), 31), 31), 31), 31), 31);
        boolean z23 = this.f65371l0;
        return iA7 + (z23 ? 1 : z23 ? 1 : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("KBranchRemoteConfiguration(enc_key=");
        sb2.append(this.f65348a);
        sb2.append(", enc_key_id=");
        sb2.append(this.f65350b);
        sb2.append(", network_data_retention_window=");
        sb2.append(this.f65352c);
        sb2.append(", analytics_records_limit=");
        sb2.append(this.f65354d);
        sb2.append(", fallback_latency_threshold=");
        sb2.append(this.f65356e);
        sb2.append(", fallback_latency_threshold_zero_state=");
        sb2.append(this.f65358f);
        sb2.append(", fallback_outside_to_sesame=");
        sb2.append(this.f65360g);
        sb2.append(", fallback_outside_threshold_multiplier=");
        sb2.append(this.f65362h);
        sb2.append(", fallback_outside_results_cap=");
        sb2.append(this.f65364i);
        sb2.append(", remote_latency_threshold=");
        sb2.append(this.f65366j);
        sb2.append(", ads_zero_state_threshold=");
        sb2.append(this.f65368k);
        sb2.append(", ads_zero_state_background_threshold=");
        sb2.append(this.f65370l);
        sb2.append(", ads_suggested_apps_threshold=");
        sb2.append(this.f65372m);
        sb2.append(", content_provider_timeout=");
        sb2.append(this.n);
        sb2.append(", ping_job_cap=");
        sb2.append(this.o);
        sb2.append(", sdk_device_id=");
        sb2.append(this.f65373p);
        sb2.append(", identity_cookies=");
        sb2.append(this.f65374q);
        sb2.append(", network_capping_rules=");
        sb2.append(this.f65375r);
        sb2.append(", app_usage_event_types=");
        sb2.append(this.f65376s);
        sb2.append(", sqlite_max_cache_size=");
        sb2.append(this.f65377t);
        sb2.append(", payload_upload_max_count=");
        sb2.append(this.f65378u);
        sb2.append(", analytics_multi_val_restore_max_size=");
        sb2.append(this.f65379v);
        sb2.append(", observable_request_trigger_conf=");
        sb2.append(this.f65380w);
        sb2.append(", enable_clusters=");
        sb2.append(this.f65381x);
        sb2.append(", analytics_shrink_result_list=");
        sb2.append(this.f65382y);
        sb2.append(", analytics_ignore_empty_values=");
        sb2.append(this.f65383z);
        sb2.append(", group_data_ttl=");
        sb2.append(this.A);
        sb2.append(", offline_session_limit=");
        sb2.append(this.B);
        sb2.append(", branch_job_ard_min_sec=");
        sb2.append(this.C);
        sb2.append(", branch_job_ard_max_sec=");
        sb2.append(this.D);
        sb2.append(", payload_upload_max_bytes=");
        sb2.append(this.E);
        sb2.append(", max_payloads_to_store_on_disk=");
        sb2.append(this.F);
        sb2.append(", enable_crash_reporting=");
        sb2.append(this.G);
        sb2.append(", enable_crash_filtering=");
        sb2.append(this.H);
        sb2.append(", enable_crash_suppress=");
        sb2.append(this.I);
        sb2.append(", crash_filtering_regex=");
        sb2.append(this.J);
        sb2.append(", crash_loop_handler_enabled=");
        sb2.append(this.K);
        sb2.append(", crash_loop_hindsight=");
        sb2.append(this.L);
        sb2.append(", crash_loop_detection_cap=");
        sb2.append(this.M);
        sb2.append(", app_store_query_param_bindings=");
        sb2.append(this.N);
        sb2.append(", app_store_use_api=");
        sb2.append(this.O);
        sb2.append(", error_ping_param_rule=");
        sb2.append(this.P);
        sb2.append(", scheduled_queries_timeout=");
        sb2.append(this.Q);
        sb2.append(", cacheConfig=");
        sb2.append(this.R);
        sb2.append(", retryConfig=");
        sb2.append(this.S);
        sb2.append(", max_url_impression_tracking_pos=");
        sb2.append(this.T);
        sb2.append(", allFeatures=");
        sb2.append(this.U);
        sb2.append(", max_zs_suggested_apps=");
        sb2.append(this.V);
        sb2.append(", max_zs_suggested_links=");
        sb2.append(this.W);
        sb2.append(", sentry_logging_enabled=");
        sb2.append(this.X);
        sb2.append(", sentry_logging_level=");
        sb2.append(this.Y);
        sb2.append(", zero_state_cache_refresh_interval=");
        sb2.append(this.Z);
        sb2.append(", zero_state_cache_remote_config=");
        sb2.append(this.f65349a0);
        sb2.append(", zero_state_container_order=");
        sb2.append(this.f65351b0);
        sb2.append(", run_gc_during_package_ingestion=");
        sb2.append(this.f65353c0);
        sb2.append(", search_config=");
        sb2.append(this.f65355d0);
        sb2.append(", detailed_analytics_device_threshold=");
        sb2.append(this.f65357e0);
        sb2.append(", always_tracked_analytics_objects_keys=");
        sb2.append(this.f65359f0);
        sb2.append(", always_tracked_diagnostics_keys=");
        sb2.append(this.f65361g0);
        sb2.append(", zero_state_app_data_types=");
        sb2.append(this.f65363h0);
        sb2.append(", zero_state_links_data_types=");
        sb2.append(this.f65365i0);
        sb2.append(", search_app_data_types=");
        sb2.append(this.f65367j0);
        sb2.append(", search_shortcut_data_types=");
        sb2.append(this.f65369k0);
        sb2.append(", use_activity_callbacks_for_lifecycle_notifications=");
        return a2.c.p(sb2, this.f65371l0, ')');
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C3282n8(@NotNull String enc_key, @NotNull String enc_key_id, int i5, int i11, int i12, int i13, boolean z11, float f11, int i14, @Nullable Integer num, int i15, int i16, int i17, int i18, int i19, @NotNull String sdk_device_id, @NotNull Map<String, String> identity_cookies, @NotNull List<C3383t8> network_capping_rules, @NotNull List<Integer> app_usage_event_types, int i21, int i22, int i23, @NotNull HashMap<String, HashMap<String, Integer>> observable_request_trigger_conf, boolean z12, boolean z13, boolean z14, int i24, long j11, int i25, int i26, long j12, int i27, boolean z15, boolean z16, boolean z17, @NotNull String crash_filtering_regex, boolean z18, long j13, int i28, @NotNull Map<String, String> app_store_query_param_bindings, boolean z19, @NotNull List<String> error_ping_param_rule, long j14, @NotNull A3 cacheConfig, @NotNull Pb retryConfig, @Nullable Integer num2, @NotNull E allFeatures, int i29, int i31, boolean z21, @NotNull a50.b sentry_logging_level, long j15, @NotNull Nf zero_state_cache_remote_config, @NotNull List<String> zero_state_container_order, boolean z22, @NotNull C3135ed search_config, float f12, @NotNull List<String> always_tracked_analytics_objects_keys, @NotNull List<String> always_tracked_diagnostics_keys, @NotNull Set<? extends u40.a> zero_state_app_data_types, @NotNull Set<? extends u40.a> zero_state_links_data_types, @NotNull List<? extends u40.a> search_app_data_types, @NotNull List<? extends u40.a> search_shortcut_data_types, boolean z23) {
        Intrinsics.g(enc_key, "enc_key");
        Intrinsics.g(enc_key_id, "enc_key_id");
        Intrinsics.g(sdk_device_id, "sdk_device_id");
        Intrinsics.g(identity_cookies, "identity_cookies");
        Intrinsics.g(network_capping_rules, "network_capping_rules");
        Intrinsics.g(app_usage_event_types, "app_usage_event_types");
        Intrinsics.g(observable_request_trigger_conf, "observable_request_trigger_conf");
        Intrinsics.g(crash_filtering_regex, "crash_filtering_regex");
        Intrinsics.g(app_store_query_param_bindings, "app_store_query_param_bindings");
        Intrinsics.g(error_ping_param_rule, "error_ping_param_rule");
        Intrinsics.g(cacheConfig, "cacheConfig");
        Intrinsics.g(retryConfig, "retryConfig");
        Intrinsics.g(allFeatures, "allFeatures");
        Intrinsics.g(sentry_logging_level, "sentry_logging_level");
        Intrinsics.g(zero_state_cache_remote_config, "zero_state_cache_remote_config");
        Intrinsics.g(zero_state_container_order, "zero_state_container_order");
        Intrinsics.g(search_config, "search_config");
        Intrinsics.g(always_tracked_analytics_objects_keys, "always_tracked_analytics_objects_keys");
        Intrinsics.g(always_tracked_diagnostics_keys, "always_tracked_diagnostics_keys");
        Intrinsics.g(zero_state_app_data_types, "zero_state_app_data_types");
        Intrinsics.g(zero_state_links_data_types, "zero_state_links_data_types");
        Intrinsics.g(search_app_data_types, "search_app_data_types");
        Intrinsics.g(search_shortcut_data_types, "search_shortcut_data_types");
        this.f65348a = enc_key;
        this.f65350b = enc_key_id;
        this.f65352c = i5;
        this.f65354d = i11;
        this.f65356e = i12;
        this.f65358f = i13;
        this.f65360g = z11;
        this.f65362h = f11;
        this.f65364i = i14;
        this.f65366j = num;
        this.f65368k = i15;
        this.f65370l = i16;
        this.f65372m = i17;
        this.n = i18;
        this.o = i19;
        this.f65373p = sdk_device_id;
        this.f65374q = identity_cookies;
        this.f65375r = network_capping_rules;
        this.f65376s = app_usage_event_types;
        this.f65377t = i21;
        this.f65378u = i22;
        this.f65379v = i23;
        this.f65380w = observable_request_trigger_conf;
        this.f65381x = z12;
        this.f65382y = z13;
        this.f65383z = z14;
        this.A = i24;
        this.B = j11;
        this.C = i25;
        this.D = i26;
        this.E = j12;
        this.F = i27;
        this.G = z15;
        this.H = z16;
        this.I = z17;
        this.J = crash_filtering_regex;
        this.K = z18;
        this.L = j13;
        this.M = i28;
        this.N = app_store_query_param_bindings;
        this.O = z19;
        this.P = error_ping_param_rule;
        this.Q = j14;
        this.R = cacheConfig;
        this.S = retryConfig;
        this.T = num2;
        this.U = allFeatures;
        this.V = i29;
        this.W = i31;
        this.X = z21;
        this.Y = sentry_logging_level;
        this.Z = j15;
        this.f65349a0 = zero_state_cache_remote_config;
        this.f65351b0 = zero_state_container_order;
        this.f65353c0 = z22;
        this.f65355d0 = search_config;
        this.f65357e0 = f12;
        this.f65359f0 = always_tracked_analytics_objects_keys;
        this.f65361g0 = always_tracked_diagnostics_keys;
        this.f65363h0 = zero_state_app_data_types;
        this.f65365i0 = zero_state_links_data_types;
        this.f65367j0 = search_app_data_types;
        this.f65369k0 = search_shortcut_data_types;
        this.f65371l0 = z23;
    }

    public C3282n8(int i5) {
        String strJ = b.c0.j("randomUUID().toString()");
        HashMap map = new HashMap();
        List<C3383t8> list = f65345m0;
        List<Integer> list2 = f65346n0;
        EnumC3107d2.Companion.getClass();
        HashMap mapA = EnumC3107d2.a.a();
        long millis = TimeUnit.DAYS.toMillis(1L);
        Map mapJ0 = MapsKt.j0(new Pair("user_query", "user_query"), new Pair("branch_key", Q1.a(1)), new Pair("user_locale", C3056a2.a(7)), new Pair("country", Q1.a(2)));
        List listP = ul.b.P(C3056a2.a(11));
        A3 a32 = new A3(TTAdConstant.AD_MAX_EVENT_TIME, false);
        Pb pb2 = new Pb(0);
        E e3 = new E(0);
        Nf nf2 = new Nf(0);
        List listQ = ul.b.Q("suggested_apps", "suggested_links", "suggested_installs_zs");
        C3135ed c3135ed = new C3135ed(0);
        List listQ2 = ul.b.Q("virtual_request", "custom_events");
        List listQ3 = ul.b.Q("device_info_diagnostic", "crash_info_diagnostic");
        u40.a aVar = u40.a.f90553b;
        Set setU = ab.e0.U(aVar);
        EnumSet enumSet = u40.a.f90552a;
        EnumSet enumSet2 = u40.a.f90552a;
        Intrinsics.f(enumSet2, "LinkType.ALL_DEEP_LINKS");
        this("f2ca1bb6c7e907d06dafe4687e579fce", "2be9fb0d-c5c3-44d4-9abe-2931ba4bb3ae", 40, 1000, 750, 750, true, 2.0f, 10, null, Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, 3500, Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, 5000, 30, strJ, map, list, list2, 100, 100, 200, mapA, false, true, true, 600000, millis, 5, 15, 4194304L, 100, true, true, true, "(?s).*(\\sio\\.branch).*", true, 60000L, 3, mapJ0, true, listP, 60000L, a32, pb2, null, e3, 16, 10, true, a50.b.f403d, 3600000L, nf2, listQ, true, c3135ed, 5.0f, listQ2, listQ3, setU, enumSet2, ul.b.P(aVar), ul.b.Q(u40.a.f90559h, u40.a.f90554c, u40.a.f90556e, u40.a.f90557f), true);
    }
}
