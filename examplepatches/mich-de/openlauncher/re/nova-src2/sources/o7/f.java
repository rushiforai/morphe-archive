package o7;

import h6.c1;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: i, reason: collision with root package name */
    public static final f f79652i = new f(1, false, false, false, false, -1, -1, EmptySet.f71734a);

    /* renamed from: a, reason: collision with root package name */
    public final int f79653a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f79654b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f79655c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f79656d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f79657e;

    /* renamed from: f, reason: collision with root package name */
    public final long f79658f;

    /* renamed from: g, reason: collision with root package name */
    public final long f79659g;

    /* renamed from: h, reason: collision with root package name */
    public final Set f79660h;

    public f(int i5, boolean z11, boolean z12, boolean z13, boolean z14, long j11, long j12, Set contentUriTriggers) {
        fq.c.o(i5, "requiredNetworkType");
        Intrinsics.g(contentUriTriggers, "contentUriTriggers");
        this.f79653a = i5;
        this.f79654b = z11;
        this.f79655c = z12;
        this.f79656d = z13;
        this.f79657e = z14;
        this.f79658f = j11;
        this.f79659g = j12;
        this.f79660h = contentUriTriggers;
    }

    public final boolean a() {
        return !this.f79660h.isEmpty();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !f.class.equals(obj.getClass())) {
            return false;
        }
        f fVar = (f) obj;
        if (this.f79654b == fVar.f79654b && this.f79655c == fVar.f79655c && this.f79656d == fVar.f79656d && this.f79657e == fVar.f79657e && this.f79658f == fVar.f79658f && this.f79659g == fVar.f79659g && this.f79653a == fVar.f79653a) {
            return Intrinsics.b(this.f79660h, fVar.f79660h);
        }
        return false;
    }

    public final int hashCode() {
        int iF = ((((((((b.c0.F(this.f79653a) * 31) + (this.f79654b ? 1 : 0)) * 31) + (this.f79655c ? 1 : 0)) * 31) + (this.f79656d ? 1 : 0)) * 31) + (this.f79657e ? 1 : 0)) * 31;
        long j11 = this.f79658f;
        int i5 = (iF + ((int) (j11 ^ (j11 >>> 32)))) * 31;
        long j12 = this.f79659g;
        return this.f79660h.hashCode() + ((i5 + ((int) (j12 ^ (j12 >>> 32)))) * 31);
    }

    public final String toString() {
        return "Constraints{requiredNetworkType=" + c1.C(this.f79653a) + ", requiresCharging=" + this.f79654b + ", requiresDeviceIdle=" + this.f79655c + ", requiresBatteryNotLow=" + this.f79656d + ", requiresStorageNotLow=" + this.f79657e + ", contentTriggerUpdateDelayMillis=" + this.f79658f + ", contentTriggerMaxDelayMillis=" + this.f79659g + ", contentUriTriggers=" + this.f79660h + ", }";
    }

    public f(f other) {
        Intrinsics.g(other, "other");
        this.f79654b = other.f79654b;
        this.f79655c = other.f79655c;
        this.f79653a = other.f79653a;
        this.f79656d = other.f79656d;
        this.f79657e = other.f79657e;
        this.f79660h = other.f79660h;
        this.f79658f = other.f79658f;
        this.f79659g = other.f79659g;
    }
}
