package com.tiktok.appevents;

/* loaded from: classes4.dex */
public class ReferrerInfo {
    private String googleInstallReferrer;
    private long gpReferrerClickTs;
    private long gpReferrerInstallTs;

    public ReferrerInfo(String str, long j11, long j12) {
        this.googleInstallReferrer = str;
        this.gpReferrerInstallTs = j11;
        this.gpReferrerClickTs = j12;
    }

    public String getGoogleInstallReferrer() {
        return this.googleInstallReferrer;
    }

    public long getGpReferrerClickTs() {
        return this.gpReferrerClickTs;
    }

    public long getGpReferrerInstallTs() {
        return this.gpReferrerInstallTs;
    }

    public void setGoogleInstallReferrer(String str) {
        this.googleInstallReferrer = str;
    }

    public void setGpReferrerClickTs(long j11) {
        this.gpReferrerClickTs = j11;
    }

    public void setGpReferrerInstallTs(long j11) {
        this.gpReferrerInstallTs = j11;
    }
}
