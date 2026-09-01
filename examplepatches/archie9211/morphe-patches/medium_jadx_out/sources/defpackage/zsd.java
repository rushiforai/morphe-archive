package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zsd {
    public static final zsd e = new zsd(0, 0, new Object[0], null);
    public int a;
    public int b;
    public final no3 c;
    public Object[] d;

    public zsd(int i, int i2, Object[] objArr, no3 no3Var) {
        this.a = i;
        this.b = i2;
        this.c = no3Var;
        this.d = objArr;
    }

    public static zsd j(int i, Object obj, Object obj2, int i2, Object obj3, Object obj4, int i3, no3 no3Var) {
        if (i3 > 30) {
            return new zsd(0, 0, new Object[]{obj, obj2, obj3, obj4}, no3Var);
        }
        int iB = er7.B(i, i3);
        int iB2 = er7.B(i2, i3);
        if (iB != iB2) {
            return new zsd((1 << iB) | (1 << iB2), 0, iB < iB2 ? new Object[]{obj, obj2, obj3, obj4} : new Object[]{obj3, obj4, obj, obj2}, no3Var);
        }
        return new zsd(0, 1 << iB, new Object[]{j(i, obj, obj2, i2, obj3, obj4, i3 + 5, no3Var)}, no3Var);
    }

    public final Object[] a(int i, int i2, int i3, Object obj, Object obj2, int i4, no3 no3Var) {
        Object obj3 = this.d[i];
        zsd zsdVarJ = j(obj3 != null ? obj3.hashCode() : 0, obj3, x(i), i3, obj, obj2, i4 + 5, no3Var);
        int iT = t(i2);
        int i5 = iT + 1;
        Object[] objArr = this.d;
        Object[] objArr2 = new Object[objArr.length - 1];
        k80.j0(0, i, 6, objArr, objArr2);
        k80.g0(i, i + 2, i5, objArr, objArr2);
        objArr2[iT - 1] = zsdVarJ;
        k80.g0(iT, i5, objArr.length, objArr, objArr2);
        return objArr2;
    }

    public final int b() {
        if (this.b == 0) {
            return this.d.length / 2;
        }
        int iBitCount = Integer.bitCount(this.a);
        int length = this.d.length;
        for (int i = iBitCount * 2; i < length; i++) {
            iBitCount += s(i).b();
        }
        return iBitCount;
    }

    public final boolean c(Object obj) {
        l46 l46VarR = iq7.R(iq7.W(0, this.d.length), 2);
        int i = l46VarR.a;
        int i2 = l46VarR.b;
        int i3 = l46VarR.c;
        if ((i3 > 0 && i <= i2) || (i3 < 0 && i2 <= i)) {
            while (!g76.L(obj, this.d[i])) {
                if (i != i2) {
                    i += i3;
                }
            }
            return true;
        }
        return false;
    }

    public final boolean d(int i, int i2, Object obj) {
        int iB = 1 << er7.B(i, i2);
        if (h(iB)) {
            return g76.L(obj, this.d[f(iB)]);
        }
        if (!i(iB)) {
            return false;
        }
        zsd zsdVarS = s(t(iB));
        return i2 == 30 ? zsdVarS.c(obj) : zsdVarS.d(i, i2 + 5, obj);
    }

    public final boolean e(zsd zsdVar) {
        if (this == zsdVar) {
            return true;
        }
        if (this.b == zsdVar.b && this.a == zsdVar.a) {
            int length = this.d.length;
            for (int i = 0; i < length; i++) {
                if (this.d[i] == zsdVar.d[i]) {
                }
            }
            return true;
        }
        return false;
    }

    public final int f(int i) {
        return Integer.bitCount(this.a & (i - 1)) * 2;
    }

    public final Object g(int i, int i2, Object obj) {
        int iB = 1 << er7.B(i, i2);
        if (h(iB)) {
            int iF = f(iB);
            if (g76.L(obj, this.d[iF])) {
                return x(iF);
            }
            return null;
        }
        if (!i(iB)) {
            return null;
        }
        zsd zsdVarS = s(t(iB));
        if (i2 != 30) {
            return zsdVarS.g(i, i2 + 5, obj);
        }
        l46 l46VarR = iq7.R(iq7.W(0, zsdVarS.d.length), 2);
        int i3 = l46VarR.a;
        int i4 = l46VarR.b;
        int i5 = l46VarR.c;
        if ((i5 <= 0 || i3 > i4) && (i5 >= 0 || i4 > i3)) {
            return null;
        }
        while (!g76.L(obj, zsdVarS.d[i3])) {
            if (i3 == i4) {
                return null;
            }
            i3 += i5;
        }
        return zsdVarS.x(i3);
    }

    public final boolean h(int i) {
        return (this.a & i) != 0;
    }

    public final boolean i(int i) {
        return (this.b & i) != 0;
    }

    public final zsd k(int i, m89 m89Var) {
        m89Var.f(m89Var.e - 1);
        m89Var.c = x(i);
        Object[] objArr = this.d;
        if (objArr.length == 2) {
            return null;
        }
        if (this.c != m89Var.a) {
            return new zsd(0, 0, er7.E(i, objArr), m89Var.a);
        }
        this.d = er7.E(i, objArr);
        return this;
    }

    public final zsd l(int i, Object obj, Object obj2, int i2, m89 m89Var) {
        m89 m89Var2;
        zsd zsdVarL;
        int iB = 1 << er7.B(i, i2);
        boolean zH = h(iB);
        no3 no3Var = this.c;
        if (zH) {
            int iF = f(iB);
            if (!g76.L(obj, this.d[iF])) {
                m89Var.f(m89Var.e + 1);
                no3 no3Var2 = m89Var.a;
                if (no3Var != no3Var2) {
                    return new zsd(this.a ^ iB, this.b | iB, a(iF, iB, i, obj, obj2, i2, no3Var2), no3Var2);
                }
                this.d = a(iF, iB, i, obj, obj2, i2, no3Var2);
                this.a ^= iB;
                this.b |= iB;
                return this;
            }
            m89Var.c = x(iF);
            if (x(iF) == obj2) {
                return this;
            }
            if (no3Var == m89Var.a) {
                this.d[iF + 1] = obj2;
                return this;
            }
            m89Var.d++;
            Object[] objArr = this.d;
            Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
            objArrCopyOf[iF + 1] = obj2;
            return new zsd(this.a, this.b, objArrCopyOf, m89Var.a);
        }
        if (!i(iB)) {
            m89Var.f(m89Var.e + 1);
            no3 no3Var3 = m89Var.a;
            int iF2 = f(iB);
            Object[] objArr2 = this.d;
            if (no3Var != no3Var3) {
                return new zsd(this.a | iB, this.b, er7.C(objArr2, iF2, obj, obj2), no3Var3);
            }
            this.d = er7.C(objArr2, iF2, obj, obj2);
            this.a |= iB;
            return this;
        }
        int iT = t(iB);
        zsd zsdVarS = s(iT);
        if (i2 == 30) {
            l46 l46VarR = iq7.R(iq7.W(0, zsdVarS.d.length), 2);
            int i3 = l46VarR.a;
            int i4 = l46VarR.b;
            int i5 = l46VarR.c;
            if ((i5 <= 0 || i3 > i4) && (i5 >= 0 || i4 > i3)) {
                m89Var.f(m89Var.e + 1);
                zsdVarL = new zsd(0, 0, er7.C(zsdVarS.d, 0, obj, obj2), m89Var.a);
                m89Var2 = m89Var;
            } else {
                while (!g76.L(obj, zsdVarS.d[i3])) {
                    if (i3 == i4) {
                        m89Var.f(m89Var.e + 1);
                        zsdVarL = new zsd(0, 0, er7.C(zsdVarS.d, 0, obj, obj2), m89Var.a);
                        break;
                    }
                    i3 += i5;
                }
                m89Var.c = zsdVarS.x(i3);
                if (zsdVarS.c == m89Var.a) {
                    zsdVarS.d[i3 + 1] = obj2;
                    zsdVarL = zsdVarS;
                } else {
                    m89Var.d++;
                    Object[] objArr3 = zsdVarS.d;
                    Object[] objArrCopyOf2 = Arrays.copyOf(objArr3, objArr3.length);
                    objArrCopyOf2[i3 + 1] = obj2;
                    zsdVarL = new zsd(0, 0, objArrCopyOf2, m89Var.a);
                }
                m89Var2 = m89Var;
            }
        } else {
            m89Var2 = m89Var;
            zsdVarL = zsdVarS.l(i, obj, obj2, i2 + 5, m89Var2);
        }
        return zsdVarS == zsdVarL ? this : r(iT, zsdVarL, m89Var2.a);
    }

    public final zsd m(zsd zsdVar, int i, b73 b73Var, m89 m89Var) {
        Object[] objArr;
        zsd zsdVarJ;
        if (this == zsdVar) {
            b73Var.a += b();
            return this;
        }
        int i2 = 0;
        if (i > 30) {
            no3 no3Var = m89Var.a;
            int i3 = zsdVar.b;
            Object[] objArr2 = this.d;
            Object[] objArrCopyOf = Arrays.copyOf(objArr2, objArr2.length + zsdVar.d.length);
            int length = this.d.length;
            l46 l46VarR = iq7.R(iq7.W(0, zsdVar.d.length), 2);
            int i4 = l46VarR.a;
            int i5 = l46VarR.b;
            int i6 = l46VarR.c;
            if ((i6 > 0 && i4 <= i5) || (i6 < 0 && i5 <= i4)) {
                while (true) {
                    if (c(zsdVar.d[i4])) {
                        b73Var.a++;
                    } else {
                        Object[] objArr3 = zsdVar.d;
                        objArrCopyOf[length] = objArr3[i4];
                        objArrCopyOf[length + 1] = objArr3[i4 + 1];
                        length += 2;
                    }
                    if (i4 == i5) {
                        break;
                    }
                    i4 += i6;
                }
            }
            if (length != this.d.length) {
                return length == zsdVar.d.length ? zsdVar : length == objArrCopyOf.length ? new zsd(0, 0, objArrCopyOf, no3Var) : new zsd(0, 0, Arrays.copyOf(objArrCopyOf, length), no3Var);
            }
        } else {
            int i7 = this.b | zsdVar.b;
            int i8 = this.a;
            int i9 = zsdVar.a;
            int i10 = (i8 ^ i9) & (~i7);
            int i11 = i8 & i9;
            int i12 = i10;
            while (i11 != 0) {
                int iLowestOneBit = Integer.lowestOneBit(i11);
                if (g76.L(this.d[f(iLowestOneBit)], zsdVar.d[zsdVar.f(iLowestOneBit)])) {
                    i12 |= iLowestOneBit;
                } else {
                    i7 |= iLowestOneBit;
                }
                i11 ^= iLowestOneBit;
            }
            if ((i7 & i12) != 0) {
                xx9.b("Check failed.");
            }
            zsd zsdVar2 = (g76.L(this.c, m89Var.a) && this.a == i12 && this.b == i7) ? this : new zsd(i12, i7, new Object[Integer.bitCount(i7) + (Integer.bitCount(i12) * 2)], null);
            int i13 = i7;
            int i14 = 0;
            while (i13 != 0) {
                int iLowestOneBit2 = Integer.lowestOneBit(i13);
                Object[] objArr4 = zsdVar2.d;
                int length2 = (objArr4.length - 1) - i14;
                if (i(iLowestOneBit2)) {
                    zsdVarJ = s(t(iLowestOneBit2));
                    if (zsdVar.i(iLowestOneBit2)) {
                        zsdVarJ = zsdVarJ.m(zsdVar.s(zsdVar.t(iLowestOneBit2)), i + 5, b73Var, m89Var);
                        objArr = objArr4;
                    } else if (zsdVar.h(iLowestOneBit2)) {
                        int iF = zsdVar.f(iLowestOneBit2);
                        Object obj = zsdVar.d[iF];
                        Object objX = zsdVar.x(iF);
                        int i15 = m89Var.e;
                        objArr = objArr4;
                        zsdVarJ = zsdVarJ.l(obj != null ? obj.hashCode() : i2, obj, objX, i + 5, m89Var);
                        if (m89Var.e == i15) {
                            b73Var.a++;
                        }
                    } else {
                        objArr = objArr4;
                    }
                } else {
                    objArr = objArr4;
                    if (zsdVar.i(iLowestOneBit2)) {
                        zsd zsdVarS = zsdVar.s(zsdVar.t(iLowestOneBit2));
                        if (h(iLowestOneBit2)) {
                            int iF2 = f(iLowestOneBit2);
                            Object obj2 = this.d[iF2];
                            int i16 = i + 5;
                            if (zsdVarS.d(obj2 != null ? obj2.hashCode() : 0, i16, obj2)) {
                                b73Var.a++;
                                zsdVarJ = zsdVarS;
                            } else {
                                zsdVarJ = zsdVarS.l(obj2 != null ? obj2.hashCode() : 0, obj2, x(iF2), i16, m89Var);
                            }
                        } else {
                            zsdVarJ = zsdVarS;
                        }
                    } else {
                        int iF3 = f(iLowestOneBit2);
                        Object obj3 = this.d[iF3];
                        Object objX2 = x(iF3);
                        int iF4 = zsdVar.f(iLowestOneBit2);
                        Object obj4 = zsdVar.d[iF4];
                        zsdVarJ = j(obj3 != null ? obj3.hashCode() : 0, obj3, objX2, obj4 != null ? obj4.hashCode() : 0, obj4, zsdVar.x(iF4), i + 5, m89Var.a);
                    }
                }
                objArr[length2] = zsdVarJ;
                i14++;
                i13 ^= iLowestOneBit2;
                i2 = 0;
            }
            int i17 = 0;
            while (i12 != 0) {
                int iLowestOneBit3 = Integer.lowestOneBit(i12);
                int i18 = i17 * 2;
                if (zsdVar.h(iLowestOneBit3)) {
                    int iF5 = zsdVar.f(iLowestOneBit3);
                    Object[] objArr5 = zsdVar2.d;
                    objArr5[i18] = zsdVar.d[iF5];
                    objArr5[i18 + 1] = zsdVar.x(iF5);
                    if (h(iLowestOneBit3)) {
                        b73Var.a++;
                    }
                } else {
                    int iF6 = f(iLowestOneBit3);
                    Object[] objArr6 = zsdVar2.d;
                    objArr6[i18] = this.d[iF6];
                    objArr6[i18 + 1] = x(iF6);
                }
                i17++;
                i12 ^= iLowestOneBit3;
            }
            if (!e(zsdVar2)) {
                return zsdVar.e(zsdVar2) ? zsdVar : zsdVar2;
            }
        }
        return this;
    }

    public final zsd n(int i, Object obj, int i2, m89 m89Var) {
        zsd zsdVarN;
        int iB = 1 << er7.B(i, i2);
        if (h(iB)) {
            int iF = f(iB);
            if (g76.L(obj, this.d[iF])) {
                return p(iF, iB, m89Var);
            }
        } else if (i(iB)) {
            int iT = t(iB);
            zsd zsdVarS = s(iT);
            if (i2 == 30) {
                l46 l46VarR = iq7.R(iq7.W(0, zsdVarS.d.length), 2);
                int i3 = l46VarR.a;
                int i4 = l46VarR.b;
                int i5 = l46VarR.c;
                if ((i5 <= 0 || i3 > i4) && (i5 >= 0 || i4 > i3)) {
                    zsdVarN = zsdVarS;
                    break;
                }
                while (!g76.L(obj, zsdVarS.d[i3])) {
                    if (i3 == i4) {
                        zsdVarN = zsdVarS;
                        break;
                    }
                    i3 += i5;
                }
                zsdVarN = zsdVarS.k(i3, m89Var);
            } else {
                zsdVarN = zsdVarS.n(i, obj, i2 + 5, m89Var);
            }
            return q(zsdVarS, zsdVarN, iT, iB, m89Var.a);
        }
        return this;
    }

    public final zsd o(int i, Object obj, Object obj2, int i2, m89 m89Var) {
        m89 m89Var2;
        zsd zsdVarO;
        int iB = 1 << er7.B(i, i2);
        if (h(iB)) {
            int iF = f(iB);
            return (g76.L(obj, this.d[iF]) && g76.L(obj2, x(iF))) ? p(iF, iB, m89Var) : this;
        }
        if (!i(iB)) {
            return this;
        }
        int iT = t(iB);
        zsd zsdVarS = s(iT);
        if (i2 == 30) {
            l46 l46VarR = iq7.R(iq7.W(0, zsdVarS.d.length), 2);
            int i3 = l46VarR.a;
            int i4 = l46VarR.b;
            int i5 = l46VarR.c;
            if ((i5 <= 0 || i3 > i4) && (i5 >= 0 || i4 > i3)) {
                zsdVarO = zsdVarS;
                m89Var2 = m89Var;
            } else {
                while (true) {
                    if (!g76.L(obj, zsdVarS.d[i3]) || !g76.L(obj2, zsdVarS.x(i3))) {
                        if (i3 == i4) {
                            break;
                        }
                        i3 += i5;
                    } else {
                        zsdVarO = zsdVarS.k(i3, m89Var);
                        break;
                    }
                }
                zsdVarO = zsdVarS;
                m89Var2 = m89Var;
            }
        } else {
            m89Var2 = m89Var;
            zsdVarO = zsdVarS.o(i, obj, obj2, i2 + 5, m89Var2);
        }
        return q(zsdVarS, zsdVarO, iT, iB, m89Var2.a);
    }

    public final zsd p(int i, int i2, m89 m89Var) {
        m89Var.f(m89Var.e - 1);
        m89Var.c = x(i);
        Object[] objArr = this.d;
        if (objArr.length == 2) {
            return null;
        }
        if (this.c != m89Var.a) {
            return new zsd(i2 ^ this.a, this.b, er7.E(i, objArr), m89Var.a);
        }
        this.d = er7.E(i, objArr);
        this.a ^= i2;
        return this;
    }

    public final zsd q(zsd zsdVar, zsd zsdVar2, int i, int i2, no3 no3Var) {
        no3 no3Var2 = this.c;
        if (zsdVar2 != null) {
            return (no3Var2 == no3Var || zsdVar != zsdVar2) ? r(i, zsdVar2, no3Var) : this;
        }
        Object[] objArr = this.d;
        if (objArr.length == 1) {
            return null;
        }
        if (no3Var2 != no3Var) {
            return new zsd(this.a, this.b ^ i2, er7.F(i, objArr), no3Var);
        }
        this.d = er7.F(i, objArr);
        this.b ^= i2;
        return this;
    }

    public final zsd r(int i, zsd zsdVar, no3 no3Var) {
        Object[] objArr = this.d;
        if (objArr.length == 1 && zsdVar.d.length == 2 && zsdVar.b == 0) {
            zsdVar.a = this.b;
            return zsdVar;
        }
        if (this.c == no3Var) {
            objArr[i] = zsdVar;
            return this;
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        objArrCopyOf[i] = zsdVar;
        return new zsd(this.a, this.b, objArrCopyOf, no3Var);
    }

    public final zsd s(int i) {
        Object obj = this.d[i];
        obj.getClass();
        return (zsd) obj;
    }

    public final int t(int i) {
        return (this.d.length - 1) - Integer.bitCount(this.b & (i - 1));
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x00c6, code lost:
    
        if (r15 != null) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00cf, code lost:
    
        if (r15 == null) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00d2, code lost:
    
        r15.c = w(r7, r2, (defpackage.zsd) r15.c);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00dc, code lost:
    
        return r15;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.ad u(java.lang.Object r15, int r16, java.lang.Object r17, int r18) {
        /*
            Method dump skipped, instruction units count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zsd.u(java.lang.Object, int, java.lang.Object, int):ad");
    }

    public final zsd v(int i, int i2, Object obj) {
        zsd zsdVarV;
        int iB = 1 << er7.B(i, i2);
        if (h(iB)) {
            int iF = f(iB);
            if (!g76.L(obj, this.d[iF])) {
                return this;
            }
            Object[] objArr = this.d;
            if (objArr.length != 2) {
                return new zsd(this.a ^ iB, this.b, er7.E(iF, objArr), null);
            }
        } else {
            if (!i(iB)) {
                return this;
            }
            int iT = t(iB);
            zsd zsdVarS = s(iT);
            if (i2 == 30) {
                l46 l46VarR = iq7.R(iq7.W(0, zsdVarS.d.length), 2);
                int i3 = l46VarR.a;
                int i4 = l46VarR.b;
                int i5 = l46VarR.c;
                if ((i5 <= 0 || i3 > i4) && (i5 >= 0 || i4 > i3)) {
                    zsdVarV = zsdVarS;
                    break;
                }
                while (!g76.L(obj, zsdVarS.d[i3])) {
                    if (i3 == i4) {
                        zsdVarV = zsdVarS;
                        break;
                    }
                    i3 += i5;
                }
                Object[] objArr2 = zsdVarS.d;
                zsdVarV = objArr2.length == 2 ? null : new zsd(0, 0, er7.E(i3, objArr2), null);
            } else {
                zsdVarV = zsdVarS.v(i, i2 + 5, obj);
            }
            if (zsdVarV != null) {
                return zsdVarS != zsdVarV ? w(iT, iB, zsdVarV) : this;
            }
            Object[] objArr3 = this.d;
            if (objArr3.length != 1) {
                return new zsd(this.a, this.b ^ iB, er7.F(iT, objArr3), null);
            }
        }
        return null;
    }

    public final zsd w(int i, int i2, zsd zsdVar) {
        Object[] objArr = zsdVar.d;
        if (objArr.length != 2 || zsdVar.b != 0) {
            Object[] objArr2 = this.d;
            Object[] objArrCopyOf = Arrays.copyOf(objArr2, objArr2.length);
            objArrCopyOf[i] = zsdVar;
            return new zsd(this.a, this.b, objArrCopyOf, null);
        }
        if (this.d.length == 1) {
            zsdVar.a = this.b;
            return zsdVar;
        }
        int iF = f(i2);
        Object[] objArr3 = this.d;
        Object obj = objArr[0];
        Object obj2 = objArr[1];
        Object[] objArrCopyOf2 = Arrays.copyOf(objArr3, objArr3.length + 1);
        k80.g0(i + 2, i + 1, objArr3.length, objArrCopyOf2, objArrCopyOf2);
        k80.g0(iF + 2, iF, i, objArrCopyOf2, objArrCopyOf2);
        objArrCopyOf2[iF] = obj;
        objArrCopyOf2[iF + 1] = obj2;
        return new zsd(this.a ^ i2, this.b ^ i2, objArrCopyOf2, null);
    }

    public final Object x(int i) {
        return this.d[i + 1];
    }
}
