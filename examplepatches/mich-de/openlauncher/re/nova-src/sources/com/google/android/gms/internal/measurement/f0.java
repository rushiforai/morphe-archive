package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f32520a = {"com.google.common.flogger.util.StackWalkerStackGetter", "com.google.common.flogger.util.JavaLangAccessStackGetter"};

    /* renamed from: b, reason: collision with root package name */
    public static final h0 f32521b;

    static {
        h0 h0Var;
        int i5 = 0;
        while (true) {
            if (i5 >= 2) {
                h0Var = new h0();
                break;
            }
            h0Var = null;
            try {
                h0Var = (h0) Class.forName(f32520a[i5]).asSubclass(h0.class).getDeclaredConstructor(null).newInstance(null);
            } catch (Throwable unused) {
            }
            if (h0Var != null) {
                break;
            } else {
                i5++;
            }
        }
        f32521b = h0Var;
    }
}
