package com.bytedance.adsdk.ugeno.yoga;

/* loaded from: classes2.dex */
public enum lud {
    COLUMN(0),
    COLUMN_REVERSE(1),
    ROW(2),
    ROW_REVERSE(3);

    private final int lud;

    lud(int i5) {
        this.lud = i5;
    }

    public int ycx() {
        return this.lud;
    }

    public static lud ycx(int i5) {
        if (i5 == 0) {
            return COLUMN;
        }
        if (i5 == 1) {
            return COLUMN_REVERSE;
        }
        if (i5 == 2) {
            return ROW;
        }
        if (i5 == 3) {
            return ROW_REVERSE;
        }
        throw new IllegalArgumentException("Unknown enum value: ".concat(String.valueOf(i5)));
    }

    public static lud ycx(String str) {
        str.getClass();
        switch (str) {
            case "column_reverse":
                return COLUMN_REVERSE;
            case "column":
                return COLUMN;
            case "row_reverse":
                return ROW_REVERSE;
            case "row":
                return ROW;
            default:
                throw new IllegalArgumentException("Unknown enum value: ".concat(str));
        }
    }
}
