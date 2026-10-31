package io.branch.search.internal;

import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class gg implements InterfaceC3432w6 {

    /* renamed from: a, reason: collision with root package name */
    public final long f64608a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Long f64609b;

    /* renamed from: c, reason: collision with root package name */
    public final int f64610c;

    /* renamed from: d, reason: collision with root package name */
    public final int f64611d;

    /* renamed from: e, reason: collision with root package name */
    public final int f64612e;

    /* renamed from: f, reason: collision with root package name */
    public final int f64613f;

    /* renamed from: g, reason: collision with root package name */
    public final int f64614g;

    /* renamed from: h, reason: collision with root package name */
    public final int f64615h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f64616i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final Lazy f64617j = LazyKt.a(new a());

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final Lazy f64618k = LazyKt.a(new b());

    public static final class a extends Lambda implements Function0<Integer> {
        public a() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            gg ggVar = gg.this;
            return Integer.valueOf(ggVar.f64610c * ggVar.f64611d);
        }
    }

    public static final class b extends Lambda implements Function0<Integer> {
        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            gg ggVar = gg.this;
            return Integer.valueOf(ggVar.f64612e * ggVar.f64613f);
        }
    }

    public gg(long j11, @Nullable Long l9, int i5, int i11, int i12, int i13, int i14, int i15, boolean z11) {
        this.f64608a = j11;
        this.f64609b = l9;
        this.f64610c = i5;
        this.f64611d = i11;
        this.f64612e = i12;
        this.f64613f = i13;
        this.f64614g = i14;
        this.f64615h = i15;
        this.f64616i = z11;
    }

    @Override // io.branch.search.internal.InterfaceC3432w6
    public final long a() {
        return this.f64608a;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gg)) {
            return false;
        }
        gg ggVar = (gg) obj;
        return this.f64608a == ggVar.f64608a && Intrinsics.b(this.f64609b, ggVar.f64609b) && this.f64610c == ggVar.f64610c && this.f64611d == ggVar.f64611d && this.f64612e == ggVar.f64612e && this.f64613f == ggVar.f64613f && this.f64614g == ggVar.f64614g && this.f64615h == ggVar.f64615h && this.f64616i == ggVar.f64616i;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = Long.hashCode(this.f64608a) * 31;
        Long l9 = this.f64609b;
        int iA = C3214j8.a(this.f64615h, C3214j8.a(this.f64614g, C3214j8.a(this.f64613f, C3214j8.a(this.f64612e, C3214j8.a(this.f64611d, C3214j8.a(this.f64610c, (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31, 31), 31), 31), 31), 31), 31);
        boolean z11 = this.f64616i;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iA + i5;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ZeroStateRequestData(timeStamp=");
        sb2.append(this.f64608a);
        sb2.append(", userId=");
        sb2.append(this.f64609b);
        sb2.append(", saRowCount=");
        sb2.append(this.f64610c);
        sb2.append(", saRowSize=");
        sb2.append(this.f64611d);
        sb2.append(", slRowCount=");
        sb2.append(this.f64612e);
        sb2.append(", slRowSize=");
        sb2.append(this.f64613f);
        sb2.append(", siRowCount=");
        sb2.append(this.f64614g);
        sb2.append(", siRowSize=");
        sb2.append(this.f64615h);
        sb2.append(", forCacheUpdate=");
        return a2.c.p(sb2, this.f64616i, ')');
    }
}
