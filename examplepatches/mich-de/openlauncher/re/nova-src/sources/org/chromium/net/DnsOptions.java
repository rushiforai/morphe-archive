package org.chromium.net;

import java.time.Duration;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class DnsOptions {
    private final Boolean mEnableStaleDns;
    private final Boolean mPersistHostCache;
    private final Long mPersistHostCachePeriodMillis;
    private final Boolean mPreestablishConnectionsToStaleDnsResults;
    private final StaleDnsOptions mStaleDnsOptions;
    private final Boolean mUseBuiltInDnsResolver;

    public static final class Builder {
        private Boolean mEnableStaleDns;
        private Boolean mPersistHostCache;
        private Long mPersistHostCachePeriodMillis;
        private Boolean mPreestablishConnectionsToStaleDnsResults;
        private StaleDnsOptions mStaleDnsOptions;
        private Boolean mUseBuiltInDnsResolver;

        public DnsOptions build() {
            return new DnsOptions(this);
        }

        public Builder enableStaleDns(boolean z11) {
            this.mEnableStaleDns = Boolean.valueOf(z11);
            return this;
        }

        public Builder persistHostCache(boolean z11) {
            this.mPersistHostCache = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder preestablishConnectionsToStaleDnsResults(boolean z11) {
            this.mPreestablishConnectionsToStaleDnsResults = Boolean.valueOf(z11);
            return this;
        }

        public Builder setPersistDelay(Duration duration) {
            Objects.requireNonNull(duration);
            return setPersistHostCachePeriodMillis(duration.toMillis());
        }

        public Builder setPersistHostCachePeriodMillis(long j11) {
            this.mPersistHostCachePeriodMillis = Long.valueOf(j11);
            return this;
        }

        public Builder setStaleDnsOptions(StaleDnsOptions staleDnsOptions) {
            this.mStaleDnsOptions = staleDnsOptions;
            return this;
        }

        public Builder useBuiltInDnsResolver(boolean z11) {
            this.mUseBuiltInDnsResolver = Boolean.valueOf(z11);
            return this;
        }

        @Experimental
        public Builder setStaleDnsOptions(StaleDnsOptions.Builder builder) {
            return setStaleDnsOptions(builder.build());
        }
    }

    public @interface Experimental {
    }

    public static class StaleDnsOptions {
        private final Boolean mAllowCrossNetworkUsage;
        private final Long mFreshLookupTimeoutMillis;
        private final Long mMaxExpiredDelayMillis;
        private final Boolean mUseStaleOnNameNotResolved;

        public static final class Builder {
            private Boolean mAllowCrossNetworkUsage;
            private Long mFreshLookupTimeoutMillis;
            private Long mMaxExpiredDelayMillis;
            private Boolean mUseStaleOnNameNotResolved;

            public Builder allowCrossNetworkUsage(boolean z11) {
                this.mAllowCrossNetworkUsage = Boolean.valueOf(z11);
                return this;
            }

            public StaleDnsOptions build() {
                return new StaleDnsOptions(this);
            }

            public Builder setFreshLookupTimeout(Duration duration) {
                Objects.requireNonNull(duration);
                return setFreshLookupTimeoutMillis(duration.toMillis());
            }

            public Builder setFreshLookupTimeoutMillis(long j11) {
                this.mFreshLookupTimeoutMillis = Long.valueOf(j11);
                return this;
            }

            public Builder setMaxExpiredDelay(Duration duration) {
                Objects.requireNonNull(duration);
                return setMaxExpiredDelayMillis(duration.toMillis());
            }

            public Builder setMaxExpiredDelayMillis(long j11) {
                this.mMaxExpiredDelayMillis = Long.valueOf(j11);
                return this;
            }

            public Builder useStaleOnNameNotResolved(boolean z11) {
                this.mUseStaleOnNameNotResolved = Boolean.valueOf(z11);
                return this;
            }
        }

        public StaleDnsOptions(Builder builder) {
            this.mFreshLookupTimeoutMillis = builder.mFreshLookupTimeoutMillis;
            this.mMaxExpiredDelayMillis = builder.mMaxExpiredDelayMillis;
            this.mAllowCrossNetworkUsage = builder.mAllowCrossNetworkUsage;
            this.mUseStaleOnNameNotResolved = builder.mUseStaleOnNameNotResolved;
        }

        public static Builder builder() {
            return new Builder();
        }

        public Boolean getAllowCrossNetworkUsage() {
            return this.mAllowCrossNetworkUsage;
        }

        public Long getFreshLookupTimeoutMillis() {
            return this.mFreshLookupTimeoutMillis;
        }

        public Long getMaxExpiredDelayMillis() {
            return this.mMaxExpiredDelayMillis;
        }

        public Boolean getUseStaleOnNameNotResolved() {
            return this.mUseStaleOnNameNotResolved;
        }
    }

    public DnsOptions(Builder builder) {
        this.mEnableStaleDns = builder.mEnableStaleDns;
        this.mStaleDnsOptions = builder.mStaleDnsOptions;
        this.mPersistHostCachePeriodMillis = builder.mPersistHostCachePeriodMillis;
        this.mPreestablishConnectionsToStaleDnsResults = builder.mPreestablishConnectionsToStaleDnsResults;
        this.mUseBuiltInDnsResolver = builder.mUseBuiltInDnsResolver;
        this.mPersistHostCache = builder.mPersistHostCache;
    }

    public static Builder builder() {
        return new Builder();
    }

    public Boolean getEnableStaleDns() {
        return this.mEnableStaleDns;
    }

    public Boolean getPersistHostCache() {
        return this.mPersistHostCache;
    }

    public Long getPersistHostCachePeriodMillis() {
        return this.mPersistHostCachePeriodMillis;
    }

    public Boolean getPreestablishConnectionsToStaleDnsResults() {
        return this.mPreestablishConnectionsToStaleDnsResults;
    }

    public StaleDnsOptions getStaleDnsOptions() {
        return this.mStaleDnsOptions;
    }

    public Boolean getUseBuiltInDnsResolver() {
        return this.mUseBuiltInDnsResolver;
    }
}
