package com.facebook.ads.redexgen.X;

import android.media.AudioTrack;

/* renamed from: com.facebook.ads.redexgen.X.Qr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1183Qr {
    public static String[] A06 = {"ZC93MQ23Yh9ZuGELE", "YCFIEH73Qdsm", "9LJE6kCrUuIfCh6K1cvi2SCxld95rKgF", "mUze9eeMrBjEikfQTZ3fmpLzU8VG1Rzk", "gSOsBennIVuamqUS2xFPdnuu", "8YYYjuDAdVxv5awAvW98Zv9hkC3G5n4s", "RvKXN2fljwqPuqEKUv8ne2lrVNa0ocBo", "oeYA6y2RxQdEwc2O1sVJZ8CIRbLwBW9N"};
    public int A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public final C1181Qp A05;

    public C1183Qr(AudioTrack audioTrack) {
        if (N1.A02 >= 19) {
            this.A05 = new C1181Qp(audioTrack);
            A05();
        } else {
            this.A05 = null;
            A00(3);
        }
    }

    private void A00(int i5) {
        this.A00 = i5;
        switch (i5) {
            case 0:
                this.A03 = 0L;
                this.A01 = -1L;
                this.A02 = System.nanoTime() / 1000;
                this.A04 = 5000L;
                return;
            case 1:
                this.A04 = 5000L;
                return;
            case 2:
            case 3:
                this.A04 = 10000000L;
                return;
            case 4:
                this.A04 = 500000L;
                return;
            default:
                throw new IllegalStateException();
        }
    }

    public final long A01() {
        if (this.A05 != null) {
            return this.A05.A00();
        }
        return -1L;
    }

    public final long A02() {
        if (this.A05 != null) {
            return this.A05.A01();
        }
        return -9223372036854775807L;
    }

    public final void A03() {
        if (this.A00 == 4) {
            A05();
        }
    }

    public final void A04() {
        A00(4);
    }

    public final void A05() {
        if (this.A05 != null) {
            A00(0);
        }
    }

    public final boolean A06() {
        return this.A00 == 2;
    }

    public final boolean A07(long j11) {
        if (this.A05 == null || j11 - this.A03 < this.A04) {
            return false;
        }
        this.A03 = j11;
        boolean zA02 = this.A05.A02();
        switch (this.A00) {
            case 0:
                if (zA02) {
                    long jA01 = this.A05.A01();
                    long timestampPositionFrames = this.A02;
                    if (jA01 >= timestampPositionFrames) {
                        this.A01 = this.A05.A00();
                        A00(1);
                        return zA02;
                    }
                    return false;
                }
                long j12 = this.A02;
                if (A06[0].length() != 17) {
                    A06[4] = "TzRrdbo";
                    if (j11 - j12 <= 500000) {
                        return zA02;
                    }
                } else {
                    String[] strArr = A06;
                    strArr[5] = "BmQlCGNjeQmmKTb9SWms6bU8Sb0HGE3Y";
                    strArr[6] = "dFvkOmehb1zUwf70EV8tvksbEgSORIri";
                    if (j11 - j12 <= 500000) {
                        return zA02;
                    }
                }
                A00(3);
                return zA02;
            case 1:
                if (zA02) {
                    long jA00 = this.A05.A00();
                    long j13 = this.A01;
                    if (A06[3].length() == 19) {
                        throw new RuntimeException();
                    }
                    A06[4] = "5avojWuRn30zgHFHK5jyzezvHQrlLUdD";
                    if (jA00 > j13) {
                        A00(2);
                        return zA02;
                    }
                    return zA02;
                }
                A05();
                return zA02;
            case 2:
                if (!zA02) {
                    A05();
                    return zA02;
                }
                return zA02;
            case 3:
                if (zA02) {
                    A05();
                    return zA02;
                }
                return zA02;
            case 4:
                return zA02;
            default:
                throw new IllegalStateException();
        }
    }
}
