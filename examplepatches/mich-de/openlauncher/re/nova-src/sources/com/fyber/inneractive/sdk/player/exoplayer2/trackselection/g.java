package com.fyber.inneractive.sdk.player.exoplayer2.trackselection;

import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.source.y;
import com.fyber.inneractive.sdk.player.exoplayer2.source.z;
import com.fyber.inneractive.sdk.player.exoplayer2.t;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

/* loaded from: classes3.dex */
public abstract class g extends i {

    /* renamed from: a, reason: collision with root package name */
    public final SparseArray f30263a = new SparseArray();

    /* renamed from: b, reason: collision with root package name */
    public final SparseBooleanArray f30264b = new SparseBooleanArray();

    /* JADX WARN: Removed duplicated region for block: B:103:0x01de A[PHI: r30
      0x01de: PHI (r30v7 int) = (r30v5 int), (r30v9 int) binds: [B:102:0x01dc, B:95:0x01cc] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:105:0x01e2 A[PHI: r30
      0x01e2: PHI (r30v6 int) = (r30v5 int), (r30v9 int) binds: [B:104:0x01e0, B:97:0x01cf] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x01f3  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x01f7  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01a6  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01b8  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01bd  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.trackselection.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final j a(com.fyber.inneractive.sdk.player.exoplayer2.a[] aVarArr, z zVar) throws com.fyber.inneractive.sdk.player.exoplayer2.d {
        boolean z11;
        int i5;
        boolean z12;
        int i11;
        int[][] iArr;
        int i12;
        boolean z13;
        c cVar;
        int[][][] iArr2;
        int i13;
        int i14;
        y yVar;
        ArrayList arrayList;
        int i15;
        boolean zA;
        boolean z14;
        int i16;
        int i17;
        int i18;
        boolean z15;
        int[] iArr3;
        boolean z16 = true;
        int[] iArr4 = new int[aVarArr.length + 1];
        int length = aVarArr.length + 1;
        y[][] yVarArr = new y[length][];
        int[][][] iArr5 = new int[aVarArr.length + 1][][];
        for (int i19 = 0; i19 < length; i19++) {
            int i21 = zVar.f30248a;
            yVarArr[i19] = new y[i21];
            iArr5[i19] = new int[i21][];
        }
        int length2 = aVarArr.length;
        int[] iArr6 = new int[length2];
        for (int i22 = 0; i22 < length2; i22++) {
            aVarArr[i22].getClass();
            iArr6[i22] = 4;
        }
        int i23 = 0;
        while (i23 < zVar.f30248a) {
            y yVar2 = zVar.f30249b[i23];
            int length3 = aVarArr.length;
            int i24 = 0;
            int i25 = 0;
            while (true) {
                if (i24 >= aVarArr.length) {
                    z15 = z16;
                    break;
                }
                com.fyber.inneractive.sdk.player.exoplayer2.a aVar = aVarArr[i24];
                int i26 = 0;
                while (i26 < yVar2.f30244a) {
                    o oVar = yVar2.f30245b[i26];
                    z15 = z16;
                    com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c cVar2 = (com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c) aVar;
                    cVar2.getClass();
                    try {
                        int iB = cVar2.b(cVar2.f30059h, oVar) & 3;
                        if (iB > i25) {
                            if (iB == 3) {
                                length3 = i24;
                                break;
                            }
                            i25 = iB;
                            length3 = i24;
                        }
                        i26++;
                        z16 = z15;
                    } catch (com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.f e3) {
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.d(e3);
                    }
                }
                i24++;
            }
            if (length3 == aVarArr.length) {
                iArr3 = new int[yVar2.f30244a];
            } else {
                com.fyber.inneractive.sdk.player.exoplayer2.a aVar2 = aVarArr[length3];
                int[] iArr7 = new int[yVar2.f30244a];
                for (int i27 = 0; i27 < yVar2.f30244a; i27++) {
                    o oVar2 = yVar2.f30245b[i27];
                    com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c cVar3 = (com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.c) aVar2;
                    cVar3.getClass();
                    try {
                        iArr7[i27] = cVar3.b(cVar3.f30059h, oVar2);
                    } catch (com.fyber.inneractive.sdk.player.exoplayer2.mediacodec.f e11) {
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.d(e11);
                    }
                }
                iArr3 = iArr7;
            }
            int i28 = iArr4[length3];
            yVarArr[length3][i28] = yVar2;
            iArr5[length3][i28] = iArr3;
            iArr4[length3] = i28 + 1;
            i23++;
            z16 = z15;
        }
        boolean z17 = z16;
        z[] zVarArr = new z[aVarArr.length];
        int[] iArr8 = new int[aVarArr.length];
        for (int i29 = 0; i29 < aVarArr.length; i29++) {
            int i31 = iArr4[i29];
            zVarArr[i29] = new z((y[]) Arrays.copyOf(yVarArr[i29], i31));
            iArr5[i29] = (int[][]) Arrays.copyOf(iArr5[i29], i31);
            iArr8[i29] = aVarArr[i29].f28969a;
        }
        new z((y[]) Arrays.copyOf(yVarArr[aVarArr.length], iArr4[aVarArr.length]));
        int length4 = aVarArr.length;
        b[] bVarArr = new b[length4];
        c cVar4 = (c) ((d) this).f30262c.get();
        int i32 = 0;
        boolean z18 = false;
        while (i32 < length4) {
            if (2 == aVarArr[i32].f28969a) {
                if (z18) {
                    cVar = cVar4;
                    iArr2 = iArr5;
                    i13 = i32;
                } else {
                    z zVar2 = zVarArr[i32];
                    int[][] iArr9 = iArr5[i32];
                    cVar4.getClass();
                    y yVar3 = null;
                    int i33 = 0;
                    int i34 = 0;
                    int i35 = 0;
                    int i36 = -1;
                    int i37 = -1;
                    while (i33 < zVar2.f30248a) {
                        y yVar4 = zVar2.f30249b[i33];
                        c cVar5 = cVar4;
                        ArrayList arrayList2 = new ArrayList(yVar4.f30244a);
                        int[][][] iArr10 = iArr5;
                        for (int i38 = 0; i38 < yVar4.f30244a; i38++) {
                            arrayList2.add(Integer.valueOf(i38));
                        }
                        int[] iArr11 = iArr9[i33];
                        int i39 = i35;
                        int i40 = i36;
                        int i41 = i32;
                        int iB2 = i40;
                        int i42 = i37;
                        z zVar3 = zVar2;
                        int i43 = i42;
                        y yVar5 = yVar3;
                        int i44 = 0;
                        while (i44 < yVar4.f30244a) {
                            int i45 = i44;
                            if (d.a(iArr11[i44], z17)) {
                                o oVar3 = yVar4.f30245b[i45];
                                if (arrayList2.contains(Integer.valueOf(i45))) {
                                    int i46 = oVar3.f30132j;
                                    yVar = yVar4;
                                    arrayList = arrayList2;
                                    boolean z19 = (i46 == -1 || i46 <= Integer.MAX_VALUE) && ((i17 = oVar3.f30133k) == -1 || i17 <= Integer.MAX_VALUE) && ((i18 = oVar3.f30124b) == -1 || i18 <= Integer.MAX_VALUE);
                                    i15 = !z19 ? 2 : 1;
                                    boolean z21 = z19;
                                    zA = d.a(iArr11[i45], false);
                                    if (zA) {
                                        i15 += 1000;
                                    }
                                    z14 = i15 <= i39;
                                    if (i15 != i39) {
                                        if (oVar3.b() != iB2) {
                                            int iB3 = oVar3.b();
                                            i14 = i39;
                                            i16 = -1;
                                            if (iB3 != -1) {
                                                i16 = iB2 == -1 ? 1 : iB3 - iB2;
                                            } else if (iB2 == -1) {
                                                i16 = 0;
                                            }
                                            z14 = zA || !z21 ? i16 < 0 : i16 > 0;
                                        } else {
                                            i14 = i39;
                                            i16 = -1;
                                            int i47 = oVar3.f30124b;
                                            if (i47 == -1) {
                                                if (i43 == -1) {
                                                }
                                            } else if (i43 != -1) {
                                                i16 = i47 - i43;
                                            }
                                            if (zA) {
                                            }
                                        }
                                        i44 = i45 + 1;
                                        yVar4 = yVar;
                                        arrayList2 = arrayList;
                                        z17 = true;
                                    } else {
                                        i14 = i39;
                                    }
                                    if (!z14) {
                                        i43 = oVar3.f30124b;
                                        iB2 = oVar3.b();
                                        i39 = i15;
                                        i34 = i45;
                                        yVar5 = yVar;
                                    }
                                    i44 = i45 + 1;
                                    yVar4 = yVar;
                                    arrayList2 = arrayList;
                                    z17 = true;
                                } else {
                                    yVar = yVar4;
                                    arrayList = arrayList2;
                                }
                                if (!z19) {
                                }
                                boolean z212 = z19;
                                zA = d.a(iArr11[i45], false);
                                if (zA) {
                                }
                                if (i15 <= i39) {
                                }
                                if (i15 != i39) {
                                }
                                if (!z14) {
                                }
                                i44 = i45 + 1;
                                yVar4 = yVar;
                                arrayList2 = arrayList;
                                z17 = true;
                            } else {
                                i14 = i39;
                                yVar = yVar4;
                                arrayList = arrayList2;
                            }
                            i39 = i14;
                            i44 = i45 + 1;
                            yVar4 = yVar;
                            arrayList2 = arrayList;
                            z17 = true;
                        }
                        int i48 = i39;
                        i33++;
                        i36 = iB2;
                        i32 = i41;
                        i37 = i43;
                        zVar2 = zVar3;
                        cVar4 = cVar5;
                        iArr5 = iArr10;
                        yVar3 = yVar5;
                        i35 = i48;
                        z17 = true;
                    }
                    cVar = cVar4;
                    iArr2 = iArr5;
                    i13 = i32;
                    e eVar = yVar3 == null ? null : new e(yVar3, i34);
                    bVarArr[i13] = eVar;
                    z18 = eVar != null;
                }
                int i49 = zVarArr[i13].f30248a;
            } else {
                cVar = cVar4;
                iArr2 = iArr5;
                i13 = i32;
            }
            i32 = i13 + 1;
            cVar4 = cVar;
            iArr5 = iArr2;
            z17 = true;
        }
        c cVar6 = cVar4;
        int[][][] iArr12 = iArr5;
        boolean z22 = false;
        boolean z23 = false;
        int i51 = 0;
        while (i51 < length4) {
            int i52 = aVarArr[i51].f28969a;
            if (i52 == 1) {
                z11 = z22;
                i5 = length4;
                z12 = z23;
                if (!z12) {
                    z zVar4 = zVarArr[i51];
                    int[][] iArr13 = iArr12[i51];
                    cVar6.getClass();
                    int i53 = 0;
                    int i54 = 0;
                    int i55 = -1;
                    int i56 = -1;
                    while (i53 < zVar4.f30248a) {
                        y yVar6 = zVar4.f30249b[i53];
                        int[] iArr14 = iArr13[i53];
                        int i57 = i56;
                        int i58 = 0;
                        while (i58 < yVar6.f30244a) {
                            int[][] iArr15 = iArr13;
                            if (d.a(iArr14[i58], true)) {
                                o oVar4 = yVar6.f30245b[i58];
                                int i59 = iArr14[i58];
                                int i61 = (oVar4.f30144x & 1) != 0 ? 2 : 1;
                                i11 = i53;
                                if (d.a(i59, false)) {
                                    i61 += 1000;
                                }
                                if (i61 > i54) {
                                    i55 = i58;
                                    i54 = i61;
                                    i57 = i11;
                                }
                            } else {
                                i11 = i53;
                            }
                            i58++;
                            i53 = i11;
                            iArr13 = iArr15;
                        }
                        i53++;
                        i56 = i57;
                        iArr13 = iArr13;
                    }
                    e eVar2 = i56 == -1 ? null : new e(zVar4.f30249b[i56], i55);
                    bVarArr[i51] = eVar2;
                    z12 = eVar2 != null;
                }
                z22 = z11;
                i51++;
                length4 = i5;
                z23 = z12;
            } else if (i52 == 2) {
                z11 = z22;
                i5 = length4;
                z12 = z23;
            } else if (i52 != 3) {
                z zVar5 = zVarArr[i51];
                int[][] iArr16 = iArr12[i51];
                cVar6.getClass();
                y yVar7 = null;
                int i62 = 0;
                int i63 = 0;
                int i64 = 0;
                while (i62 < zVar5.f30248a) {
                    y yVar8 = zVar5.f30249b[i62];
                    int[] iArr17 = iArr16[i62];
                    boolean z24 = z22;
                    int i65 = length4;
                    int i66 = 0;
                    while (i66 < yVar8.f30244a) {
                        int i67 = i66;
                        if (d.a(iArr17[i66], true)) {
                            int i68 = (yVar8.f30245b[i67].f30144x & 1) != 0 ? 2 : 1;
                            z13 = z23;
                            if (d.a(iArr17[i67], false)) {
                                i68 += 1000;
                            }
                            if (i68 > i64) {
                                i64 = i68;
                                yVar7 = yVar8;
                                i63 = i67;
                            }
                        } else {
                            z13 = z23;
                        }
                        i66 = i67 + 1;
                        z23 = z13;
                    }
                    i62++;
                    z22 = z24;
                    length4 = i65;
                }
                z11 = z22;
                i5 = length4;
                z12 = z23;
                bVarArr[i51] = yVar7 == null ? null : new e(yVar7, i63);
            } else {
                z11 = z22;
                i5 = length4;
                z12 = z23;
                if (!z11) {
                    z zVar6 = zVarArr[i51];
                    int[][] iArr18 = iArr12[i51];
                    cVar6.getClass();
                    y yVar9 = null;
                    int i69 = 0;
                    int i71 = 0;
                    int i72 = 0;
                    while (i69 < zVar6.f30248a) {
                        y yVar10 = zVar6.f30249b[i69];
                        int[] iArr19 = iArr18[i69];
                        y yVar11 = yVar9;
                        int i73 = 0;
                        while (i73 < yVar10.f30244a) {
                            z zVar7 = zVar6;
                            if (d.a(iArr19[i73], true)) {
                                int i74 = yVar10.f30245b[i73].f30144x;
                                boolean z25 = (i74 & 1) != 0;
                                boolean z26 = (i74 & 2) != 0;
                                if (!z25) {
                                    i12 = z26 ? 1 : 3;
                                    iArr = iArr18;
                                }
                                iArr = iArr18;
                                if (d.a(iArr19[i73], false)) {
                                    i12 += 1000;
                                }
                                if (i12 > i72) {
                                    i72 = i12;
                                    i71 = i73;
                                    yVar11 = yVar10;
                                }
                            } else {
                                iArr = iArr18;
                            }
                            i73++;
                            zVar6 = zVar7;
                            iArr18 = iArr;
                        }
                        i69++;
                        yVar9 = yVar11;
                    }
                    e eVar3 = yVar9 == null ? null : new e(yVar9, i71);
                    bVarArr[i51] = eVar3;
                    z22 = eVar3 != null;
                    i51++;
                    length4 = i5;
                    z23 = z12;
                }
            }
            z22 = z11;
            i51++;
            length4 = i5;
            z23 = z12;
        }
        for (int i75 = 0; i75 < aVarArr.length; i75++) {
            if (this.f30264b.get(i75)) {
                bVarArr[i75] = null;
            } else {
                z zVar8 = zVarArr[i75];
                Map map = (Map) this.f30263a.get(i75);
                if (!(map != null && map.containsKey(zVar8))) {
                    continue;
                } else {
                    if (((Map) this.f30263a.get(i75)).get(zVar8) != null) {
                        throw new ClassCastException();
                    }
                    bVarArr[i75] = null;
                }
            }
        }
        f fVar = new f(zVarArr);
        t[] tVarArr = new t[aVarArr.length];
        for (int i76 = 0; i76 < aVarArr.length; i76++) {
            tVarArr[i76] = bVarArr[i76] != null ? t.f30251b : null;
        }
        return new j(zVar, new h(bVarArr), fVar, tVarArr);
    }
}
