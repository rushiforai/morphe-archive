package a30;

import android.os.Build;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f183a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f184b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f185c;

    static {
        String str = Build.MANUFACTURER;
        f183a = "samsung".equalsIgnoreCase(str);
        f184b = "HUAWEI".equalsIgnoreCase(str);
        f185c = new a();
    }
}
