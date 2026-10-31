package ja0;

import com.google.android.gms.internal.measurement.v6;
import fa.t;

/* loaded from: classes.dex */
public final class k extends l {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69340a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f69341b;

    public /* synthetic */ k(m mVar, int i5) {
        this.f69340a = i5;
        this.f69341b = mVar;
    }

    public final int d(int i5) {
        int i11;
        switch (this.f69340a) {
            case 0:
                m mVar = this.f69341b;
                if (i5 >= 0 && i5 < mVar.f69344c) {
                    i11 = mVar.f69345d;
                    break;
                } else {
                    throw new IndexOutOfBoundsException(String.format("Invalid string index %d, not in [0, %d)", Integer.valueOf(i5), Integer.valueOf(mVar.f69344c)));
                }
            default:
                m mVar2 = this.f69341b;
                if (i5 >= 0 && i5 < mVar2.f69346e) {
                    i11 = mVar2.f69347f;
                    break;
                } else {
                    throw new IndexOutOfBoundsException(String.format("Invalid type index %d, not in [0, %d)", Integer.valueOf(i5), Integer.valueOf(mVar2.f69346e)));
                }
                break;
        }
        return (i5 * 4) + i11;
    }

    @Override // ja0.l, java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        int i11;
        char c11;
        switch (this.f69340a) {
            case 0:
                int iD = d(i5);
                m mVar = this.f69341b;
                int iY = mVar.f69342a.y(iD);
                v6 v6Var = mVar.f69343b;
                v6Var.getClass();
                t tVar = new t(v6Var, iY);
                int i12 = 0;
                int iM = tVar.m(false);
                int[] iArr = new int[1];
                byte[] bArr = (byte[]) v6Var.f33136b;
                int i13 = tVar.f54485a;
                bh.i iVar = va0.a.f92582a;
                char[] cArr = (char[]) iVar.get();
                if (cArr == null || cArr.length < iM) {
                    cArr = new char[iM];
                    iVar.set(cArr);
                }
                int i14 = 0;
                int i15 = i13;
                while (iM > 0) {
                    byte b11 = bArr[i15];
                    int i16 = b11 & 255;
                    switch (i16 >> 4) {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                            i11 = i12;
                            if (i16 == 0) {
                                va0.a.a(i16, i15);
                                throw null;
                            }
                            c11 = (char) i16;
                            i15++;
                            break;
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        default:
                            va0.a.a(i16, i15);
                            throw null;
                        case 12:
                        case 13:
                            i11 = i12;
                            int i17 = i15 + 1;
                            byte b12 = bArr[i17];
                            int i18 = b12 & 255;
                            if ((b12 & 192) != 128) {
                                va0.a.a(i18, i17);
                                throw null;
                            }
                            int i19 = ((b11 & 31) << 6) | (b12 & 63);
                            if (i19 != 0 && i19 < 128) {
                                va0.a.a(i18, i17);
                                throw null;
                            }
                            c11 = (char) i19;
                            i15 += 2;
                            break;
                        case 14:
                            int i21 = i15 + 1;
                            byte b13 = bArr[i21];
                            int i22 = b13 & 255;
                            if ((b13 & 192) != 128) {
                                va0.a.a(i22, i21);
                                throw null;
                            }
                            int i23 = i15 + 2;
                            byte b14 = bArr[i23];
                            int i24 = b14 & 255;
                            i11 = i12;
                            if ((b14 & 192) != 128) {
                                va0.a.a(i24, i23);
                                throw null;
                            }
                            int i25 = ((b11 & 15) << 12) | ((b13 & 63) << 6) | (b14 & 63);
                            if (i25 < 2048) {
                                va0.a.a(i24, i23);
                                throw null;
                            }
                            c11 = (char) i25;
                            i15 += 3;
                            break;
                    }
                    cArr[i14] = c11;
                    i14++;
                    iM--;
                    i12 = i11;
                }
                int i26 = i12;
                int i27 = i15 - i13;
                iArr[i26] = i27;
                iArr[i26] = i27;
                String str = new String(cArr, i26, i14);
                tVar.f54485a += iArr[i26];
                return str;
            default:
                int iD2 = d(i5);
                m mVar2 = this.f69341b;
                return (String) mVar2.f69356q.get(mVar2.f69342a.y(iD2));
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        switch (this.f69340a) {
            case 0:
                return this.f69341b.f69344c;
            default:
                return this.f69341b.f69346e;
        }
    }
}
