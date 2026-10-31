package io.sentry.util;

/* loaded from: classes4.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f67828a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f67829b;

    static {
        try {
            f67828a = "The Android Project".equals(System.getProperty("java.vendor"));
        } catch (Throwable unused) {
            f67828a = false;
        }
        try {
            String property = System.getProperty("java.specification.version");
            if (property != null) {
                f67829b = Double.valueOf(property).doubleValue() >= 9.0d;
            } else {
                f67829b = false;
            }
        } catch (Throwable unused2) {
            f67829b = false;
        }
    }
}
