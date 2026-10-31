package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public abstract class e0 extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public static final String f32487b;

    static {
        String property;
        try {
            property = System.getProperty("line.separator");
        } catch (SecurityException unused) {
        }
        if (!property.matches("\\n|\\r(?:\\n)?")) {
            property = "\n";
        }
        f32487b = property;
    }

    public static int g(int i5, String str) {
        while (i5 < str.length()) {
            int i11 = i5 + 1;
            if (str.charAt(i5) != '%') {
                i5 = i11;
            } else {
                if (i11 >= str.length()) {
                    throw new zzabo(zzabo.c(i5, -1, "trailing unquoted '%' character", str));
                }
                char cCharAt = str.charAt(i11);
                if (cCharAt != '%' && cCharAt != 'n') {
                    return i5;
                }
                i5 += 2;
            }
        }
        return -1;
    }

    public final void f(int i5, int i11, String str, StringBuilder sb2) {
        int i12 = i5;
        while (i5 < i11) {
            int i13 = i5 + 1;
            if (str.charAt(i5) == '%') {
                if (i13 == i11) {
                    break;
                }
                char cCharAt = str.charAt(i13);
                if (cCharAt == '%') {
                    sb2.append((CharSequence) str, i12, i13);
                } else if (cCharAt == 'n') {
                    sb2.append((CharSequence) str, i12, i5);
                    sb2.append(f32487b);
                }
                i12 = i5 + 2;
                i5 = i12;
            }
            i5 = i13;
        }
        if (i12 < i11) {
            sb2.append((CharSequence) str, i12, i11);
        }
    }
}
