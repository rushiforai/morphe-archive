package s90;

import android.net.http.ConnectionMigrationOptions;
import android.net.http.DnsOptions;
import android.net.http.HttpEngine;
import android.net.http.QuicOptions;
import android.util.Log;
import java.time.Duration;
import java.util.Date;
import java.util.Set;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.chromium.net.CronetEngine;
import org.chromium.net.ExperimentalCronetEngine;
import org.chromium.net.ICronetEngineBuilder;

/* loaded from: classes5.dex */
public final class g extends ICronetEngineBuilder {

    /* renamed from: b, reason: collision with root package name */
    public static boolean f86943b;

    /* renamed from: c, reason: collision with root package name */
    public static boolean f86944c;

    /* renamed from: a, reason: collision with root package name */
    public final HttpEngine.Builder f86945a;

    public g(HttpEngine.Builder builder) {
        this.f86945a = builder;
    }

    public static int a(int i5) {
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return 0;
        }
        if (iF == 1) {
            return 1;
        }
        if (iF == 2) {
            return 2;
        }
        throw new AssertionError("Invalid OptionalBoolean value: ".concat(i5 != 1 ? i5 != 2 ? i5 != 3 ? AbstractJsonLexerKt.NULL : "FALSE" : "TRUE" : "UNSET"));
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder addPublicKeyPins(String str, Set set, boolean z11, Date date) {
        this.f86945a.addPublicKeyPins(str, set, z11, date.toInstant());
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder addQuicHint(String str, int i5, int i11) {
        this.f86945a.addQuicHint(str, i5, i11);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ExperimentalCronetEngine build() {
        return new h(this.f86945a.build());
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableBrotli(boolean z11) {
        this.f86945a.setEnableBrotli(z11);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableHttp2(boolean z11) {
        this.f86945a.setEnableHttp2(z11);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableHttpCache(int i5, long j11) {
        this.f86945a.setEnableHttpCache(i5, j11);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableNetworkQualityEstimator(boolean z11) {
        if (!f86944c) {
            Log.i("HttpEngBuilderWrap", "NetworkQualityEstimator is unsupported when HttpEngineNativeProvider is used");
            f86944c = true;
        }
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enablePublicKeyPinningBypassForLocalTrustAnchors(boolean z11) {
        this.f86945a.setEnablePublicKeyPinningBypassForLocalTrustAnchors(z11);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableQuic(boolean z11) {
        this.f86945a.setEnableQuic(z11);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableSdch(boolean z11) {
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final String getDefaultUserAgent() {
        return this.f86945a.getDefaultUserAgent();
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setExperimentalOptions(String str) {
        t90.c cVar = new t90.c(str);
        HttpEngine.Builder builder = this.f86945a;
        ConnectionMigrationOptions.Builder builderA = e.a();
        builderA.setDefaultNetworkMigration(a(qm.e.a((Boolean) cVar.b("QUIC", "migrate_sessions_on_network_change_v2", null, Boolean.class))));
        builderA.setPathDegradationMigration(a(qm.e.a((Boolean) cVar.b("QUIC", "allow_port_migration", null, Boolean.class))));
        int iA = qm.e.a((Boolean) cVar.b("QUIC", "migrate_sessions_early_v2", null, Boolean.class));
        builderA.setAllowNonDefaultNetworkUsage(a(iA));
        if (iA == 2) {
            builderA.setPathDegradationMigration(a(2));
        }
        builder.setConnectionMigrationOptions(builderA.build());
        HttpEngine.Builder builder2 = this.f86945a;
        DnsOptions.StaleDnsOptions.Builder builderF = e.f();
        int iIntValue = ((Integer) cVar.b("StaleDNS", "delay_ms", -1, Integer.class)).intValue();
        if (iIntValue != -1) {
            builderF.setFreshLookupTimeout(Duration.ofMillis(iIntValue));
        }
        int iIntValue2 = ((Integer) cVar.b("StaleDNS", "max_expired_time_ms", -1, Integer.class)).intValue();
        if (iIntValue2 != -1) {
            builderF.setMaxExpiredDelay(Duration.ofMillis(iIntValue2));
        }
        builderF.setAllowCrossNetworkUsage(a(qm.e.a((Boolean) cVar.b("StaleDNS", "allow_other_network", null, Boolean.class)))).setUseStaleOnNameNotResolved(a(qm.e.a((Boolean) cVar.b("StaleDNS", "use_stale_on_name_not_resolved", null, Boolean.class))));
        DnsOptions.Builder builderC = e.c();
        builderC.setUseHttpStackDnsResolver(a(qm.e.a((Boolean) cVar.b("AsyncDNS", "enable", null, Boolean.class)))).setStaleDns(a(qm.e.a((Boolean) cVar.b("StaleDNS", "enable", null, Boolean.class)))).setStaleDnsOptions(builderF.build()).setPreestablishConnectionsToStaleDnsResults(a(qm.e.a((Boolean) cVar.b("QUIC", "race_stale_dns_on_connection", null, Boolean.class)))).setPersistHostCache(a(qm.e.a((Boolean) cVar.b("StaleDNS", "persist_to_disk", null, Boolean.class))));
        int iIntValue3 = ((Integer) cVar.b("StaleDNS", "persist_delay_ms", -1, Integer.class)).intValue();
        if (iIntValue3 != -1) {
            builderC.setPersistHostCachePeriod(Duration.ofMillis(iIntValue3));
        }
        builder2.setDnsOptions(builderC.build());
        HttpEngine.Builder builder3 = this.f86945a;
        QuicOptions.Builder builderJ = e.j();
        if (((String) cVar.b("QUIC", "host_whitelist", null, String.class)) != null) {
            for (String str2 : ((String) cVar.b("QUIC", "host_whitelist", null, String.class)).split(",")) {
                builderJ.addAllowedQuicHost(str2);
            }
        }
        int iIntValue4 = ((Integer) cVar.b("QUIC", "max_server_configs_stored_in_properties", -1, Integer.class)).intValue();
        if (iIntValue4 != -1) {
            builderJ.setInMemoryServerConfigsCacheSize(iIntValue4);
        }
        String str3 = (String) cVar.b("QUIC", "user_agent_id", null, String.class);
        if (str3 != null) {
            builderJ.setHandshakeUserAgent(str3);
        }
        int iIntValue5 = ((Integer) cVar.b("QUIC", "idle_connection_timeout_seconds", -1, Integer.class)).intValue();
        if (iIntValue5 != -1) {
            builderJ.setIdleConnectionTimeout(Duration.ofSeconds(iIntValue5));
        }
        builder3.setQuicOptions(builderJ.build());
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setLibraryLoader(CronetEngine.Builder.LibraryLoader libraryLoader) {
        if (!f86943b) {
            Log.i("HttpEngBuilderWrap", "Custom library loader is unsupported when HttpEngineNativeProvider is used.");
            f86943b = true;
        }
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setStoragePath(String str) {
        this.f86945a.setStoragePath(str);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setThreadPriority(int i5) {
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setUserAgent(String str) {
        this.f86945a.setUserAgent(str);
        return this;
    }
}
