package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import java.io.EOFException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class b0 implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i {

    /* renamed from: l, reason: collision with root package name */
    public static final long f29759l = com.fyber.inneractive.sdk.player.exoplayer2.util.z.a("AC-3");

    /* renamed from: m, reason: collision with root package name */
    public static final long f29760m = com.fyber.inneractive.sdk.player.exoplayer2.util.z.a("EAC3");
    public static final long n = com.fyber.inneractive.sdk.player.exoplayer2.util.z.a("HEVC");

    /* renamed from: a, reason: collision with root package name */
    public final int f29761a;

    /* renamed from: b, reason: collision with root package name */
    public final List f29762b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29763c;

    /* renamed from: d, reason: collision with root package name */
    public final SparseIntArray f29764d;

    /* renamed from: e, reason: collision with root package name */
    public final e f29765e;

    /* renamed from: f, reason: collision with root package name */
    public final SparseArray f29766f;

    /* renamed from: g, reason: collision with root package name */
    public final SparseBooleanArray f29767g;

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.j f29768h;

    /* renamed from: i, reason: collision with root package name */
    public int f29769i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f29770j;

    /* renamed from: k, reason: collision with root package name */
    public f0 f29771k;

    public b0(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar, e eVar) {
        this.f29765e = eVar;
        this.f29761a = i5;
        if (i5 == 1 || i5 == 2) {
            this.f29762b = Collections.singletonList(vVar);
        } else {
            ArrayList arrayList = new ArrayList();
            this.f29762b = arrayList;
            arrayList.add(vVar);
        }
        this.f29763c = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(940);
        this.f29767g = new SparseBooleanArray();
        this.f29766f = new SparseArray();
        this.f29764d = new SparseIntArray();
        a();
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0021, code lost:
    
        r1 = r1 + 1;
     */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        byte[] bArr = this.f29763c.f30461a;
        bVar.a(bArr, 0, 940, false);
        int i5 = 0;
        while (i5 < 188) {
            for (int i11 = 0; i11 != 5; i11++) {
                if (bArr[(i11 * 188) + i5] != 71) {
                    break;
                }
            }
            bVar.a(i5);
            return true;
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        this.f29768h = jVar;
        jVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.extractor.p(-9223372036854775807L));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        int size = this.f29762b.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((com.fyber.inneractive.sdk.player.exoplayer2.util.v) this.f29762b.get(i5)).f30487c = -9223372036854775807L;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.f29763c;
        nVar.f30462b = 0;
        nVar.f30463c = 0;
        this.f29764d.clear();
        a();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, EOFException {
        f0 f0Var;
        int iMin;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar2;
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.f29763c;
        byte[] bArr = nVar.f30461a;
        int i5 = nVar.f30462b;
        if (940 - i5 < 188) {
            int i11 = nVar.f30463c - i5;
            if (i11 > 0) {
                System.arraycopy(bArr, i5, bArr, 0, i11);
            }
            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29763c;
            nVar2.f30461a = bArr;
            nVar2.f30463c = i11;
            nVar2.f30462b = 0;
        }
        while (true) {
            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = this.f29763c;
            int i12 = nVar3.f30463c;
            int i13 = nVar3.f30462b;
            if (i12 - i13 < 188) {
                int i14 = 940 - i12;
                int i15 = bVar.f29136f;
                if (i15 == 0) {
                    iMin = 0;
                } else {
                    iMin = Math.min(i15, i14);
                    System.arraycopy(bVar.f29134d, 0, bArr, i12, iMin);
                    bVar.b(iMin);
                }
                if (iMin == 0) {
                    bVar2 = bVar;
                    iMin = bVar2.a(bArr, i12, i14, 0, true);
                } else {
                    bVar2 = bVar;
                }
                if (iMin != -1) {
                    bVar2.f29133c += iMin;
                }
                if (iMin == -1) {
                    return -1;
                }
                this.f29763c.d(i12 + iMin);
                bVar = bVar2;
            } else {
                while (i13 < i12 && bArr[i13] != 71) {
                    i13++;
                }
                this.f29763c.e(i13);
                int i16 = i13 + 188;
                if (i16 > i12) {
                    return 0;
                }
                int iB = this.f29763c.b();
                if ((8388608 & iB) != 0) {
                    this.f29763c.e(i16);
                    return 0;
                }
                boolean z11 = true;
                boolean z12 = (4194304 & iB) != 0;
                int i17 = (2096896 & iB) >> 8;
                boolean z13 = (iB & 32) != 0;
                boolean z14 = (iB & 16) != 0;
                if (this.f29761a != 2) {
                    int i18 = iB & 15;
                    int i19 = this.f29764d.get(i17, i18 - 1);
                    this.f29764d.put(i17, i18);
                    if (i19 == i18) {
                        if (z14) {
                            this.f29763c.e(i16);
                            return 0;
                        }
                    } else if (i18 == ((i19 + 1) & 15)) {
                    }
                    z11 = false;
                } else {
                    z11 = false;
                }
                if (z13) {
                    int iJ = this.f29763c.j();
                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar4 = this.f29763c;
                    nVar4.e(nVar4.f30462b + iJ);
                }
                if (z14 && (f0Var = (f0) this.f29766f.get(i17)) != null) {
                    if (z11) {
                        f0Var.a();
                    }
                    this.f29763c.d(i16);
                    f0Var.a(this.f29763c, z12);
                    this.f29763c.d(i12);
                }
                this.f29763c.e(i16);
                return 0;
            }
        }
    }

    public final void a() {
        this.f29767g.clear();
        this.f29766f.clear();
        this.f29765e.getClass();
        SparseArray sparseArray = new SparseArray();
        int size = sparseArray.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.f29766f.put(sparseArray.keyAt(i5), (f0) sparseArray.valueAt(i5));
        }
        this.f29766f.put(0, new w(new z(this)));
        this.f29771k = null;
    }
}
