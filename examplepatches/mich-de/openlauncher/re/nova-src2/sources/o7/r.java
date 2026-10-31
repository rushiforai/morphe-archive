package o7;

import android.util.Log;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: b, reason: collision with root package name */
    public static final Object f79679b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public static volatile r f79680c;

    /* renamed from: a, reason: collision with root package name */
    public final int f79681a;

    public r(int i5) {
        this.f79681a = i5;
    }

    public static r c() {
        r rVar;
        synchronized (f79679b) {
            try {
                if (f79680c == null) {
                    f79680c = new r(3);
                }
                rVar = f79680c;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return rVar;
    }

    public static String e(String str) {
        int length = str.length();
        StringBuilder sb2 = new StringBuilder(23);
        sb2.append("WM-");
        if (length >= 20) {
            sb2.append(str.substring(0, 20));
        } else {
            sb2.append(str);
        }
        return sb2.toString();
    }

    public final void a(String str, String str2) {
        if (this.f79681a <= 6) {
            Log.e(str, str2);
        }
    }

    public final void b(String str, String str2, Throwable th2) {
        if (this.f79681a <= 6) {
            Log.e(str, str2, th2);
        }
    }

    public final void d(String str, String str2) {
        if (this.f79681a <= 4) {
            Log.i(str, str2);
        }
    }

    public final void f(String str, String str2) {
        if (this.f79681a <= 5) {
            Log.w(str, str2);
        }
    }
}
