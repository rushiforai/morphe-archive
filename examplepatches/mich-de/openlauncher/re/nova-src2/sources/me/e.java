package me;

import com.amplitude.eventbridge.EventBridgeChannel;
import ke.r;
import ke.t;
import ke.v;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final v f76250a;

    /* renamed from: b, reason: collision with root package name */
    public final int f76251b;

    /* renamed from: c, reason: collision with root package name */
    public final int f76252c;

    /* renamed from: d, reason: collision with root package name */
    public final long f76253d;

    /* renamed from: e, reason: collision with root package name */
    public final int f76254e;

    /* renamed from: f, reason: collision with root package name */
    public int f76255f;

    /* renamed from: g, reason: collision with root package name */
    public int f76256g;

    /* renamed from: h, reason: collision with root package name */
    public int f76257h;

    /* renamed from: i, reason: collision with root package name */
    public int f76258i;

    /* renamed from: j, reason: collision with root package name */
    public int f76259j;

    /* renamed from: k, reason: collision with root package name */
    public long[] f76260k;

    /* renamed from: l, reason: collision with root package name */
    public int[] f76261l;

    public e(int i5, int i11, long j11, int i12, v vVar) {
        boolean z11 = true;
        if (i11 != 1 && i11 != 2) {
            z11 = false;
        }
        wf.a.e(z11);
        this.f76253d = j11;
        this.f76254e = i12;
        this.f76250a = vVar;
        int i13 = (((i5 % 10) + 48) << 8) | ((i5 / 10) + 48);
        this.f76251b = (i11 == 2 ? 1667497984 : 1651965952) | i13;
        this.f76252c = i11 == 2 ? i13 | 1650720768 : -1;
        this.f76260k = new long[EventBridgeChannel.QUEUE_CAPACITY];
        this.f76261l = new int[EventBridgeChannel.QUEUE_CAPACITY];
    }

    public final t a(int i5) {
        return new t(((this.f76253d * 1) / this.f76254e) * this.f76261l[i5], this.f76260k[i5]);
    }

    public final r b(long j11) {
        int i5 = (int) (j11 / ((this.f76253d * 1) / this.f76254e));
        int iD = wf.v.d(this.f76261l, i5, true, true);
        if (this.f76261l[iD] == i5) {
            t tVarA = a(iD);
            return new r(tVarA, tVarA);
        }
        t tVarA2 = a(iD);
        int i11 = iD + 1;
        return i11 < this.f76260k.length ? new r(tVarA2, a(i11)) : new r(tVarA2, tVarA2);
    }
}
