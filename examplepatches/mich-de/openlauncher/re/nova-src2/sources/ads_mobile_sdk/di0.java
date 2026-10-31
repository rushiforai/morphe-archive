package ads_mobile_sdk;

import a70.d;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Environment;
import java.util.List;
import kotlin.LazyKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class di0 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final Context f2529c;

    /* renamed from: d, reason: collision with root package name */
    public final ci3 f2530d;

    /* renamed from: e, reason: collision with root package name */
    public final PackageManager f2531e;

    /* renamed from: f, reason: collision with root package name */
    public final d f2532f;

    /* renamed from: g, reason: collision with root package name */
    public final d f2533g;

    /* renamed from: h, reason: collision with root package name */
    public final d f2534h;

    /* renamed from: i, reason: collision with root package name */
    public final d f2535i;

    /* renamed from: j, reason: collision with root package name */
    public final d f2536j;

    /* renamed from: k, reason: collision with root package name */
    public final d f2537k;

    /* renamed from: l, reason: collision with root package name */
    public final d f2538l;

    /* renamed from: m, reason: collision with root package name */
    public final d f2539m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public di0(Context context, ci3 traceLogger) {
        super(wv0.CUI_NAME_DEVICE_PROPERTIES_INIT_TASK, 2);
        Intrinsics.g(context, "context");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f2529c = context;
        this.f2530d = traceLogger;
        this.f2531e = context.getPackageManager();
        this.f2532f = LazyKt.a(new ai0(this, 4));
        this.f2533g = LazyKt.a(new ai0(this, 0));
        this.f2534h = LazyKt.a(o52.a$1);
        this.f2535i = LazyKt.a(new ai0(this, 2));
        this.f2536j = LazyKt.a(new ai0(this, 1));
        this.f2537k = LazyKt.a(new ai0(this, 5));
        this.f2538l = LazyKt.a(new ai0(this, 3));
        this.f2539m = LazyKt.a(new ai0(this, 6));
    }

    public final boolean a(Intent intent) {
        PackageManager packageManager = this.f2529c.getPackageManager();
        if (packageManager != null) {
            if (Build.VERSION.SDK_INT >= 33) {
                List listQueryIntentActivities = packageManager.queryIntentActivities(intent, PackageManager.ResolveInfoFlags.of(0L));
                Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
                if (!listQueryIntentActivities.isEmpty()) {
                    return true;
                }
            } else {
                List<ResolveInfo> listQueryIntentActivities2 = packageManager.queryIntentActivities(intent, 0);
                Intrinsics.f(listQueryIntentActivities2, "queryIntentActivities(...)");
                if (!listQueryIntentActivities2.isEmpty()) {
                    return true;
                }
            }
        }
        return false;
    }

    public final boolean c() {
        if (Intrinsics.b(Environment.getExternalStorageState(), "mounted")) {
            return Build.VERSION.SDK_INT >= 30 || this.f2529c.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0;
        }
        return false;
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        this.f2532f.getValue();
        this.f2534h.getValue();
        this.f2533g.getValue();
        this.f2535i.getValue();
        this.f2536j.getValue();
        this.f2537k.getValue();
        this.f2538l.getValue();
        this.f2539m.getValue();
        return new xu0(Unit.f71706a);
    }
}
