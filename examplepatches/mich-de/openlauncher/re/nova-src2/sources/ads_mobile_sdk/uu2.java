package ads_mobile_sdk;

import b.k9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class uu2 {

    /* renamed from: a, reason: collision with root package name */
    public final z1 f10488a;

    /* renamed from: b, reason: collision with root package name */
    public km0 f10489b;

    /* renamed from: c, reason: collision with root package name */
    public final long f10490c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f10491d;

    public uu2(z1 z1Var, km0 fillStatus, long j11, Integer num) {
        Intrinsics.g(fillStatus, "fillStatus");
        this.f10488a = z1Var;
        this.f10489b = fillStatus;
        this.f10490c = j11;
        this.f10491d = num;
    }

    public final String toString() {
        return k9.s(this.f10488a, this.f10489b, this.f10490c, this.f10491d);
    }
}
