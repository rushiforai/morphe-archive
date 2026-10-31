package ads_mobile_sdk;

import b.c0;
import b.k9;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes2.dex */
public final class hv {

    /* renamed from: a, reason: collision with root package name */
    public final String f4547a;

    /* renamed from: b, reason: collision with root package name */
    public final String f4548b;

    /* renamed from: c, reason: collision with root package name */
    public final String f4549c;

    /* renamed from: d, reason: collision with root package name */
    public final String f4550d;

    /* renamed from: e, reason: collision with root package name */
    public final com.google.gson.r f4551e;

    /* renamed from: f, reason: collision with root package name */
    public final com.google.gson.r f4552f;

    /* renamed from: g, reason: collision with root package name */
    public final mp f4553g;

    /* renamed from: h, reason: collision with root package name */
    public final String f4554h;

    /* renamed from: i, reason: collision with root package name */
    public final com.google.gson.r f4555i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f4556j;

    /* renamed from: k, reason: collision with root package name */
    public final long f4557k;

    /* renamed from: l, reason: collision with root package name */
    public final int f4558l;

    /* renamed from: m, reason: collision with root package name */
    public final ArrayList f4559m;
    public final long n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final int f4560p;

    /* renamed from: q, reason: collision with root package name */
    public final com.google.gson.r f4561q;

    /* renamed from: r, reason: collision with root package name */
    public final String f4562r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f4563s;

    /* renamed from: t, reason: collision with root package name */
    public final com.google.gson.r f4564t;

    /* renamed from: u, reason: collision with root package name */
    public final boolean f4565u;

    public hv(String str, String str2, String str3, String str4, com.google.gson.r adResponseHeaders, com.google.gson.r biddingData, mp mpVar, String str5, com.google.gson.r inspectorExtras, boolean z11, long j11, int i5, ArrayList arrayList, long j12, long j13, int i11, com.google.gson.r rVar, String str6, boolean z12, com.google.gson.r rVar2, boolean z13) {
        Intrinsics.g(adResponseHeaders, "adResponseHeaders");
        Intrinsics.g(biddingData, "biddingData");
        Intrinsics.g(inspectorExtras, "inspectorExtras");
        this.f4547a = str;
        this.f4548b = str2;
        this.f4549c = str3;
        this.f4550d = str4;
        this.f4551e = adResponseHeaders;
        this.f4552f = biddingData;
        this.f4553g = mpVar;
        this.f4554h = str5;
        this.f4555i = inspectorExtras;
        this.f4556j = z11;
        this.f4557k = j11;
        this.f4558l = i5;
        this.f4559m = arrayList;
        this.n = j12;
        this.o = j13;
        this.f4560p = i11;
        this.f4561q = rVar;
        this.f4562r = str6;
        this.f4563s = z12;
        this.f4564t = rVar2;
        this.f4565u = z13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hv)) {
            return false;
        }
        hv hvVar = (hv) obj;
        return this.f4547a.equals(hvVar.f4547a) && this.f4548b.equals(hvVar.f4548b) && this.f4549c.equals(hvVar.f4549c) && this.f4550d.equals(hvVar.f4550d) && Intrinsics.b(this.f4551e, hvVar.f4551e) && Intrinsics.b(this.f4552f, hvVar.f4552f) && Intrinsics.b(this.f4553g, hvVar.f4553g) && this.f4554h.equals(hvVar.f4554h) && Intrinsics.b(this.f4555i, hvVar.f4555i) && this.f4556j == hvVar.f4556j && this.f4557k == hvVar.f4557k && this.f4558l == hvVar.f4558l && this.f4559m.equals(hvVar.f4559m) && Duration.d(this.n, hvVar.n) && Duration.d(this.o, hvVar.o) && this.f4560p == hvVar.f4560p && this.f4561q.equals(hvVar.f4561q) && this.f4562r.equals(hvVar.f4562r) && this.f4563s == hvVar.f4563s && Intrinsics.b(this.f4564t, hvVar.f4564t) && this.f4565u == hvVar.f4565u;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = (this.f4552f.f34795a.hashCode() + ((this.f4551e.f34795a.hashCode() + c0.e(c0.e(c0.e(this.f4547a.hashCode() * 31, 31, this.f4548b), 31, this.f4549c), 31, this.f4550d)) * 31)) * 31;
        mp mpVar = this.f4553g;
        int iHashCode2 = (this.f4555i.f34795a.hashCode() + c0.e((iHashCode + (mpVar == null ? 0 : mpVar.hashCode())) * 31, 31, this.f4554h)) * 31;
        boolean z11 = this.f4556j;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iHashCode3 = (this.f4559m.hashCode() + k9.b(this.f4558l, c0.d((iHashCode2 + i5) * 31, 31, this.f4557k))) * 31;
        Duration.Companion companion = Duration.f72038b;
        int iE = c0.e((this.f4561q.f34795a.hashCode() + k9.b(this.f4560p, c0.d(c0.d(iHashCode3, 31, this.n), 31, this.o))) * 31, 31, this.f4562r);
        boolean z12 = this.f4563s;
        int i11 = z12;
        if (z12 != 0) {
            i11 = 1;
        }
        int i12 = (iE + i11) * 31;
        com.google.gson.r rVar = this.f4564t;
        int iHashCode4 = (i12 + (rVar != null ? rVar.f34795a.hashCode() : 0)) * 31;
        boolean z13 = this.f4565u;
        return iHashCode4 + (z13 ? 1 : z13 ? 1 : 0);
    }

    public final String toString() {
        String strR = Duration.r(this.n);
        String strR2 = Duration.r(this.o);
        StringBuilder sbW = c0.w("CommonConfiguration(adapterResponseReplacementKey=", this.f4547a, ", adRequestPostBody=", this.f4548b, ", adRequestUrl=");
        c0.D(sbW, this.f4549c, ", adResponseBody=", this.f4550d, ", adResponseHeaders=");
        sbW.append(this.f4551e);
        sbW.append(", biddingData=");
        sbW.append(this.f4552f);
        sbW.append(", bowResponseError=");
        sbW.append(this.f4553g);
        sbW.append(", gwsQueryId=");
        sbW.append(this.f4554h);
        sbW.append(", inspectorExtras=");
        sbW.append(this.f4555i);
        sbW.append(", isIdless=");
        sbW.append(this.f4556j);
        sbW.append(", latency=");
        sbW.append(this.f4557k);
        sbW.append(", maxParallelRenderers=");
        sbW.append(this.f4558l);
        sbW.append(", noFillUrls=");
        sbW.append(this.f4559m);
        sbW.append(", refreshInterval=");
        sbW.append(strR);
        sbW.append(", proactiveRefreshLoadDelayInterval=");
        sbW.append(strR2);
        sbW.append(", responseCode=");
        sbW.append(this.f4560p);
        sbW.append(", responseInfoExtras=");
        sbW.append(this.f4561q);
        sbW.append(", scionQueryEventId=");
        sbW.append(this.f4562r);
        sbW.append(", isPersistentAdEnabled=");
        sbW.append(this.f4563s);
        sbW.append(", throttleConfiguration=");
        sbW.append(this.f4564t);
        sbW.append(", isCrossProcessAdEnabled=");
        sbW.append(this.f4565u);
        sbW.append(")");
        return sbW.toString();
    }
}
