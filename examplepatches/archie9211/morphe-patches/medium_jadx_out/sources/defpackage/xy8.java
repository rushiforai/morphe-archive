package defpackage;

import android.os.Trace;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xy8 implements xt6 {
    public final /* synthetic */ gz8 a;
    public final /* synthetic */ hw8 b;
    public final /* synthetic */ hy8 c;
    public final /* synthetic */ z46 d;
    public final /* synthetic */ m45 e;
    public final /* synthetic */ m45 f;
    public final /* synthetic */ zq0 g;
    public final /* synthetic */ hpe h;
    public final /* synthetic */ sb2 i;

    public xy8(gz8 gz8Var, hw8 hw8Var, hy8 hy8Var, z46 z46Var, ti6 ti6Var, m45 m45Var, zq0 zq0Var, hpe hpeVar, sb2 sb2Var) {
        this.a = gz8Var;
        this.b = hw8Var;
        this.c = hy8Var;
        this.d = z46Var;
        this.e = ti6Var;
        this.f = m45Var;
        this.g = zq0Var;
        this.h = hpeVar;
        this.i = sb2Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v35, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v36 */
    /* JADX WARN: Type inference failed for: r0v41 */
    /* JADX WARN: Type inference failed for: r17v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r18v5, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v34, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v35 */
    /* JADX WARN: Type inference failed for: r2v37 */
    @Override // defpackage.xt6
    public final al7 a(yt6 yt6Var, long j) {
        int i;
        wy8 wy8Var;
        int iH;
        zq0 zq0Var;
        gz8 gz8Var;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        el7 el7Var;
        m70 m70Var;
        int i17;
        ArrayList arrayList;
        int i18;
        ey3 ey3Var;
        int i19;
        int i20;
        ArrayList arrayList2;
        int i21;
        int i22;
        int i23;
        int i24;
        m70 m70Var2;
        int i25;
        int i26;
        long j2;
        hw8 hw8Var;
        lvc lvcVar;
        int i27;
        ArrayList arrayList3;
        int i28;
        int i29;
        ArrayList arrayList4;
        ?? arrayList5;
        ?? arrayList6;
        Object obj;
        boolean z;
        float fU;
        yy8 yy8Var;
        lvc lvcVar2;
        yt6 yt6Var2;
        int[] iArr;
        int i30;
        int i31;
        int i32;
        int i33;
        hw8 hw8Var2;
        zq0 zq0Var2;
        long j3;
        ArrayList arrayList7;
        List list;
        int i34;
        ArrayList arrayList8;
        int i35;
        xy8 xy8Var = this;
        lvc lvcVar3 = yt6Var.b;
        gz8 gz8Var2 = xy8Var.a;
        gz8Var2.C.getValue();
        hw8 hw8Var3 = hw8.Vertical;
        hw8 hw8Var4 = xy8Var.b;
        boolean z2 = hw8Var4 == hw8Var3;
        wgf.g(j, z2 ? hw8Var3 : hw8.Horizontal);
        hy8 hy8Var = xy8Var.c;
        int iI0 = z2 ? lvcVar3.i0(hy8Var.b(lvcVar3.getLayoutDirection())) : lvcVar3.i0(w2g.o(hy8Var, lvcVar3.getLayoutDirection()));
        int iI02 = z2 ? lvcVar3.i0(hy8Var.c(lvcVar3.getLayoutDirection())) : lvcVar3.i0(w2g.n(hy8Var, lvcVar3.getLayoutDirection()));
        int iI03 = lvcVar3.i0(hy8Var.d());
        int iI04 = lvcVar3.i0(hy8Var.a()) + iI03;
        int i36 = iI0 + iI02;
        int i37 = z2 ? iI04 : i36;
        if (z2) {
            iI02 = iI03;
        } else if (!z2) {
            iI02 = iI0;
        }
        int i38 = i37 - iI02;
        long jI = h72.i(-i36, -iI04, j);
        gz8Var2.n = yt6Var;
        int iI05 = lvcVar3.i0(0.0f);
        int iG = z2 ? f72.g(j) - iI04 : f72.h(j) - i36;
        long j4 = (((long) iI0) << 32) | (((long) iI03) & 4294967295L);
        xy8Var.d.getClass();
        int i39 = iG < 0 ? 0 : iG;
        long j5 = j4;
        h72.b(0, hw8Var4 == hw8Var3 ? f72.h(jI) : i39, 0, hw8Var4 != hw8Var3 ? f72.g(jI) : i39, 5);
        wy8 wy8Var2 = (wy8) xy8Var.e.invoke();
        hpe hpeVar = xy8Var.h;
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            int iK = gz8Var2.k();
            gz8 gz8Var3 = gz8Var2;
            int i40 = iG;
            ft2 ft2Var = gz8Var3.d;
            int iH2 = vc2.H(wy8Var2, ft2Var.b, iK);
            if (iK != iH2) {
                i = i39;
                ((h49) ft2Var.d).h(iH2);
                ((au6) ft2Var.f).c(iK);
            } else {
                i = i39;
            }
            gz8Var3.k();
            float fL = gz8Var3.l();
            gz8Var3.o();
            hpeVar.getClass();
            int i41 = i + iI05;
            int iW0 = nk7.w0(0.0f - (fL * i41));
            vn7.T(oicVarA, oicVarG, x45VarE);
            List listL = g01.L(wy8Var2, gz8Var3.A, gz8Var3.w);
            k68 k68Var = j46.a;
            k68 k68Var2 = new k68();
            int iIntValue = ((Number) xy8Var.f.invoke()).intValue();
            l78 l78Var = gz8Var3.B;
            if (iI02 < 0) {
                e26.a("negative beforeContentPadding");
            }
            if (i38 < 0) {
                e26.a("negative afterContentPadding");
            }
            List list2 = listL;
            int i42 = i41 < 0 ? 0 : i41;
            int i43 = iIntValue;
            int i44 = iIntValue < 0 ? i43 : 0;
            hw8 hw8Var5 = xy8Var.b;
            if (hw8Var5 == hw8Var3) {
                wy8Var = wy8Var2;
                iH = f72.h(jI);
            } else {
                wy8Var = wy8Var2;
                iH = i;
            }
            int i45 = iW0;
            long jB = h72.b(0, iH, 0, hw8Var5 != hw8Var3 ? f72.g(jI) : i, 5);
            fy3 fy3Var = fy3.a;
            hpe hpeVar2 = xy8Var.h;
            sb2 sb2Var = xy8Var.i;
            if (i43 <= 0) {
                yy8Var = new yy8(i, iI05, i38, hw8Var5, -iI02, i40 + i38, i44, hpeVar2, lvcVar3.q0(h72.g(f72.j(jI) + i36, j), h72.f(f72.i(jI) + iI04, j), fy3Var, new hb8(18)), sb2Var, yt6Var, jB);
                yt6Var2 = yt6Var;
                lvcVar2 = lvcVar3;
                gz8Var = gz8Var3;
            } else {
                fy3 fy3Var2 = fy3Var;
                long j6 = jB;
                hw8 hw8Var6 = hw8Var5;
                int i46 = 0;
                int i47 = iH2;
                while (i47 > 0 && i45 > 0) {
                    i47--;
                    i45 -= i42;
                }
                int i48 = i45 * (-1);
                if (i47 >= i43) {
                    i47 = i43 - 1;
                    i48 = 0;
                }
                m70 m70Var3 = new m70();
                int i49 = -iI02;
                int i50 = i49 + (iI05 < 0 ? iI05 : 0);
                int i51 = i48 + i50;
                int iMax = 0;
                while (true) {
                    zq0Var = xy8Var.g;
                    if (i51 >= 0 || i47 <= 0) {
                        break;
                    }
                    i47--;
                    fy3 fy3Var3 = fy3Var2;
                    gz8 gz8Var4 = gz8Var3;
                    int i52 = i36;
                    int i53 = i46;
                    long j7 = j5;
                    wy8 wy8Var3 = wy8Var;
                    k68 k68Var3 = k68Var2;
                    int i54 = i;
                    el7 el7VarW = mk7.w(yt6Var, i47, j6, wy8Var3, j7, hw8Var6, zq0Var, lvcVar3.getLayoutDirection(), i54, k68Var3);
                    k68Var2 = k68Var3;
                    m70Var3.add(i53, el7VarW);
                    iMax = Math.max(iMax, el7VarW.h);
                    i51 += i42;
                    wy8Var = wy8Var3;
                    j5 = j7;
                    j6 = j6;
                    i = i54;
                    i36 = i52;
                    iI02 = iI02;
                    i44 = i44;
                    fy3Var2 = fy3Var3;
                    gz8Var3 = gz8Var4;
                    hw8Var6 = hw8Var6;
                    i43 = i43;
                    i46 = i53;
                    xy8Var = this;
                }
                fy3 fy3Var4 = fy3Var2;
                gz8Var = gz8Var3;
                int i55 = i44;
                int i56 = iI02;
                int i57 = i36;
                int i58 = i46;
                long j8 = j5;
                int i59 = i;
                int i60 = i43;
                hw8 hw8Var7 = hw8Var6;
                long j9 = j6;
                wy8 wy8Var4 = wy8Var;
                if (i51 < i50) {
                    i51 = i50;
                }
                int i61 = i51 - i50;
                int i62 = i40 + i38;
                int i63 = i62 < 0 ? i58 : i62;
                int i64 = -i61;
                hw8 hw8Var8 = hw8Var7;
                int i65 = i47;
                int i66 = i65;
                int i67 = 0;
                boolean z3 = false;
                while (i67 < m70Var3.c) {
                    if (i64 >= i63) {
                        m70Var3.removeAt(i67);
                        z3 = true;
                    } else {
                        i65++;
                        i64 += i42;
                        i67++;
                    }
                }
                int i68 = i64;
                int i69 = iMax;
                int i70 = i61;
                int i71 = i60;
                int i72 = i65;
                boolean z4 = z3;
                while (true) {
                    if (i72 >= i71) {
                        i2 = i40;
                        break;
                    }
                    if (i68 >= i63 && i68 > 0 && !m70Var3.isEmpty()) {
                        i2 = i40;
                        break;
                    }
                    int i73 = i63;
                    long j10 = j9;
                    int i74 = i71;
                    zq0 zq0Var3 = zq0Var;
                    ip6 layoutDirection = lvcVar3.getLayoutDirection();
                    hw8 hw8Var9 = hw8Var8;
                    int i75 = i70;
                    int i76 = i40;
                    int i77 = i69;
                    int i78 = i68;
                    el7 el7VarW2 = mk7.w(yt6Var, i72, j10, wy8Var4, j8, hw8Var9, zq0Var3, layoutDirection, i59, k68Var2);
                    int i79 = i72;
                    int i80 = i74 - 1;
                    i68 = i78 + (i79 == i80 ? i59 : i42);
                    if (i68 > i50 || i79 == i80) {
                        int iMax2 = Math.max(i77, el7VarW2.h);
                        m70Var3.addLast(el7VarW2);
                        i35 = i75;
                        i77 = iMax2;
                    } else {
                        i35 = i75 - i42;
                        i66 = i79 + 1;
                        z4 = true;
                    }
                    i72 = i79 + 1;
                    i69 = i77;
                    i40 = i76;
                    i70 = i35;
                    zq0Var = zq0Var3;
                    hw8Var8 = hw8Var9;
                    j9 = j10;
                    i71 = i74;
                    i63 = i73;
                }
                int i81 = i71;
                long j11 = j9;
                zq0 zq0Var4 = zq0Var;
                int i82 = i70;
                hw8 hw8Var10 = hw8Var8;
                int iMax3 = i69;
                int i83 = i72;
                if (i68 < i2) {
                    int i84 = i2 - i68;
                    int i85 = i68 + i84;
                    int i86 = i82 - i84;
                    int i87 = i56;
                    while (i86 < i87 && i66 > 0) {
                        i66--;
                        int i88 = i87;
                        el7 el7VarW3 = mk7.w(yt6Var, i66, j11, wy8Var4, j8, hw8Var10, zq0Var4, lvcVar3.getLayoutDirection(), i59, k68Var2);
                        m70Var3.add(0, el7VarW3);
                        iMax3 = Math.max(iMax3, el7VarW3.h);
                        i87 = i88;
                        i86 += i42;
                        i83 = i83;
                        i85 = i85;
                    }
                    int i89 = i86;
                    i4 = i87;
                    int i90 = i85;
                    i5 = i83;
                    if (i89 < 0) {
                        i3 = i90 + i89;
                        i6 = 0;
                    } else {
                        i6 = i89;
                        i3 = i90;
                    }
                } else {
                    i3 = i68;
                    i4 = i56;
                    i5 = i83;
                    i6 = i82;
                }
                if (i6 < 0) {
                    e26.a("invalid currentFirstPageScrollOffset");
                }
                int i91 = -i6;
                el7 el7Var2 = (el7) m70Var3.first();
                int i92 = iMax3;
                int i93 = iI05;
                if (i4 > 0 || i93 < 0) {
                    int i94 = i6;
                    int size = m70Var3.getSize();
                    el7 el7Var3 = el7Var2;
                    int i95 = i94;
                    i7 = i91;
                    int i96 = 0;
                    while (i96 < size && i95 != 0) {
                        i8 = i5;
                        int i97 = i42;
                        if (i97 > i95) {
                            i9 = i97;
                            break;
                        }
                        i9 = i97;
                        i10 = 1;
                        if (i96 == m70Var3.getSize() - 1) {
                            break;
                        }
                        i95 -= i9;
                        i96++;
                        el7Var3 = (el7) m70Var3.get(i96);
                        i5 = i8;
                        i42 = i9;
                    }
                    i8 = i5;
                    i9 = i42;
                    i10 = 1;
                    i11 = i95;
                    el7Var2 = el7Var3;
                } else {
                    i7 = i91;
                    i8 = i5;
                    i9 = i42;
                    i10 = 1;
                    i11 = i6;
                }
                int iMax4 = Math.max(0, i66 - i55);
                int i98 = i66 - 1;
                if (iMax4 <= i98) {
                    int i99 = i98;
                    ArrayList arrayList9 = null;
                    while (true) {
                        if (arrayList9 == null) {
                            arrayList9 = new ArrayList();
                        }
                        el7 el7Var4 = el7Var2;
                        ip6 layoutDirection2 = lvcVar3.getLayoutDirection();
                        i12 = i2;
                        i13 = i11;
                        i14 = i93;
                        el7Var = el7Var4;
                        i16 = i55;
                        arrayList8 = arrayList9;
                        int i100 = i99;
                        i15 = i3;
                        m70Var = m70Var3;
                        i17 = iMax4;
                        arrayList8.add(mk7.w(yt6Var, i100, j11, wy8Var4, j8, hw8Var10, zq0Var4, layoutDirection2, i59, k68Var2));
                        if (i100 == i17) {
                            break;
                        }
                        i99 = i100 - 1;
                        iMax4 = i17;
                        m70Var3 = m70Var;
                        i3 = i15;
                        arrayList9 = arrayList8;
                        el7Var2 = el7Var;
                        i55 = i16;
                        i11 = i13;
                        i93 = i14;
                        i2 = i12;
                    }
                    arrayList = arrayList8;
                } else {
                    i12 = i2;
                    i13 = i11;
                    i14 = i93;
                    i15 = i3;
                    i16 = i55;
                    el7Var = el7Var2;
                    m70Var = m70Var3;
                    i17 = iMax4;
                    arrayList = null;
                }
                int size2 = list2.size();
                int i101 = 0;
                while (i101 < size2) {
                    List list3 = list2;
                    int i102 = i101;
                    int iIntValue2 = ((Number) list3.get(i101)).intValue();
                    if (iIntValue2 < i17) {
                        if (arrayList == null) {
                            arrayList = new ArrayList();
                        }
                        list = list3;
                        i34 = size2;
                        ArrayList arrayList10 = arrayList;
                        arrayList10.add(mk7.w(yt6Var, iIntValue2, j11, wy8Var4, j8, hw8Var10, zq0Var4, lvcVar3.getLayoutDirection(), i59, k68Var2));
                        arrayList = arrayList10;
                    } else {
                        list = list3;
                        i34 = size2;
                    }
                    i101 = i102 + 1;
                    size2 = i34;
                    list2 = list;
                }
                List list4 = list2;
                ey3 ey3Var2 = ey3.a;
                List list5 = arrayList == null ? ey3Var2 : arrayList;
                int iMax5 = i92;
                int i103 = 0;
                for (int size3 = list5.size(); i103 < size3; size3 = size3) {
                    iMax5 = Math.max(iMax5, ((el7) list5.get(i103)).h);
                    i103++;
                }
                int i104 = ((el7) m70Var.last()).a;
                int iMin = Math.min(i16, (i81 - i104) - 1) + i104;
                int i105 = i104 + 1;
                if (i105 <= iMin) {
                    ArrayList arrayList11 = null;
                    while (true) {
                        if (arrayList11 == null) {
                            arrayList11 = new ArrayList();
                        }
                        ey3Var = ey3Var2;
                        arrayList7 = arrayList11;
                        i18 = iMax5;
                        ip6 layoutDirection3 = lvcVar3.getLayoutDirection();
                        i19 = i16;
                        i20 = iMin;
                        int i106 = i105;
                        arrayList7.add(mk7.w(yt6Var, i106, j11, wy8Var4, j8, hw8Var10, zq0Var4, layoutDirection3, i59, k68Var2));
                        if (i106 == i20) {
                            break;
                        }
                        i105 = i106 + 1;
                        iMin = i20;
                        iMax5 = i18;
                        i16 = i19;
                        arrayList11 = arrayList7;
                        ey3Var2 = ey3Var;
                    }
                    arrayList2 = arrayList7;
                } else {
                    i18 = iMax5;
                    ey3Var = ey3Var2;
                    i19 = i16;
                    i20 = iMin;
                    arrayList2 = null;
                }
                int size4 = list4.size();
                int i107 = 0;
                while (i107 < size4) {
                    List list6 = list4;
                    int i108 = i107;
                    int iIntValue3 = ((Number) list6.get(i107)).intValue();
                    ArrayList arrayList12 = arrayList2;
                    if (i20 + 1 <= iIntValue3) {
                        int i109 = i81;
                        if (iIntValue3 < i109) {
                            if (arrayList12 == null) {
                                arrayList12 = new ArrayList();
                            }
                            i33 = size4;
                            ArrayList arrayList13 = arrayList12;
                            ip6 layoutDirection4 = lvcVar3.getLayoutDirection();
                            i30 = i20;
                            i32 = i108;
                            i31 = i109;
                            list4 = list6;
                            el7 el7VarW4 = mk7.w(yt6Var, iIntValue3, j11, wy8Var4, j8, hw8Var10, zq0Var4, layoutDirection4, i59, k68Var2);
                            hw8Var2 = hw8Var10;
                            long j12 = j11;
                            zq0Var2 = zq0Var4;
                            j3 = j12;
                            arrayList13.add(el7VarW4);
                            arrayList2 = arrayList13;
                            i107 = i32 + 1;
                            size4 = i33;
                            i81 = i31;
                            i20 = i30;
                            zq0Var4 = zq0Var2;
                            j11 = j3;
                            hw8Var10 = hw8Var2;
                        } else {
                            i30 = i20;
                            i31 = i109;
                            i33 = size4;
                            i32 = i108;
                            list4 = list6;
                        }
                    } else {
                        i30 = i20;
                        i31 = i81;
                        i32 = i108;
                        list4 = list6;
                        i33 = size4;
                    }
                    hw8Var2 = hw8Var10;
                    long j13 = j11;
                    zq0Var2 = zq0Var4;
                    j3 = j13;
                    arrayList2 = arrayList12;
                    i107 = i32 + 1;
                    size4 = i33;
                    i81 = i31;
                    i20 = i30;
                    zq0Var4 = zq0Var2;
                    j11 = j3;
                    hw8Var10 = hw8Var2;
                }
                ArrayList arrayList14 = arrayList2;
                hw8 hw8Var11 = hw8Var10;
                int i110 = i81;
                long j14 = j11;
                List list7 = arrayList14 == null ? ey3Var : arrayList14;
                int size5 = list7.size();
                int iMax6 = i18;
                for (int i111 = 0; i111 < size5; i111++) {
                    iMax6 = Math.max(iMax6, ((el7) list7.get(i111)).h);
                }
                int i112 = (g76.L(el7Var, m70Var.first()) && list5.isEmpty() && list7.isEmpty()) ? i10 : 0;
                hw8 hw8Var12 = hw8.Vertical;
                int iG2 = h72.g(hw8Var11 == hw8Var12 ? iMax6 : i15, jI);
                if (hw8Var11 == hw8Var12) {
                    iMax6 = i15;
                }
                int iF = h72.f(iMax6, jI);
                if (hw8Var11 != hw8Var12) {
                    iF = iG2;
                }
                int i113 = i12;
                int i114 = i15;
                int i115 = i114 < Math.min(iF, i113) ? i10 : 0;
                if (i115 == 0 || i7 == 0) {
                    i21 = i113;
                    i22 = iF;
                    i23 = i7;
                } else {
                    i21 = i113;
                    i22 = iF;
                    StringBuilder sb = new StringBuilder("non-zero pagesScrollOffset=");
                    i23 = i7;
                    sb.append(i23);
                    e26.c(sb.toString());
                }
                int i116 = i23;
                ArrayList arrayList15 = new ArrayList(list7.size() + list5.size() + m70Var.getSize());
                if (i115 != 0) {
                    if (!list5.isEmpty() || !list7.isEmpty()) {
                        e26.a("No extra pages");
                    }
                    int size6 = m70Var.getSize();
                    int[] iArr2 = new int[size6];
                    for (int i117 = 0; i117 < size6; i117++) {
                        iArr2[i117] = i59;
                    }
                    int[] iArr3 = new int[size6];
                    int i118 = i14;
                    j2 = j14;
                    i26 = i118;
                    h70 h70Var = new h70(lvcVar3.N(i118), false, null);
                    if (hw8Var11 == hw8.Vertical) {
                        h70Var.f0(yt6Var, iF, iArr2, iArr3);
                        iArr = iArr3;
                        lvcVar = lvcVar3;
                        arrayList3 = arrayList15;
                        i28 = i59;
                        i29 = i114;
                        i24 = i112;
                        i25 = i22;
                        hw8Var = hw8Var11;
                        i27 = i21;
                    } else {
                        iArr = iArr3;
                        lvcVar = lvcVar3;
                        arrayList3 = arrayList15;
                        i28 = i59;
                        i29 = i114;
                        i24 = i112;
                        i25 = i22;
                        hw8Var = hw8Var11;
                        i27 = i21;
                        h70Var.w(yt6Var, iF, iArr2, ip6.Ltr, iArr);
                    }
                    n46 n46VarV0 = k80.v0(iArr);
                    int i119 = n46VarV0.b;
                    int i120 = n46VarV0.c;
                    if ((i120 > 0 && i119 >= 0) || (i120 < 0 && i119 <= 0)) {
                        int i121 = 0;
                        while (true) {
                            int i122 = iArr[i121];
                            m70Var2 = m70Var;
                            int i123 = i120;
                            el7 el7Var5 = (el7) m70Var2.get(i121);
                            el7Var5.b(i122, iG2, i25);
                            arrayList3.add(el7Var5);
                            if (i121 == i119) {
                                break;
                            }
                            i121 += i123;
                            m70Var = m70Var2;
                            i120 = i123;
                        }
                    } else {
                        m70Var2 = m70Var;
                    }
                } else {
                    i24 = i112;
                    m70Var2 = m70Var;
                    i25 = i22;
                    i26 = i14;
                    j2 = j14;
                    hw8Var = hw8Var11;
                    lvcVar = lvcVar3;
                    i27 = i21;
                    arrayList3 = arrayList15;
                    i28 = i59;
                    i29 = i114;
                    int size7 = list5.size();
                    int i124 = i116;
                    for (int i125 = 0; i125 < size7; i125++) {
                        el7 el7Var6 = (el7) list5.get(i125);
                        i124 -= i41;
                        el7Var6.b(i124, iG2, i25);
                        arrayList3.add(el7Var6);
                    }
                    int size8 = m70Var2.getSize();
                    int i126 = i116;
                    for (int i127 = 0; i127 < size8; i127++) {
                        el7 el7Var7 = (el7) m70Var2.get(i127);
                        el7Var7.b(i126, iG2, i25);
                        arrayList3.add(el7Var7);
                        i126 += i41;
                    }
                    int size9 = list7.size();
                    for (int i128 = 0; i128 < size9; i128++) {
                        el7 el7Var8 = (el7) list7.get(i128);
                        el7Var8.b(i126, iG2, i25);
                        arrayList3.add(el7Var8);
                        i126 += i41;
                    }
                }
                if (i24 != 0) {
                    arrayList4 = arrayList3;
                } else {
                    arrayList4 = new ArrayList(arrayList3.size());
                    int size10 = arrayList3.size();
                    int i129 = 0;
                    while (i129 < size10) {
                        Object obj2 = arrayList3.get(i129);
                        el7 el7Var9 = (el7) obj2;
                        int i130 = size10;
                        m70 m70Var4 = m70Var2;
                        if (el7Var9.a >= ((el7) m70Var2.first()).a && el7Var9.a <= ((el7) m70Var4.last()).a) {
                            arrayList4.add(obj2);
                        }
                        i129++;
                        size10 = i130;
                        m70Var2 = m70Var4;
                    }
                }
                m70 m70Var5 = m70Var2;
                if (list5.isEmpty()) {
                    arrayList5 = ey3Var;
                } else {
                    arrayList5 = new ArrayList(arrayList3.size());
                    int size11 = arrayList3.size();
                    for (int i131 = 0; i131 < size11; i131++) {
                        Object obj3 = arrayList3.get(i131);
                        if (((el7) obj3).a < ((el7) m70Var5.first()).a) {
                            arrayList5.add(obj3);
                        }
                    }
                }
                if (list7.isEmpty()) {
                    arrayList6 = ey3Var;
                } else {
                    arrayList6 = new ArrayList(arrayList3.size());
                    int size12 = arrayList3.size();
                    for (int i132 = 0; i132 < size12; i132++) {
                        Object obj4 = arrayList3.get(i132);
                        if (((el7) obj4).a > ((el7) m70Var5.last()).a) {
                            arrayList6.add(obj4);
                        }
                    }
                }
                if (arrayList4.isEmpty()) {
                    obj = null;
                } else {
                    obj = arrayList4.get(0);
                    int i133 = ((el7) obj).j;
                    hpeVar2.getClass();
                    float f = -Math.abs(i133 - 0.0f);
                    int size13 = arrayList4.size() - 1;
                    int i134 = i10;
                    if (i134 <= size13) {
                        float f2 = f;
                        int i135 = i134;
                        while (true) {
                            Object obj5 = arrayList4.get(i135);
                            float f3 = -Math.abs(((el7) obj5).j - 0.0f);
                            if (Float.compare(f2, f3) < 0) {
                                f2 = f3;
                                obj = obj5;
                            }
                            if (i135 == size13) {
                                break;
                            }
                            i135++;
                        }
                    }
                }
                el7 el7Var10 = (el7) obj;
                hpeVar2.getClass();
                int i136 = el7Var10 != null ? el7Var10.j : 0;
                if (i9 == 0) {
                    fU = 0.0f;
                    z = false;
                } else {
                    z = false;
                    fU = iq7.u((0 - i136) / i9, -0.5f, 0.5f);
                }
                int i137 = iG2 + i57;
                ?? r17 = arrayList5;
                ?? r18 = arrayList6;
                int i138 = i28;
                lvcVar2 = lvcVar;
                yy8Var = new yy8(arrayList4, i138, i26, i38, hw8Var, i49, i62, i19, el7Var, el7Var10, fU, i13, (i8 < i110 || i29 > i27) ? true : z, hpeVar2, lvcVar.q0(h72.g(i137, j), h72.f(i25 + iI04, j), fy3Var4, new q58(l78Var, 18, arrayList3)), z4, r17, r18, sb2Var, yt6Var, j2);
                yt6Var2 = yt6Var;
            }
            gz8 gz8Var5 = gz8Var;
            gz8Var5.h(yy8Var, lvcVar2.W(), false);
            qy8 qy8Var = gz8Var5.v;
            List list8 = yy8Var.a;
            Trace.beginSection("compose:pager:cache_window:keepAroundItems");
            try {
                if (qy8Var.b() && !list8.isEmpty()) {
                    int i139 = ((el7) bu1.x0(list8)).a;
                    int i140 = ((el7) bu1.H0(list8)).a;
                    for (int i141 = qy8Var.h; i141 < i139; i141++) {
                        yt6Var2.a(i141);
                    }
                    int i142 = i140 + 1;
                    int i143 = qy8Var.i;
                    if (i142 <= i143) {
                        while (true) {
                            yt6Var2.a(i142);
                            if (i142 == i143) {
                                break;
                            }
                            i142++;
                        }
                    }
                }
                return yy8Var;
            } finally {
                Trace.endSection();
            }
        } catch (Throwable th) {
            vn7.T(oicVarA, oicVarG, x45VarE);
            throw th;
        }
    }
}
