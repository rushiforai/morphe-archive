package j80;

import b.c0;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f69152a;

    /* renamed from: b, reason: collision with root package name */
    public final int f69153b;

    public a(String str, int i5) {
        int length;
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.l("The number of function arguments can not be less than 0 for '", str, "'"));
        }
        if (str != null && (length = str.length()) != 0) {
            for (int i11 = 0; i11 < length; i11++) {
                char cCharAt = str.charAt(i11);
                if (Character.isLetter(cCharAt) || cCharAt == '_' || (Character.isDigit(cCharAt) && i11 > 0)) {
                }
            }
            this.f69152a = str;
            this.f69153b = i5;
            return;
        }
        throw new IllegalArgumentException(c0.l("The function name '", str, "' is invalid"));
    }

    public abstract double a(double... dArr);
}
