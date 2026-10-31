package com.fyber.inneractive.sdk.mraid;

/* loaded from: classes3.dex */
public enum k {
    CLOSE(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d),
    EXPAND(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39151e),
    USECUSTOMCLOSE("usecustomclose"),
    OPEN("open"),
    RESIZE(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39153g),
    GET_RESIZE_PROPERTIES("getResizeProperties"),
    SET_RESIZE_PROPERTIES("setResizeProperties"),
    SET_ORIENTATION_PROPERTIES(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39154h),
    PLAY_VIDEO("playVideo"),
    STORE_PICTURE("storePicture"),
    GET_CURRENT_POSITION("getCurrentPosition"),
    GET_DEFAULT_POSITION("getDefaultPosition"),
    GET_MAX_SIZE("getMaxSize"),
    GET_SCREEN_SIZE("getScreenSize"),
    CREATE_CALENDAR_EVENT("createCalendarEvent"),
    UNSPECIFIED(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);

    private String mCommand;

    k(String str) {
        this.mCommand = str;
    }

    public static k a(String str) {
        for (k kVar : values()) {
            if (kVar.mCommand.equals(str)) {
                return kVar;
            }
        }
        return UNSPECIFIED;
    }

    public final String a() {
        return this.mCommand;
    }
}
