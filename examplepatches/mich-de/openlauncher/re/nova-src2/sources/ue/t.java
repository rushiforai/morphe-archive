package ue;

import androidx.recyclerview.widget.u1;
import fe.j0;
import fe.k0;

/* loaded from: classes3.dex */
public final class t implements h {

    /* renamed from: a, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f91032a;

    /* renamed from: b, reason: collision with root package name */
    public final fz.y f91033b;

    /* renamed from: c, reason: collision with root package name */
    public final String f91034c;

    /* renamed from: d, reason: collision with root package name */
    public ke.v f91035d;

    /* renamed from: e, reason: collision with root package name */
    public String f91036e;

    /* renamed from: f, reason: collision with root package name */
    public int f91037f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f91038g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f91039h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f91040i;

    /* renamed from: j, reason: collision with root package name */
    public long f91041j;

    /* renamed from: k, reason: collision with root package name */
    public int f91042k;

    /* renamed from: l, reason: collision with root package name */
    public long f91043l;

    public t(String str) {
        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(4);
        this.f91032a = aVar;
        ((byte[]) aVar.f31986d)[0] = -1;
        this.f91033b = new fz.y();
        this.f91043l = -9223372036854775807L;
        this.f91034c = str;
    }

    @Override // ue.h
    public final void f(com.google.android.gms.internal.consent_sdk.a aVar) {
        wf.a.j(this.f91035d);
        while (aVar.g() > 0) {
            int i5 = this.f91037f;
            com.google.android.gms.internal.consent_sdk.a aVar2 = this.f91032a;
            if (i5 == 0) {
                byte[] bArr = (byte[]) aVar.f31986d;
                int i11 = aVar.f31984b;
                int i12 = aVar.f31985c;
                while (true) {
                    if (i11 >= i12) {
                        aVar.Y(i12);
                        break;
                    }
                    byte b11 = bArr[i11];
                    boolean z11 = (b11 & 255) == 255;
                    boolean z12 = this.f91040i && (b11 & 224) == 224;
                    this.f91040i = z11;
                    if (z12) {
                        aVar.Y(i11 + 1);
                        this.f91040i = false;
                        ((byte[]) aVar2.f31986d)[1] = bArr[i11];
                        this.f91038g = 2;
                        this.f91037f = 1;
                        break;
                    }
                    i11++;
                }
            } else if (i5 == 1) {
                int iMin = Math.min(aVar.g(), 4 - this.f91038g);
                aVar.z(this.f91038g, iMin, (byte[]) aVar2.f31986d);
                int i13 = this.f91038g + iMin;
                this.f91038g = i13;
                if (i13 >= 4) {
                    aVar2.Y(0);
                    int iA = aVar2.A();
                    fz.y yVar = this.f91033b;
                    if (yVar.b(iA)) {
                        this.f91042k = yVar.f56388b;
                        if (!this.f91039h) {
                            int i14 = yVar.f56389c;
                            this.f91041j = (yVar.f56392f * 1000000) / i14;
                            j0 j0Var = new j0();
                            j0Var.f54846a = this.f91036e;
                            j0Var.f54856k = (String) yVar.f56393g;
                            j0Var.f54857l = u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                            j0Var.f54867x = yVar.f56390d;
                            j0Var.f54868y = i14;
                            j0Var.f54848c = this.f91034c;
                            this.f91035d.a(new k0(j0Var));
                            this.f91039h = true;
                        }
                        aVar2.Y(0);
                        this.f91035d.d(4, aVar2);
                        this.f91037f = 2;
                    } else {
                        this.f91038g = 0;
                        this.f91037f = 1;
                    }
                }
            } else {
                if (i5 != 2) {
                    throw new IllegalStateException();
                }
                int iMin2 = Math.min(aVar.g(), this.f91042k - this.f91038g);
                this.f91035d.d(iMin2, aVar);
                int i15 = this.f91038g + iMin2;
                this.f91038g = i15;
                int i16 = this.f91042k;
                if (i15 >= i16) {
                    long j11 = this.f91043l;
                    if (j11 != -9223372036854775807L) {
                        this.f91035d.b(j11, 1, i16, 0, null);
                        this.f91043l += this.f91041j;
                    }
                    this.f91038g = 0;
                    this.f91037f = 0;
                }
            }
        }
    }

    @Override // ue.h
    public final void h() {
        this.f91037f = 0;
        this.f91038g = 0;
        this.f91040i = false;
        this.f91043l = -9223372036854775807L;
    }

    @Override // ue.h
    public final void i(ke.l lVar, d0 d0Var) {
        d0Var.a();
        d0Var.b();
        this.f91036e = d0Var.f90859e;
        d0Var.b();
        this.f91035d = lVar.s(d0Var.f90858d, 1);
    }

    @Override // ue.h
    public final void j() {
    }

    @Override // ue.h
    public final void k(int i5, long j11) {
        if (j11 != -9223372036854775807L) {
            this.f91043l = j11;
        }
    }
}
