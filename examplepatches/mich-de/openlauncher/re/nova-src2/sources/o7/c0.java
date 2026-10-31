package o7;

import java.util.HashSet;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public final UUID f79632a;

    /* renamed from: b, reason: collision with root package name */
    public final int f79633b;

    /* renamed from: c, reason: collision with root package name */
    public final HashSet f79634c;

    /* renamed from: d, reason: collision with root package name */
    public final g f79635d;

    /* renamed from: e, reason: collision with root package name */
    public final g f79636e;

    /* renamed from: f, reason: collision with root package name */
    public final int f79637f;

    /* renamed from: g, reason: collision with root package name */
    public final int f79638g;

    /* renamed from: h, reason: collision with root package name */
    public final f f79639h;

    /* renamed from: i, reason: collision with root package name */
    public final long f79640i;

    /* renamed from: j, reason: collision with root package name */
    public final b0 f79641j;

    /* renamed from: k, reason: collision with root package name */
    public final long f79642k;

    /* renamed from: l, reason: collision with root package name */
    public final int f79643l;

    public c0(UUID uuid, int i5, HashSet hashSet, g gVar, g gVar2, int i11, int i12, f fVar, long j11, b0 b0Var, long j12, int i13) {
        fq.c.o(i5, "state");
        this.f79632a = uuid;
        this.f79633b = i5;
        this.f79634c = hashSet;
        this.f79635d = gVar;
        this.f79636e = gVar2;
        this.f79637f = i11;
        this.f79638g = i12;
        this.f79639h = fVar;
        this.f79640i = j11;
        this.f79641j = b0Var;
        this.f79642k = j12;
        this.f79643l = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !c0.class.equals(obj.getClass())) {
            return false;
        }
        c0 c0Var = (c0) obj;
        if (this.f79637f == c0Var.f79637f && this.f79638g == c0Var.f79638g && this.f79632a.equals(c0Var.f79632a) && this.f79633b == c0Var.f79633b && this.f79635d.equals(c0Var.f79635d) && this.f79639h.equals(c0Var.f79639h) && this.f79640i == c0Var.f79640i && Intrinsics.b(this.f79641j, c0Var.f79641j) && this.f79642k == c0Var.f79642k && this.f79643l == c0Var.f79643l && this.f79634c.equals(c0Var.f79634c)) {
            return this.f79636e.equals(c0Var.f79636e);
        }
        return false;
    }

    public final int hashCode() {
        int iD = b.c0.d((this.f79639h.hashCode() + ((((((this.f79636e.hashCode() + ((this.f79634c.hashCode() + ((this.f79635d.hashCode() + ((b.c0.F(this.f79633b) + (this.f79632a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31) + this.f79637f) * 31) + this.f79638g) * 31)) * 31, 31, this.f79640i);
        b0 b0Var = this.f79641j;
        return Integer.hashCode(this.f79643l) + b.c0.d((iD + (b0Var != null ? b0Var.hashCode() : 0)) * 31, 31, this.f79642k);
    }

    public final String toString() {
        return "WorkInfo{id='" + this.f79632a + "', state=" + fq.c.A(this.f79633b) + ", outputData=" + this.f79635d + ", tags=" + this.f79634c + ", progress=" + this.f79636e + ", runAttemptCount=" + this.f79637f + ", generation=" + this.f79638g + ", constraints=" + this.f79639h + ", initialDelayMillis=" + this.f79640i + ", periodicityInfo=" + this.f79641j + ", nextScheduleTimeMillis=" + this.f79642k + "}, stopReason=" + this.f79643l;
    }
}
