package fr;

import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final int f55642a;

    /* renamed from: b, reason: collision with root package name */
    public static final int f55643b;

    static {
        TimeUnit timeUnit = TimeUnit.SECONDS;
        f55642a = (int) timeUnit.toMillis(30L);
        f55643b = (int) timeUnit.toMillis(80L);
    }
}
