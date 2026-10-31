package ex;

import ads_mobile_sdk.el;
import android.app.Activity;
import dx.j0;
import gx.f0;
import java.lang.ref.WeakReference;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final el f53058a;

    /* renamed from: b, reason: collision with root package name */
    public final mi.b f53059b;

    /* renamed from: c, reason: collision with root package name */
    public final String f53060c;

    /* renamed from: d, reason: collision with root package name */
    public final WeakReference f53061d;

    /* renamed from: e, reason: collision with root package name */
    public final long f53062e;

    /* renamed from: f, reason: collision with root package name */
    public final String f53063f;

    public b(el banner, mi.b bVar, Activity activity, String str) {
        Intrinsics.g(banner, "banner");
        Intrinsics.g(activity, "activity");
        this.f53058a = banner;
        this.f53059b = bVar;
        this.f53060c = str;
        this.f53061d = new WeakReference(activity);
        this.f53062e = System.currentTimeMillis();
        String adapterClassName = banner.a().getResponseInfo().getAdapterClassName();
        this.f53063f = adapterClassName != null ? r70.k.n1('.', adapterClassName, adapterClassName) : null;
    }

    @Override // gx.f0
    public final String a() {
        return this.f53060c;
    }

    @Override // gx.f0
    public final long b(j0 global) {
        Intrinsics.g(global, "global");
        return global.f49730p;
    }

    @Override // gx.f0
    public final long c() {
        return this.f53062e;
    }

    @Override // gx.f0
    public final boolean d() {
        Activity activity = (Activity) this.f53061d.get();
        return (activity == null || activity.isDestroyed() || activity.isFinishing()) ? false : true;
    }

    @Override // gx.f0
    public final void destroy() {
        try {
            int i5 = Result.f71687b;
            this.f53058a.destroy();
            Unit unit = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
        try {
            this.f53059b.removeAllViews();
            Unit unit2 = Unit.f71706a;
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            ResultKt.a(th3);
        }
    }

    @Override // gx.f0
    public final dx.u e() {
        return dx.u.f49795b;
    }

    @Override // gx.f0
    public final String f() {
        return this.f53063f;
    }
}
