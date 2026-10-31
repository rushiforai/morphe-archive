package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class m implements h {

    /* renamed from: a, reason: collision with root package name */
    public final x f29869a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f29870b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f29871c;

    /* renamed from: g, reason: collision with root package name */
    public long f29875g;

    /* renamed from: i, reason: collision with root package name */
    public String f29877i;

    /* renamed from: j, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29878j;

    /* renamed from: k, reason: collision with root package name */
    public l f29879k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f29880l;

    /* renamed from: m, reason: collision with root package name */
    public long f29881m;

    /* renamed from: h, reason: collision with root package name */
    public final boolean[] f29876h = new boolean[3];

    /* renamed from: d, reason: collision with root package name */
    public final r f29872d = new r(7);

    /* renamed from: e, reason: collision with root package name */
    public final r f29873e = new r(8);

    /* renamed from: f, reason: collision with root package name */
    public final r f29874f = new r(6);
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n n = new com.fyber.inneractive.sdk.player.exoplayer2.util.n();

    public m(x xVar, boolean z11, boolean z12) {
        this.f29869a = xVar;
        this.f29870b = z11;
        this.f29871c = z12;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(this.f29876h);
        r rVar = this.f29872d;
        rVar.f29927b = false;
        rVar.f29928c = false;
        r rVar2 = this.f29873e;
        rVar2.f29927b = false;
        rVar2.f29928c = false;
        r rVar3 = this.f29874f;
        rVar3.f29927b = false;
        rVar3.f29928c = false;
        l lVar = this.f29879k;
        lVar.f29863k = false;
        lVar.o = false;
        k kVar = lVar.n;
        kVar.f29840b = false;
        kVar.f29839a = false;
        this.f29875g = 0L;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        this.f29877i = e0Var.f29804e;
        e0Var.b();
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(e0Var.f29803d, 2);
        this.f29878j = gVarA;
        this.f29879k = new l(gVarA, this.f29870b, this.f29871c);
        this.f29869a.a(jVar, e0Var);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        this.f29881m = j11;
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x0287  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0241  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int i5;
        int i11;
        int i12;
        boolean z11;
        int i13;
        int i14;
        int i15;
        int i16;
        boolean z12;
        boolean z13;
        int i17 = nVar.f30462b;
        int i18 = nVar.f30463c;
        byte[] bArr = nVar.f30461a;
        int i19 = i18 - i17;
        this.f29875g += i19;
        this.f29878j.a(i19, nVar);
        while (true) {
            int iA = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(bArr, i17, i18, this.f29876h);
            if (iA == i18) {
                break;
            }
            int i21 = iA + 3;
            int i22 = bArr[i21] & 31;
            int i23 = iA - i17;
            if (i23 > 0) {
                if (!this.f29880l || this.f29879k.f29855c) {
                    this.f29872d.a(bArr, i17, iA);
                    this.f29873e.a(bArr, i17, iA);
                }
                this.f29874f.a(bArr, i17, iA);
                this.f29879k.a(bArr, i17, iA);
            }
            int i24 = i18 - iA;
            long j11 = this.f29875g - i24;
            int i25 = i23 < 0 ? -i23 : 0;
            long j12 = this.f29881m;
            if (!this.f29880l || this.f29879k.f29855c) {
                this.f29872d.a(i25);
                this.f29873e.a(i25);
                if (!this.f29880l) {
                    if (this.f29872d.f29928c && this.f29873e.f29928c) {
                        ArrayList arrayList = new ArrayList();
                        r rVar = this.f29872d;
                        arrayList.add(Arrays.copyOf(rVar.f29929d, rVar.f29930e));
                        r rVar2 = this.f29873e;
                        arrayList.add(Arrays.copyOf(rVar2.f29929d, rVar2.f29930e));
                        r rVar3 = this.f29872d;
                        com.fyber.inneractive.sdk.player.exoplayer2.util.k kVarA = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(rVar3.f29929d, 3, rVar3.f29930e);
                        r rVar4 = this.f29873e;
                        i5 = i24;
                        com.fyber.inneractive.sdk.player.exoplayer2.util.o oVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.o(rVar4.f29929d, 3, rVar4.f29930e);
                        oVar.d(8);
                        int iD = oVar.d();
                        int iD2 = oVar.d();
                        oVar.f();
                        com.fyber.inneractive.sdk.player.exoplayer2.util.j jVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.j(oVar.c(), iD, iD2);
                        i11 = i18;
                        this.f29878j.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(this.f29877i, "video/avc", -1, kVarA.f30444b, kVarA.f30445c, arrayList, -1, kVarA.f30446d, null, -1, null, null));
                        this.f29880l = true;
                        this.f29879k.f29856d.append(kVarA.f30443a, kVarA);
                        this.f29879k.f29857e.append(iD, jVar);
                        r rVar5 = this.f29872d;
                        rVar5.f29927b = false;
                        rVar5.f29928c = false;
                        r rVar6 = this.f29873e;
                        rVar6.f29927b = false;
                        rVar6.f29928c = false;
                    } else {
                        i5 = i24;
                        i11 = i18;
                    }
                } else {
                    i5 = i24;
                    i11 = i18;
                    r rVar7 = this.f29872d;
                    if (rVar7.f29928c) {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.k kVarA2 = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(rVar7.f29929d, 3, rVar7.f29930e);
                        this.f29879k.f29856d.append(kVarA2.f30443a, kVarA2);
                        r rVar8 = this.f29872d;
                        rVar8.f29927b = false;
                        rVar8.f29928c = false;
                    } else {
                        r rVar9 = this.f29873e;
                        if (rVar9.f29928c) {
                            com.fyber.inneractive.sdk.player.exoplayer2.util.o oVar2 = new com.fyber.inneractive.sdk.player.exoplayer2.util.o(rVar9.f29929d, 3, rVar9.f29930e);
                            oVar2.d(8);
                            int iD3 = oVar2.d();
                            int iD4 = oVar2.d();
                            oVar2.f();
                            this.f29879k.f29857e.append(iD3, new com.fyber.inneractive.sdk.player.exoplayer2.util.j(oVar2.c(), iD3, iD4));
                            r rVar10 = this.f29873e;
                            rVar10.f29927b = false;
                            rVar10.f29928c = false;
                        }
                    }
                }
            }
            if (this.f29874f.a(i25)) {
                r rVar11 = this.f29874f;
                int iA2 = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(rVar11.f29930e, rVar11.f29929d);
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.n;
                nVar2.f30461a = this.f29874f.f29929d;
                nVar2.f30463c = iA2;
                nVar2.f30462b = 0;
                nVar2.e(4);
                com.fyber.inneractive.sdk.player.exoplayer2.text.cea.a.a(j12, this.n, this.f29869a.f29964b);
            }
            l lVar = this.f29879k;
            if (lVar.f29861i != 9) {
                if (lVar.f29855c) {
                    k kVar = lVar.n;
                    k kVar2 = lVar.f29865m;
                    if (!kVar.f29839a || (kVar2.f29839a && kVar.f29844f == kVar2.f29844f && kVar.f29845g == kVar2.f29845g && kVar.f29846h == kVar2.f29846h && ((!kVar.f29847i || !kVar2.f29847i || kVar.f29848j == kVar2.f29848j) && (((i14 = kVar.f29842d) == (i15 = kVar2.f29842d) || (i14 != 0 && i15 != 0)) && (((i16 = kVar.f29841c.f30450h) != 0 || kVar2.f29841c.f30450h != 0 || (kVar.f29851m == kVar2.f29851m && kVar.n == kVar2.n)) && ((i16 != 1 || kVar2.f29841c.f30450h != 1 || (kVar.o == kVar2.o && kVar.f29852p == kVar2.f29852p)) && (z12 = kVar.f29849k) == (z13 = kVar2.f29849k) && (!z12 || !z13 || kVar.f29850l == kVar2.f29850l))))))) {
                    }
                }
                i12 = 1;
            } else {
                if (lVar.o) {
                    long j13 = lVar.f29862j;
                    lVar.f29853a.a(lVar.f29867q, lVar.f29868r ? 1 : 0, (int) (j13 - lVar.f29866p), i5 + ((int) (j11 - j13)), null);
                }
                lVar.f29866p = lVar.f29862j;
                lVar.f29867q = lVar.f29864l;
                lVar.f29868r = false;
                i12 = 1;
                lVar.o = true;
            }
            boolean z14 = lVar.f29868r;
            int i26 = lVar.f29861i;
            if (i26 == 5) {
                z11 = true;
            } else {
                if (lVar.f29854b && i26 == i12) {
                    k kVar3 = lVar.n;
                    if (!kVar3.f29840b || ((i13 = kVar3.f29843e) != 7 && i13 != 2)) {
                    }
                }
                z11 = false;
            }
            lVar.f29868r = z14 | z11;
            long j14 = this.f29881m;
            if (!this.f29880l || this.f29879k.f29855c) {
                this.f29872d.b(i22);
                this.f29873e.b(i22);
            }
            this.f29874f.b(i22);
            l lVar2 = this.f29879k;
            lVar2.f29861i = i22;
            lVar2.f29864l = j14;
            lVar2.f29862j = j11;
            if ((lVar2.f29854b && i22 == 1) || (lVar2.f29855c && (i22 == 5 || i22 == 1 || i22 == 2))) {
                k kVar4 = lVar2.f29865m;
                lVar2.f29865m = lVar2.n;
                lVar2.n = kVar4;
                kVar4.f29840b = false;
                kVar4.f29839a = false;
                lVar2.f29860h = 0;
                lVar2.f29863k = true;
            }
            i17 = i21;
            i18 = i11;
        }
        if (!this.f29880l || this.f29879k.f29855c) {
            this.f29872d.a(bArr, i17, i18);
            this.f29873e.a(bArr, i17, i18);
        }
        this.f29874f.a(bArr, i17, i18);
        this.f29879k.a(bArr, i17, i18);
    }
}
