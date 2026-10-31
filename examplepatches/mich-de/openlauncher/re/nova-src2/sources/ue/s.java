package ue;

import com.google.android.exoplayer2.ParserException;
import com.vungle.ads.internal.protos.Sdk;
import fe.j0;
import fe.k0;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class s implements h {

    /* renamed from: a, reason: collision with root package name */
    public final String f91013a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f91014b;

    /* renamed from: c, reason: collision with root package name */
    public final ke.x f91015c;

    /* renamed from: d, reason: collision with root package name */
    public ke.v f91016d;

    /* renamed from: e, reason: collision with root package name */
    public String f91017e;

    /* renamed from: f, reason: collision with root package name */
    public k0 f91018f;

    /* renamed from: g, reason: collision with root package name */
    public int f91019g;

    /* renamed from: h, reason: collision with root package name */
    public int f91020h;

    /* renamed from: i, reason: collision with root package name */
    public int f91021i;

    /* renamed from: j, reason: collision with root package name */
    public int f91022j;

    /* renamed from: k, reason: collision with root package name */
    public long f91023k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f91024l;

    /* renamed from: m, reason: collision with root package name */
    public int f91025m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f91026p;

    /* renamed from: q, reason: collision with root package name */
    public long f91027q;

    /* renamed from: r, reason: collision with root package name */
    public int f91028r;

    /* renamed from: s, reason: collision with root package name */
    public long f91029s;

    /* renamed from: t, reason: collision with root package name */
    public int f91030t;

    /* renamed from: u, reason: collision with root package name */
    public String f91031u;

    public s(String str) {
        this.f91013a = str;
        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(1024);
        this.f91014b = aVar;
        byte[] bArr = (byte[]) aVar.f31986d;
        this.f91015c = new ke.x(bArr, bArr.length);
        this.f91023k = -9223372036854775807L;
    }

    @Override // ue.h
    public final void f(com.google.android.gms.internal.consent_sdk.a aVar) throws ParserException {
        int i5;
        boolean zH;
        wf.a.j(this.f91016d);
        while (aVar.g() > 0) {
            int i11 = this.f91019g;
            if (i11 != 0) {
                if (i11 != 1) {
                    com.google.android.gms.internal.consent_sdk.a aVar2 = this.f91014b;
                    ke.x xVar = this.f91015c;
                    if (i11 == 2) {
                        int iN = ((this.f91022j & (-225)) << 8) | aVar.N();
                        this.f91021i = iN;
                        if (iN > ((byte[]) aVar2.f31986d).length) {
                            aVar2.U(iN);
                            byte[] bArr = (byte[]) aVar2.f31986d;
                            xVar.n(bArr.length, bArr);
                        }
                        this.f91020h = 0;
                        this.f91019g = 3;
                    } else {
                        if (i11 != 3) {
                            throw new IllegalStateException();
                        }
                        int iMin = Math.min(aVar.g(), this.f91021i - this.f91020h);
                        aVar.z(this.f91020h, iMin, xVar.f71449d);
                        int i12 = this.f91020h + iMin;
                        this.f91020h = i12;
                        if (i12 == this.f91021i) {
                            xVar.o(0);
                            if (xVar.h()) {
                                if (this.f91024l) {
                                }
                                this.f91019g = 0;
                            } else {
                                this.f91024l = true;
                                int i13 = xVar.i(1);
                                int i14 = i13 == 1 ? xVar.i(1) : 0;
                                this.f91025m = i14;
                                if (i14 != 0) {
                                    throw ParserException.a(null, null);
                                }
                                if (i13 == 1) {
                                    xVar.i((xVar.i(2) + 1) * 8);
                                }
                                if (!xVar.h()) {
                                    throw ParserException.a(null, null);
                                }
                                this.n = xVar.i(6);
                                int i15 = xVar.i(4);
                                int i16 = xVar.i(3);
                                if (i15 != 0 || i16 != 0) {
                                    throw ParserException.a(null, null);
                                }
                                if (i13 == 0) {
                                    int iG = xVar.g();
                                    int iB = xVar.b();
                                    com.google.android.gms.internal.consent_sdk.a aVarF = he.a.f(xVar, true);
                                    this.f91031u = (String) aVarF.f31986d;
                                    this.f91028r = aVarF.f31984b;
                                    this.f91030t = aVarF.f31985c;
                                    int iB2 = iB - xVar.b();
                                    xVar.o(iG);
                                    byte[] bArr2 = new byte[(iB2 + 7) / 8];
                                    xVar.j(iB2, bArr2);
                                    j0 j0Var = new j0();
                                    j0Var.f54846a = this.f91017e;
                                    j0Var.f54856k = "audio/mp4a-latm";
                                    j0Var.f54853h = this.f91031u;
                                    j0Var.f54867x = this.f91030t;
                                    j0Var.f54868y = this.f91028r;
                                    j0Var.f54858m = Collections.singletonList(bArr2);
                                    j0Var.f54848c = this.f91013a;
                                    k0 k0Var = new k0(j0Var);
                                    if (!k0Var.equals(this.f91018f)) {
                                        this.f91018f = k0Var;
                                        this.f91029s = 1024000000 / k0Var.f54895z;
                                        this.f91016d.a(k0Var);
                                    }
                                } else {
                                    int iB3 = xVar.b();
                                    com.google.android.gms.internal.consent_sdk.a aVarF2 = he.a.f(xVar, true);
                                    this.f91031u = (String) aVarF2.f31986d;
                                    this.f91028r = aVarF2.f31984b;
                                    this.f91030t = aVarF2.f31985c;
                                    xVar.r(xVar.i((xVar.i(2) + 1) * 8) - (iB3 - xVar.b()));
                                }
                                int i17 = xVar.i(3);
                                this.o = i17;
                                if (i17 == 0) {
                                    xVar.r(8);
                                } else if (i17 == 1) {
                                    xVar.r(9);
                                } else if (i17 == 3 || i17 == 4 || i17 == 5) {
                                    xVar.r(6);
                                } else {
                                    if (i17 != 6 && i17 != 7) {
                                        throw new IllegalStateException();
                                    }
                                    xVar.r(1);
                                }
                                boolean zH2 = xVar.h();
                                this.f91026p = zH2;
                                this.f91027q = 0L;
                                if (zH2) {
                                    if (i13 == 1) {
                                        this.f91027q = xVar.i((xVar.i(2) + 1) * 8);
                                    } else {
                                        do {
                                            zH = xVar.h();
                                            this.f91027q = (this.f91027q << 8) + xVar.i(8);
                                        } while (zH);
                                    }
                                }
                                if (xVar.h()) {
                                    xVar.r(8);
                                }
                            }
                            if (this.f91025m != 0) {
                                throw ParserException.a(null, null);
                            }
                            if (this.n != 0) {
                                throw ParserException.a(null, null);
                            }
                            if (this.o != 0) {
                                throw ParserException.a(null, null);
                            }
                            int i18 = 0;
                            do {
                                i5 = xVar.i(8);
                                i18 += i5;
                            } while (i5 == 255);
                            int iG2 = xVar.g();
                            if ((iG2 & 7) == 0) {
                                aVar2.Y(iG2 >> 3);
                            } else {
                                xVar.j(i18 * 8, (byte[]) aVar2.f31986d);
                                aVar2.Y(0);
                            }
                            this.f91016d.d(i18, aVar2);
                            long j11 = this.f91023k;
                            if (j11 != -9223372036854775807L) {
                                this.f91016d.b(j11, 1, i18, 0, null);
                                this.f91023k += this.f91029s;
                            }
                            if (this.f91026p) {
                                xVar.r((int) this.f91027q);
                            }
                            this.f91019g = 0;
                        } else {
                            continue;
                        }
                    }
                } else {
                    int iN2 = aVar.N();
                    if ((iN2 & Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE) == 224) {
                        this.f91022j = iN2;
                        this.f91019g = 2;
                    } else if (iN2 != 86) {
                        this.f91019g = 0;
                    }
                }
            } else if (aVar.N() == 86) {
                this.f91019g = 1;
            }
        }
    }

    @Override // ue.h
    public final void h() {
        this.f91019g = 0;
        this.f91023k = -9223372036854775807L;
        this.f91024l = false;
    }

    @Override // ue.h
    public final void i(ke.l lVar, d0 d0Var) {
        d0Var.a();
        d0Var.b();
        this.f91016d = lVar.s(d0Var.f90858d, 1);
        d0Var.b();
        this.f91017e = d0Var.f90859e;
    }

    @Override // ue.h
    public final void j() {
    }

    @Override // ue.h
    public final void k(int i5, long j11) {
        if (j11 != -9223372036854775807L) {
            this.f91023k = j11;
        }
    }
}
