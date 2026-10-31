package com.facebook.ads.redexgen.X;

import android.media.metrics.LogSessionId;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Objects;

/* loaded from: assets/audience_network/classes.dex */
public final class QD {
    public static final QD A03;
    public final String A00;
    public final QC A01;
    public final Object A02;

    static {
        QD qd2;
        if (N1.A02 < 31) {
            qd2 = new QD(b.f42142b);
        } else {
            qd2 = new QD(QC.A01, b.f42142b);
        }
        A03 = qd2;
    }

    public QD(QC qc2, String str) {
        this.A01 = qc2;
        this.A00 = str;
        this.A02 = new Object();
    }

    public QD(String str) {
        AbstractC1062Ln.A08(N1.A02 < 31);
        this.A00 = str;
        this.A01 = null;
        this.A02 = new Object();
    }

    public final LogSessionId A00() {
        return ((QC) AbstractC1062Ln.A01(this.A01)).A00;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof QD)) {
            return false;
        }
        QD qd2 = (QD) obj;
        if (Objects.equals(this.A00, qd2.A00) && Objects.equals(this.A01, qd2.A01) && Objects.equals(this.A02, qd2.A02)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.A00, this.A01, this.A02);
    }
}
