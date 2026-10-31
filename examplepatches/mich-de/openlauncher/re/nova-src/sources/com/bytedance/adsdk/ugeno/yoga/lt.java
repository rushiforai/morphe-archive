package com.bytedance.adsdk.ugeno.yoga;

/* loaded from: classes2.dex */
public enum lt {
    FLEX_START(0),
    CENTER(1),
    FLEX_END(2),
    SPACE_BETWEEN(3),
    SPACE_AROUND(4),
    SPACE_EVENLY(5);


    /* renamed from: ul, reason: collision with root package name */
    private final int f22607ul;

    lt(int i5) {
        this.f22607ul = i5;
    }

    public int ycx() {
        return this.f22607ul;
    }

    public static lt ycx(int i5) {
        if (i5 == 0) {
            return FLEX_START;
        }
        if (i5 == 1) {
            return CENTER;
        }
        if (i5 == 2) {
            return FLEX_END;
        }
        if (i5 == 3) {
            return SPACE_BETWEEN;
        }
        if (i5 == 4) {
            return SPACE_AROUND;
        }
        if (i5 == 5) {
            return SPACE_EVENLY;
        }
        throw new IllegalArgumentException("Unknown enum value: ".concat(String.valueOf(i5)));
    }

    public static lt ycx(String str) {
        str.getClass();
        switch (str) {
            case "center":
                return CENTER;
            case "space_around":
                return SPACE_AROUND;
            case "space_evenly":
                return SPACE_EVENLY;
            case "flex_start":
                return FLEX_START;
            case "space_between":
                return SPACE_BETWEEN;
            case "flex_end":
                return FLEX_END;
            default:
                throw new IllegalArgumentException("Unknown enum value: ".concat(str));
        }
    }
}
