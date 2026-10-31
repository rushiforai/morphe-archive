package d2;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final int f48867a;

    /* renamed from: b, reason: collision with root package name */
    public final long f48868b;

    /* renamed from: c, reason: collision with root package name */
    public final f f48869c;

    /* renamed from: d, reason: collision with root package name */
    public final cm.f f48870d;

    public e(int i5, long j11, f fVar, cm.f fVar2) {
        this.f48867a = i5;
        this.f48868b = j11;
        this.f48869c = fVar;
        this.f48870d = fVar2;
    }

    public final int a() {
        return this.f48867a;
    }

    public final cm.f b() {
        return this.f48870d;
    }

    public final f c() {
        return this.f48869c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f48867a == eVar.f48867a && this.f48868b == eVar.f48868b && this.f48869c == eVar.f48869c && Intrinsics.b(this.f48870d, eVar.f48870d);
    }

    public final int hashCode() {
        int iHashCode = (this.f48869c.hashCode() + c0.d(Integer.hashCode(this.f48867a) * 31, 31, this.f48868b)) * 31;
        cm.f fVar = this.f48870d;
        return iHashCode + (fVar == null ? 0 : fVar.hashCode());
    }

    public final String toString() {
        return "ContentCaptureEvent(id=" + this.f48867a + ", timestamp=" + this.f48868b + ", type=" + this.f48869c + ", structureCompat=" + this.f48870d + ')';
    }
}
