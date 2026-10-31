package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class L7 {
    public static String[] A02 = {"SQo4RrLzF", "jPCz6PYNJUbTykU8CCW9dGszrDnifOAR", "KesQWu7GH", "ekyj6ghr92eupjgSNtsQJYpTWv5WbeKj", "QXJrQi1lVZYEXiLwDFv7zwiJMniia7MH", "eplt6KvTCtdOQ0wVtLKlLGCjMoiCj9el", "H", "svpDYXgEYoijXdrxWcelK3hNiLhAHVy7"};
    public final int A00;
    public final int A01;

    public L7(int i5, int i11) {
        this.A01 = i5;
        this.A00 = i11;
    }

    public final int A00() {
        switch (this.A00) {
            case 2:
                return 10;
            case 5:
                return 11;
            case 22:
                return 1073741824;
            case 23:
                return 15;
            case 29:
                return 12;
            case 42:
                if (A02[6].length() != 1) {
                    throw new RuntimeException();
                }
                A02[6] = "b";
                return 16;
            default:
                return 0;
        }
    }
}
