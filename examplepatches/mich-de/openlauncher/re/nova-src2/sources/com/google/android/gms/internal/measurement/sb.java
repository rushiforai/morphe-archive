package com.google.android.gms.internal.measurement;

import android.app.ActivityManager;
import android.util.Log;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes3.dex */
public final /* synthetic */ class sb implements vk.u {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ sb f33055b = new sb(0);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ sb f33056c = new sb(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33057a;

    public /* synthetic */ sb(int i5) {
        this.f33057a = i5;
    }

    @Override // vk.u
    public final Object get() {
        switch (this.f33057a) {
            case 0:
                Object obj = ob.f32917j;
                ScheduledExecutorService scheduledExecutorServiceNewSingleThreadScheduledExecutor = Executors.newSingleThreadScheduledExecutor(rb.f33033a);
                return scheduledExecutorServiceNewSingleThreadScheduledExecutor instanceof cl.e1 ? (cl.e1) scheduledExecutorServiceNewSingleThreadScheduledExecutor : new cl.j1(scheduledExecutorServiceNewSingleThreadScheduledExecutor);
            default:
                ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
                boolean z11 = false;
                try {
                    ActivityManager.getMyMemoryState(runningAppProcessInfo);
                    int i5 = runningAppProcessInfo.importance;
                    StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 17);
                    sb2.append("Memory state is: ");
                    sb2.append(i5);
                    Log.i("PhenotypeProcessReaper", sb2.toString());
                    if (runningAppProcessInfo.importance >= 400) {
                        z11 = true;
                    }
                } catch (RuntimeException e3) {
                    Log.w("PhenotypeProcessReaper", "Failed to retrieve memory state, not killing process.", e3);
                }
                return new Boolean(z11);
        }
    }
}
