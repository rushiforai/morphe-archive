package ads_mobile_sdk;

import android.os.Build;
import b.c0;
import b.t2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class wk0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f11313a;

    /* renamed from: b, reason: collision with root package name */
    public final long f11314b;

    /* renamed from: d, reason: collision with root package name */
    public final int f11315d;

    public wk0(String str, long j11, int i5) {
        String deviceModel = Build.MODEL;
        Intrinsics.g(deviceModel, "deviceModel");
        this.f11313a = str;
        this.f11314b = j11;
        this.f11315d = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wk0)) {
            return false;
        }
        wk0 wk0Var = (wk0) obj;
        if (!this.f11313a.equals(wk0Var.f11313a) || this.f11314b != wk0Var.f11314b) {
            return false;
        }
        String str = Build.MODEL;
        return Intrinsics.b(str, str) && this.f11315d == wk0Var.f11315d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f11315d) + t2.a(Build.MODEL, c0.d(this.f11313a.hashCode() * 31, 31, this.f11314b));
    }

    public final String toString() {
        return "EnvironmentData(packageName=" + this.f11313a + ", versionCode=" + this.f11314b + ", deviceModel=" + Build.MODEL + ", apiVersion=" + this.f11315d + ")";
    }
}
