package lw;

import b.c0;
import i2.s;
import kotlin.ULong;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final s0.g f75124a;

    /* renamed from: b, reason: collision with root package name */
    public final long f75125b;

    /* renamed from: c, reason: collision with root package name */
    public final long f75126c;

    public e(s0.g gVar, long j11, long j12) {
        this.f75124a = gVar;
        this.f75125b = j11;
        this.f75126c = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        if (!this.f75124a.equals(eVar.f75124a)) {
            return false;
        }
        long j11 = eVar.f75125b;
        int i5 = s.n;
        return ULong.a(this.f75125b, j11) && ULong.a(this.f75126c, eVar.f75126c);
    }

    public final int hashCode() {
        int iHashCode = this.f75124a.hashCode() * 31;
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f75126c) + c0.d(iHashCode, 31, this.f75125b);
    }

    public final String toString() {
        String strH = s.h(this.f75125b);
        String strH2 = s.h(this.f75126c);
        StringBuilder sb2 = new StringBuilder("StripeBottomSheetLayoutInfo(sheetShape=");
        sb2.append(this.f75124a);
        sb2.append(", sheetBackgroundColor=");
        sb2.append(strH);
        sb2.append(", scrimColor=");
        return c0.q(sb2, strH2, ")");
    }
}
