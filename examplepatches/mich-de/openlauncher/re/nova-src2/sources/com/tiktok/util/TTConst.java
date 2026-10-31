package com.tiktok.util;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes4.dex */
public class TTConst {
    public static final String ERROR_MESSAGE_INVALID_ID = "Invalid appId or tiktokAppId";
    public static final String TRACK_TYPE = "type";
    public static final String TRACK_TYPE_AUTO = "auto";
    public static final String TTSDK_APP_2DR_TIME = "com.tiktok.sdk.2drTime";
    public static final String TTSDK_APP_ANONYMOUS_ID = "com.tiktok.sdk.anonymousId";
    public static final String TTSDK_APP_FIRST_INSTALL = "com.tiktok.sdk.firstInstall";
    public static final String TTSDK_APP_LAST_LAUNCH = "com.tiktok.sdk.lastLaunch";
    public static final String TTSDK_APP_SENSIG_LIST = "com.tiktok.sdk.anonymousId.list";
    public static final String TTSDK_APP_SENSIG_VERSION = "com.tiktok.sdk.anonymousId.version";
    public static final int TTSDK_EXCEPTION_CRASH = 3;
    public static final int TTSDK_EXCEPTION_NET_ERROR = 1;
    public static final int TTSDK_EXCEPTION_SDK_CATCH = 2;
    public static final String TTSDK_KEY_VALUE_STORE = "com.tiktok.sdk.keystore";
    public static final String TTSDK_PREFIX = "com.tiktok";
    public static final String TTSDK_USER_AGENT = "com.tiktok.user.agent";

    public enum ApiErrorCodes {
        PARTIAL_SUCCESS(Integer.valueOf(Sdk.SDKError.Reason.AD_SERVER_ERROR_VALUE)),
        API_ERROR(40000);

        public Integer code;

        ApiErrorCodes(Integer num) {
            this.code = num;
        }
    }

    public enum AutoEvents {
        InstallApp("InstallApp"),
        SecondDayRetention("2Dretention"),
        LaunchAPP("LaunchAPP");

        public String name;

        AutoEvents(String str) {
            this.name = str;
        }
    }
}
