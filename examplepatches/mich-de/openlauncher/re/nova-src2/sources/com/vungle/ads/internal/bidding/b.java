package com.vungle.ads.internal.bidding;

import com.iab.omid.library.vungle.internal.l;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f46743a;

    /* renamed from: b, reason: collision with root package name */
    public final String f46744b;

    public b(String bidToken, String errorMessage) {
        Intrinsics.g(bidToken, "bidToken");
        Intrinsics.g(errorMessage, "errorMessage");
        this.f46743a = bidToken;
        this.f46744b = errorMessage;
    }

    public final String a() {
        return this.f46743a;
    }

    public final String b() {
        return this.f46744b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f46743a, bVar.f46743a) && Intrinsics.b(this.f46744b, bVar.f46744b);
    }

    public final int hashCode() {
        return this.f46744b.hashCode() + (this.f46743a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sbA = l.a("BiddingTokenInfo(bidToken=");
        sbA.append(this.f46743a);
        sbA.append(", errorMessage=");
        return c1.t(sbA, this.f46744b, ')');
    }
}
