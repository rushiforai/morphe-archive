package u1;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgression;
import p1.o1;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: e, reason: collision with root package name */
    public static final p f90353e = new p(0, 0, new Object[0], null);

    /* renamed from: a, reason: collision with root package name */
    public int f90354a;

    /* renamed from: b, reason: collision with root package name */
    public int f90355b;

    /* renamed from: c, reason: collision with root package name */
    public final w1.b f90356c;

    /* renamed from: d, reason: collision with root package name */
    public Object[] f90357d;

    public p(int i5, int i11, Object[] objArr, w1.b bVar) {
        this.f90354a = i5;
        this.f90355b = i11;
        this.f90356c = bVar;
        this.f90357d = objArr;
    }

    public static p j(int i5, Object obj, Object obj2, int i11, Object obj3, Object obj4, int i12, w1.b bVar) {
        if (i12 > 30) {
            return new p(0, 0, new Object[]{obj, obj2, obj3, obj4}, bVar);
        }
        int iC0 = bh.g.c0(i5, i12);
        int iC02 = bh.g.c0(i11, i12);
        if (iC0 != iC02) {
            return new p((1 << iC0) | (1 << iC02), 0, iC0 < iC02 ? new Object[]{obj, obj2, obj3, obj4} : new Object[]{obj3, obj4, obj, obj2}, bVar);
        }
        return new p(0, 1 << iC0, new Object[]{j(i5, obj, obj2, i11, obj3, obj4, i12 + 5, bVar)}, bVar);
    }

    public final Object[] a(int i5, int i11, int i12, Object obj, Object obj2, int i13, w1.b bVar) {
        Object obj3 = this.f90357d[i5];
        p pVarJ = j(obj3 != null ? obj3.hashCode() : 0, obj3, x(i5), i12, obj, obj2, i13 + 5, bVar);
        int iT = t(i11);
        int i14 = iT + 1;
        Object[] objArr = this.f90357d;
        Object[] objArr2 = new Object[objArr.length - 1];
        u90.b.w(objArr, 0, objArr2, i5, 6);
        u90.b.t(objArr, i5, objArr2, i5 + 2, i14);
        objArr2[iT - 1] = pVarJ;
        u90.b.t(objArr, iT, objArr2, i14, objArr.length);
        return objArr2;
    }

    public final int b() {
        if (this.f90355b == 0) {
            return this.f90357d.length / 2;
        }
        int iBitCount = Integer.bitCount(this.f90354a);
        int length = this.f90357d.length;
        for (int i5 = iBitCount * 2; i5 < length; i5++) {
            iBitCount += s(i5).b();
        }
        return iBitCount;
    }

    public final boolean c(Object obj) {
        IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, this.f90357d.length), 2);
        int i5 = intProgressionL0.f71906a;
        int i11 = intProgressionL0.f71907b;
        int i12 = intProgressionL0.f71908c;
        if ((i12 > 0 && i5 <= i11) || (i12 < 0 && i11 <= i5)) {
            while (!Intrinsics.b(obj, this.f90357d[i5])) {
                if (i5 != i11) {
                    i5 += i12;
                }
            }
            return true;
        }
        return false;
    }

    public final boolean d(int i5, int i11, Object obj) {
        int iC0 = 1 << bh.g.c0(i5, i11);
        if (h(iC0)) {
            return Intrinsics.b(obj, this.f90357d[f(iC0)]);
        }
        if (!i(iC0)) {
            return false;
        }
        p pVarS = s(t(iC0));
        return i11 == 30 ? pVarS.c(obj) : pVarS.d(i5, i11 + 5, obj);
    }

    public final boolean e(p pVar) {
        if (this == pVar) {
            return true;
        }
        if (this.f90355b == pVar.f90355b && this.f90354a == pVar.f90354a) {
            int length = this.f90357d.length;
            for (int i5 = 0; i5 < length; i5++) {
                if (this.f90357d[i5] == pVar.f90357d[i5]) {
                }
            }
            return true;
        }
        return false;
    }

    public final int f(int i5) {
        return Integer.bitCount((i5 - 1) & this.f90354a) * 2;
    }

    public final Object g(int i5, int i11, Object obj) {
        int iC0 = 1 << bh.g.c0(i5, i11);
        if (h(iC0)) {
            int iF = f(iC0);
            if (Intrinsics.b(obj, this.f90357d[iF])) {
                return x(iF);
            }
            return null;
        }
        if (!i(iC0)) {
            return null;
        }
        p pVarS = s(t(iC0));
        if (i11 != 30) {
            return pVarS.g(i5, i11 + 5, obj);
        }
        IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, pVarS.f90357d.length), 2);
        int i12 = intProgressionL0.f71906a;
        int i13 = intProgressionL0.f71907b;
        int i14 = intProgressionL0.f71908c;
        if ((i14 <= 0 || i12 > i13) && (i14 >= 0 || i13 > i12)) {
            return null;
        }
        while (!Intrinsics.b(obj, pVarS.f90357d[i12])) {
            if (i12 == i13) {
                return null;
            }
            i12 += i14;
        }
        return pVarS.x(i12);
    }

    public final boolean h(int i5) {
        return (i5 & this.f90354a) != 0;
    }

    public final boolean i(int i5) {
        return (i5 & this.f90355b) != 0;
    }

    public final p k(int i5, e eVar) {
        eVar.f(eVar.f90341f - 1);
        eVar.f90339d = x(i5);
        Object[] objArr = this.f90357d;
        if (objArr.length == 2) {
            return null;
        }
        if (this.f90356c != eVar.f90337b) {
            return new p(0, 0, bh.g.z(i5, objArr), eVar.f90337b);
        }
        this.f90357d = bh.g.z(i5, objArr);
        return this;
    }

    public final p l(int i5, Object obj, Object obj2, int i11, e eVar) {
        e eVar2;
        p pVarL;
        int iC0 = 1 << bh.g.c0(i5, i11);
        boolean zH = h(iC0);
        w1.b bVar = this.f90356c;
        if (zH) {
            int iF = f(iC0);
            if (!Intrinsics.b(obj, this.f90357d[iF])) {
                eVar.f(eVar.f90341f + 1);
                w1.b bVar2 = eVar.f90337b;
                if (bVar != bVar2) {
                    return new p(this.f90354a ^ iC0, this.f90355b | iC0, a(iF, iC0, i5, obj, obj2, i11, bVar2), bVar2);
                }
                this.f90357d = a(iF, iC0, i5, obj, obj2, i11, bVar2);
                this.f90354a ^= iC0;
                this.f90355b |= iC0;
                return this;
            }
            eVar.f90339d = x(iF);
            if (x(iF) == obj2) {
                return this;
            }
            if (bVar == eVar.f90337b) {
                this.f90357d[iF + 1] = obj2;
                return this;
            }
            eVar.f90340e++;
            Object[] objArr = this.f90357d;
            Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            objArrCopyOf[iF + 1] = obj2;
            return new p(this.f90354a, this.f90355b, objArrCopyOf, eVar.f90337b);
        }
        if (!i(iC0)) {
            eVar.f(eVar.f90341f + 1);
            w1.b bVar3 = eVar.f90337b;
            int iF2 = f(iC0);
            if (bVar != bVar3) {
                return new p(this.f90354a | iC0, this.f90355b, bh.g.y(this.f90357d, iF2, obj, obj2), bVar3);
            }
            this.f90357d = bh.g.y(this.f90357d, iF2, obj, obj2);
            this.f90354a |= iC0;
            return this;
        }
        int iT = t(iC0);
        p pVarS = s(iT);
        if (i11 == 30) {
            IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, pVarS.f90357d.length), 2);
            int i12 = intProgressionL0.f71906a;
            int i13 = intProgressionL0.f71907b;
            int i14 = intProgressionL0.f71908c;
            if ((i14 <= 0 || i12 > i13) && (i14 >= 0 || i13 > i12)) {
                eVar.f(eVar.f90341f + 1);
                pVarL = new p(0, 0, bh.g.y(pVarS.f90357d, 0, obj, obj2), eVar.f90337b);
                eVar2 = eVar;
            } else {
                while (!Intrinsics.b(obj, pVarS.f90357d[i12])) {
                    if (i12 == i13) {
                        eVar.f(eVar.f90341f + 1);
                        pVarL = new p(0, 0, bh.g.y(pVarS.f90357d, 0, obj, obj2), eVar.f90337b);
                        break;
                    }
                    i12 += i14;
                }
                eVar.f90339d = pVarS.x(i12);
                if (pVarS.f90356c == eVar.f90337b) {
                    pVarS.f90357d[i12 + 1] = obj2;
                    pVarL = pVarS;
                } else {
                    eVar.f90340e++;
                    Object[] objArr2 = pVarS.f90357d;
                    Object[] objArrCopyOf2 = Arrays.copyOf(objArr2, objArr2.length);
                    Intrinsics.f(objArrCopyOf2, "copyOf(...)");
                    objArrCopyOf2[i12 + 1] = obj2;
                    pVarL = new p(0, 0, objArrCopyOf2, eVar.f90337b);
                }
                eVar2 = eVar;
            }
        } else {
            eVar2 = eVar;
            pVarL = pVarS.l(i5, obj, obj2, i11 + 5, eVar2);
        }
        return pVarS == pVarL ? this : r(iT, pVarL, eVar2.f90337b);
    }

    public final p m(p pVar, int i5, w1.a aVar, e eVar) {
        Object[] objArr;
        p pVarJ;
        if (this == pVar) {
            aVar.f93639a += b();
            return this;
        }
        int i11 = 0;
        if (i5 > 30) {
            w1.b bVar = eVar.f90337b;
            int i12 = pVar.f90355b;
            Object[] objArr2 = this.f90357d;
            Object[] objArrCopyOf = Arrays.copyOf(objArr2, objArr2.length + pVar.f90357d.length);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            int length = this.f90357d.length;
            IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, pVar.f90357d.length), 2);
            int i13 = intProgressionL0.f71906a;
            int i14 = intProgressionL0.f71907b;
            int i15 = intProgressionL0.f71908c;
            if ((i15 > 0 && i13 <= i14) || (i15 < 0 && i14 <= i13)) {
                while (true) {
                    if (c(pVar.f90357d[i13])) {
                        aVar.f93639a++;
                    } else {
                        Object[] objArr3 = pVar.f90357d;
                        objArrCopyOf[length] = objArr3[i13];
                        objArrCopyOf[length + 1] = objArr3[i13 + 1];
                        length += 2;
                    }
                    if (i13 == i14) {
                        break;
                    }
                    i13 += i15;
                }
            }
            if (length != this.f90357d.length) {
                if (length == pVar.f90357d.length) {
                    return pVar;
                }
                if (length == objArrCopyOf.length) {
                    return new p(0, 0, objArrCopyOf, bVar);
                }
                Object[] objArrCopyOf2 = Arrays.copyOf(objArrCopyOf, length);
                Intrinsics.f(objArrCopyOf2, "copyOf(...)");
                return new p(0, 0, objArrCopyOf2, bVar);
            }
        } else {
            int i16 = this.f90355b | pVar.f90355b;
            int i17 = this.f90354a;
            int i18 = pVar.f90354a;
            int i19 = (i17 ^ i18) & (~i16);
            int i21 = i17 & i18;
            int i22 = i19;
            while (i21 != 0) {
                int iLowestOneBit = Integer.lowestOneBit(i21);
                if (Intrinsics.b(this.f90357d[f(iLowestOneBit)], pVar.f90357d[pVar.f(iLowestOneBit)])) {
                    i22 |= iLowestOneBit;
                } else {
                    i16 |= iLowestOneBit;
                }
                i21 ^= iLowestOneBit;
            }
            if ((i16 & i22) != 0) {
                o1.b("Check failed.");
            }
            p pVar2 = (Intrinsics.b(this.f90356c, eVar.f90337b) && this.f90354a == i22 && this.f90355b == i16) ? this : new p(i22, i16, new Object[Integer.bitCount(i16) + (Integer.bitCount(i22) * 2)], null);
            int i23 = i16;
            int i24 = 0;
            while (i23 != 0) {
                int iLowestOneBit2 = Integer.lowestOneBit(i23);
                Object[] objArr4 = pVar2.f90357d;
                int length2 = (objArr4.length - 1) - i24;
                if (i(iLowestOneBit2)) {
                    pVarJ = s(t(iLowestOneBit2));
                    if (pVar.i(iLowestOneBit2)) {
                        pVarJ = pVarJ.m(pVar.s(pVar.t(iLowestOneBit2)), i5 + 5, aVar, eVar);
                        objArr = objArr4;
                    } else if (pVar.h(iLowestOneBit2)) {
                        int iF = pVar.f(iLowestOneBit2);
                        Object obj = pVar.f90357d[iF];
                        Object objX = pVar.x(iF);
                        int i25 = eVar.f90341f;
                        objArr = objArr4;
                        pVarJ = pVarJ.l(obj != null ? obj.hashCode() : i11, obj, objX, i5 + 5, eVar);
                        if (eVar.f90341f == i25) {
                            aVar.f93639a++;
                        }
                    } else {
                        objArr = objArr4;
                    }
                } else {
                    objArr = objArr4;
                    if (pVar.i(iLowestOneBit2)) {
                        p pVarS = pVar.s(pVar.t(iLowestOneBit2));
                        if (h(iLowestOneBit2)) {
                            int iF2 = f(iLowestOneBit2);
                            Object obj2 = this.f90357d[iF2];
                            int i26 = i5 + 5;
                            if (pVarS.d(obj2 != null ? obj2.hashCode() : 0, i26, obj2)) {
                                aVar.f93639a++;
                                pVarJ = pVarS;
                            } else {
                                pVarJ = pVarS.l(obj2 != null ? obj2.hashCode() : 0, obj2, x(iF2), i26, eVar);
                            }
                        } else {
                            pVarJ = pVarS;
                        }
                    } else {
                        int iF3 = f(iLowestOneBit2);
                        Object obj3 = this.f90357d[iF3];
                        Object objX2 = x(iF3);
                        int iF4 = pVar.f(iLowestOneBit2);
                        Object obj4 = pVar.f90357d[iF4];
                        pVarJ = j(obj3 != null ? obj3.hashCode() : 0, obj3, objX2, obj4 != null ? obj4.hashCode() : 0, obj4, pVar.x(iF4), i5 + 5, eVar.f90337b);
                    }
                }
                objArr[length2] = pVarJ;
                i24++;
                i23 ^= iLowestOneBit2;
                i11 = 0;
            }
            int i27 = 0;
            while (i22 != 0) {
                int iLowestOneBit3 = Integer.lowestOneBit(i22);
                int i28 = i27 * 2;
                if (pVar.h(iLowestOneBit3)) {
                    int iF5 = pVar.f(iLowestOneBit3);
                    Object[] objArr5 = pVar2.f90357d;
                    objArr5[i28] = pVar.f90357d[iF5];
                    objArr5[i28 + 1] = pVar.x(iF5);
                    if (h(iLowestOneBit3)) {
                        aVar.f93639a++;
                    }
                } else {
                    int iF6 = f(iLowestOneBit3);
                    Object[] objArr6 = pVar2.f90357d;
                    objArr6[i28] = this.f90357d[iF6];
                    objArr6[i28 + 1] = x(iF6);
                }
                i27++;
                i22 ^= iLowestOneBit3;
            }
            if (!e(pVar2)) {
                return pVar.e(pVar2) ? pVar : pVar2;
            }
        }
        return this;
    }

    public final p n(int i5, Object obj, int i11, e eVar) {
        p pVarN;
        int iC0 = 1 << bh.g.c0(i5, i11);
        if (h(iC0)) {
            int iF = f(iC0);
            if (Intrinsics.b(obj, this.f90357d[iF])) {
                return p(iF, iC0, eVar);
            }
        } else if (i(iC0)) {
            int iT = t(iC0);
            p pVarS = s(iT);
            if (i11 == 30) {
                IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, pVarS.f90357d.length), 2);
                int i12 = intProgressionL0.f71906a;
                int i13 = intProgressionL0.f71907b;
                int i14 = intProgressionL0.f71908c;
                if ((i14 <= 0 || i12 > i13) && (i14 >= 0 || i13 > i12)) {
                    pVarN = pVarS;
                    break;
                }
                while (!Intrinsics.b(obj, pVarS.f90357d[i12])) {
                    if (i12 == i13) {
                        pVarN = pVarS;
                        break;
                    }
                    i12 += i14;
                }
                pVarN = pVarS.k(i12, eVar);
            } else {
                pVarN = pVarS.n(i5, obj, i11 + 5, eVar);
            }
            return q(pVarS, pVarN, iT, iC0, eVar.f90337b);
        }
        return this;
    }

    public final p o(int i5, Object obj, Object obj2, int i11, e eVar) {
        p pVar;
        p pVarO;
        int iC0 = 1 << bh.g.c0(i5, i11);
        if (h(iC0)) {
            int iF = f(iC0);
            if (Intrinsics.b(obj, this.f90357d[iF]) && Intrinsics.b(obj2, x(iF))) {
                return p(iF, iC0, eVar);
            }
        } else if (i(iC0)) {
            int iT = t(iC0);
            p pVarS = s(iT);
            if (i11 == 30) {
                IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, pVarS.f90357d.length), 2);
                int i12 = intProgressionL0.f71906a;
                int i13 = intProgressionL0.f71907b;
                int i14 = intProgressionL0.f71908c;
                if ((i14 <= 0 || i12 > i13) && (i14 >= 0 || i13 > i12)) {
                    pVarO = pVarS;
                    pVar = pVarS;
                } else {
                    while (true) {
                        if (!Intrinsics.b(obj, pVarS.f90357d[i12]) || !Intrinsics.b(obj2, pVarS.x(i12))) {
                            if (i12 == i13) {
                                break;
                            }
                            i12 += i14;
                        } else {
                            pVarO = pVarS.k(i12, eVar);
                            break;
                        }
                    }
                    pVarO = pVarS;
                    pVar = pVarS;
                }
            } else {
                pVar = pVarS;
                pVarO = pVar.o(i5, obj, obj2, i11 + 5, eVar);
            }
            return q(pVar, pVarO, iT, iC0, eVar.f90337b);
        }
        return this;
    }

    public final p p(int i5, int i11, e eVar) {
        eVar.f(eVar.f90341f - 1);
        eVar.f90339d = x(i5);
        Object[] objArr = this.f90357d;
        if (objArr.length == 2) {
            return null;
        }
        if (this.f90356c != eVar.f90337b) {
            return new p(i11 ^ this.f90354a, this.f90355b, bh.g.z(i5, objArr), eVar.f90337b);
        }
        this.f90357d = bh.g.z(i5, objArr);
        this.f90354a ^= i11;
        return this;
    }

    public final p q(p pVar, p pVar2, int i5, int i11, w1.b bVar) {
        w1.b bVar2 = this.f90356c;
        if (pVar2 != null) {
            return (bVar2 == bVar || pVar != pVar2) ? r(i5, pVar2, bVar) : this;
        }
        Object[] objArr = this.f90357d;
        if (objArr.length == 1) {
            return null;
        }
        if (bVar2 != bVar) {
            return new p(this.f90354a, i11 ^ this.f90355b, bh.g.A(i5, objArr), bVar);
        }
        this.f90357d = bh.g.A(i5, objArr);
        this.f90355b ^= i11;
        return this;
    }

    public final p r(int i5, p pVar, w1.b bVar) {
        Object[] objArr = this.f90357d;
        if (objArr.length == 1 && pVar.f90357d.length == 2 && pVar.f90355b == 0) {
            pVar.f90354a = this.f90355b;
            return pVar;
        }
        if (this.f90356c == bVar) {
            objArr[i5] = pVar;
            return this;
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        Intrinsics.f(objArrCopyOf, "copyOf(...)");
        objArrCopyOf[i5] = pVar;
        return new p(this.f90354a, this.f90355b, objArrCopyOf, bVar);
    }

    public final p s(int i5) {
        Object obj = this.f90357d[i5];
        Intrinsics.e(obj, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.TrieNode<K of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.TrieNode, V of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.TrieNode>");
        return (p) obj;
    }

    public final int t(int i5) {
        return (this.f90357d.length - 1) - Integer.bitCount((i5 - 1) & this.f90355b);
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x00d1, code lost:
    
        if (r14 != null) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00da, code lost:
    
        if (r14 == null) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00dd, code lost:
    
        r14.f54486b = w(r12, r4, (u1.p) r14.f54486b);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00e7, code lost:
    
        return r14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final fa.t u(Object obj, int i5, int i11, Object obj2) {
        fa.t tVarU;
        int i12 = 1;
        int iC0 = 1 << bh.g.c0(i5, i11);
        int i13 = 0;
        if (h(iC0)) {
            int iF = f(iC0);
            if (!Intrinsics.b(obj, this.f90357d[iF])) {
                return new fa.t(new p(this.f90354a ^ iC0, this.f90355b | iC0, a(iF, iC0, i5, obj, obj2, i11, null), null), i12);
            }
            if (x(iF) != obj2) {
                Object[] objArr = this.f90357d;
                Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
                Intrinsics.f(objArrCopyOf, "copyOf(...)");
                objArrCopyOf[iF + 1] = obj2;
                return new fa.t(new p(this.f90354a, this.f90355b, objArrCopyOf, null), i13);
            }
        } else {
            if (!i(iC0)) {
                return new fa.t(new p(this.f90354a | iC0, this.f90355b, bh.g.y(this.f90357d, f(iC0), obj, obj2), null), i12);
            }
            int iT = t(iC0);
            p pVarS = s(iT);
            if (i11 == 30) {
                IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, pVarS.f90357d.length), 2);
                int i14 = intProgressionL0.f71906a;
                int i15 = intProgressionL0.f71907b;
                int i16 = intProgressionL0.f71908c;
                if ((i16 > 0 && i14 <= i15) || (i16 < 0 && i15 <= i14)) {
                    while (!Intrinsics.b(obj, pVarS.f90357d[i14])) {
                        if (i14 != i15) {
                            i14 += i16;
                        }
                    }
                    if (obj2 == pVarS.x(i14)) {
                        tVarU = null;
                    } else {
                        Object[] objArr2 = pVarS.f90357d;
                        Object[] objArrCopyOf2 = Arrays.copyOf(objArr2, objArr2.length);
                        Intrinsics.f(objArrCopyOf2, "copyOf(...)");
                        objArrCopyOf2[i14 + 1] = obj2;
                        tVarU = new fa.t(new p(0, 0, objArrCopyOf2, null), i13);
                    }
                }
                tVarU = new fa.t(new p(0, 0, bh.g.y(pVarS.f90357d, 0, obj, obj2), null), i12);
                break;
            }
            tVarU = pVarS.u(obj, i5, i11 + 5, obj2);
        }
        return null;
    }

    public final p v(int i5, int i11, Object obj) {
        p pVarV;
        int iC0 = 1 << bh.g.c0(i5, i11);
        if (h(iC0)) {
            int iF = f(iC0);
            if (Intrinsics.b(obj, this.f90357d[iF])) {
                Object[] objArr = this.f90357d;
                if (objArr.length != 2) {
                    return new p(this.f90354a ^ iC0, this.f90355b, bh.g.z(iF, objArr), null);
                }
                return null;
            }
            return this;
        }
        if (i(iC0)) {
            int iT = t(iC0);
            p pVarS = s(iT);
            if (i11 == 30) {
                IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, pVarS.f90357d.length), 2);
                int i12 = intProgressionL0.f71906a;
                int i13 = intProgressionL0.f71907b;
                int i14 = intProgressionL0.f71908c;
                if ((i14 > 0 && i12 <= i13) || (i14 < 0 && i13 <= i12)) {
                    while (!Intrinsics.b(obj, pVarS.f90357d[i12])) {
                        if (i12 != i13) {
                            i12 += i14;
                        }
                    }
                    Object[] objArr2 = pVarS.f90357d;
                    pVarV = objArr2.length == 2 ? null : new p(0, 0, bh.g.z(i12, objArr2), null);
                }
                pVarV = pVarS;
                break;
            }
            pVarV = pVarS.v(i5, i11 + 5, obj);
            if (pVarV == null) {
                Object[] objArr3 = this.f90357d;
                if (objArr3.length != 1) {
                    return new p(this.f90354a, iC0 ^ this.f90355b, bh.g.A(iT, objArr3), null);
                }
                return null;
            }
            if (pVarS != pVarV) {
                return w(iT, iC0, pVarV);
            }
        }
        return this;
    }

    public final p w(int i5, int i11, p pVar) {
        Object[] objArr = pVar.f90357d;
        if (objArr.length != 2 || pVar.f90355b != 0) {
            Object[] objArr2 = this.f90357d;
            Object[] objArrCopyOf = Arrays.copyOf(objArr2, objArr2.length);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            objArrCopyOf[i5] = pVar;
            return new p(this.f90354a, this.f90355b, objArrCopyOf, null);
        }
        if (this.f90357d.length == 1) {
            pVar.f90354a = this.f90355b;
            return pVar;
        }
        int iF = f(i11);
        Object[] objArr3 = this.f90357d;
        Object obj = objArr[0];
        Object obj2 = objArr[1];
        Object[] objArrCopyOf2 = Arrays.copyOf(objArr3, objArr3.length + 1);
        Intrinsics.f(objArrCopyOf2, "copyOf(...)");
        u90.b.t(objArrCopyOf2, i5 + 2, objArrCopyOf2, i5 + 1, objArr3.length);
        u90.b.t(objArrCopyOf2, iF + 2, objArrCopyOf2, iF, i5);
        objArrCopyOf2[iF] = obj;
        objArrCopyOf2[iF + 1] = obj2;
        return new p(this.f90354a ^ i11, i11 ^ this.f90355b, objArrCopyOf2, null);
    }

    public final Object x(int i5) {
        return this.f90357d[i5 + 1];
    }
}
