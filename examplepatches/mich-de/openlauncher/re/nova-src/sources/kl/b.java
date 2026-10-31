package kl;

import java.util.Arrays;

/* loaded from: classes3.dex */
public class b {

    /* renamed from: a, reason: collision with root package name */
    public final long[] f71566a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f71567b;

    /* renamed from: c, reason: collision with root package name */
    public final long[] f71568c;

    public b(long[] jArr, long[] jArr2, long[] jArr3) {
        this.f71566a = jArr;
        this.f71567b = jArr2;
        this.f71568c = jArr3;
    }

    public final void a(b bVar, int i5) {
        a.d(this.f71566a, bVar.f71566a, i5);
        a.d(this.f71567b, bVar.f71567b, i5);
        a.d(this.f71568c, bVar.f71568c, i5);
    }

    public void b(long[] jArr, long[] jArr2) {
        System.arraycopy(jArr2, 0, jArr, 0, 10);
    }

    public b() {
        b bVar = a.f71557b;
        this.f71566a = Arrays.copyOf(bVar.f71566a, 10);
        this.f71567b = Arrays.copyOf(bVar.f71567b, 10);
        this.f71568c = Arrays.copyOf(bVar.f71568c, 10);
    }
}
