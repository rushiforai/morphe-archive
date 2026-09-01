package com.android.installreferrer.api;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReferrerDetails {
    private static final String KEY_GOOGLE_PLAY_INSTANT = "google_play_instant";
    private static final String KEY_INSTALL_BEGIN_TIMESTAMP = "install_begin_timestamp_seconds";
    private static final String KEY_INSTALL_BEGIN_TIMESTAMP_SERVER = "install_begin_timestamp_server_seconds";
    private static final String KEY_INSTALL_REFERRER = "install_referrer";
    private static final String KEY_INSTALL_VERSION = "install_version";
    private static final String KEY_REFERRER_CLICK_TIMESTAMP = "referrer_click_timestamp_seconds";
    private static final String KEY_REFERRER_CLICK_TIMESTAMP_SERVER = "referrer_click_timestamp_server_seconds";
    private final Bundle mOriginalBundle;

    public ReferrerDetails(Bundle bundle) {
        this.mOriginalBundle = bundle;
    }

    public boolean getGooglePlayInstantParam() {
        return this.mOriginalBundle.getBoolean(KEY_GOOGLE_PLAY_INSTANT);
    }

    public long getInstallBeginTimestampSeconds() {
        return this.mOriginalBundle.getLong(KEY_INSTALL_BEGIN_TIMESTAMP);
    }

    public long getInstallBeginTimestampServerSeconds() {
        return this.mOriginalBundle.getLong(KEY_INSTALL_BEGIN_TIMESTAMP_SERVER);
    }

    public String getInstallReferrer() {
        return this.mOriginalBundle.getString(KEY_INSTALL_REFERRER);
    }

    public String getInstallVersion() {
        return this.mOriginalBundle.getString(KEY_INSTALL_VERSION);
    }

    public long getReferrerClickTimestampSeconds() {
        return this.mOriginalBundle.getLong(KEY_REFERRER_CLICK_TIMESTAMP);
    }

    public long getReferrerClickTimestampServerSeconds() {
        return this.mOriginalBundle.getLong(KEY_REFERRER_CLICK_TIMESTAMP_SERVER);
    }
}
