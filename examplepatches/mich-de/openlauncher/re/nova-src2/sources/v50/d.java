package v50;

import b.u4;
import h50.q;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class d implements Comparable<d> {

    @NotNull
    public static final c Companion = new c();

    /* renamed from: j, reason: collision with root package name */
    public static final Lazy[] f92105j;

    /* renamed from: a, reason: collision with root package name */
    public final int f92106a;

    /* renamed from: b, reason: collision with root package name */
    public final int f92107b;

    /* renamed from: c, reason: collision with root package name */
    public final int f92108c;

    /* renamed from: d, reason: collision with root package name */
    public final f f92109d;

    /* renamed from: e, reason: collision with root package name */
    public final int f92110e;

    /* renamed from: f, reason: collision with root package name */
    public final int f92111f;

    /* renamed from: g, reason: collision with root package name */
    public final e f92112g;

    /* renamed from: h, reason: collision with root package name */
    public final int f92113h;

    /* renamed from: i, reason: collision with root package name */
    public final long f92114i;

    static {
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71680b;
        f92105j = new Lazy[]{null, null, null, LazyKt.b(lazyThreadSafetyMode, new q(28)), null, null, LazyKt.b(lazyThreadSafetyMode, new q(29)), null, null};
        a.a(0L);
    }

    public /* synthetic */ d(int i5, int i11, int i12, int i13, f fVar, int i14, int i15, e eVar, int i16, long j11) {
        if (511 != (i5 & 511)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 511, b.f92104a.getDescriptor());
        }
        this.f92106a = i11;
        this.f92107b = i12;
        this.f92108c = i13;
        this.f92109d = fVar;
        this.f92110e = i14;
        this.f92111f = i15;
        this.f92112g = eVar;
        this.f92113h = i16;
        this.f92114i = j11;
    }

    @Override // java.lang.Comparable
    public final int compareTo(d dVar) {
        d other = dVar;
        Intrinsics.g(other, "other");
        return Intrinsics.i(this.f92114i, other.f92114i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f92106a == dVar.f92106a && this.f92107b == dVar.f92107b && this.f92108c == dVar.f92108c && this.f92109d == dVar.f92109d && this.f92110e == dVar.f92110e && this.f92111f == dVar.f92111f && this.f92112g == dVar.f92112g && this.f92113h == dVar.f92113h && this.f92114i == dVar.f92114i;
    }

    public final int hashCode() {
        return Long.hashCode(this.f92114i) + u4.a(this.f92113h, (this.f92112g.hashCode() + u4.a(this.f92111f, u4.a(this.f92110e, (this.f92109d.hashCode() + u4.a(this.f92108c, u4.a(this.f92107b, Integer.hashCode(this.f92106a) * 31, 31), 31)) * 31, 31), 31)) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GMTDate(seconds=");
        sb2.append(this.f92106a);
        sb2.append(", minutes=");
        sb2.append(this.f92107b);
        sb2.append(", hours=");
        sb2.append(this.f92108c);
        sb2.append(", dayOfWeek=");
        sb2.append(this.f92109d);
        sb2.append(", dayOfMonth=");
        sb2.append(this.f92110e);
        sb2.append(", dayOfYear=");
        sb2.append(this.f92111f);
        sb2.append(", month=");
        sb2.append(this.f92112g);
        sb2.append(", year=");
        sb2.append(this.f92113h);
        sb2.append(", timestamp=");
        return a2.c.n(sb2, this.f92114i, ')');
    }

    public d(int i5, int i11, int i12, f dayOfWeek, int i13, int i14, e month, int i15, long j11) {
        Intrinsics.g(dayOfWeek, "dayOfWeek");
        Intrinsics.g(month, "month");
        this.f92106a = i5;
        this.f92107b = i11;
        this.f92108c = i12;
        this.f92109d = dayOfWeek;
        this.f92110e = i13;
        this.f92111f = i14;
        this.f92112g = month;
        this.f92113h = i15;
        this.f92114i = j11;
    }
}
