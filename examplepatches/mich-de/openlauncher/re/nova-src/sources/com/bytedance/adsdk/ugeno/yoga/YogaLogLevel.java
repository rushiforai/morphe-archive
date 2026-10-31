package com.bytedance.adsdk.ugeno.yoga;

@com.bytedance.adsdk.ugeno.yoga.ycx.ycx
/* loaded from: classes2.dex */
public enum YogaLogLevel {
    ERROR(0),
    WARN(1),
    INFO(2),
    DEBUG(3),
    VERBOSE(4),
    FATAL(5);


    /* renamed from: ul, reason: collision with root package name */
    private final int f22589ul;

    YogaLogLevel(int i5) {
        this.f22589ul = i5;
    }

    @com.bytedance.adsdk.ugeno.yoga.ycx.ycx
    public static YogaLogLevel fromInt(int i5) {
        if (i5 == 0) {
            return ERROR;
        }
        if (i5 == 1) {
            return WARN;
        }
        if (i5 == 2) {
            return INFO;
        }
        if (i5 == 3) {
            return DEBUG;
        }
        if (i5 == 4) {
            return VERBOSE;
        }
        if (i5 == 5) {
            return FATAL;
        }
        throw new IllegalArgumentException("Unknown enum value: ".concat(String.valueOf(i5)));
    }
}
