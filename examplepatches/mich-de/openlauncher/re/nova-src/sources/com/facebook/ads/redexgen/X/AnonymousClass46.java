package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.46, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass46 extends C8B implements Comparable<AnonymousClass46> {
    public long A00;

    public AnonymousClass46() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.lang.Comparable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compareTo(AnonymousClass46 anonymousClass46) {
        if (A05() != anonymousClass46.A05()) {
            return A05() ? 1 : -1;
        }
        long j11 = this.A01 - anonymousClass46.A01;
        if (j11 == 0) {
            long j12 = this.A00;
            long delta = anonymousClass46.A00;
            j11 = j12 - delta;
            if (j11 == 0) {
                return 0;
            }
        }
        return j11 > 0 ? 1 : -1;
    }
}
