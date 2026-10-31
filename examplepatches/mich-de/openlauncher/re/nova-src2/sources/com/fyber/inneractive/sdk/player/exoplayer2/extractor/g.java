package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

import androidx.recyclerview.widget.u1;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.nio.ByteBuffer;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.atomic.AtomicInteger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class g implements r {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.b f29182a;

    /* renamed from: b, reason: collision with root package name */
    public final int f29183b;

    /* renamed from: c, reason: collision with root package name */
    public final e f29184c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedBlockingDeque f29185d;

    /* renamed from: e, reason: collision with root package name */
    public final d f29186e;

    /* renamed from: f, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29187f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicInteger f29188g;

    /* renamed from: h, reason: collision with root package name */
    public long f29189h;

    /* renamed from: i, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.o f29190i;

    /* renamed from: j, reason: collision with root package name */
    public long f29191j;

    /* renamed from: k, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.upstream.a f29192k;

    /* renamed from: l, reason: collision with root package name */
    public int f29193l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f29194m;
    public f n;

    public g(com.fyber.inneractive.sdk.player.exoplayer2.upstream.b bVar) {
        this.f29182a = bVar;
        ((com.fyber.inneractive.sdk.player.exoplayer2.upstream.l) bVar).getClass();
        this.f29183b = SQLiteDatabase.OPEN_FULLMUTEX;
        this.f29184c = new e();
        this.f29185d = new LinkedBlockingDeque();
        this.f29186e = new d();
        this.f29187f = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(32);
        this.f29188g = new AtomicInteger();
        this.f29193l = SQLiteDatabase.OPEN_FULLMUTEX;
    }

    public final void a(boolean z11) {
        int andSet = this.f29188g.getAndSet(z11 ? 0 : 2);
        a();
        e eVar = this.f29184c;
        eVar.f29154m = Long.MIN_VALUE;
        eVar.n = Long.MIN_VALUE;
        if (andSet == 2) {
            this.f29190i = null;
        }
    }

    public final void b() {
        if (this.f29188g.getAndSet(2) == 0) {
            a();
        }
    }

    public final void c() {
        if (this.f29188g.compareAndSet(1, 0)) {
            return;
        }
        a();
    }

    public final long d() {
        long jMax;
        e eVar = this.f29184c;
        synchronized (eVar) {
            jMax = Math.max(eVar.f29154m, eVar.n);
        }
        return jMax;
    }

    public final com.fyber.inneractive.sdk.player.exoplayer2.o e() {
        com.fyber.inneractive.sdk.player.exoplayer2.o oVar;
        e eVar = this.f29184c;
        synchronized (eVar) {
            oVar = eVar.f29155p ? null : eVar.f29156q;
        }
        return oVar;
    }

    public final void f() {
        long j11;
        e eVar = this.f29184c;
        synchronized (eVar) {
            int i5 = eVar.f29150i;
            if (i5 == 0) {
                j11 = -1;
            } else {
                int i11 = eVar.f29152k + i5;
                int i12 = eVar.f29142a;
                int i13 = (i11 - 1) % i12;
                eVar.f29152k = i11 % i12;
                eVar.f29151j += i5;
                eVar.f29150i = 0;
                j11 = eVar.f29144c[i13] + eVar.f29145d[i13];
            }
        }
        if (j11 != -1) {
            a(j11);
        }
    }

    public final boolean a(boolean z11, long j11) {
        long j12;
        e eVar = this.f29184c;
        synchronized (eVar) {
            if (eVar.f29150i != 0) {
                long[] jArr = eVar.f29147f;
                int i5 = eVar.f29152k;
                if (j11 < jArr[i5]) {
                    j12 = -1;
                } else {
                    if (j11 <= eVar.n || z11) {
                        int i11 = -1;
                        int i12 = 0;
                        while (i5 != eVar.f29153l && eVar.f29147f[i5] <= j11) {
                            if ((eVar.f29146e[i5] & 1) != 0) {
                                i11 = i12;
                            }
                            i5 = (i5 + 1) % eVar.f29142a;
                            i12++;
                        }
                        if (i11 != -1) {
                            int i13 = (eVar.f29152k + i11) % eVar.f29142a;
                            eVar.f29152k = i13;
                            eVar.f29151j += i11;
                            eVar.f29150i -= i11;
                            j12 = eVar.f29144c[i13];
                        }
                    }
                    j12 = -1;
                }
            } else {
                j12 = -1;
            }
        }
        if (j12 == -1) {
            return false;
        }
        a(j12);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:103:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0097  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.p pVar, com.fyber.inneractive.sdk.player.exoplayer2.decoder.c cVar, boolean z11, boolean z12, long j11) {
        long j12;
        e eVar = this.f29184c;
        com.fyber.inneractive.sdk.player.exoplayer2.o oVar = this.f29190i;
        d dVar = this.f29186e;
        synchronized (eVar) {
            int iO = 1;
            if (eVar.f29150i != 0) {
                if (!z11) {
                    com.fyber.inneractive.sdk.player.exoplayer2.o[] oVarArr = eVar.f29149h;
                    int i5 = eVar.f29152k;
                    if (oVarArr[i5] == oVar) {
                        if (cVar.f29113c == null && cVar.f29115e == 0) {
                            return -3;
                        }
                        long j13 = eVar.f29147f[i5];
                        cVar.f29114d = j13;
                        cVar.f29111a = eVar.f29146e[i5];
                        dVar.f29138a = eVar.f29145d[i5];
                        dVar.f29139b = eVar.f29144c[i5];
                        dVar.f29141d = eVar.f29148g[i5];
                        eVar.f29154m = Math.max(eVar.f29154m, j13);
                        int i11 = eVar.f29150i - 1;
                        eVar.f29150i = i11;
                        int i12 = eVar.f29152k + 1;
                        eVar.f29152k = i12;
                        eVar.f29151j++;
                        if (i12 == eVar.f29142a) {
                            eVar.f29152k = 0;
                        }
                        if (i11 > 0) {
                            j12 = eVar.f29144c[eVar.f29152k];
                        } else {
                            j12 = dVar.f29139b + dVar.f29138a;
                        }
                        dVar.f29140c = j12;
                        if (!cVar.b(4)) {
                        }
                    }
                }
                pVar.f30147a = eVar.f29149h[eVar.f29152k];
                this.f29190i = pVar.f30147a;
                return -5;
            }
            if (z12) {
                cVar.f29111a = 4;
                if (!cVar.b(4)) {
                    return -4;
                }
                if (cVar.f29114d < j11) {
                    cVar.f29111a = Integer.MIN_VALUE | cVar.f29111a;
                }
                if (cVar.b(1073741824)) {
                    d dVar2 = this.f29186e;
                    long j14 = dVar2.f29139b;
                    this.f29187f.c(1);
                    a(j14, this.f29187f.f30461a, 1);
                    long j15 = j14 + 1;
                    byte b11 = this.f29187f.f30461a[0];
                    boolean z13 = (b11 & 128) != 0;
                    int i13 = b11 & AbstractJsonLexerKt.TC_INVALID;
                    com.fyber.inneractive.sdk.player.exoplayer2.decoder.b bVar = cVar.f29112b;
                    if (bVar.f29106a == null) {
                        bVar.f29106a = new byte[16];
                    }
                    a(j15, bVar.f29106a, i13);
                    long j16 = j15 + i13;
                    if (z13) {
                        this.f29187f.c(2);
                        a(j16, this.f29187f.f30461a, 2);
                        j16 += 2;
                        iO = this.f29187f.o();
                    }
                    int i14 = iO;
                    com.fyber.inneractive.sdk.player.exoplayer2.decoder.b bVar2 = cVar.f29112b;
                    int[] iArr = bVar2.f29107b;
                    if (iArr == null || iArr.length < i14) {
                        iArr = new int[i14];
                    }
                    int[] iArr2 = iArr;
                    int[] iArr3 = bVar2.f29108c;
                    if (iArr3 == null || iArr3.length < i14) {
                        iArr3 = new int[i14];
                    }
                    int[] iArr4 = iArr3;
                    if (z13) {
                        int i15 = i14 * 6;
                        this.f29187f.c(i15);
                        a(j16, this.f29187f.f30461a, i15);
                        j16 += i15;
                        this.f29187f.e(0);
                        for (int i16 = 0; i16 < i14; i16++) {
                            iArr2[i16] = this.f29187f.o();
                            iArr4[i16] = this.f29187f.m();
                        }
                    } else {
                        iArr2[0] = 0;
                        iArr4[0] = dVar2.f29138a - ((int) (j16 - dVar2.f29139b));
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.decoder.b bVar3 = cVar.f29112b;
                    bVar3.a(i14, iArr2, iArr4, dVar2.f29141d, bVar3.f29106a);
                    long j17 = dVar2.f29139b;
                    int i17 = (int) (j16 - j17);
                    dVar2.f29139b = j17 + i17;
                    dVar2.f29138a -= i17;
                }
                int i18 = this.f29186e.f29138a;
                ByteBuffer byteBuffer = cVar.f29113c;
                if (byteBuffer == null) {
                    cVar.f29113c = cVar.a(i18);
                } else {
                    int iCapacity = byteBuffer.capacity();
                    int iPosition = cVar.f29113c.position();
                    int i19 = i18 + iPosition;
                    if (iCapacity < i19) {
                        ByteBuffer byteBufferA = cVar.a(i19);
                        if (iPosition > 0) {
                            cVar.f29113c.position(0);
                            cVar.f29113c.limit(iPosition);
                            byteBufferA.put(cVar.f29113c);
                        }
                        cVar.f29113c = byteBufferA;
                    }
                }
                d dVar3 = this.f29186e;
                long j18 = dVar3.f29139b;
                ByteBuffer byteBuffer2 = cVar.f29113c;
                int i21 = dVar3.f29138a;
                while (i21 > 0) {
                    a(j18);
                    int i22 = (int) (j18 - this.f29189h);
                    int iMin = Math.min(i21, this.f29183b - i22);
                    com.fyber.inneractive.sdk.player.exoplayer2.upstream.a aVar = (com.fyber.inneractive.sdk.player.exoplayer2.upstream.a) this.f29185d.peek();
                    byteBuffer2.put(aVar.f30272a, aVar.f30273b + i22, iMin);
                    j18 += iMin;
                    i21 -= iMin;
                }
                a(this.f29186e.f29140c);
                return -4;
            }
            com.fyber.inneractive.sdk.player.exoplayer2.o oVar2 = eVar.f29156q;
            if (oVar2 == null || (!z11 && oVar2 == oVar)) {
                return -3;
            }
            pVar.f30147a = oVar2;
            this.f29190i = pVar.f30147a;
            return -5;
        }
    }

    public final void a(long j11, byte[] bArr, int i5) {
        int i11 = 0;
        while (i11 < i5) {
            a(j11);
            int i12 = (int) (j11 - this.f29189h);
            int iMin = Math.min(i5 - i11, this.f29183b - i12);
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.a aVar = (com.fyber.inneractive.sdk.player.exoplayer2.upstream.a) this.f29185d.peek();
            System.arraycopy(aVar.f30272a, aVar.f30273b + i12, bArr, i11, iMin);
            j11 += iMin;
            i11 += iMin;
        }
    }

    public final void a(long j11) {
        int i5 = ((int) (j11 - this.f29189h)) / this.f29183b;
        for (int i11 = 0; i11 < i5; i11++) {
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.b bVar = this.f29182a;
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.a aVar = (com.fyber.inneractive.sdk.player.exoplayer2.upstream.a) this.f29185d.remove();
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.upstream.l) bVar;
            synchronized (lVar) {
                com.fyber.inneractive.sdk.player.exoplayer2.upstream.a[] aVarArr = lVar.f30371a;
                aVarArr[0] = aVar;
                lVar.a(aVarArr);
            }
            this.f29189h += this.f29183b;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
        boolean z11;
        if (oVar == null) {
            oVar = null;
        }
        e eVar = this.f29184c;
        synchronized (eVar) {
            z11 = true;
            if (oVar == null) {
                eVar.f29155p = true;
            } else {
                eVar.f29155p = false;
                com.fyber.inneractive.sdk.player.exoplayer2.o oVar2 = eVar.f29156q;
                int i5 = z.f30489a;
                if (!oVar.equals(oVar2)) {
                    eVar.f29156q = oVar;
                }
            }
            z11 = false;
        }
        f fVar = this.n;
        if (fVar == null || !z11) {
            return;
        }
        fVar.e();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final int a(b bVar, int i5, boolean z11) throws InterruptedException, EOFException {
        b bVar2;
        int iA = 0;
        if (!this.f29188g.compareAndSet(0, 1)) {
            int iMin = Math.min(bVar.f29136f, i5);
            bVar.b(iMin);
            if (iMin == 0) {
                iMin = bVar.a(b.f29130g, 0, Math.min(i5, u1.FLAG_APPEARED_IN_PRE_LAYOUT), 0, true);
            }
            if (iMin != -1) {
                bVar.f29133c += iMin;
            }
            if (iMin != -1) {
                return iMin;
            }
            if (z11) {
                return -1;
            }
            throw new EOFException();
        }
        try {
            int iA2 = a(i5);
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.a aVar = this.f29192k;
            byte[] bArr = aVar.f30272a;
            int i11 = aVar.f30273b + this.f29193l;
            int i12 = bVar.f29136f;
            if (i12 != 0) {
                int iMin2 = Math.min(i12, iA2);
                System.arraycopy(bVar.f29134d, 0, bArr, i11, iMin2);
                bVar.b(iMin2);
                iA = iMin2;
            }
            if (iA == 0) {
                bVar2 = bVar;
                iA = bVar.a(bArr, i11, iA2, 0, true);
            } else {
                bVar2 = bVar;
            }
            if (iA != -1) {
                bVar2.f29133c += iA;
            }
            if (iA == -1) {
                if (z11) {
                    c();
                    return -1;
                }
                throw new EOFException();
            }
            this.f29193l += iA;
            this.f29191j += iA;
            c();
            return iA;
        } catch (Throwable th2) {
            c();
            throw th2;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final void a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        if (!this.f29188g.compareAndSet(0, 1)) {
            nVar.e(nVar.f30462b + i5);
            return;
        }
        while (i5 > 0) {
            int iA = a(i5);
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.a aVar = this.f29192k;
            nVar.a(aVar.f30272a, aVar.f30273b + this.f29193l, iA);
            this.f29193l += iA;
            this.f29191j += iA;
            i5 -= iA;
        }
        c();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final void a(long j11, int i5, int i11, int i12, byte[] bArr) {
        if (!this.f29188g.compareAndSet(0, 1)) {
            e eVar = this.f29184c;
            synchronized (eVar) {
                eVar.n = Math.max(eVar.n, j11);
            }
            return;
        }
        try {
            if (this.f29194m) {
                if ((i5 & 1) != 0 && this.f29184c.a(j11)) {
                    this.f29194m = false;
                }
                return;
            }
            this.f29184c.a(j11, i5, (this.f29191j - i11) - i12, i11, bArr);
        } finally {
            c();
        }
    }

    public final void a() {
        e eVar = this.f29184c;
        eVar.f29151j = 0;
        eVar.f29152k = 0;
        eVar.f29153l = 0;
        eVar.f29150i = 0;
        eVar.o = true;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.b bVar = this.f29182a;
        LinkedBlockingDeque linkedBlockingDeque = this.f29185d;
        ((com.fyber.inneractive.sdk.player.exoplayer2.upstream.l) bVar).a((com.fyber.inneractive.sdk.player.exoplayer2.upstream.a[]) linkedBlockingDeque.toArray(new com.fyber.inneractive.sdk.player.exoplayer2.upstream.a[linkedBlockingDeque.size()]));
        this.f29185d.clear();
        ((com.fyber.inneractive.sdk.player.exoplayer2.upstream.l) this.f29182a).a();
        this.f29189h = 0L;
        this.f29191j = 0L;
        this.f29192k = null;
        this.f29193l = this.f29183b;
    }

    public final int a(int i5) {
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.a aVar;
        if (this.f29193l == this.f29183b) {
            this.f29193l = 0;
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.upstream.l) this.f29182a;
            synchronized (lVar) {
                try {
                    lVar.f30373c++;
                    int i11 = lVar.f30374d;
                    if (i11 > 0) {
                        com.fyber.inneractive.sdk.player.exoplayer2.upstream.a[] aVarArr = lVar.f30375e;
                        int i12 = i11 - 1;
                        lVar.f30374d = i12;
                        aVar = aVarArr[i12];
                        aVarArr[i12] = null;
                    } else {
                        aVar = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.a(0, new byte[SQLiteDatabase.OPEN_FULLMUTEX]);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            this.f29192k = aVar;
            this.f29185d.add(aVar);
        }
        return Math.min(i5, this.f29183b - this.f29193l);
    }
}
