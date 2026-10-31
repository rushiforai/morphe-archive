package ads_mobile_sdk;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class mg {

    /* renamed from: a, reason: collision with root package name */
    public final Context f7200a;

    /* renamed from: b, reason: collision with root package name */
    public final b41 f7201b;

    /* renamed from: c, reason: collision with root package name */
    public final ApplicationInfo f7202c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReference f7203d;

    public mg(Context context, b41 initializationConfigWrapper) {
        Intrinsics.g(context, "context");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        this.f7200a = context;
        this.f7201b = initializationConfigWrapper;
        this.f7202c = context.getApplicationInfo();
        this.f7203d = new AtomicReference();
    }
}
