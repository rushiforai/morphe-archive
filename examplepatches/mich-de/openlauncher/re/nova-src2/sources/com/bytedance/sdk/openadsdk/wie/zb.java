package com.bytedance.sdk.openadsdk.wie;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    public static int f27287dj = 2;
    public static int lud = 3;
    public static int sya = 1;
    public static int ycx = -1;

    /* renamed from: zb, reason: collision with root package name */
    public static int f27288zb;

    /* renamed from: lt, reason: collision with root package name */
    private int f27291lt = ycx;

    /* renamed from: ul, reason: collision with root package name */
    private long f27292ul = 0;
    private long fby = 0;

    /* renamed from: jw, reason: collision with root package name */
    private final List<sya> f27290jw = new ArrayList();

    /* renamed from: jc, reason: collision with root package name */
    private long f27289jc = 0;

    public void dj(long j11) {
        int i5 = this.f27291lt;
        if (i5 == ycx || i5 != f27287dj) {
            return;
        }
        this.f27291lt = sya;
        this.f27290jw.add(new sya(this.f27289jc, j11));
        this.f27289jc = 0L;
    }

    public void sya(long j11) {
        int i5;
        int i11 = this.f27291lt;
        if (i11 == ycx || i11 == (i5 = f27287dj) || i11 == lud) {
            return;
        }
        this.f27291lt = i5;
        this.f27289jc = j11;
    }

    public void ycx(long j11) {
        this.f27291lt = f27288zb;
        this.f27292ul = j11;
    }

    public void zb(long j11) {
        int i5;
        int i11 = this.f27291lt;
        if (i11 == ycx || i11 == (i5 = lud)) {
            return;
        }
        this.f27291lt = i5;
        this.fby = j11;
    }

    public long ycx(long j11, long j12) {
        long j13;
        long j14;
        long jZb;
        long j15 = this.fby;
        if (j15 != 0 && j11 > j15) {
            return 0L;
        }
        int i5 = 0;
        for (sya syaVar : this.f27290jw) {
            if (syaVar.zb() > j11) {
                if (j11 < syaVar.ycx()) {
                    j14 = i5;
                    jZb = syaVar.zb() - syaVar.ycx();
                } else {
                    j14 = i5;
                    jZb = syaVar.zb() - j11;
                }
                i5 = (int) (jZb + j14);
            }
        }
        long j16 = this.f27292ul;
        if (j16 < j11) {
            long j17 = this.f27289jc;
            if (j17 == 0) {
                j17 = this.fby;
                if (j17 == 0) {
                    j13 = j12 - j11;
                }
            } else if (j17 <= j11) {
                return 0L;
            }
            return (j17 - j11) - i5;
        }
        long j18 = this.f27289jc;
        if (j18 == 0) {
            j18 = this.fby;
            if (j18 == 0) {
                j13 = j12 - j16;
            }
        } else if (j18 <= j16) {
            return 0L;
        }
        return (j18 - j16) - i5;
        return j13 - i5;
    }

    public int ycx() {
        return this.f27291lt;
    }
}
