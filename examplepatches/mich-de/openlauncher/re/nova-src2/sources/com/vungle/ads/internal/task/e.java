package com.vungle.ads.internal.task;

import android.os.Bundle;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public final String f47531a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f47532b;

    /* renamed from: c, reason: collision with root package name */
    public long f47533c;

    /* renamed from: d, reason: collision with root package name */
    public Bundle f47534d;

    /* renamed from: e, reason: collision with root package name */
    public int f47535e;

    public e(String jobTag) {
        Intrinsics.g(jobTag, "jobTag");
        this.f47531a = jobTag;
        this.f47534d = new Bundle();
        this.f47535e = 2;
    }

    public final e a(boolean z11) {
        this.f47532b = z11;
        return this;
    }

    public final long b() {
        return this.f47533c;
    }

    public final Bundle c() {
        return this.f47534d;
    }

    public final Object clone() {
        return super.clone();
    }

    public final String d() {
        return this.f47531a;
    }

    public final int e() {
        return this.f47535e;
    }

    public final boolean f() {
        return this.f47532b;
    }

    public final void g() {
        this.f47533c = 0L;
    }

    public final e h() {
        this.f47535e = 0;
        return this;
    }

    public final e a(Bundle extras) {
        Intrinsics.g(extras, "extras");
        this.f47534d = extras;
        return this;
    }

    public final e a() throws CloneNotSupportedException {
        try {
            Object objClone = super.clone();
            Intrinsics.e(objClone, "null cannot be cast to non-null type com.vungle.ads.internal.task.JobInfo");
            return (e) objClone;
        } catch (CloneNotSupportedException e3) {
            boolean z11 = u.f47714a;
            t.a("JobInfo", "Cannot copy JobInfo " + this, e3);
            return null;
        }
    }
}
