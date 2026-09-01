package com.android.installreferrer.api;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Retention(RetentionPolicy.SOURCE)
public @interface InstallReferrerClientImpl$ClientState {
    public static final int CLOSED = 3;
    public static final int CONNECTED = 2;
    public static final int CONNECTING = 1;
    public static final int DISCONNECTED = 0;
}
