package com.vungle.ads.internal.task;

import android.os.Bundle;
import android.os.Process;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends i {

    /* renamed from: e, reason: collision with root package name */
    public static final String f47536e = "f";

    /* renamed from: a, reason: collision with root package name */
    public final e f47537a;

    /* renamed from: b, reason: collision with root package name */
    public final d f47538b;

    /* renamed from: c, reason: collision with root package name */
    public final g f47539c;

    /* renamed from: d, reason: collision with root package name */
    public final m f47540d;

    public f(e jobinfo, d creator, g jobRunner, m mVar) {
        Intrinsics.g(jobinfo, "jobinfo");
        Intrinsics.g(creator, "creator");
        Intrinsics.g(jobRunner, "jobRunner");
        this.f47537a = jobinfo;
        this.f47538b = creator;
        this.f47539c = jobRunner;
        this.f47540d = mVar;
    }

    @Override // com.vungle.ads.internal.task.i
    public final int a() {
        return this.f47537a.f47535e;
    }

    @Override // java.lang.Runnable
    public final void run() {
        m mVar = this.f47540d;
        if (mVar != null) {
            try {
                int iA = ((h) mVar).a(this.f47537a);
                Process.setThreadPriority(iA);
                boolean z11 = u.f47714a;
                String TAG = f47536e;
                Intrinsics.f(TAG, "TAG");
                t.a(TAG, "Setting process thread prio = " + iA + " for " + this.f47537a.d());
            } catch (Throwable unused) {
                boolean z12 = u.f47714a;
                String TAG2 = f47536e;
                Intrinsics.f(TAG2, "TAG");
                t.b(TAG2, "Error on setting process thread priority");
            }
        }
        try {
            String strD = this.f47537a.d();
            Bundle bundleC = this.f47537a.c();
            boolean z13 = u.f47714a;
            String TAG3 = f47536e;
            Intrinsics.f(TAG3, "TAG");
            t.a(TAG3, "Start job " + strD + "Thread " + Thread.currentThread().getName());
            int iA2 = ((o) this.f47538b).a(strD).a(bundleC, this.f47539c);
            t.a(TAG3, "On job finished " + strD + " with result " + iA2);
            if (iA2 == 2) {
                this.f47537a.getClass();
            }
        } catch (Exception e3) {
            boolean z14 = u.f47714a;
            String TAG4 = f47536e;
            Intrinsics.f(TAG4, "TAG");
            t.b(TAG4, "Cannot create job" + e3.getLocalizedMessage());
        }
    }
}
