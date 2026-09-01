package defpackage;

import android.net.http.ConnectionMigrationOptions;
import android.net.http.DnsOptions;
import android.net.http.HttpEngine;
import android.net.http.QuicOptions;
import j$.time.Duration;
import j$.time.TimeConversions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tp extends d46 {
    public final HttpEngine.Builder t;

    public tp(HttpEngine.Builder builder) {
        this.t = builder;
    }

    public static int k0(aw8 aw8Var) {
        int i = sp.a[aw8Var.ordinal()];
        int i2 = 1;
        if (i != 1) {
            i2 = 2;
            if (i != 2) {
                if (i == 3) {
                    return 0;
                }
                ay0.d("Invalid OptionalBoolean value: ".concat(String.valueOf(aw8Var)));
                return 0;
            }
        }
        return i2;
    }

    @Override // defpackage.d46
    public final d46 d0(String str) {
        y54 y54Var = new y54(str);
        HttpEngine.Builder builder = this.t;
        ConnectionMigrationOptions.Builder builder2 = new ConnectionMigrationOptions.Builder();
        builder2.setDefaultNetworkMigration(k0(aw8.fromBoolean((Boolean) y54Var.c("QUIC", "migrate_sessions_on_network_change_v2", null, Boolean.class))));
        builder2.setPathDegradationMigration(k0(aw8.fromBoolean((Boolean) y54Var.c("QUIC", "allow_port_migration", null, Boolean.class))));
        aw8 aw8VarFromBoolean = aw8.fromBoolean((Boolean) y54Var.c("QUIC", "migrate_sessions_early_v2", null, Boolean.class));
        builder2.setAllowNonDefaultNetworkUsage(k0(aw8VarFromBoolean));
        aw8 aw8Var = aw8.TRUE;
        if (aw8VarFromBoolean == aw8Var) {
            builder2.setPathDegradationMigration(k0(aw8Var));
        }
        builder.setConnectionMigrationOptions(builder2.build());
        HttpEngine.Builder builder3 = this.t;
        DnsOptions.StaleDnsOptions.Builder builder4 = new DnsOptions.StaleDnsOptions.Builder();
        int iIntValue = ((Integer) y54Var.c("StaleDNS", "delay_ms", -1, Integer.class)).intValue();
        if (iIntValue != -1) {
            builder4.setFreshLookupTimeout(TimeConversions.convert(Duration.ofMillis(iIntValue)));
        }
        int iIntValue2 = ((Integer) y54Var.c("StaleDNS", "max_expired_time_ms", -1, Integer.class)).intValue();
        if (iIntValue2 != -1) {
            builder4.setMaxExpiredDelay(TimeConversions.convert(Duration.ofMillis(iIntValue2)));
        }
        builder4.setAllowCrossNetworkUsage(k0(aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "allow_other_network", null, Boolean.class)))).setUseStaleOnNameNotResolved(k0(aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "use_stale_on_name_not_resolved", null, Boolean.class))));
        DnsOptions.Builder builder5 = new DnsOptions.Builder();
        builder5.setUseHttpStackDnsResolver(k0(aw8.fromBoolean((Boolean) y54Var.c("AsyncDNS", "enable", null, Boolean.class)))).setStaleDns(k0(aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "enable", null, Boolean.class)))).setStaleDnsOptions(builder4.build()).setPreestablishConnectionsToStaleDnsResults(k0(aw8.fromBoolean((Boolean) y54Var.c("QUIC", "race_stale_dns_on_connection", null, Boolean.class)))).setPersistHostCache(k0(aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "persist_to_disk", null, Boolean.class))));
        int iIntValue3 = ((Integer) y54Var.c("StaleDNS", "persist_delay_ms", -1, Integer.class)).intValue();
        if (iIntValue3 != -1) {
            builder5.setPersistHostCachePeriod(TimeConversions.convert(Duration.ofMillis(iIntValue3)));
        }
        builder3.setDnsOptions(builder5.build());
        HttpEngine.Builder builder6 = this.t;
        QuicOptions.Builder builder7 = new QuicOptions.Builder();
        if (((String) y54Var.c("QUIC", "host_whitelist", null, String.class)) != null) {
            for (String str2 : ((String) y54Var.c("QUIC", "host_whitelist", null, String.class)).split(",")) {
                builder7.addAllowedQuicHost(str2);
            }
        }
        int iIntValue4 = ((Integer) y54Var.c("QUIC", "max_server_configs_stored_in_properties", -1, Integer.class)).intValue();
        if (iIntValue4 != -1) {
            builder7.setInMemoryServerConfigsCacheSize(iIntValue4);
        }
        String str3 = (String) y54Var.c("QUIC", "user_agent_id", null, String.class);
        if (str3 != null) {
            builder7.setHandshakeUserAgent(str3);
        }
        int iIntValue5 = ((Integer) y54Var.c("QUIC", "idle_connection_timeout_seconds", -1, Integer.class)).intValue();
        if (iIntValue5 != -1) {
            builder7.setIdleConnectionTimeout(TimeConversions.convert(Duration.ofSeconds(iIntValue5)));
        }
        builder6.setQuicOptions(builder7.build());
        return this;
    }

    @Override // defpackage.d46
    public final x54 v() {
        return new up(this.t.build());
    }
}
