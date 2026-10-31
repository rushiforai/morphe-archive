package qe;

import java.util.ArrayDeque;
import ke.k;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f83924a = new byte[8];

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f83925b = new ArrayDeque();

    /* renamed from: c, reason: collision with root package name */
    public final e f83926c = new e();

    /* renamed from: d, reason: collision with root package name */
    public q.c f83927d;

    /* renamed from: e, reason: collision with root package name */
    public int f83928e;

    /* renamed from: f, reason: collision with root package name */
    public int f83929f;

    /* renamed from: g, reason: collision with root package name */
    public long f83930g;

    public final long a(k kVar, int i5) {
        kVar.readFully(this.f83924a, 0, i5);
        long j11 = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            j11 = (j11 << 8) | (r0[i11] & 255);
        }
        return j11;
    }
}
