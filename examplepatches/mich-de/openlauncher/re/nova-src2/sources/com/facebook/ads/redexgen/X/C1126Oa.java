package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Oa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1126Oa implements Comparable<C1126Oa> {
    public int A00;
    public long A01;
    public Object A02;
    public final PS A03;

    public C1126Oa(PS ps2) {
        this.A03 = ps2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.lang.Comparable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compareTo(C1126Oa c1126Oa) {
        if ((this.A02 == null) != (c1126Oa.A02 == null)) {
            return this.A02 != null ? -1 : 1;
        }
        if (this.A02 == null) {
            return 0;
        }
        int i5 = this.A00 - c1126Oa.A00;
        if (i5 != 0) {
            return i5;
        }
        int comparePeriodIndex = N1.A08(this.A01, c1126Oa.A01);
        return comparePeriodIndex;
    }

    public final void A01(int i5, long j11, Object obj) {
        this.A00 = i5;
        this.A01 = j11;
        this.A02 = obj;
    }
}
