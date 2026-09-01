package defpackage;

import android.net.NetworkRequest;
import android.os.Build;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e72 {
    public static final e72 j = new e72();
    public final te8 a;
    public final le8 b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final long g;
    public final long h;
    public final Set i;

    public e72(e72 e72Var) {
        e72Var.getClass();
        this.c = e72Var.c;
        this.d = e72Var.d;
        this.b = e72Var.b;
        this.a = e72Var.a;
        this.e = e72Var.e;
        this.f = e72Var.f;
        this.i = e72Var.i;
        this.g = e72Var.g;
        this.h = e72Var.h;
    }

    public final NetworkRequest a() {
        return (NetworkRequest) this.b.a;
    }

    public final boolean b() {
        return Build.VERSION.SDK_INT < 24 || !this.i.isEmpty();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !e72.class.equals(obj.getClass())) {
            return false;
        }
        e72 e72Var = (e72) obj;
        if (this.c == e72Var.c && this.d == e72Var.d && this.e == e72Var.e && this.f == e72Var.f && this.g == e72Var.g && this.h == e72Var.h && g76.L(a(), e72Var.a()) && this.a == e72Var.a) {
            return this.i.equals(e72Var.i);
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = ((((((((this.a.hashCode() * 31) + (this.c ? 1 : 0)) * 31) + (this.d ? 1 : 0)) * 31) + (this.e ? 1 : 0)) * 31) + (this.f ? 1 : 0)) * 31;
        long j2 = this.g;
        int i = (iHashCode + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        long j3 = this.h;
        int iHashCode2 = (this.i.hashCode() + ((i + ((int) (j3 ^ (j3 >>> 32)))) * 31)) * 31;
        NetworkRequest networkRequestA = a();
        return iHashCode2 + (networkRequestA != null ? networkRequestA.hashCode() : 0);
    }

    public final String toString() {
        return "Constraints{requiredNetworkType=" + this.a + ", requiresCharging=" + this.c + ", requiresDeviceIdle=" + this.d + ", requiresBatteryNotLow=" + this.e + ", requiresStorageNotLow=" + this.f + ", contentTriggerUpdateDelayMillis=" + this.g + ", contentTriggerMaxDelayMillis=" + this.h + ", contentUriTriggers=" + this.i + ", }";
    }

    public e72(le8 le8Var, te8 te8Var, boolean z, boolean z2, boolean z3, boolean z4, long j2, long j3, Set set) {
        te8Var.getClass();
        this.b = le8Var;
        this.a = te8Var;
        this.c = z;
        this.d = z2;
        this.e = z3;
        this.f = z4;
        this.g = j2;
        this.h = j3;
        this.i = set;
    }

    public e72() {
        te8 te8Var = te8.NOT_REQUIRED;
        te8Var.getClass();
        this.b = new le8(null);
        this.a = te8Var;
        this.c = false;
        this.d = false;
        this.e = false;
        this.f = false;
        this.g = -1L;
        this.h = -1L;
        this.i = ny3.a;
    }
}
