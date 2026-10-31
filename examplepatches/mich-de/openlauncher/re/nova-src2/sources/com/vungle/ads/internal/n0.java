package com.vungle.ads.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47208a;

    /* renamed from: b, reason: collision with root package name */
    public final DisplayMetrics f47209b;

    public n0(Context context) {
        Intrinsics.g(context, "context");
        this.f47208a = context;
        DisplayMetrics displayMetrics = new DisplayMetrics();
        this.f47209b = displayMetrics;
        Object systemService = context.getSystemService("window");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.WindowManager");
        ((WindowManager) systemService).getDefaultDisplay().getMetrics(displayMetrics);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n0) && Intrinsics.b(this.f47208a, ((n0) obj).f47208a);
    }

    public final int hashCode() {
        return this.f47208a.hashCode();
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("DeviceScreenInfo(context=");
        sbA.append(this.f47208a);
        sbA.append(')');
        return sbA.toString();
    }
}
