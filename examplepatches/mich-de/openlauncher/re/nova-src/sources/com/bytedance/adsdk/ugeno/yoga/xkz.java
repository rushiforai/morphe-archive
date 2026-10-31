package com.bytedance.adsdk.ugeno.yoga;

/* loaded from: classes2.dex */
public enum xkz {
    NO_WRAP(0),
    WRAP(1),
    WRAP_REVERSE(2);


    /* renamed from: dj, reason: collision with root package name */
    private final int f22616dj;

    xkz(int i5) {
        this.f22616dj = i5;
    }

    public int ycx() {
        return this.f22616dj;
    }

    public static xkz ycx(int i5) {
        if (i5 == 0) {
            return NO_WRAP;
        }
        if (i5 == 1) {
            return WRAP;
        }
        if (i5 == 2) {
            return WRAP_REVERSE;
        }
        throw new IllegalArgumentException("Unknown enum value: ".concat(String.valueOf(i5)));
    }

    public static xkz ycx(String str) {
        String lowerCase;
        lowerCase = str.toLowerCase();
        lowerCase.getClass();
        switch (lowerCase) {
            case "nowrap":
                return NO_WRAP;
            case "wrap":
                return WRAP;
            case "wrap_reverse":
                return WRAP_REVERSE;
            default:
                throw new IllegalArgumentException("Unknown enum value: ".concat(lowerCase));
        }
    }
}
