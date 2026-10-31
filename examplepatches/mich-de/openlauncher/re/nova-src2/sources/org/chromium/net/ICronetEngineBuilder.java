package org.chromium.net;

import java.util.Collections;
import java.util.Date;
import java.util.Set;
import org.chromium.net.CronetEngine;

/* loaded from: classes5.dex */
public abstract class ICronetEngineBuilder {
    public static final int CONNECTION_MIGRATION_OPTIONS = 1;
    public static final int DNS_OPTIONS = 2;
    public static final int PROXY_OPTIONS = 4;
    public static final int QUIC_OPTIONS = 3;

    public abstract ICronetEngineBuilder addPublicKeyPins(String str, Set<byte[]> set, boolean z11, Date date);

    public abstract ICronetEngineBuilder addQuicHint(String str, int i5, int i11);

    public abstract ExperimentalCronetEngine build();

    public ICronetEngineBuilder enableBrotli(boolean z11) {
        return this;
    }

    public abstract ICronetEngineBuilder enableHttp2(boolean z11);

    public abstract ICronetEngineBuilder enableHttpCache(int i5, long j11);

    public ICronetEngineBuilder enableNetworkQualityEstimator(boolean z11) {
        return this;
    }

    public abstract ICronetEngineBuilder enablePublicKeyPinningBypassForLocalTrustAnchors(boolean z11);

    public abstract ICronetEngineBuilder enableQuic(boolean z11);

    public abstract ICronetEngineBuilder enableSdch(boolean z11);

    public abstract String getDefaultUserAgent();

    public long getLogCronetInitializationRef() {
        return 0L;
    }

    public Set<Integer> getSupportedConfigOptions() {
        return Collections.EMPTY_SET;
    }

    public ICronetEngineBuilder setConnectionMigrationOptions(ConnectionMigrationOptions connectionMigrationOptions) {
        return this;
    }

    public ICronetEngineBuilder setDnsOptions(DnsOptions dnsOptions) {
        return this;
    }

    public abstract ICronetEngineBuilder setExperimentalOptions(String str);

    public abstract ICronetEngineBuilder setLibraryLoader(CronetEngine.Builder.LibraryLoader libraryLoader);

    public ICronetEngineBuilder setProxyOptions(ProxyOptions proxyOptions) {
        throw new UnsupportedOperationException("This Cronet implementation does not support ProxyOptions");
    }

    public ICronetEngineBuilder setQuicOptions(QuicOptions quicOptions) {
        return this;
    }

    public abstract ICronetEngineBuilder setStoragePath(String str);

    public ICronetEngineBuilder setThreadPriority(int i5) {
        return this;
    }

    public abstract ICronetEngineBuilder setUserAgent(String str);
}
