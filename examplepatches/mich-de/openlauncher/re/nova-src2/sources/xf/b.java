package xf;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public long f95766a;

    /* renamed from: b, reason: collision with root package name */
    public long f95767b;

    /* renamed from: c, reason: collision with root package name */
    public long f95768c;

    /* renamed from: d, reason: collision with root package name */
    public long f95769d;

    /* renamed from: e, reason: collision with root package name */
    public long f95770e;

    /* renamed from: f, reason: collision with root package name */
    public long f95771f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean[] f95772g = new boolean[15];

    /* renamed from: h, reason: collision with root package name */
    public int f95773h;

    public final boolean a() {
        return this.f95769d > 15 && this.f95773h == 0;
    }

    public final void b(long j11) {
        long j12 = this.f95769d;
        if (j12 == 0) {
            this.f95766a = j11;
        } else if (j12 == 1) {
            long j13 = j11 - this.f95766a;
            this.f95767b = j13;
            this.f95771f = j13;
            this.f95770e = 1L;
        } else {
            long j14 = j11 - this.f95768c;
            int i5 = (int) (j12 % 15);
            long jAbs = Math.abs(j14 - this.f95767b);
            boolean[] zArr = this.f95772g;
            if (jAbs <= 1000000) {
                this.f95770e++;
                this.f95771f += j14;
                if (zArr[i5]) {
                    zArr[i5] = false;
                    this.f95773h--;
                }
            } else if (!zArr[i5]) {
                zArr[i5] = true;
                this.f95773h++;
            }
        }
        this.f95769d++;
        this.f95768c = j11;
    }

    public final void c() {
        this.f95769d = 0L;
        this.f95770e = 0L;
        this.f95771f = 0L;
        this.f95773h = 0;
        Arrays.fill(this.f95772g, false);
    }
}
