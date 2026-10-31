package se;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import wf.v;

/* loaded from: classes3.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final p f87358a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87359b;

    /* renamed from: c, reason: collision with root package name */
    public final long[] f87360c;

    /* renamed from: d, reason: collision with root package name */
    public final int[] f87361d;

    /* renamed from: e, reason: collision with root package name */
    public final int f87362e;

    /* renamed from: f, reason: collision with root package name */
    public final long[] f87363f;

    /* renamed from: g, reason: collision with root package name */
    public final int[] f87364g;

    /* renamed from: h, reason: collision with root package name */
    public final long f87365h;

    public s(p pVar, long[] jArr, int[] iArr, int i5, long[] jArr2, int[] iArr2, long j11) {
        wf.a.e(iArr.length == jArr2.length);
        wf.a.e(jArr.length == jArr2.length);
        wf.a.e(iArr2.length == jArr2.length);
        this.f87358a = pVar;
        this.f87360c = jArr;
        this.f87361d = iArr;
        this.f87362e = i5;
        this.f87363f = jArr2;
        this.f87364g = iArr2;
        this.f87365h = j11;
        this.f87359b = jArr.length;
        if (iArr2.length > 0) {
            int length = iArr2.length - 1;
            iArr2[length] = iArr2[length] | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
        }
    }

    public final int a(long j11) {
        long[] jArr = this.f87363f;
        for (int iB = v.b(jArr, j11, true); iB < jArr.length; iB++) {
            if ((this.f87364g[iB] & 1) != 0) {
                return iB;
            }
        }
        return -1;
    }
}
