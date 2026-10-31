package com.bytedance.adsdk.ugeno.core;

/* loaded from: classes2.dex */
public enum xkz {
    UNKNOWN_EVENT("UNKNOWN_EVENT", 0),
    TAP_EVENT("onTap", 1),
    LONG_TAP_EVENT("onLongTap", 2),
    SHAKE_EVENT("onShake", 3),
    TWIST_EVENT("onTwist", 18),
    SLIDE_EVENT("onSlide", 4),
    EXPOSURE_EVENT("onExposure", 5),
    SCROLL_EVENT("onScroll", 6),
    PULL_TO_REFRESH_EVENT("onPullToRefresh", 7),
    LOAD_MORE_EVENT("onLoadMore", 8),
    TIMER("onTimer", 9),
    DELAY("onDelay", 10),
    ANIMATION("onAnimation", 11),
    VIDEO_PROGRESS("onVideoProgress", 12),
    VIDEO_PAUSE("onVideoPause", 13),
    VIDEO_RESUME("onVideoResume", 14),
    VIDEO_FINISH("onVideoFinish", 15),
    VIDEO_PLAY("onVideoPlay", 16),
    DOWN_EVENT("onDown", 17),
    RENDER_SUCCESS("onRenderSuccess", 22);

    private String thx;
    private int wwx;

    xkz(String str, int i5) {
        this.thx = str;
        this.wwx = i5;
    }

    public int ycx() {
        return this.wwx;
    }

    public static xkz ycx(String str) {
        for (xkz xkzVar : values()) {
            if (xkzVar.thx.equals(str)) {
                return xkzVar;
            }
        }
        return UNKNOWN_EVENT;
    }
}
