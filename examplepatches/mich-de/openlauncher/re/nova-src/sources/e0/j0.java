package e0;

import android.view.ViewConfiguration;

/* loaded from: classes2.dex */
public abstract class j0 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f50030a = ViewConfiguration.getScrollFriction();

    /* renamed from: b, reason: collision with root package name */
    public static final double f50031b;

    /* renamed from: c, reason: collision with root package name */
    public static final double f50032c;

    static {
        double dLog = Math.log(0.78d) / Math.log(0.9d);
        f50031b = dLog;
        f50032c = dLog - 1.0d;
    }
}
