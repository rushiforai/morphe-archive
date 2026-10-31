package p10;

import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a2 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81694a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f81695b;

    /* renamed from: c, reason: collision with root package name */
    public final long f81696c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f81697d;

    /* renamed from: e, reason: collision with root package name */
    public final long f81698e;

    /* renamed from: f, reason: collision with root package name */
    public final long f81699f;

    /* renamed from: g, reason: collision with root package name */
    public final int f81700g;

    /* renamed from: h, reason: collision with root package name */
    public final List f81701h;

    /* renamed from: i, reason: collision with root package name */
    public final int f81702i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f81703j;

    /* renamed from: k, reason: collision with root package name */
    public final int f81704k;

    /* renamed from: l, reason: collision with root package name */
    public final d0 f81705l;

    public a2(long j11, boolean z11, long j12, boolean z12, long j13, long j14, int i5, List list, int i11, boolean z13, int i12, d0 d0Var) {
        this.f81694a = j11;
        this.f81695b = z11;
        this.f81696c = j12;
        this.f81697d = z12;
        this.f81698e = j13;
        this.f81699f = j14;
        this.f81700g = i5;
        this.f81701h = list;
        this.f81702i = i11;
        this.f81703j = z13;
        this.f81704k = i12;
        this.f81705l = d0Var;
    }

    public static a2 a(a2 a2Var, long j11, boolean z11, long j12, boolean z12, long j13, long j14, int i5, ArrayList arrayList, int i11, boolean z13, int i12, d0 d0Var, int i13) {
        long j15 = (i13 & 1) != 0 ? a2Var.f81694a : j11;
        boolean z14 = (i13 & 2) != 0 ? a2Var.f81695b : z11;
        long j16 = (i13 & 4) != 0 ? a2Var.f81696c : j12;
        boolean z15 = (i13 & 8) != 0 ? a2Var.f81697d : z12;
        long j17 = (i13 & 16) != 0 ? a2Var.f81698e : j13;
        long j18 = (i13 & 32) != 0 ? a2Var.f81699f : j14;
        int i14 = (i13 & 64) != 0 ? a2Var.f81700g : i5;
        List list = (i13 & 128) != 0 ? a2Var.f81701h : arrayList;
        int i15 = (i13 & 256) != 0 ? a2Var.f81702i : i11;
        boolean z16 = (i13 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? a2Var.f81703j : z13;
        long j19 = j15;
        int i16 = (i13 & 1024) != 0 ? a2Var.f81704k : i12;
        d0 d0Var2 = (i13 & 2048) != 0 ? a2Var.f81705l : d0Var;
        a2Var.getClass();
        return new a2(j19, z14, j16, z15, j17, j18, i14, list, i15, z16, i16, d0Var2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a2)) {
            return false;
        }
        a2 a2Var = (a2) obj;
        return this.f81694a == a2Var.f81694a && this.f81695b == a2Var.f81695b && this.f81696c == a2Var.f81696c && this.f81697d == a2Var.f81697d && this.f81698e == a2Var.f81698e && this.f81699f == a2Var.f81699f && this.f81700g == a2Var.f81700g && Intrinsics.b(this.f81701h, a2Var.f81701h) && this.f81702i == a2Var.f81702i && this.f81703j == a2Var.f81703j && this.f81704k == a2Var.f81704k && Intrinsics.b(this.f81705l, a2Var.f81705l);
    }

    public final int hashCode() {
        int iA = u4.a(this.f81704k, c9.f(u4.a(this.f81702i, u4.c(u4.a(this.f81700g, b.c0.d(b.c0.d(c9.f(b.c0.d(c9.f(Long.hashCode(this.f81694a) * 31, 31, this.f81695b), 31, this.f81696c), 31, this.f81697d), 31, this.f81698e), 31, this.f81699f), 31), 31, this.f81701h), 31), 31, this.f81703j), 31);
        d0 d0Var = this.f81705l;
        return iA + (d0Var == null ? 0 : d0Var.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RewardsUiState(balance=");
        sb2.append(this.f81694a);
        sb2.append(", checkInAvailable=");
        sb2.append(this.f81695b);
        b.c0.B(sb2, ", checkInCoins=", this.f81696c, ", rewardedEnabled=");
        sb2.append(this.f81697d);
        sb2.append(", rewardedCoins=");
        sb2.append(this.f81698e);
        b.c0.B(sb2, ", rewardedCoinsAtMax=", this.f81699f, ", rewardedRemainingToday=");
        sb2.append(this.f81700g);
        sb2.append(", rewards=");
        sb2.append(this.f81701h);
        sb2.append(", streakDay=");
        sb2.append(this.f81702i);
        sb2.append(", streakAtMax=");
        sb2.append(this.f81703j);
        sb2.append(", streakRampDays=");
        sb2.append(this.f81704k);
        sb2.append(", merch=");
        sb2.append(this.f81705l);
        sb2.append(")");
        return sb2.toString();
    }
}
