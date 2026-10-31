package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.SparseArray;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29853a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f29854b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f29855c;

    /* renamed from: f, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.o f29858f;

    /* renamed from: g, reason: collision with root package name */
    public byte[] f29859g;

    /* renamed from: h, reason: collision with root package name */
    public int f29860h;

    /* renamed from: i, reason: collision with root package name */
    public int f29861i;

    /* renamed from: j, reason: collision with root package name */
    public long f29862j;

    /* renamed from: l, reason: collision with root package name */
    public long f29864l;

    /* renamed from: p, reason: collision with root package name */
    public long f29866p;

    /* renamed from: q, reason: collision with root package name */
    public long f29867q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f29868r;

    /* renamed from: d, reason: collision with root package name */
    public final SparseArray f29856d = new SparseArray();

    /* renamed from: e, reason: collision with root package name */
    public final SparseArray f29857e = new SparseArray();

    /* renamed from: m, reason: collision with root package name */
    public k f29865m = new k();
    public k n = new k();

    /* renamed from: k, reason: collision with root package name */
    public boolean f29863k = false;
    public boolean o = false;

    public l(com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar, boolean z11, boolean z12) {
        this.f29853a = rVar;
        this.f29854b = z11;
        this.f29855c = z12;
        byte[] bArr = new byte[128];
        this.f29859g = bArr;
        this.f29858f = new com.fyber.inneractive.sdk.player.exoplayer2.util.o(bArr, 0, 0);
        k kVar = this.n;
        kVar.f29840b = false;
        kVar.f29839a = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0154  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(byte[] bArr, int i5, int i11) {
        boolean zC;
        boolean zC2;
        boolean z11;
        boolean z12;
        int iD;
        int i12;
        int iE;
        int iE2;
        int i13;
        if (this.f29863k) {
            int i14 = i11 - i5;
            byte[] bArr2 = this.f29859g;
            int length = bArr2.length;
            int i15 = this.f29860h + i14;
            if (length < i15) {
                this.f29859g = Arrays.copyOf(bArr2, i15 * 2);
            }
            System.arraycopy(bArr, i5, this.f29859g, this.f29860h, i14);
            int i16 = this.f29860h + i14;
            this.f29860h = i16;
            com.fyber.inneractive.sdk.player.exoplayer2.util.o oVar = this.f29858f;
            oVar.f30464a = this.f29859g;
            int i17 = 0;
            oVar.f30466c = 0;
            oVar.f30465b = i16;
            oVar.f30467d = 0;
            oVar.a();
            if (this.f29858f.a(8)) {
                this.f29858f.f();
                int iB = this.f29858f.b(2);
                this.f29858f.d(5);
                if (this.f29858f.b()) {
                    this.f29858f.d();
                    if (this.f29858f.b()) {
                        int iD2 = this.f29858f.d();
                        if (!this.f29855c) {
                            this.f29863k = false;
                            k kVar = this.n;
                            kVar.f29843e = iD2;
                            kVar.f29840b = true;
                            return;
                        }
                        if (this.f29858f.b()) {
                            int iD3 = this.f29858f.d();
                            if (this.f29857e.indexOfKey(iD3) < 0) {
                                this.f29863k = false;
                                return;
                            }
                            com.fyber.inneractive.sdk.player.exoplayer2.util.j jVar = (com.fyber.inneractive.sdk.player.exoplayer2.util.j) this.f29857e.get(iD3);
                            com.fyber.inneractive.sdk.player.exoplayer2.util.k kVar2 = (com.fyber.inneractive.sdk.player.exoplayer2.util.k) this.f29856d.get(jVar.f30441a);
                            if (kVar2.f30447e) {
                                if (!this.f29858f.a(2)) {
                                    return;
                                } else {
                                    this.f29858f.d(2);
                                }
                            }
                            if (this.f29858f.a(kVar2.f30449g)) {
                                int iB2 = this.f29858f.b(kVar2.f30449g);
                                if (kVar2.f30448f) {
                                    zC = false;
                                    zC2 = false;
                                } else {
                                    if (!this.f29858f.a(1)) {
                                        return;
                                    }
                                    zC = this.f29858f.c();
                                    if (zC) {
                                        if (this.f29858f.a(1)) {
                                            zC2 = this.f29858f.c();
                                            z11 = true;
                                            z12 = this.f29861i != 5;
                                            if (z12) {
                                                iD = 0;
                                            } else if (!this.f29858f.b()) {
                                                return;
                                            } else {
                                                iD = this.f29858f.d();
                                            }
                                            i12 = kVar2.f30450h;
                                            if (i12 != 0) {
                                                if (!this.f29858f.a(kVar2.f30451i)) {
                                                    return;
                                                }
                                                int iB3 = this.f29858f.b(kVar2.f30451i);
                                                if (!jVar.f30442b || zC) {
                                                    iE = 0;
                                                    i13 = iB3;
                                                    iE2 = 0;
                                                } else {
                                                    if (!this.f29858f.b()) {
                                                        return;
                                                    }
                                                    iE = this.f29858f.e();
                                                    i13 = iB3;
                                                    iE2 = 0;
                                                }
                                            } else if (i12 != 1 || kVar2.f30452j) {
                                                iE = 0;
                                                iE2 = 0;
                                                i13 = 0;
                                            } else {
                                                if (!this.f29858f.b()) {
                                                    return;
                                                }
                                                int iE3 = this.f29858f.e();
                                                if (!jVar.f30442b || zC) {
                                                    iE = 0;
                                                    i13 = 0;
                                                    i17 = iE3;
                                                    iE2 = 0;
                                                } else {
                                                    if (!this.f29858f.b()) {
                                                        return;
                                                    }
                                                    i13 = 0;
                                                    i17 = iE3;
                                                    iE2 = this.f29858f.e();
                                                    iE = 0;
                                                }
                                            }
                                            k kVar3 = this.n;
                                            kVar3.f29841c = kVar2;
                                            kVar3.f29842d = iB;
                                            kVar3.f29843e = iD2;
                                            kVar3.f29844f = iB2;
                                            kVar3.f29845g = iD3;
                                            kVar3.f29846h = zC;
                                            kVar3.f29847i = z11;
                                            kVar3.f29848j = zC2;
                                            kVar3.f29849k = z12;
                                            kVar3.f29850l = iD;
                                            kVar3.f29851m = i13;
                                            kVar3.n = iE;
                                            kVar3.o = i17;
                                            kVar3.f29852p = iE2;
                                            kVar3.f29839a = true;
                                            kVar3.f29840b = true;
                                            this.f29863k = false;
                                        }
                                        return;
                                    }
                                    zC2 = false;
                                }
                                z11 = zC2;
                                if (this.f29861i != 5) {
                                }
                                if (z12) {
                                }
                                i12 = kVar2.f30450h;
                                if (i12 != 0) {
                                }
                                k kVar32 = this.n;
                                kVar32.f29841c = kVar2;
                                kVar32.f29842d = iB;
                                kVar32.f29843e = iD2;
                                kVar32.f29844f = iB2;
                                kVar32.f29845g = iD3;
                                kVar32.f29846h = zC;
                                kVar32.f29847i = z11;
                                kVar32.f29848j = zC2;
                                kVar32.f29849k = z12;
                                kVar32.f29850l = iD;
                                kVar32.f29851m = i13;
                                kVar32.n = iE;
                                kVar32.o = i17;
                                kVar32.f29852p = iE2;
                                kVar32.f29839a = true;
                                kVar32.f29840b = true;
                                this.f29863k = false;
                            }
                        }
                    }
                }
            }
        }
    }
}
