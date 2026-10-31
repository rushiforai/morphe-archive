package ke;

/* loaded from: classes3.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71446a;

    /* renamed from: b, reason: collision with root package name */
    public int f71447b;

    /* renamed from: c, reason: collision with root package name */
    public int f71448c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f71449d;

    /* renamed from: e, reason: collision with root package name */
    public int f71450e;

    public x() {
        this.f71446a = 2;
        this.f71449d = wf.v.f94381f;
    }

    public void a() {
        int i5;
        int i11;
        switch (this.f71446a) {
            case 2:
                int i12 = this.f71447b;
                wf.a.i(i12 >= 0 && (i12 < (i5 = this.f71450e) || (i12 == i5 && this.f71448c == 0)));
                break;
            default:
                int i13 = this.f71448c;
                wf.a.i(i13 >= 0 && (i13 < (i11 = this.f71447b) || (i13 == i11 && this.f71450e == 0)));
                break;
        }
    }

    public int b() {
        return ((this.f71450e - this.f71447b) * 8) - this.f71448c;
    }

    public void c() {
        if (this.f71448c == 0) {
            return;
        }
        this.f71448c = 0;
        this.f71447b++;
        a();
    }

    public boolean d(int i5) {
        int i11 = this.f71448c;
        int i12 = i5 / 8;
        int i13 = i11 + i12;
        int i14 = (this.f71450e + i5) - (i12 * 8);
        if (i14 > 7) {
            i13++;
            i14 -= 8;
        }
        while (true) {
            i11++;
            if (i11 > i13 || i13 >= this.f71447b) {
                break;
            }
            if (p(i11)) {
                i13++;
                i11 += 2;
            }
        }
        int i15 = this.f71447b;
        if (i13 >= i15) {
            return i13 == i15 && i14 == 0;
        }
        return true;
    }

    public boolean e() {
        int i5 = this.f71448c;
        int i11 = this.f71450e;
        int i12 = 0;
        while (this.f71448c < this.f71447b && !h()) {
            i12++;
        }
        boolean z11 = this.f71448c == this.f71447b;
        this.f71448c = i5;
        this.f71450e = i11;
        return !z11 && d((i12 * 2) + 1);
    }

    public int f() {
        wf.a.i(this.f71448c == 0);
        return this.f71447b;
    }

    public int g() {
        return (this.f71447b * 8) + this.f71448c;
    }

    public boolean h() {
        switch (this.f71446a) {
            case 0:
                boolean z11 = (((this.f71449d[this.f71448c] & 255) >> this.f71450e) & 1) == 1;
                r(1);
                return z11;
            case 1:
            default:
                boolean z12 = (this.f71449d[this.f71448c] & (128 >> this.f71450e)) != 0;
                q();
                return z12;
            case 2:
                boolean z13 = (this.f71449d[this.f71447b] & (128 >> this.f71448c)) != 0;
                q();
                return z13;
        }
    }

    public int i(int i5) {
        switch (this.f71446a) {
            case 0:
                int i11 = this.f71448c;
                int iMin = Math.min(i5, 8 - this.f71450e);
                byte[] bArr = this.f71449d;
                int i12 = i11 + 1;
                int i13 = ((bArr[i11] & 255) >> this.f71450e) & (255 >> (8 - iMin));
                while (iMin < i5) {
                    i13 |= (bArr[i12] & 255) << iMin;
                    iMin += 8;
                    i12++;
                }
                int i14 = i13 & ((-1) >>> (32 - i5));
                r(i5);
                return i14;
            case 1:
            default:
                this.f71450e += i5;
                int i15 = 0;
                while (true) {
                    int i16 = this.f71450e;
                    if (i16 <= 8) {
                        byte[] bArr2 = this.f71449d;
                        int i17 = this.f71448c;
                        int i18 = ((-1) >>> (32 - i5)) & (i15 | ((bArr2[i17] & 255) >> (8 - i16)));
                        if (i16 == 8) {
                            this.f71450e = 0;
                            this.f71448c = i17 + (p(i17 + 1) ? 2 : 1);
                        }
                        a();
                        return i18;
                    }
                    int i19 = i16 - 8;
                    this.f71450e = i19;
                    byte[] bArr3 = this.f71449d;
                    int i21 = this.f71448c;
                    i15 |= (bArr3[i21] & 255) << i19;
                    if (!p(i21 + 1)) {
                        i = 1;
                    }
                    this.f71448c = i21 + i;
                }
            case 2:
                if (i5 == 0) {
                    return 0;
                }
                this.f71448c += i5;
                int i22 = 0;
                while (true) {
                    int i23 = this.f71448c;
                    if (i23 <= 8) {
                        byte[] bArr4 = this.f71449d;
                        int i24 = this.f71447b;
                        int i25 = ((-1) >>> (32 - i5)) & (i22 | ((bArr4[i24] & 255) >> (8 - i23)));
                        if (i23 == 8) {
                            this.f71448c = 0;
                            this.f71447b = i24 + 1;
                        }
                        a();
                        return i25;
                    }
                    int i26 = i23 - 8;
                    this.f71448c = i26;
                    byte[] bArr5 = this.f71449d;
                    int i27 = this.f71447b;
                    this.f71447b = i27 + 1;
                    i22 |= (bArr5[i27] & 255) << i26;
                }
        }
    }

    public void j(int i5, byte[] bArr) {
        int i11 = i5 >> 3;
        for (int i12 = 0; i12 < i11; i12++) {
            byte[] bArr2 = this.f71449d;
            int i13 = this.f71447b;
            int i14 = i13 + 1;
            this.f71447b = i14;
            byte b11 = bArr2[i13];
            int i15 = this.f71448c;
            byte b12 = (byte) (b11 << i15);
            bArr[i12] = b12;
            bArr[i12] = (byte) (((255 & bArr2[i14]) >> (8 - i15)) | b12);
        }
        int i16 = i5 & 7;
        if (i16 == 0) {
            return;
        }
        byte b13 = (byte) (bArr[i11] & (255 >> i16));
        bArr[i11] = b13;
        int i17 = this.f71448c;
        if (i17 + i16 > 8) {
            byte[] bArr3 = this.f71449d;
            int i18 = this.f71447b;
            this.f71447b = i18 + 1;
            bArr[i11] = (byte) (b13 | ((bArr3[i18] & 255) << i17));
            this.f71448c = i17 - 8;
        }
        int i19 = this.f71448c + i16;
        this.f71448c = i19;
        byte[] bArr4 = this.f71449d;
        int i21 = this.f71447b;
        bArr[i11] = (byte) (((byte) (((255 & bArr4[i21]) >> (8 - i19)) << (8 - i16))) | bArr[i11]);
        if (i19 == 8) {
            this.f71448c = 0;
            this.f71447b = i21 + 1;
        }
        a();
    }

    public void k(int i5, byte[] bArr) {
        wf.a.i(this.f71448c == 0);
        System.arraycopy(this.f71449d, this.f71447b, bArr, 0, i5);
        this.f71447b += i5;
        a();
    }

    public int l() {
        int i5 = 0;
        while (!h()) {
            i5++;
        }
        return ((1 << i5) - 1) + (i5 > 0 ? i(i5) : 0);
    }

    public int m() {
        int iL = l();
        return ((iL + 1) / 2) * (iL % 2 == 0 ? -1 : 1);
    }

    public void n(int i5, byte[] bArr) {
        this.f71449d = bArr;
        this.f71447b = 0;
        this.f71448c = 0;
        this.f71450e = i5;
    }

    public void o(int i5) {
        int i11 = i5 / 8;
        this.f71447b = i11;
        this.f71448c = i5 - (i11 * 8);
        a();
    }

    public boolean p(int i5) {
        if (2 > i5 || i5 >= this.f71447b) {
            return false;
        }
        byte[] bArr = this.f71449d;
        return bArr[i5] == 3 && bArr[i5 + (-2)] == 0 && bArr[i5 - 1] == 0;
    }

    public void q() {
        switch (this.f71446a) {
            case 2:
                int i5 = this.f71448c + 1;
                this.f71448c = i5;
                if (i5 == 8) {
                    this.f71448c = 0;
                    this.f71447b++;
                }
                a();
                break;
            default:
                int i11 = this.f71450e + 1;
                this.f71450e = i11;
                if (i11 == 8) {
                    this.f71450e = 0;
                    int i12 = this.f71448c;
                    this.f71448c = i12 + (p(i12 + 1) ? 2 : 1);
                }
                a();
                break;
        }
    }

    public void r(int i5) {
        int i11;
        switch (this.f71446a) {
            case 0:
                int i12 = i5 / 8;
                int i13 = this.f71448c + i12;
                this.f71448c = i13;
                int i14 = (i5 - (i12 * 8)) + this.f71450e;
                this.f71450e = i14;
                boolean z11 = true;
                if (i14 > 7) {
                    this.f71448c = i13 + 1;
                    this.f71450e = i14 - 8;
                }
                int i15 = this.f71448c;
                if (i15 < 0 || (i15 >= (i11 = this.f71447b) && (i15 != i11 || this.f71450e != 0))) {
                    z11 = false;
                }
                wf.a.i(z11);
                break;
            case 1:
            default:
                int i16 = this.f71448c;
                int i17 = i5 / 8;
                int i18 = i16 + i17;
                this.f71448c = i18;
                int i19 = (i5 - (i17 * 8)) + this.f71450e;
                this.f71450e = i19;
                if (i19 > 7) {
                    this.f71448c = i18 + 1;
                    this.f71450e = i19 - 8;
                }
                while (true) {
                    i16++;
                    if (i16 > this.f71448c) {
                        a();
                        break;
                    } else if (p(i16)) {
                        this.f71448c++;
                        i16 += 2;
                    }
                }
            case 2:
                int i21 = i5 / 8;
                int i22 = this.f71447b + i21;
                this.f71447b = i22;
                int i23 = (i5 - (i21 * 8)) + this.f71448c;
                this.f71448c = i23;
                if (i23 > 7) {
                    this.f71447b = i22 + 1;
                    this.f71448c = i23 - 8;
                }
                a();
                break;
        }
    }

    public void s(int i5) {
        wf.a.i(this.f71448c == 0);
        this.f71447b += i5;
        a();
    }

    public x(byte[] bArr, int i5, int i11) {
        this.f71446a = 3;
        this.f71449d = bArr;
        this.f71448c = i5;
        this.f71447b = i11;
        this.f71450e = 0;
        a();
    }

    public x(byte[] bArr) {
        this.f71446a = 0;
        this.f71449d = bArr;
        this.f71447b = bArr.length;
    }

    public x(byte[] bArr, int i5) {
        this.f71446a = 2;
        this.f71449d = bArr;
        this.f71450e = i5;
    }

    public x(int i5, int i11) {
        this.f71446a = 1;
        this.f71447b = i5;
        this.f71448c = i11;
        this.f71449d = new byte[(i11 * 2) - 1];
        this.f71450e = 0;
    }
}
