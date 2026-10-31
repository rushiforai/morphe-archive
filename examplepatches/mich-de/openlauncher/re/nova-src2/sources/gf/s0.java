package gf;

import ai.w3;
import android.util.SparseArray;
import com.google.android.exoplayer2.drm.DrmInitData;
import com.google.android.gms.internal.measurement.ke;
import io.sentry.e3;
import java.io.EOFException;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class s0 implements ke.v {
    public boolean A;
    public boolean B;

    /* renamed from: a, reason: collision with root package name */
    public final p0 f57616a;

    /* renamed from: d, reason: collision with root package name */
    public final je.e f57619d;

    /* renamed from: e, reason: collision with root package name */
    public final a0 f57620e;

    /* renamed from: f, reason: collision with root package name */
    public l0 f57621f;

    /* renamed from: g, reason: collision with root package name */
    public fe.k0 f57622g;

    /* renamed from: h, reason: collision with root package name */
    public je.f f57623h;

    /* renamed from: p, reason: collision with root package name */
    public int f57629p;

    /* renamed from: q, reason: collision with root package name */
    public int f57630q;

    /* renamed from: r, reason: collision with root package name */
    public int f57631r;

    /* renamed from: s, reason: collision with root package name */
    public int f57632s;

    /* renamed from: w, reason: collision with root package name */
    public boolean f57636w;

    /* renamed from: z, reason: collision with root package name */
    public fe.k0 f57639z;

    /* renamed from: b, reason: collision with root package name */
    public final q0 f57617b = new q0();

    /* renamed from: i, reason: collision with root package name */
    public int f57624i = 1000;

    /* renamed from: j, reason: collision with root package name */
    public int[] f57625j = new int[1000];

    /* renamed from: k, reason: collision with root package name */
    public long[] f57626k = new long[1000];
    public long[] n = new long[1000];

    /* renamed from: m, reason: collision with root package name */
    public int[] f57628m = new int[1000];

    /* renamed from: l, reason: collision with root package name */
    public int[] f57627l = new int[1000];
    public ke.u[] o = new ke.u[1000];

    /* renamed from: c, reason: collision with root package name */
    public final c00.d f57618c = new c00.d(new ge.d(8));

    /* renamed from: t, reason: collision with root package name */
    public long f57633t = Long.MIN_VALUE;

    /* renamed from: u, reason: collision with root package name */
    public long f57634u = Long.MIN_VALUE;

    /* renamed from: v, reason: collision with root package name */
    public long f57635v = Long.MIN_VALUE;

    /* renamed from: y, reason: collision with root package name */
    public boolean f57638y = true;

    /* renamed from: x, reason: collision with root package name */
    public boolean f57637x = true;

    public s0(vf.m mVar, je.e eVar, a0 a0Var) {
        this.f57619d = eVar;
        this.f57620e = a0Var;
        this.f57616a = new p0(mVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0053 A[Catch: all -> 0x0050, TryCatch #0 {all -> 0x0050, blocks: (B:4:0x0002, B:8:0x000f, B:13:0x0021, B:15:0x003a, B:19:0x0055, B:81:0x0109, B:73:0x00f6, B:76:0x00fe, B:18:0x0053), top: B:91:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0108  */
    @Override // ke.v
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(fe.k0 k0Var) {
        boolean z11;
        boolean z12;
        ke keVarD;
        int iC;
        synchronized (this) {
            z11 = false;
            try {
                this.f57638y = false;
                if (!wf.v.a(k0Var, this.f57639z)) {
                    if (!(((SparseArray) this.f57618c.f19045c).size() == 0)) {
                        SparseArray sparseArray = (SparseArray) this.f57618c.f19045c;
                        if (((r0) sparseArray.valueAt(sparseArray.size() - 1)).f57614a.equals(k0Var)) {
                            SparseArray sparseArray2 = (SparseArray) this.f57618c.f19045c;
                            this.f57639z = ((r0) sparseArray2.valueAt(sparseArray2.size() - 1)).f57614a;
                        } else {
                            this.f57639z = k0Var;
                        }
                        fe.k0 k0Var2 = this.f57639z;
                        String str = k0Var2.f54883l;
                        String str2 = k0Var2.f54880i;
                        ArrayList arrayList = wf.j.f94334a;
                        if (str == null) {
                            z12 = false;
                            this.A = z12;
                            this.B = false;
                            z11 = true;
                        } else {
                            switch (str) {
                                case "audio/eac3-joc":
                                case "audio/mpeg-L1":
                                case "audio/mpeg-L2":
                                case "audio/ac3":
                                case "audio/raw":
                                case "audio/eac3":
                                case "audio/flac":
                                case "audio/mpeg":
                                case "audio/g711-alaw":
                                case "audio/g711-mlaw":
                                    z12 = true;
                                    break;
                                case "audio/mp4a-latm":
                                    if (str2 != null && (keVarD = wf.j.d(str2)) != null && (iC = keVarD.c()) != 0 && iC != 16) {
                                    }
                                    break;
                            }
                            this.A = z12;
                            this.B = false;
                            z11 = true;
                        }
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        l0 l0Var = this.f57621f;
        if (l0Var == null || !z11) {
            return;
        }
        l0Var.o.post(l0Var.f57554m);
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00c2 A[Catch: all -> 0x0063, TryCatch #0 {all -> 0x0063, blocks: (B:23:0x0045, B:25:0x0049, B:29:0x005f, B:32:0x0066, B:36:0x006e, B:41:0x00a7, B:64:0x0122, B:66:0x012b, B:43:0x00c2, B:45:0x00c6, B:47:0x00ce, B:49:0x00e8, B:53:0x00f1, B:54:0x00f6, B:56:0x00fc, B:60:0x010a, B:62:0x010f, B:63:0x011f, B:46:0x00cc), top: B:71:0x0045 }] */
    @Override // ke.v
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(long j11, int i5, int i11, int i12, ke.u uVar) {
        je.d dVar;
        int i13 = i5 & 1;
        boolean z11 = i13 != 0;
        if (this.f57637x) {
            if (!z11) {
                return;
            } else {
                this.f57637x = false;
            }
        }
        if (this.A) {
            if (j11 < this.f57633t) {
                return;
            }
            if (i13 == 0) {
                if (!this.B) {
                    wf.a.D("SampleQueue", "Overriding unexpected non-sync sample for format: " + this.f57639z);
                    this.B = true;
                }
                i5 |= 1;
            }
        }
        long j12 = (this.f57616a.f57599g - i11) - i12;
        synchronized (this) {
            try {
                int i14 = this.f57629p;
                if (i14 > 0) {
                    int iH = h(i14 - 1);
                    wf.a.e(this.f57626k[iH] + ((long) this.f57627l[iH]) <= j12);
                }
                this.f57636w = (536870912 & i5) != 0;
                this.f57635v = Math.max(this.f57635v, j11);
                int iH2 = h(this.f57629p);
                this.n[iH2] = j11;
                this.f57626k[iH2] = j12;
                this.f57627l[iH2] = i11;
                this.f57628m[iH2] = i5;
                this.o[iH2] = uVar;
                this.f57625j[iH2] = 0;
                if (!(((SparseArray) this.f57618c.f19045c).size() == 0)) {
                    SparseArray sparseArray = (SparseArray) this.f57618c.f19045c;
                    if (!((r0) sparseArray.valueAt(sparseArray.size() - 1)).f57614a.equals(this.f57639z)) {
                        je.e eVar = this.f57619d;
                        if (eVar != null) {
                            eVar.getClass();
                            dVar = je.d.f69483a;
                        } else {
                            dVar = je.d.f69483a;
                        }
                        c00.d dVar2 = this.f57618c;
                        int i15 = this.f57630q + this.f57629p;
                        fe.k0 k0Var = this.f57639z;
                        k0Var.getClass();
                        r0 r0Var = new r0(k0Var, dVar);
                        SparseArray sparseArray2 = (SparseArray) dVar2.f19045c;
                        if (dVar2.f19044b == -1) {
                            wf.a.i(sparseArray2.size() == 0);
                            dVar2.f19044b = 0;
                        }
                        if (sparseArray2.size() > 0) {
                            int iKeyAt = sparseArray2.keyAt(sparseArray2.size() - 1);
                            wf.a.e(i15 >= iKeyAt);
                            if (iKeyAt == i15) {
                                ((ge.d) dVar2.f19046d).d(sparseArray2.valueAt(sparseArray2.size() - 1));
                            }
                        }
                        sparseArray2.append(i15, r0Var);
                    }
                }
                int i16 = this.f57629p + 1;
                this.f57629p = i16;
                int i17 = this.f57624i;
                if (i16 == i17) {
                    int i18 = i17 + 1000;
                    int[] iArr = new int[i18];
                    long[] jArr = new long[i18];
                    long[] jArr2 = new long[i18];
                    int[] iArr2 = new int[i18];
                    int[] iArr3 = new int[i18];
                    ke.u[] uVarArr = new ke.u[i18];
                    int i19 = this.f57631r;
                    int i21 = i17 - i19;
                    System.arraycopy(this.f57626k, i19, jArr, 0, i21);
                    System.arraycopy(this.n, this.f57631r, jArr2, 0, i21);
                    System.arraycopy(this.f57628m, this.f57631r, iArr2, 0, i21);
                    System.arraycopy(this.f57627l, this.f57631r, iArr3, 0, i21);
                    System.arraycopy(this.o, this.f57631r, uVarArr, 0, i21);
                    System.arraycopy(this.f57625j, this.f57631r, iArr, 0, i21);
                    int i22 = this.f57631r;
                    System.arraycopy(this.f57626k, 0, jArr, i21, i22);
                    System.arraycopy(this.n, 0, jArr2, i21, i22);
                    System.arraycopy(this.f57628m, 0, iArr2, i21, i22);
                    System.arraycopy(this.f57627l, 0, iArr3, i21, i22);
                    System.arraycopy(this.o, 0, uVarArr, i21, i22);
                    System.arraycopy(this.f57625j, 0, iArr, i21, i22);
                    this.f57626k = jArr;
                    this.n = jArr2;
                    this.f57628m = iArr2;
                    this.f57627l = iArr3;
                    this.o = uVarArr;
                    this.f57625j = iArr;
                    this.f57631r = 0;
                    this.f57624i = i18;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // ke.v
    public final int c(vf.h hVar, int i5, boolean z11) throws EOFException {
        p0 p0Var = this.f57616a;
        int iB = p0Var.b(i5);
        w3 w3Var = p0Var.f57598f;
        vf.a aVar = (vf.a) w3Var.f13398c;
        int i11 = hVar.read(aVar.f92626a, ((int) (p0Var.f57599g - w3Var.f13396a)) + aVar.f92627b, iB);
        if (i11 == -1) {
            if (z11) {
                return -1;
            }
            throw new EOFException();
        }
        long j11 = p0Var.f57599g + i11;
        p0Var.f57599g = j11;
        w3 w3Var2 = p0Var.f57598f;
        if (j11 == w3Var2.f13397b) {
            p0Var.f57598f = (w3) w3Var2.f13399d;
        }
        return i11;
    }

    @Override // ke.v
    public final void d(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        while (true) {
            p0 p0Var = this.f57616a;
            if (i5 <= 0) {
                p0Var.getClass();
                return;
            }
            int iB = p0Var.b(i5);
            w3 w3Var = p0Var.f57598f;
            vf.a aVar2 = (vf.a) w3Var.f13398c;
            aVar.z(((int) (p0Var.f57599g - w3Var.f13396a)) + aVar2.f92627b, iB, aVar2.f92626a);
            i5 -= iB;
            long j11 = p0Var.f57599g + iB;
            p0Var.f57599g = j11;
            w3 w3Var2 = p0Var.f57598f;
            if (j11 == w3Var2.f13397b) {
                p0Var.f57598f = (w3) w3Var2.f13399d;
            }
        }
    }

    public final long e(int i5) {
        long j11 = this.f57634u;
        long jMax = Long.MIN_VALUE;
        if (i5 != 0) {
            int iH = h(i5 - 1);
            for (int i11 = 0; i11 < i5; i11++) {
                jMax = Math.max(jMax, this.n[iH]);
                if ((this.f57628m[iH] & 1) != 0) {
                    break;
                }
                iH--;
                if (iH == -1) {
                    iH = this.f57624i - 1;
                }
            }
        }
        this.f57634u = Math.max(j11, jMax);
        this.f57629p -= i5;
        int i12 = this.f57630q + i5;
        this.f57630q = i12;
        int i13 = this.f57631r + i5;
        this.f57631r = i13;
        int i14 = this.f57624i;
        if (i13 >= i14) {
            this.f57631r = i13 - i14;
        }
        int i15 = this.f57632s - i5;
        this.f57632s = i15;
        int i16 = 0;
        if (i15 < 0) {
            this.f57632s = 0;
        }
        c00.d dVar = this.f57618c;
        SparseArray sparseArray = (SparseArray) dVar.f19045c;
        while (i16 < sparseArray.size() - 1) {
            int i17 = i16 + 1;
            if (i12 < sparseArray.keyAt(i17)) {
                break;
            }
            ((ge.d) dVar.f19046d).d(sparseArray.valueAt(i16));
            sparseArray.removeAt(i16);
            int i18 = dVar.f19044b;
            if (i18 > 0) {
                dVar.f19044b = i18 - 1;
            }
            i16 = i17;
        }
        if (this.f57629p != 0) {
            return this.f57626k[this.f57631r];
        }
        int i19 = this.f57631r;
        if (i19 == 0) {
            i19 = this.f57624i;
        }
        return this.f57626k[i19 - 1] + this.f57627l[r10];
    }

    public final void f() {
        long jE;
        p0 p0Var = this.f57616a;
        synchronized (this) {
            int i5 = this.f57629p;
            jE = i5 == 0 ? -1L : e(i5);
        }
        p0Var.a(jE);
    }

    public final int g(int i5, int i11, long j11, boolean z11) {
        int i12 = -1;
        for (int i13 = 0; i13 < i11; i13++) {
            long j12 = this.n[i5];
            if (j12 > j11) {
                break;
            }
            if (!z11 || (this.f57628m[i5] & 1) != 0) {
                if (j12 == j11) {
                    return i13;
                }
                i12 = i13;
            }
            i5++;
            if (i5 == this.f57624i) {
                i5 = 0;
            }
        }
        return i12;
    }

    public final int h(int i5) {
        int i11 = this.f57631r + i5;
        int i12 = this.f57624i;
        return i11 < i12 ? i11 : i11 - i12;
    }

    public final synchronized boolean i(boolean z11) {
        fe.k0 k0Var;
        int i5 = this.f57632s;
        boolean z12 = false;
        if (i5 != this.f57629p) {
            if (((r0) this.f57618c.n(this.f57630q + i5)).f57614a != this.f57622g) {
                return true;
            }
            return j(h(this.f57632s));
        }
        if (z11 || this.f57636w || ((k0Var = this.f57639z) != null && k0Var != this.f57622g)) {
            z12 = true;
        }
        return z12;
    }

    public final boolean j(int i5) {
        je.f fVar = this.f57623h;
        if (fVar == null || fVar.p() == 4) {
            return true;
        }
        if ((this.f57628m[i5] & 1073741824) != 0) {
            return false;
        }
        this.f57623h.getClass();
        return false;
    }

    public final void k(fe.k0 k0Var, e3 e3Var) {
        fe.k0 k0Var2;
        fe.k0 k0Var3 = this.f57622g;
        boolean z11 = k0Var3 == null;
        DrmInitData drmInitData = z11 ? null : k0Var3.o;
        this.f57622g = k0Var;
        DrmInitData drmInitData2 = k0Var.o;
        je.e eVar = this.f57619d;
        if (eVar != null) {
            int iD = eVar.d(k0Var);
            fe.j0 j0VarA = k0Var.a();
            j0VarA.D = iD;
            k0Var2 = new fe.k0(j0VarA);
        } else {
            k0Var2 = k0Var;
        }
        e3Var.f67209c = k0Var2;
        e3Var.f67208b = this.f57623h;
        if (eVar == null) {
            return;
        }
        if (z11 || !wf.v.a(drmInitData, drmInitData2)) {
            je.f fVar = this.f57623h;
            a0 a0Var = this.f57620e;
            je.f fVarA = eVar.a(a0Var, k0Var);
            this.f57623h = fVarA;
            e3Var.f67208b = fVarA;
            if (fVar != null) {
                fVar.t(a0Var);
            }
        }
    }

    public final void l(boolean z11) {
        p0 p0Var = this.f57616a;
        w3 w3Var = p0Var.f57596d;
        if (((vf.a) w3Var.f13398c) != null) {
            vf.m mVar = p0Var.f57593a;
            synchronized (mVar) {
                w3 w3Var2 = w3Var;
                while (w3Var2 != null) {
                    try {
                        vf.a[] aVarArr = mVar.f92703f;
                        int i5 = mVar.f92702e;
                        mVar.f92702e = i5 + 1;
                        vf.a aVar = (vf.a) w3Var2.f13398c;
                        aVar.getClass();
                        aVarArr[i5] = aVar;
                        mVar.f92701d--;
                        w3Var2 = (w3) w3Var2.f13399d;
                        if (w3Var2 == null || ((vf.a) w3Var2.f13398c) == null) {
                            w3Var2 = null;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                mVar.notifyAll();
            }
            w3Var.f13398c = null;
            w3Var.f13399d = null;
        }
        w3 w3Var3 = p0Var.f57596d;
        int i11 = p0Var.f57594b;
        wf.a.i(((vf.a) w3Var3.f13398c) == null);
        w3Var3.f13396a = 0L;
        w3Var3.f13397b = i11;
        w3 w3Var4 = p0Var.f57596d;
        p0Var.f57597e = w3Var4;
        p0Var.f57598f = w3Var4;
        p0Var.f57599g = 0L;
        p0Var.f57593a.b();
        this.f57629p = 0;
        this.f57630q = 0;
        this.f57631r = 0;
        this.f57632s = 0;
        this.f57637x = true;
        this.f57633t = Long.MIN_VALUE;
        this.f57634u = Long.MIN_VALUE;
        this.f57635v = Long.MIN_VALUE;
        this.f57636w = false;
        c00.d dVar = this.f57618c;
        SparseArray sparseArray = (SparseArray) dVar.f19045c;
        for (int i12 = 0; i12 < sparseArray.size(); i12++) {
            ((ge.d) dVar.f19046d).d(sparseArray.valueAt(i12));
        }
        dVar.f19044b = -1;
        sparseArray.clear();
        if (z11) {
            this.f57639z = null;
            this.f57638y = true;
        }
    }

    public final synchronized boolean m(long j11, boolean z11) throws Throwable {
        try {
            try {
                synchronized (this) {
                    try {
                        this.f57632s = 0;
                        p0 p0Var = this.f57616a;
                        p0Var.f57597e = p0Var.f57596d;
                        int iH = h(0);
                        int i5 = this.f57632s;
                        int i11 = this.f57629p;
                        if ((i5 != i11) && j11 >= this.n[iH]) {
                            if (j11 <= this.f57635v || z11) {
                                int iG = g(iH, i11 - i5, j11, true);
                                if (iG == -1) {
                                    return false;
                                }
                                this.f57633t = j11;
                                this.f57632s += iG;
                                return true;
                            }
                        }
                        return false;
                    } finally {
                        th = th;
                        while (true) {
                            Throwable th2 = th;
                            try {
                            } catch (Throwable th3) {
                                th = th3;
                            }
                        }
                    }
                }
            } catch (Throwable th4) {
                th = th4;
                throw th;
            }
        } catch (Throwable th5) {
            th = th5;
            throw th;
        }
    }
}
