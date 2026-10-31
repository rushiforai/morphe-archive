package mk;

import android.app.Activity;
import android.content.Intent;

/* loaded from: classes3.dex */
public final class t implements q {

    /* renamed from: a, reason: collision with root package name */
    public final o f76486a;

    /* renamed from: b, reason: collision with root package name */
    public final Activity f76487b;

    public t(Intent intent, Activity activity) {
        this.f76487b = activity;
        if (qh.a.a(activity)) {
            this.f76486a = new o(activity.getApplicationContext(), "HpoaService", intent, new b50.d());
        } else {
            this.f76486a = null;
        }
    }
}
