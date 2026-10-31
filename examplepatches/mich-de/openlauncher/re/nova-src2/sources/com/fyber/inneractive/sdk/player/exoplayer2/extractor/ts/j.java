package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.Pair;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class j implements h {
    public static final double[] n = {23.976023976023978d, 24.0d, 25.0d, 29.97002997002997d, 30.0d, 50.0d, 59.94005994005994d, 60.0d};

    /* renamed from: a, reason: collision with root package name */
    public String f29826a;

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29827b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f29828c;

    /* renamed from: d, reason: collision with root package name */
    public long f29829d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean[] f29830e = new boolean[4];

    /* renamed from: f, reason: collision with root package name */
    public final i f29831f = new i();

    /* renamed from: g, reason: collision with root package name */
    public boolean f29832g;

    /* renamed from: h, reason: collision with root package name */
    public long f29833h;

    /* renamed from: i, reason: collision with root package name */
    public long f29834i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f29835j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f29836k;

    /* renamed from: l, reason: collision with root package name */
    public long f29837l;

    /* renamed from: m, reason: collision with root package name */
    public long f29838m;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(this.f29830e);
        i iVar = this.f29831f;
        iVar.f29822a = false;
        iVar.f29823b = 0;
        iVar.f29824c = 0;
        this.f29835j = false;
        this.f29832g = false;
        this.f29833h = 0L;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        this.f29826a = e0Var.f29804e;
        e0Var.b();
        this.f29827b = jVar.a(e0Var.f29803d, 2);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        boolean z12 = j11 != -9223372036854775807L;
        this.f29835j = z12;
        if (z12) {
            this.f29834i = j11;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x012c  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        boolean z11;
        float f11;
        int i5;
        float f12;
        int i11;
        long j11;
        int i12 = nVar.f30462b;
        int i13 = nVar.f30463c;
        byte[] bArr = nVar.f30461a;
        int i14 = i13 - i12;
        this.f29833h += i14;
        this.f29827b.a(i14, nVar);
        int i15 = i12;
        while (true) {
            int iA = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(bArr, i12, i13, this.f29830e);
            if (iA == i13) {
                break;
            }
            int i16 = iA + 3;
            boolean z12 = nVar.f30461a[i16] & 255;
            if (!this.f29828c) {
                int i17 = iA - i15;
                if (i17 > 0) {
                    i iVar = this.f29831f;
                    if (iVar.f29822a) {
                        byte[] bArr2 = iVar.f29825d;
                        int length = bArr2.length;
                        int i18 = iVar.f29823b + i17;
                        if (length < i18) {
                            iVar.f29825d = Arrays.copyOf(bArr2, i18 * 2);
                        }
                        System.arraycopy(bArr, i15, iVar.f29825d, iVar.f29823b, i17);
                        iVar.f29823b += i17;
                    }
                }
                int i19 = i17 < 0 ? -i17 : 0;
                i iVar2 = this.f29831f;
                if (iVar2.f29822a) {
                    if (iVar2.f29824c == 0 && z12 == 181) {
                        iVar2.f29824c = iVar2.f29823b;
                    } else {
                        int i21 = iVar2.f29823b - i19;
                        iVar2.f29823b = i21;
                        iVar2.f29822a = false;
                        String str = this.f29826a;
                        byte[] bArrCopyOf = Arrays.copyOf(iVar2.f29825d, i21);
                        int i22 = bArrCopyOf[4] & 255;
                        byte b11 = bArrCopyOf[5];
                        int i23 = (i22 << 4) | ((b11 & 255) >> 4);
                        int i24 = ((b11 & 15) << 8) | (bArrCopyOf[6] & 255);
                        int i25 = (bArrCopyOf[7] & 240) >> 4;
                        if (i25 == 2) {
                            f11 = i24 * 4;
                            i5 = i23 * 3;
                        } else if (i25 == 3) {
                            f11 = i24 * 16;
                            i5 = i23 * 9;
                        } else if (i25 != 4) {
                            f12 = 1.0f;
                            com.fyber.inneractive.sdk.player.exoplayer2.o oVarA = com.fyber.inneractive.sdk.player.exoplayer2.o.a(str, "video/mpeg2", -1, i23, i24, Collections.singletonList(bArrCopyOf), -1, f12, null, -1, null, null);
                            i11 = (bArrCopyOf[7] & 15) - 1;
                            if (i11 < 0) {
                                double[] dArr = n;
                                if (i11 < 8) {
                                    double d5 = dArr[i11];
                                    byte b12 = bArrCopyOf[iVar2.f29824c + 9];
                                    int i26 = (b12 & 96) >> 5;
                                    if (i26 != (b12 & 31)) {
                                        d5 *= (i26 + 1.0d) / (r5 + 1);
                                    }
                                    j11 = (long) (1000000.0d / d5);
                                } else {
                                    j11 = 0;
                                }
                                Pair pairCreate = Pair.create(oVarA, Long.valueOf(j11));
                                this.f29827b.a((com.fyber.inneractive.sdk.player.exoplayer2.o) pairCreate.first);
                                this.f29829d = ((Long) pairCreate.second).longValue();
                                this.f29828c = true;
                            }
                        } else {
                            f11 = i24 * Sdk.SDKError.Reason.TPAT_ERROR_VALUE;
                            i5 = i23 * 100;
                        }
                        f12 = f11 / i5;
                        com.fyber.inneractive.sdk.player.exoplayer2.o oVarA2 = com.fyber.inneractive.sdk.player.exoplayer2.o.a(str, "video/mpeg2", -1, i23, i24, Collections.singletonList(bArrCopyOf), -1, f12, null, -1, null, null);
                        i11 = (bArrCopyOf[7] & 15) - 1;
                        if (i11 < 0) {
                        }
                    }
                } else if (z12 == 179) {
                    iVar2.f29822a = true;
                }
            }
            if (this.f29828c && (z12 == 184 || z12 == 0)) {
                int i27 = i13 - iA;
                if (this.f29832g) {
                    this.f29827b.a(this.f29838m, this.f29836k ? 1 : 0, ((int) (this.f29833h - this.f29837l)) - i27, i27, null);
                    z11 = false;
                    this.f29836k = false;
                } else {
                    z11 = false;
                }
                if (z12 == 184) {
                    this.f29832g = z11;
                    this.f29836k = true;
                } else {
                    this.f29838m = this.f29835j ? this.f29834i : this.f29838m + this.f29829d;
                    this.f29837l = this.f29833h - i27;
                    this.f29835j = false;
                    this.f29832g = true;
                }
            }
            i15 = iA;
            i12 = i16;
        }
        if (this.f29828c) {
            return;
        }
        i iVar3 = this.f29831f;
        if (iVar3.f29822a) {
            int i28 = i13 - i15;
            byte[] bArr3 = iVar3.f29825d;
            int length2 = bArr3.length;
            int i29 = iVar3.f29823b + i28;
            if (length2 < i29) {
                iVar3.f29825d = Arrays.copyOf(bArr3, i29 * 2);
            }
            System.arraycopy(bArr, i15, iVar3.f29825d, iVar3.f29823b, i28);
            iVar3.f29823b += i28;
        }
    }
}
