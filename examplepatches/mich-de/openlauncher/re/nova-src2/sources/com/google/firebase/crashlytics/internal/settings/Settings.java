package com.google.firebase.crashlytics.internal.settings;

/* loaded from: classes.dex */
public class Settings {
    public final int cacheDuration;
    public final long expiresAtMillis;
    public final FeatureFlagData featureFlagData;
    public final double onDemandBackoffBase;
    public final int onDemandBackoffStepDurationSeconds;
    public final double onDemandUploadRatePerMinute;
    public final SessionData sessionData;
    public final int settingsVersion;

    public static class FeatureFlagData {
        public final boolean collectAnrs;
        public final boolean collectBuildIds;
        public final boolean collectReports;

        public FeatureFlagData(boolean z11, boolean z12, boolean z13) {
            this.collectReports = z11;
            this.collectAnrs = z12;
            this.collectBuildIds = z13;
        }
    }

    public static class SessionData {
        public final int maxCompleteSessionsCount;
        public final int maxCustomExceptionEvents;

        public SessionData(int i5, int i11) {
            this.maxCustomExceptionEvents = i5;
            this.maxCompleteSessionsCount = i11;
        }
    }

    public Settings(long j11, SessionData sessionData, FeatureFlagData featureFlagData, int i5, int i11, double d5, double d11, int i12) {
        this.expiresAtMillis = j11;
        this.sessionData = sessionData;
        this.featureFlagData = featureFlagData;
        this.settingsVersion = i5;
        this.cacheDuration = i11;
        this.onDemandUploadRatePerMinute = d5;
        this.onDemandBackoffBase = d11;
        this.onDemandBackoffStepDurationSeconds = i12;
    }

    public boolean isExpired(long j11) {
        return this.expiresAtMillis < j11;
    }
}
