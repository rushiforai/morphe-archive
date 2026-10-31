package ue;

import fe.j0;
import fe.k0;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class g implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90891a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f90892b;

    /* renamed from: c, reason: collision with root package name */
    public long f90893c;

    /* renamed from: d, reason: collision with root package name */
    public int f90894d;

    /* renamed from: e, reason: collision with root package name */
    public int f90895e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f90896f;

    /* renamed from: g, reason: collision with root package name */
    public Object f90897g;

    public g(List list) {
        this.f90891a = 0;
        this.f90896f = list;
        this.f90897g = new ke.v[list.size()];
        this.f90893c = -9223372036854775807L;
    }

    @Override // ue.h
    public final void f(com.google.android.gms.internal.consent_sdk.a aVar) {
        boolean z11;
        boolean z12;
        switch (this.f90891a) {
            case 0:
                if (this.f90892b) {
                    if (this.f90894d == 2) {
                        if (aVar.g() == 0) {
                            z12 = false;
                        } else {
                            if (aVar.N() != 32) {
                                this.f90892b = false;
                            }
                            this.f90894d--;
                            z12 = this.f90892b;
                        }
                        if (!z12) {
                        }
                    }
                    if (this.f90894d == 1) {
                        if (aVar.g() == 0) {
                            z11 = false;
                        } else {
                            if (aVar.N() != 0) {
                                this.f90892b = false;
                            }
                            this.f90894d--;
                            z11 = this.f90892b;
                        }
                        if (!z11) {
                        }
                    }
                    int i5 = aVar.f31984b;
                    int iG = aVar.g();
                    for (ke.v vVar : (ke.v[]) this.f90897g) {
                        aVar.Y(i5);
                        vVar.d(iG, aVar);
                    }
                    this.f90895e += iG;
                    break;
                }
                break;
            default:
                com.google.android.gms.internal.consent_sdk.a aVar2 = (com.google.android.gms.internal.consent_sdk.a) this.f90896f;
                wf.a.j((ke.v) this.f90897g);
                if (this.f90892b) {
                    int iG2 = aVar.g();
                    int i11 = this.f90895e;
                    if (i11 < 10) {
                        int iMin = Math.min(iG2, 10 - i11);
                        System.arraycopy((byte[]) aVar.f31986d, aVar.f31984b, (byte[]) aVar2.f31986d, this.f90895e, iMin);
                        if (this.f90895e + iMin == 10) {
                            aVar2.Y(0);
                            if (73 != aVar2.N() || 68 != aVar2.N() || 51 != aVar2.N()) {
                                wf.a.D("Id3Reader", "Discarding invalid ID3 tag");
                                this.f90892b = false;
                                break;
                            } else {
                                aVar2.Z(3);
                                this.f90894d = aVar2.M() + 10;
                            }
                        }
                    }
                    int iMin2 = Math.min(iG2, this.f90894d - this.f90895e);
                    ((ke.v) this.f90897g).d(iMin2, aVar);
                    this.f90895e += iMin2;
                    break;
                }
                break;
        }
    }

    @Override // ue.h
    public final void h() {
        switch (this.f90891a) {
            case 0:
                this.f90892b = false;
                this.f90893c = -9223372036854775807L;
                break;
            default:
                this.f90892b = false;
                this.f90893c = -9223372036854775807L;
                break;
        }
    }

    @Override // ue.h
    public final void i(ke.l lVar, d0 d0Var) {
        switch (this.f90891a) {
            case 0:
                ke.v[] vVarArr = (ke.v[]) this.f90897g;
                for (int i5 = 0; i5 < vVarArr.length; i5++) {
                    c0 c0Var = (c0) ((List) this.f90896f).get(i5);
                    d0Var.a();
                    d0Var.b();
                    ke.v vVarS = lVar.s(d0Var.f90858d, 3);
                    j0 j0Var = new j0();
                    d0Var.b();
                    j0Var.f54846a = d0Var.f90859e;
                    j0Var.f54856k = "application/dvbsubs";
                    j0Var.f54858m = Collections.singletonList(c0Var.f90845b);
                    j0Var.f54848c = c0Var.f90844a;
                    vVarS.a(new k0(j0Var));
                    vVarArr[i5] = vVarS;
                }
                break;
            default:
                d0Var.a();
                d0Var.b();
                ke.v vVarS2 = lVar.s(d0Var.f90858d, 5);
                this.f90897g = vVarS2;
                j0 j0Var2 = new j0();
                d0Var.b();
                j0Var2.f54846a = d0Var.f90859e;
                j0Var2.f54856k = "application/id3";
                vVarS2.a(new k0(j0Var2));
                break;
        }
    }

    @Override // ue.h
    public final void j() {
        int i5;
        switch (this.f90891a) {
            case 0:
                if (this.f90892b) {
                    if (this.f90893c != -9223372036854775807L) {
                        for (ke.v vVar : (ke.v[]) this.f90897g) {
                            vVar.b(this.f90893c, 1, this.f90895e, 0, null);
                        }
                    }
                    this.f90892b = false;
                    break;
                }
                break;
            default:
                wf.a.j((ke.v) this.f90897g);
                if (this.f90892b && (i5 = this.f90894d) != 0 && this.f90895e == i5) {
                    long j11 = this.f90893c;
                    if (j11 != -9223372036854775807L) {
                        ((ke.v) this.f90897g).b(j11, 1, i5, 0, null);
                    }
                    this.f90892b = false;
                    break;
                }
                break;
        }
    }

    @Override // ue.h
    public final void k(int i5, long j11) {
        switch (this.f90891a) {
            case 0:
                if ((i5 & 4) != 0) {
                    this.f90892b = true;
                    if (j11 != -9223372036854775807L) {
                        this.f90893c = j11;
                    }
                    this.f90895e = 0;
                    this.f90894d = 2;
                    break;
                }
                break;
            default:
                if ((i5 & 4) != 0) {
                    this.f90892b = true;
                    if (j11 != -9223372036854775807L) {
                        this.f90893c = j11;
                    }
                    this.f90894d = 0;
                    this.f90895e = 0;
                    break;
                }
                break;
        }
    }

    public g() {
        this.f90891a = 1;
        this.f90896f = new com.google.android.gms.internal.consent_sdk.a(10);
        this.f90893c = -9223372036854775807L;
    }
}
