package io.sentry.android.core;

import android.os.SystemClock;
import io.sentry.android.fragment.FragmentLifecycleIntegration;
import io.sentry.android.timber.SentryTimberIntegration;
import io.sentry.w3;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public abstract class u0 {

    /* renamed from: a, reason: collision with root package name */
    public static final long f67080a = SystemClock.uptimeMillis();

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f67081b = 0;

    public static void a(w3 w3Var, boolean z11, boolean z12) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (io.sentry.v0 v0Var : w3Var.getIntegrations()) {
            if (z11 && (v0Var instanceof FragmentLifecycleIntegration)) {
                arrayList2.add(v0Var);
            }
            if (z12 && (v0Var instanceof SentryTimberIntegration)) {
                arrayList.add(v0Var);
            }
        }
        if (arrayList2.size() > 1) {
            for (int i5 = 0; i5 < arrayList2.size() - 1; i5++) {
                w3Var.getIntegrations().remove((io.sentry.v0) arrayList2.get(i5));
            }
        }
        if (arrayList.size() > 1) {
            for (int i11 = 0; i11 < arrayList.size() - 1; i11++) {
                w3Var.getIntegrations().remove((io.sentry.v0) arrayList.get(i11));
            }
        }
    }
}
