package com.bytedance.adsdk.ugeno.yoga;

/* loaded from: classes2.dex */
public enum ry {
    STATIC(0),
    RELATIVE(1),
    ABSOLUTE(2);


    /* renamed from: dj, reason: collision with root package name */
    private final int f22612dj;

    ry(int i5) {
        this.f22612dj = i5;
    }

    public int ycx() {
        return this.f22612dj;
    }

    public static ry ycx(int i5) {
        if (i5 == 0) {
            return STATIC;
        }
        if (i5 == 1) {
            return RELATIVE;
        }
        if (i5 == 2) {
            return ABSOLUTE;
        }
        throw new IllegalArgumentException("Unknown enum value: ".concat(String.valueOf(i5)));
    }

    public static ry ycx(String str) {
        str.getClass();
        switch (str) {
            case "static":
                return STATIC;
            case "relative":
                return RELATIVE;
            case "absolute":
                return ABSOLUTE;
            default:
                throw new IllegalArgumentException("Unknown enum value: ".concat(str));
        }
    }
}
