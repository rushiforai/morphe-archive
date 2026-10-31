package ue;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.exoplayer2.ParserException;
import fe.j0;
import fe.k0;
import java.util.Arrays;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class e implements h {

    /* renamed from: v, reason: collision with root package name */
    public static final byte[] f90860v = {73, 68, 51};

    /* renamed from: a, reason: collision with root package name */
    public final boolean f90861a;

    /* renamed from: d, reason: collision with root package name */
    public final String f90864d;

    /* renamed from: e, reason: collision with root package name */
    public String f90865e;

    /* renamed from: f, reason: collision with root package name */
    public ke.v f90866f;

    /* renamed from: g, reason: collision with root package name */
    public ke.v f90867g;

    /* renamed from: k, reason: collision with root package name */
    public boolean f90871k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f90872l;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f90874p;

    /* renamed from: r, reason: collision with root package name */
    public int f90876r;

    /* renamed from: t, reason: collision with root package name */
    public ke.v f90878t;

    /* renamed from: u, reason: collision with root package name */
    public long f90879u;

    /* renamed from: b, reason: collision with root package name */
    public final ke.x f90862b = new ke.x(new byte[7], 7);

    /* renamed from: c, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90863c = new com.google.android.gms.internal.consent_sdk.a(Arrays.copyOf(f90860v, 10));

    /* renamed from: h, reason: collision with root package name */
    public int f90868h = 0;

    /* renamed from: i, reason: collision with root package name */
    public int f90869i = 0;

    /* renamed from: j, reason: collision with root package name */
    public int f90870j = 256;

    /* renamed from: m, reason: collision with root package name */
    public int f90873m = -1;
    public int n = -1;

    /* renamed from: q, reason: collision with root package name */
    public long f90875q = -9223372036854775807L;

    /* renamed from: s, reason: collision with root package name */
    public long f90877s = -9223372036854775807L;

    public e(boolean z11, String str) {
        this.f90861a = z11;
        this.f90864d = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x01f0  */
    @Override // ue.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(com.google.android.gms.internal.consent_sdk.a aVar) throws ParserException {
        int i5;
        int i11;
        byte b11;
        char c11;
        int i12;
        int i13;
        char c12;
        int i14;
        char c13;
        int i15;
        int i16;
        int i17;
        this.f90866f.getClass();
        int i18 = wf.v.f94376a;
        while (aVar.g() > 0) {
            int i19 = this.f90868h;
            char c14 = 65535;
            com.google.android.gms.internal.consent_sdk.a aVar2 = this.f90863c;
            int i21 = 3;
            ke.x xVar = this.f90862b;
            int i22 = 4;
            int i23 = 1;
            int i24 = 0;
            if (i19 == 0) {
                byte[] bArr = (byte[]) aVar.f31986d;
                int i25 = aVar.f31984b;
                int i26 = aVar.f31985c;
                while (true) {
                    if (i25 >= i26) {
                        aVar.Y(i25);
                        break;
                    }
                    i5 = i25 + 1;
                    i11 = i21;
                    b11 = bArr[i25];
                    int i27 = b11 & 255;
                    if (this.f90870j != 512 || ((65280 | (((byte) i27) & 255)) & 65526) != 65520) {
                        c11 = c14;
                        i12 = i23;
                    } else {
                        if (this.f90872l) {
                            break;
                        }
                        int i28 = i25 - 1;
                        aVar.Y(i25);
                        byte[] bArr2 = xVar.f71449d;
                        if (aVar.g() < i23) {
                            c11 = 65535;
                            i12 = 1;
                        } else {
                            aVar.z(i24, i23, bArr2);
                            xVar.o(i22);
                            int i29 = xVar.i(i23);
                            int i31 = this.f90873m;
                            if (i31 == -1 || i29 == i31) {
                                if (this.n != -1) {
                                    byte[] bArr3 = xVar.f71449d;
                                    if (aVar.g() < i23) {
                                        break;
                                    }
                                    aVar.z(i24, i23, bArr3);
                                    xVar.o(2);
                                    i15 = 4;
                                    if (xVar.i(4) == this.n) {
                                        aVar.Y(i5);
                                    }
                                    c11 = 65535;
                                } else {
                                    i15 = 4;
                                }
                                byte[] bArr4 = xVar.f71449d;
                                if (aVar.g() >= i15) {
                                    aVar.z(i24, i15, bArr4);
                                    xVar.o(14);
                                    int i32 = xVar.i(13);
                                    if (i32 >= 7) {
                                        byte[] bArr5 = (byte[]) aVar.f31986d;
                                        int i33 = aVar.f31985c;
                                        int i34 = i28 + i32;
                                        if (i34 < i33) {
                                            byte b12 = bArr5[i34];
                                            c11 = 65535;
                                            if (b12 != -1) {
                                                if (b12 == 73 && ((i16 = i34 + 1) == i33 || (bArr5[i16] == 68 && ((i17 = i34 + 2) == i33 || bArr5[i17] == 51)))) {
                                                    break;
                                                }
                                            } else {
                                                int i35 = i34 + 1;
                                                if (i35 != i33) {
                                                    byte b13 = bArr5[i35];
                                                    if (((65280 | (b13 & 255)) & 65526) == 65520 && ((b13 & 8) >> 3) == i29) {
                                                        break;
                                                    }
                                                } else {
                                                    break;
                                                }
                                            }
                                        } else {
                                            break;
                                        }
                                    }
                                } else {
                                    break;
                                }
                            } else {
                                c11 = 65535;
                            }
                            i12 = 1;
                        }
                    }
                    int i36 = this.f90870j;
                    int i37 = i27 | i36;
                    if (i37 == 329) {
                        i13 = 3;
                        c12 = 256;
                        i14 = 0;
                        c13 = 2;
                        this.f90870j = 768;
                    } else if (i37 == 511) {
                        i13 = 3;
                        c12 = 256;
                        i14 = 0;
                        c13 = 2;
                        this.f90870j = EventBridgeChannel.QUEUE_CAPACITY;
                    } else if (i37 == 836) {
                        i13 = 3;
                        c12 = 256;
                        i14 = 0;
                        c13 = 2;
                        this.f90870j = 1024;
                    } else {
                        if (i37 == 1075) {
                            this.f90868h = 2;
                            this.f90869i = 3;
                            this.f90876r = 0;
                            aVar2.Y(0);
                            aVar.Y(i5);
                            break;
                        }
                        c12 = 256;
                        if (i36 != 256) {
                            this.f90870j = 256;
                            i13 = 3;
                            i14 = 0;
                            c13 = 2;
                            i23 = i12;
                            c14 = c11;
                            i22 = 4;
                            i24 = i14;
                            i21 = i13;
                        } else {
                            i13 = 3;
                            i14 = 0;
                            c13 = 2;
                        }
                    }
                    i25 = i5;
                    i23 = i12;
                    c14 = c11;
                    i22 = 4;
                    i24 = i14;
                    i21 = i13;
                }
                this.o = (b11 & 8) >> 3;
                this.f90871k = (b11 & 1) == 0;
                if (this.f90872l) {
                    this.f90868h = i11;
                    this.f90869i = 0;
                } else {
                    this.f90868h = 1;
                    this.f90869i = 0;
                }
                aVar.Y(i5);
            } else if (i19 != 1) {
                if (i19 == 2) {
                    byte[] bArr6 = (byte[]) aVar2.f31986d;
                    int iMin = Math.min(aVar.g(), 10 - this.f90869i);
                    aVar.z(this.f90869i, iMin, bArr6);
                    int i38 = this.f90869i + iMin;
                    this.f90869i = i38;
                    if (i38 == 10) {
                        this.f90867g.d(10, aVar2);
                        aVar2.Y(6);
                        ke.v vVar = this.f90867g;
                        int iM = aVar2.M() + 10;
                        this.f90868h = 4;
                        this.f90869i = 10;
                        this.f90878t = vVar;
                        this.f90879u = 0L;
                        this.f90876r = iM;
                    }
                } else if (i19 == 3) {
                    int i39 = this.f90871k ? 7 : 5;
                    byte[] bArr7 = xVar.f71449d;
                    int iMin2 = Math.min(aVar.g(), i39 - this.f90869i);
                    aVar.z(this.f90869i, iMin2, bArr7);
                    int i40 = this.f90869i + iMin2;
                    this.f90869i = i40;
                    if (i40 == i39) {
                        xVar.o(0);
                        if (this.f90874p) {
                            xVar.r(10);
                        } else {
                            int i41 = xVar.i(2) + 1;
                            if (i41 != 2) {
                                wf.a.D("AdtsReader", "Detected audio object type: " + i41 + ", but assuming AAC LC.");
                                i41 = 2;
                            }
                            xVar.r(5);
                            int i42 = xVar.i(3);
                            int i43 = this.n;
                            byte[] bArr8 = {(byte) (((i41 << 3) & 248) | ((i43 >> 1) & 7)), (byte) (((i42 << 3) & 120) | ((i43 << 7) & 128))};
                            com.google.android.gms.internal.consent_sdk.a aVarF = he.a.f(new ke.x(bArr8, 2), false);
                            j0 j0Var = new j0();
                            j0Var.f54846a = this.f90865e;
                            j0Var.f54856k = "audio/mp4a-latm";
                            j0Var.f54853h = (String) aVarF.f31986d;
                            j0Var.f54867x = aVarF.f31985c;
                            j0Var.f54868y = aVarF.f31984b;
                            j0Var.f54858m = Collections.singletonList(bArr8);
                            j0Var.f54848c = this.f90864d;
                            k0 k0Var = new k0(j0Var);
                            this.f90875q = 1024000000 / k0Var.f54895z;
                            this.f90866f.a(k0Var);
                            this.f90874p = true;
                        }
                        xVar.r(4);
                        int i44 = xVar.i(13);
                        int i45 = i44 - 7;
                        if (this.f90871k) {
                            i45 = i44 - 9;
                        }
                        ke.v vVar2 = this.f90866f;
                        long j11 = this.f90875q;
                        this.f90868h = 4;
                        this.f90869i = 0;
                        this.f90878t = vVar2;
                        this.f90879u = j11;
                        this.f90876r = i45;
                    }
                } else {
                    if (i19 != 4) {
                        throw new IllegalStateException();
                    }
                    int iMin3 = Math.min(aVar.g(), this.f90876r - this.f90869i);
                    this.f90878t.d(iMin3, aVar);
                    int i46 = this.f90869i + iMin3;
                    this.f90869i = i46;
                    int i47 = this.f90876r;
                    if (i46 == i47) {
                        long j12 = this.f90877s;
                        if (j12 != -9223372036854775807L) {
                            this.f90878t.b(j12, 1, i47, 0, null);
                            this.f90877s += this.f90879u;
                        }
                        this.f90868h = 0;
                        this.f90869i = 0;
                        this.f90870j = 256;
                    }
                }
            } else if (aVar.g() != 0) {
                xVar.f71449d[0] = ((byte[]) aVar.f31986d)[aVar.f31984b];
                xVar.o(2);
                int i48 = xVar.i(4);
                int i49 = this.n;
                if (i49 == -1 || i48 == i49) {
                    if (!this.f90872l) {
                        this.f90872l = true;
                        this.f90873m = this.o;
                        this.n = i48;
                    }
                    this.f90868h = 3;
                    this.f90869i = 0;
                } else {
                    this.f90872l = false;
                    this.f90868h = 0;
                    this.f90869i = 0;
                    this.f90870j = 256;
                }
            }
        }
    }

    @Override // ue.h
    public final void h() {
        this.f90877s = -9223372036854775807L;
        this.f90872l = false;
        this.f90868h = 0;
        this.f90869i = 0;
        this.f90870j = 256;
    }

    @Override // ue.h
    public final void i(ke.l lVar, d0 d0Var) {
        d0Var.a();
        d0Var.b();
        this.f90865e = d0Var.f90859e;
        d0Var.b();
        ke.v vVarS = lVar.s(d0Var.f90858d, 1);
        this.f90866f = vVarS;
        this.f90878t = vVarS;
        if (!this.f90861a) {
            this.f90867g = new ke.i();
            return;
        }
        d0Var.a();
        d0Var.b();
        ke.v vVarS2 = lVar.s(d0Var.f90858d, 5);
        this.f90867g = vVarS2;
        j0 j0Var = new j0();
        d0Var.b();
        j0Var.f54846a = d0Var.f90859e;
        j0Var.f54856k = "application/id3";
        vVarS2.a(new k0(j0Var));
    }

    @Override // ue.h
    public final void j() {
    }

    @Override // ue.h
    public final void k(int i5, long j11) {
        if (j11 != -9223372036854775807L) {
            this.f90877s = j11;
        }
    }
}
