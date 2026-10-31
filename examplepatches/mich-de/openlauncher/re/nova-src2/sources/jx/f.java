package jx;

import b.u4;
import fr.b0;
import java.time.Instant;
import java.time.ZoneId;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final Instant f70406a;

    /* renamed from: b, reason: collision with root package name */
    public final ZoneId f70407b;

    /* renamed from: c, reason: collision with root package name */
    public final k30.x f70408c;

    /* renamed from: d, reason: collision with root package name */
    public final t f70409d;

    /* renamed from: e, reason: collision with root package name */
    public final a f70410e;

    /* renamed from: f, reason: collision with root package name */
    public final a70.d f70411f = LazyKt.a(new b0(this, 18));

    public f(Instant instant, ZoneId zoneId, k30.x xVar, t tVar, a aVar) {
        this.f70406a = instant;
        this.f70407b = zoneId;
        this.f70408c = xVar;
        this.f70409d = tVar;
        this.f70410e = aVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f70406a, fVar.f70406a) && Intrinsics.b(this.f70407b, fVar.f70407b) && Intrinsics.b(this.f70408c, fVar.f70408c) && Intrinsics.b(this.f70409d, fVar.f70409d) && Intrinsics.b(this.f70410e, fVar.f70410e);
    }

    public final int hashCode() {
        return this.f70410e.f70395a.hashCode() + u4.c((this.f70408c.hashCode() + ((this.f70407b.hashCode() + (this.f70406a.hashCode() * 31)) * 31)) * 31, 31, this.f70409d.f70427a);
    }

    public final String toString() {
        return "ConditionDeviceState(instant=" + this.f70406a + ", timezone=" + this.f70407b + ", weatherData=" + this.f70408c + ", wifiData=" + this.f70409d + ", bluetoothData=" + this.f70410e + ")";
    }
}
