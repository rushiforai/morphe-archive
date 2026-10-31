package org.chromium.net;

import java.time.Duration;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes5.dex */
public final class QuicOptions {
    private final Set<String> mClientConnectionOptions;
    private final Boolean mCloseSessionsOnIpChange;
    private final Set<String> mConnectionOptions;
    private final Long mCryptoHandshakeTimeoutSeconds;
    private final Boolean mDelayJobsWithAvailableSpdySession;
    private final Boolean mEnableTlsZeroRtt;
    private final Set<String> mEnabledQuicVersions;
    private final Set<String> mExtraQuicheFlags;
    private final Boolean mGoawaySessionsOnIpChange;
    private final String mHandshakeUserAgent;
    private final Long mIdleConnectionTimeoutSeconds;
    private final Integer mInMemoryServerConfigsCacheSize;
    private final Boolean mIncreaseBrokenServicePeriodExponentially;
    private final Long mInitialBrokenServicePeriodSeconds;
    private final Long mPreCryptoHandshakeIdleTimeoutSeconds;
    private final Set<String> mQuicHostAllowlist;
    private final Long mRetransmittableOnWireTimeoutMillis;
    private final Boolean mRetryWithoutAltSvcOnQuicErrors;

    public static class Builder {
        private Boolean mCloseSessionsOnIpChange;
        private Long mCryptoHandshakeTimeoutSeconds;
        private Boolean mDelayJobsWithAvailableSpdySession;
        private Boolean mEnableTlsZeroRtt;
        private Boolean mGoawaySessionsOnIpChange;
        private String mHandshakeUserAgent;
        private Long mIdleConnectionTimeoutSeconds;
        private Integer mInMemoryServerConfigsCacheSize;
        private Boolean mIncreaseBrokenServicePeriodExponentially;
        private Long mInitialBrokenServicePeriodSeconds;
        private Long mPreCryptoHandshakeIdleTimeoutSeconds;
        private Long mRetransmittableOnWireTimeoutMillis;
        private Boolean mRetryWithoutAltSvcOnQuicErrors;
        private final Set<String> mQuicHostAllowlist = new LinkedHashSet();
        private final Set<String> mEnabledQuicVersions = new LinkedHashSet();
        private final Set<String> mConnectionOptions = new LinkedHashSet();
        private final Set<String> mClientConnectionOptions = new LinkedHashSet();
        private final Set<String> mExtraQuicheFlags = new LinkedHashSet();

        public Builder addAllowedQuicHost(String str) {
            this.mQuicHostAllowlist.add(str);
            return this;
        }

        @QuichePassthroughOption
        public Builder addClientConnectionOption(String str) {
            this.mClientConnectionOptions.add(str);
            return this;
        }

        @QuichePassthroughOption
        public Builder addConnectionOption(String str) {
            this.mConnectionOptions.add(str);
            return this;
        }

        @QuichePassthroughOption
        public Builder addEnabledQuicVersion(String str) {
            this.mEnabledQuicVersions.add(str);
            return this;
        }

        @QuichePassthroughOption
        public Builder addExtraQuicheFlag(String str) {
            this.mExtraQuicheFlags.add(str);
            return this;
        }

        public QuicOptions build() {
            return new QuicOptions(this);
        }

        @Experimental
        public Builder closeSessionsOnIpChange(boolean z11) {
            this.mCloseSessionsOnIpChange = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder delayJobsWithAvailableSpdySession(boolean z11) {
            this.mDelayJobsWithAvailableSpdySession = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder enableTlsZeroRtt(boolean z11) {
            this.mEnableTlsZeroRtt = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder goawaySessionsOnIpChange(boolean z11) {
            this.mGoawaySessionsOnIpChange = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder increaseBrokenServicePeriodExponentially(boolean z11) {
            this.mIncreaseBrokenServicePeriodExponentially = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder retryWithoutAltSvcOnQuicErrors(boolean z11) {
            this.mRetryWithoutAltSvcOnQuicErrors = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder setCryptoHandshakeTimeoutSeconds(long j11) {
            this.mCryptoHandshakeTimeoutSeconds = Long.valueOf(j11);
            return this;
        }

        public Builder setHandshakeUserAgent(String str) {
            this.mHandshakeUserAgent = str;
            return this;
        }

        public Builder setIdleConnectionTimeout(Duration duration) {
            Objects.requireNonNull(duration);
            return setIdleConnectionTimeoutSeconds(duration.toSeconds());
        }

        public Builder setIdleConnectionTimeoutSeconds(long j11) {
            this.mIdleConnectionTimeoutSeconds = Long.valueOf(j11);
            return this;
        }

        public Builder setInMemoryServerConfigsCacheSize(int i5) {
            this.mInMemoryServerConfigsCacheSize = Integer.valueOf(i5);
            return this;
        }

        @Experimental
        public Builder setInitialBrokenServicePeriodSeconds(long j11) {
            this.mInitialBrokenServicePeriodSeconds = Long.valueOf(j11);
            return this;
        }

        @Experimental
        public Builder setPreCryptoHandshakeIdleTimeoutSeconds(long j11) {
            this.mPreCryptoHandshakeIdleTimeoutSeconds = Long.valueOf(j11);
            return this;
        }

        @Experimental
        public Builder setRetransmittableOnWireTimeoutMillis(long j11) {
            this.mRetransmittableOnWireTimeoutMillis = Long.valueOf(j11);
            return this;
        }
    }

    public @interface Experimental {
    }

    public @interface QuichePassthroughOption {
    }

    public QuicOptions(Builder builder) {
        this.mQuicHostAllowlist = Collections.unmodifiableSet(new LinkedHashSet(builder.mQuicHostAllowlist));
        this.mEnabledQuicVersions = Collections.unmodifiableSet(new LinkedHashSet(builder.mEnabledQuicVersions));
        this.mConnectionOptions = Collections.unmodifiableSet(new LinkedHashSet(builder.mConnectionOptions));
        this.mClientConnectionOptions = Collections.unmodifiableSet(new LinkedHashSet(builder.mClientConnectionOptions));
        this.mInMemoryServerConfigsCacheSize = builder.mInMemoryServerConfigsCacheSize;
        this.mHandshakeUserAgent = builder.mHandshakeUserAgent;
        this.mRetryWithoutAltSvcOnQuicErrors = builder.mRetryWithoutAltSvcOnQuicErrors;
        this.mEnableTlsZeroRtt = builder.mEnableTlsZeroRtt;
        this.mPreCryptoHandshakeIdleTimeoutSeconds = builder.mPreCryptoHandshakeIdleTimeoutSeconds;
        this.mCryptoHandshakeTimeoutSeconds = builder.mCryptoHandshakeTimeoutSeconds;
        this.mIdleConnectionTimeoutSeconds = builder.mIdleConnectionTimeoutSeconds;
        this.mRetransmittableOnWireTimeoutMillis = builder.mRetransmittableOnWireTimeoutMillis;
        this.mCloseSessionsOnIpChange = builder.mCloseSessionsOnIpChange;
        this.mGoawaySessionsOnIpChange = builder.mGoawaySessionsOnIpChange;
        this.mInitialBrokenServicePeriodSeconds = builder.mInitialBrokenServicePeriodSeconds;
        this.mIncreaseBrokenServicePeriodExponentially = builder.mIncreaseBrokenServicePeriodExponentially;
        this.mDelayJobsWithAvailableSpdySession = builder.mDelayJobsWithAvailableSpdySession;
        this.mExtraQuicheFlags = Collections.unmodifiableSet(new LinkedHashSet(builder.mExtraQuicheFlags));
    }

    public static Builder builder() {
        return new Builder();
    }

    public Set<String> getClientConnectionOptions() {
        return this.mClientConnectionOptions;
    }

    public Boolean getCloseSessionsOnIpChange() {
        return this.mCloseSessionsOnIpChange;
    }

    public Set<String> getConnectionOptions() {
        return this.mConnectionOptions;
    }

    public Long getCryptoHandshakeTimeoutSeconds() {
        return this.mCryptoHandshakeTimeoutSeconds;
    }

    public Boolean getDelayJobsWithAvailableSpdySession() {
        return this.mDelayJobsWithAvailableSpdySession;
    }

    public Boolean getEnableTlsZeroRtt() {
        return this.mEnableTlsZeroRtt;
    }

    public Set<String> getEnabledQuicVersions() {
        return this.mEnabledQuicVersions;
    }

    public Set<String> getExtraQuicheFlags() {
        return this.mExtraQuicheFlags;
    }

    public Boolean getGoawaySessionsOnIpChange() {
        return this.mGoawaySessionsOnIpChange;
    }

    public String getHandshakeUserAgent() {
        return this.mHandshakeUserAgent;
    }

    public Long getIdleConnectionTimeoutSeconds() {
        return this.mIdleConnectionTimeoutSeconds;
    }

    public Integer getInMemoryServerConfigsCacheSize() {
        return this.mInMemoryServerConfigsCacheSize;
    }

    public Boolean getIncreaseBrokenServicePeriodExponentially() {
        return this.mIncreaseBrokenServicePeriodExponentially;
    }

    public Long getInitialBrokenServicePeriodSeconds() {
        return this.mInitialBrokenServicePeriodSeconds;
    }

    public Long getPreCryptoHandshakeIdleTimeoutSeconds() {
        return this.mPreCryptoHandshakeIdleTimeoutSeconds;
    }

    public Set<String> getQuicHostAllowlist() {
        return this.mQuicHostAllowlist;
    }

    public Long getRetransmittableOnWireTimeoutMillis() {
        return this.mRetransmittableOnWireTimeoutMillis;
    }

    public Boolean getRetryWithoutAltSvcOnQuicErrors() {
        return this.mRetryWithoutAltSvcOnQuicErrors;
    }
}
