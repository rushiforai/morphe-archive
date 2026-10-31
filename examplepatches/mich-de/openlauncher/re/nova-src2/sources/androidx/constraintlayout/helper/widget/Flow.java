package androidx.constraintlayout.helper.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewParent;
import androidx.constraintlayout.widget.ConstraintLayout;
import fa.u;
import g4.d;
import g4.e;
import g4.f;
import g4.g;
import g4.h;
import h4.b;
import j4.c;
import j4.p;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

/* loaded from: classes2.dex */
public class Flow extends c {

    /* renamed from: h, reason: collision with root package name */
    public final boolean f14178h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f14179i;

    /* renamed from: j, reason: collision with root package name */
    public final g f14180j;

    public Flow(Context context, AttributeSet attributeSet) throws IllegalAccessException, Resources.NotFoundException, IllegalArgumentException {
        super(context, attributeSet);
        this.f68905a = new int[32];
        this.f68911g = new HashMap();
        this.f68907c = context;
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, p.f69050b);
            int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
            for (int i5 = 0; i5 < indexCount; i5++) {
                int index = typedArrayObtainStyledAttributes.getIndex(i5);
                if (index == 35) {
                    String string = typedArrayObtainStyledAttributes.getString(index);
                    this.f68909e = string;
                    h(string);
                } else if (index == 36) {
                    String string2 = typedArrayObtainStyledAttributes.getString(index);
                    this.f68910f = string2;
                    i(string2);
                }
            }
            typedArrayObtainStyledAttributes.recycle();
        }
        int[] iArr = p.f69050b;
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes2 = getContext().obtainStyledAttributes(attributeSet, iArr);
            int indexCount2 = typedArrayObtainStyledAttributes2.getIndexCount();
            for (int i11 = 0; i11 < indexCount2; i11++) {
                int index2 = typedArrayObtainStyledAttributes2.getIndex(i11);
                if (index2 == 6) {
                    this.f14178h = true;
                } else if (index2 == 22) {
                    this.f14179i = true;
                }
            }
            typedArrayObtainStyledAttributes2.recycle();
        }
        g gVar = new g();
        gVar.f57149r0 = 0;
        gVar.f57150s0 = 0;
        gVar.f57151t0 = 0;
        gVar.f57152u0 = 0;
        gVar.f57153v0 = 0;
        gVar.f57154w0 = 0;
        gVar.f57155x0 = false;
        gVar.f57156y0 = 0;
        gVar.f57157z0 = 0;
        gVar.A0 = new b();
        gVar.B0 = null;
        gVar.C0 = -1;
        gVar.D0 = -1;
        gVar.E0 = -1;
        gVar.F0 = -1;
        gVar.G0 = -1;
        gVar.H0 = -1;
        gVar.I0 = 0.5f;
        gVar.J0 = 0.5f;
        gVar.K0 = 0.5f;
        gVar.L0 = 0.5f;
        gVar.M0 = 0.5f;
        gVar.N0 = 0.5f;
        gVar.O0 = 0;
        gVar.P0 = 0;
        gVar.Q0 = 2;
        gVar.R0 = 2;
        gVar.S0 = 0;
        gVar.T0 = -1;
        gVar.U0 = 0;
        gVar.V0 = new ArrayList();
        gVar.W0 = null;
        gVar.X0 = null;
        gVar.Y0 = null;
        gVar.f57148a1 = 0;
        this.f14180j = gVar;
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes3 = getContext().obtainStyledAttributes(attributeSet, iArr);
            int indexCount3 = typedArrayObtainStyledAttributes3.getIndexCount();
            for (int i12 = 0; i12 < indexCount3; i12++) {
                int index3 = typedArrayObtainStyledAttributes3.getIndex(i12);
                if (index3 == 0) {
                    this.f14180j.U0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 1) {
                    g gVar2 = this.f14180j;
                    int dimensionPixelSize = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                    gVar2.f57149r0 = dimensionPixelSize;
                    gVar2.f57150s0 = dimensionPixelSize;
                    gVar2.f57151t0 = dimensionPixelSize;
                    gVar2.f57152u0 = dimensionPixelSize;
                } else if (index3 == 18) {
                    g gVar3 = this.f14180j;
                    int dimensionPixelSize2 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                    gVar3.f57151t0 = dimensionPixelSize2;
                    gVar3.f57153v0 = dimensionPixelSize2;
                    gVar3.f57154w0 = dimensionPixelSize2;
                } else if (index3 == 19) {
                    this.f14180j.f57152u0 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                } else if (index3 == 2) {
                    this.f14180j.f57153v0 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                } else if (index3 == 3) {
                    this.f14180j.f57149r0 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                } else if (index3 == 4) {
                    this.f14180j.f57154w0 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                } else if (index3 == 5) {
                    this.f14180j.f57150s0 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                } else if (index3 == 54) {
                    this.f14180j.S0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 44) {
                    this.f14180j.C0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 53) {
                    this.f14180j.D0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 38) {
                    this.f14180j.E0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 46) {
                    this.f14180j.G0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 40) {
                    this.f14180j.F0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 48) {
                    this.f14180j.H0 = typedArrayObtainStyledAttributes3.getInt(index3, 0);
                } else if (index3 == 42) {
                    this.f14180j.I0 = typedArrayObtainStyledAttributes3.getFloat(index3, 0.5f);
                } else if (index3 == 37) {
                    this.f14180j.K0 = typedArrayObtainStyledAttributes3.getFloat(index3, 0.5f);
                } else if (index3 == 45) {
                    this.f14180j.M0 = typedArrayObtainStyledAttributes3.getFloat(index3, 0.5f);
                } else if (index3 == 39) {
                    this.f14180j.L0 = typedArrayObtainStyledAttributes3.getFloat(index3, 0.5f);
                } else if (index3 == 47) {
                    this.f14180j.N0 = typedArrayObtainStyledAttributes3.getFloat(index3, 0.5f);
                } else if (index3 == 51) {
                    this.f14180j.J0 = typedArrayObtainStyledAttributes3.getFloat(index3, 0.5f);
                } else if (index3 == 41) {
                    this.f14180j.Q0 = typedArrayObtainStyledAttributes3.getInt(index3, 2);
                } else if (index3 == 50) {
                    this.f14180j.R0 = typedArrayObtainStyledAttributes3.getInt(index3, 2);
                } else if (index3 == 43) {
                    this.f14180j.O0 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                } else if (index3 == 52) {
                    this.f14180j.P0 = typedArrayObtainStyledAttributes3.getDimensionPixelSize(index3, 0);
                } else if (index3 == 49) {
                    this.f14180j.T0 = typedArrayObtainStyledAttributes3.getInt(index3, -1);
                }
            }
            typedArrayObtainStyledAttributes3.recycle();
        }
        this.f68908d = this.f14180j;
        k();
    }

    @Override // j4.c
    public final void e(ConstraintLayout constraintLayout) {
        d(constraintLayout);
    }

    @Override // j4.c
    public final void g(d dVar, boolean z11) {
        g gVar = this.f14180j;
        int i5 = gVar.f57151t0;
        if (i5 > 0 || gVar.f57152u0 > 0) {
            if (z11) {
                gVar.f57153v0 = gVar.f57152u0;
                gVar.f57154w0 = i5;
            } else {
                gVar.f57153v0 = i5;
                gVar.f57154w0 = gVar.f57152u0;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:391:0x068f  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:405:0x072a  */
    /* JADX WARN: Removed duplicated region for block: B:411:0x0738  */
    /* JADX WARN: Removed duplicated region for block: B:412:0x073b  */
    /* JADX WARN: Removed duplicated region for block: B:419:0x0757  */
    /* JADX WARN: Removed duplicated region for block: B:420:0x0759  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:430:0x010f A[EDGE_INSN: B:430:0x010f->B:63:0x010f BREAK  A[LOOP:1: B:57:0x00f8->B:62:0x010a], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0135  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0140  */
    /* JADX WARN: Type inference failed for: r12v2 */
    /* JADX WARN: Type inference failed for: r12v3 */
    /* JADX WARN: Type inference failed for: r12v46 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l(g gVar, int i5, int i11) {
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        int i19;
        d[] dVarArr;
        int i21;
        int i22;
        int[] iArr;
        int i23;
        int i24;
        int i25;
        int i26;
        f fVar;
        char c11;
        ?? r12;
        boolean z11;
        int i27;
        int i28;
        int i29;
        int iCeil;
        int iCeil2;
        Object obj;
        d dVar;
        boolean z12;
        int i31;
        int i32;
        int i33;
        int i34;
        int i35;
        int i36;
        g4.c cVar;
        g4.c cVar2;
        g4.c cVar3;
        ArrayList arrayList;
        int i37;
        int mode = View.MeasureSpec.getMode(i5);
        int size = View.MeasureSpec.getSize(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        int size2 = View.MeasureSpec.getSize(i11);
        if (gVar == null) {
            setMeasuredDimension(0, 0);
            return;
        }
        int[] iArr2 = gVar.f57109o0;
        g4.c cVar4 = gVar.I;
        g4.c cVar5 = gVar.H;
        g4.c cVar6 = gVar.J;
        g4.c cVar7 = gVar.K;
        ArrayList arrayList2 = gVar.V0;
        if (gVar.f57165q0 > 0) {
            b bVar = gVar.A0;
            d dVar2 = gVar.S;
            u uVar = dVar2 != null ? ((e) dVar2).f57125t0 : null;
            if (uVar == null) {
                gVar.f57156y0 = 0;
                gVar.f57157z0 = 0;
                gVar.f57155x0 = false;
            } else {
                int i38 = 0;
                while (i38 < gVar.f57165q0) {
                    d dVar3 = gVar.f57164p0[i38];
                    if (dVar3 == null) {
                        cVar = cVar5;
                    } else {
                        cVar = cVar5;
                        if (!(dVar3 instanceof h)) {
                            cVar2 = cVar6;
                            int iJ = dVar3.j(0);
                            cVar3 = cVar7;
                            int iJ2 = dVar3.j(1);
                            arrayList = arrayList2;
                            if (iJ == 3) {
                                i37 = i38;
                                if (dVar3.f57111q == 1 || iJ2 != 3 || dVar3.f57112r == 1) {
                                }
                            } else {
                                i37 = i38;
                            }
                            if (iJ == 3) {
                                iJ = 2;
                            }
                            if (iJ2 == 3) {
                                iJ2 = 2;
                            }
                            bVar.f59086a = iJ;
                            bVar.f59087b = iJ2;
                            bVar.f59088c = dVar3.n();
                            bVar.f59089d = dVar3.k();
                            uVar.f(dVar3, bVar);
                            dVar3.J(bVar.f59090e);
                            dVar3.G(bVar.f59091f);
                            dVar3.D(bVar.f59092g);
                        }
                        i38 = i37 + 1;
                        cVar5 = cVar;
                        cVar6 = cVar2;
                        cVar7 = cVar3;
                        arrayList2 = arrayList;
                    }
                    cVar2 = cVar6;
                    cVar3 = cVar7;
                    arrayList = arrayList2;
                    i37 = i38;
                    i38 = i37 + 1;
                    cVar5 = cVar;
                    cVar6 = cVar2;
                    cVar7 = cVar3;
                    arrayList2 = arrayList;
                }
                g4.c cVar8 = cVar5;
                g4.c cVar9 = cVar6;
                g4.c cVar10 = cVar7;
                ArrayList arrayList3 = arrayList2;
                int i39 = gVar.f57153v0;
                int i40 = gVar.f57154w0;
                i12 = gVar.f57149r0;
                int i41 = gVar.f57150s0;
                int[] iArr3 = new int[2];
                int i42 = (size - i39) - i40;
                i13 = gVar.U0;
                if (i13 == 1) {
                    i42 = (size2 - i12) - i41;
                }
                int i43 = i42;
                if (i13 != 0) {
                    if (gVar.C0 == -1) {
                        i36 = 0;
                        gVar.C0 = 0;
                    } else {
                        i36 = 0;
                    }
                    i14 = i40;
                    if (gVar.D0 == -1) {
                        gVar.D0 = i36;
                    }
                } else {
                    i14 = i40;
                    if (gVar.C0 == -1) {
                        gVar.C0 = 0;
                    }
                    if (gVar.D0 == -1) {
                        gVar.D0 = 0;
                    }
                }
                d[] dVarArr2 = gVar.f57164p0;
                i15 = 0;
                i16 = 0;
                while (true) {
                    i17 = gVar.f57165q0;
                    i18 = i12;
                    if (i15 < i17) {
                        break;
                    }
                    if (gVar.f57164p0[i15].f57093f0 == 8) {
                        i16++;
                    }
                    i15++;
                    i12 = i18;
                }
                if (i16 <= 0) {
                    dVarArr = new d[i17 - i16];
                    int i44 = 0;
                    int i45 = 0;
                    while (i44 < gVar.f57165q0) {
                        d dVar4 = gVar.f57164p0[i44];
                        d[] dVarArr3 = dVarArr;
                        if (dVar4.f57093f0 != 8) {
                            dVarArr3[i45] = dVar4;
                            i45++;
                        }
                        i44++;
                        dVarArr = dVarArr3;
                    }
                    i19 = i45;
                } else {
                    i19 = i17;
                    dVarArr = dVarArr2;
                }
                gVar.Z0 = dVarArr;
                gVar.f57148a1 = i19;
                i21 = gVar.S0;
                if (i21 != 0) {
                    d[] dVarArr4 = dVarArr;
                    int i46 = i19;
                    i22 = i41;
                    iArr = iArr3;
                    i23 = size2;
                    i24 = i39;
                    i25 = i14;
                    i26 = i18;
                    int i47 = gVar.U0;
                    if (i46 != 0) {
                        if (arrayList3.size() == 0) {
                            fVar = new f(gVar, i47, gVar.H, gVar.I, gVar.J, gVar.K, i43);
                            arrayList3.add(fVar);
                        } else {
                            f fVar2 = (f) arrayList3.get(0);
                            fVar2.f57134c = 0;
                            fVar2.f57133b = null;
                            fVar2.f57143l = 0;
                            fVar2.f57144m = 0;
                            fVar2.n = 0;
                            fVar2.o = 0;
                            fVar2.f57145p = 0;
                            fVar2.f(i47, gVar.H, gVar.I, gVar.J, gVar.K, gVar.f57153v0, gVar.f57149r0, gVar.f57154w0, gVar.f57150s0, i43);
                            fVar = fVar2;
                        }
                        for (int i48 = 0; i48 < i46; i48++) {
                            fVar.a(dVarArr4[i48]);
                        }
                        c11 = 0;
                        iArr[0] = fVar.d();
                        r12 = 1;
                        iArr[1] = fVar.c();
                        int i49 = iArr[c11] + i24 + i25;
                        int i51 = iArr[r12] + i26 + i22;
                        if (mode != 1073741824) {
                        }
                        if (mode2 != 1073741824) {
                        }
                        gVar.f57156y0 = size;
                        gVar.f57157z0 = iMin;
                        gVar.J(size);
                        gVar.G(iMin);
                        gVar.f57155x0 = gVar.f57165q0 <= 0 ? r12 : false;
                    }
                } else if (i21 != 1) {
                    if (i21 == 2) {
                        d[] dVarArr5 = dVarArr;
                        int i52 = i19;
                        i22 = i41;
                        iArr = iArr3;
                        i23 = size2;
                        i24 = i39;
                        i25 = i14;
                        i26 = i18;
                        int i53 = gVar.U0;
                        if (i53 == 0) {
                            int i54 = gVar.T0;
                            if (i54 <= 0) {
                                int i55 = 0;
                                iCeil2 = 0;
                                for (int i56 = 0; i56 < i52; i56++) {
                                    if (i56 > 0) {
                                        i55 += gVar.O0;
                                    }
                                    d dVar5 = dVarArr5[i56];
                                    if (dVar5 != null) {
                                        int iP = gVar.P(dVar5, i43) + i55;
                                        if (iP > i43) {
                                            break;
                                        }
                                        iCeil2++;
                                        i55 = iP;
                                    }
                                }
                            } else {
                                iCeil2 = i54;
                            }
                            iCeil = 0;
                        } else {
                            iCeil = gVar.T0;
                            if (iCeil <= 0) {
                                int i57 = 0;
                                int i58 = 0;
                                for (int i59 = 0; i59 < i52; i59++) {
                                    if (i59 > 0) {
                                        i57 += gVar.P0;
                                    }
                                    d dVar6 = dVarArr5[i59];
                                    if (dVar6 != null) {
                                        int iO = gVar.O(dVar6, i43) + i57;
                                        if (iO > i43) {
                                            break;
                                        }
                                        i58++;
                                        i57 = iO;
                                    }
                                }
                                iCeil = i58;
                            }
                            iCeil2 = 0;
                        }
                        if (gVar.Y0 == null) {
                            gVar.Y0 = new int[2];
                        }
                        boolean z13 = (iCeil == 0 && i53 == 1) || (iCeil2 == 0 && i53 == 0);
                        while (!z13) {
                            if (i53 == 0) {
                                iCeil = (int) Math.ceil(i52 / iCeil2);
                            } else {
                                iCeil2 = (int) Math.ceil(i52 / iCeil);
                            }
                            d[] dVarArr6 = gVar.X0;
                            if (dVarArr6 == null || dVarArr6.length < iCeil2) {
                                obj = null;
                                gVar.X0 = new d[iCeil2];
                            } else {
                                obj = null;
                                Arrays.fill(dVarArr6, (Object) null);
                            }
                            d[] dVarArr7 = gVar.W0;
                            if (dVarArr7 == null || dVarArr7.length < iCeil) {
                                gVar.W0 = new d[iCeil];
                            } else {
                                Arrays.fill(dVarArr7, obj);
                            }
                            for (int i61 = 0; i61 < iCeil2; i61++) {
                                for (int i62 = 0; i62 < iCeil; i62++) {
                                    int i63 = (i62 * iCeil2) + i61;
                                    if (i53 == 1) {
                                        i63 = (i61 * iCeil) + i62;
                                    }
                                    if (i63 < dVarArr5.length && (dVar = dVarArr5[i63]) != null) {
                                        int iP2 = gVar.P(dVar, i43);
                                        d dVar7 = gVar.X0[i61];
                                        if (dVar7 == null || dVar7.n() < iP2) {
                                            gVar.X0[i61] = dVar;
                                        }
                                        int iO2 = gVar.O(dVar, i43);
                                        d dVar8 = gVar.W0[i62];
                                        if (dVar8 == null || dVar8.k() < iO2) {
                                            gVar.W0[i62] = dVar;
                                        }
                                    }
                                }
                            }
                            int iP3 = 0;
                            for (int i64 = 0; i64 < iCeil2; i64++) {
                                d dVar9 = gVar.X0[i64];
                                if (dVar9 != null) {
                                    if (i64 > 0) {
                                        iP3 += gVar.O0;
                                    }
                                    iP3 = gVar.P(dVar9, i43) + iP3;
                                }
                            }
                            int iO3 = 0;
                            for (int i65 = 0; i65 < iCeil; i65++) {
                                d dVar10 = gVar.W0[i65];
                                if (dVar10 != null) {
                                    if (i65 > 0) {
                                        iO3 += gVar.P0;
                                    }
                                    iO3 = gVar.O(dVar10, i43) + iO3;
                                }
                            }
                            iArr[0] = iP3;
                            iArr[1] = iO3;
                            if (i53 == 0) {
                                if (iP3 <= i43 || iCeil2 <= 1) {
                                    z13 = true;
                                } else {
                                    iCeil2--;
                                }
                            } else if (iO3 <= i43 || iCeil <= 1) {
                                z13 = true;
                            } else {
                                iCeil--;
                            }
                        }
                        z11 = true;
                        int[] iArr4 = gVar.Y0;
                        iArr4[0] = iCeil2;
                        iArr4[1] = iCeil;
                    } else if (i21 != 3) {
                        i22 = i41;
                        iArr = iArr3;
                        i23 = size2;
                        i24 = i39;
                        i25 = i14;
                        i26 = i18;
                    } else {
                        int i66 = i19;
                        int i67 = gVar.U0;
                        if (i66 == 0) {
                            i22 = i41;
                            iArr = iArr3;
                            i23 = size2;
                            i24 = i39;
                            i25 = i14;
                            i26 = i18;
                            z12 = true;
                        } else {
                            arrayList3.clear();
                            d[] dVarArr8 = dVarArr;
                            i24 = i39;
                            i22 = i41;
                            i25 = i14;
                            i26 = i18;
                            iArr = iArr3;
                            z12 = true;
                            f fVar3 = new f(gVar, i67, gVar.H, gVar.I, gVar.J, gVar.K, i43);
                            arrayList3.add(fVar3);
                            if (i67 == 0) {
                                int i68 = 0;
                                int i69 = 0;
                                i31 = 0;
                                int i71 = 0;
                                while (i68 < i66) {
                                    i69++;
                                    d dVar11 = dVarArr8[i68];
                                    int iP4 = gVar.P(dVar11, i43);
                                    int i72 = i67;
                                    int i73 = i68;
                                    if (dVar11.f57109o0[0] == 3) {
                                        i31++;
                                    }
                                    int i74 = i31;
                                    boolean z14 = (i71 == i43 || (gVar.O0 + i71) + iP4 > i43) && fVar3.f57133b != null;
                                    if (!z14 && i73 > 0 && (i35 = gVar.T0) > 0 && i69 > i35) {
                                        z14 = true;
                                    }
                                    if (z14) {
                                        i33 = size2;
                                        i67 = i72;
                                        i34 = i73;
                                        fVar3 = new f(gVar, i67, gVar.H, gVar.I, gVar.J, gVar.K, i43);
                                        fVar3.n = i34;
                                        arrayList3.add(fVar3);
                                        i69 = 1;
                                    } else {
                                        i33 = size2;
                                        i67 = i72;
                                        i34 = i73;
                                        if (i34 > 0) {
                                            i71 = gVar.O0 + iP4 + i71;
                                        }
                                        fVar3.a(dVar11);
                                        i68 = i34 + 1;
                                        i31 = i74;
                                        size2 = i33;
                                    }
                                    i71 = iP4;
                                    fVar3.a(dVar11);
                                    i68 = i34 + 1;
                                    i31 = i74;
                                    size2 = i33;
                                }
                                i23 = size2;
                            } else {
                                i23 = size2;
                                int i75 = 0;
                                int i76 = 0;
                                int i77 = 0;
                                int i78 = 0;
                                while (i75 < i66) {
                                    i76++;
                                    d dVar12 = dVarArr8[i75];
                                    int iO4 = gVar.O(dVar12, i43);
                                    int i79 = i67;
                                    if (dVar12.f57109o0[1] == 3) {
                                        i77++;
                                    }
                                    int i81 = i77;
                                    boolean z15 = (i78 == i43 || (gVar.P0 + i78) + iO4 > i43) && fVar3.f57133b != null;
                                    if (!z15 && i75 > 0 && (i32 = gVar.T0) > 0 && i76 > i32) {
                                        z15 = true;
                                    }
                                    if (z15) {
                                        i67 = i79;
                                        fVar3 = new f(gVar, i67, gVar.H, gVar.I, gVar.J, gVar.K, i43);
                                        fVar3.n = i75;
                                        arrayList3.add(fVar3);
                                        i76 = 1;
                                    } else {
                                        i67 = i79;
                                        if (i75 > 0) {
                                            i78 = gVar.P0 + iO4 + i78;
                                        }
                                        fVar3.a(dVar12);
                                        i75++;
                                        i77 = i81;
                                    }
                                    i78 = iO4;
                                    fVar3.a(dVar12);
                                    i75++;
                                    i77 = i81;
                                }
                                i31 = i77;
                            }
                            int size3 = arrayList3.size();
                            int i82 = gVar.f57153v0;
                            int i83 = gVar.f57149r0;
                            int i84 = gVar.f57154w0;
                            int i85 = gVar.f57150s0;
                            boolean z16 = iArr2[0] == 2 || iArr2[1] == 2;
                            if (i31 > 0 && z16) {
                                for (int i86 = 0; i86 < size3; i86++) {
                                    f fVar4 = (f) arrayList3.get(i86);
                                    if (i67 == 0) {
                                        fVar4.e(i43 - fVar4.d());
                                    } else {
                                        fVar4.e(i43 - fVar4.c());
                                    }
                                }
                            }
                            int i87 = i82;
                            int i88 = i83;
                            int i89 = i84;
                            int i91 = i85;
                            g4.c cVar11 = cVar8;
                            g4.c cVar12 = cVar9;
                            g4.c cVar13 = cVar10;
                            g4.c cVar14 = cVar4;
                            int iMax = 0;
                            int i92 = 0;
                            for (int i93 = 0; i93 < size3; i93++) {
                                f fVar5 = (f) arrayList3.get(i93);
                                if (i67 == 0) {
                                    if (i93 < size3 - 1) {
                                        cVar13 = ((f) arrayList3.get(i93 + 1)).f57133b.I;
                                        i91 = 0;
                                    } else {
                                        i91 = gVar.f57150s0;
                                        cVar13 = cVar10;
                                    }
                                    g4.c cVar15 = fVar5.f57133b.K;
                                    fVar5.f(i67, cVar11, cVar14, cVar12, cVar13, i87, i88, i89, i91, i43);
                                    iMax = Math.max(iMax, fVar5.d());
                                    int iC = fVar5.c() + i92;
                                    if (i93 > 0) {
                                        iC += gVar.P0;
                                    }
                                    i92 = iC;
                                    cVar14 = cVar15;
                                    i88 = 0;
                                } else {
                                    if (i93 < size3 - 1) {
                                        cVar12 = ((f) arrayList3.get(i93 + 1)).f57133b.H;
                                        i89 = 0;
                                    } else {
                                        i89 = gVar.f57154w0;
                                        cVar12 = cVar9;
                                    }
                                    g4.c cVar16 = fVar5.f57133b.J;
                                    fVar5.f(i67, cVar11, cVar14, cVar12, cVar13, i87, i88, i89, i91, i43);
                                    int iD = fVar5.d() + iMax;
                                    int iMax2 = Math.max(i92, fVar5.c());
                                    if (i93 > 0) {
                                        iD += gVar.O0;
                                    }
                                    i92 = iMax2;
                                    iMax = iD;
                                    cVar11 = cVar16;
                                    i87 = 0;
                                }
                            }
                            iArr[0] = iMax;
                            iArr[1] = i92;
                        }
                        z11 = z12;
                    }
                    c11 = 0;
                    r12 = z11;
                    int i492 = iArr[c11] + i24 + i25;
                    int i512 = iArr[r12] + i26 + i22;
                    if (mode != 1073741824) {
                        size = mode == Integer.MIN_VALUE ? Math.min(i492, size) : mode == 0 ? i492 : 0;
                    }
                    int iMin = mode2 != 1073741824 ? i23 : mode2 == Integer.MIN_VALUE ? Math.min(i512, i23) : mode2 == 0 ? i512 : 0;
                    gVar.f57156y0 = size;
                    gVar.f57157z0 = iMin;
                    gVar.J(size);
                    gVar.G(iMin);
                    gVar.f57155x0 = gVar.f57165q0 <= 0 ? r12 : false;
                } else {
                    i22 = i41;
                    iArr = iArr3;
                    i23 = size2;
                    i24 = i39;
                    i25 = i14;
                    i26 = i18;
                    int i94 = i19;
                    d[] dVarArr9 = dVarArr;
                    int i95 = gVar.U0;
                    if (i94 != 0) {
                        arrayList3.clear();
                        f fVar6 = new f(gVar, i95, gVar.H, gVar.I, gVar.J, gVar.K, i43);
                        arrayList3.add(fVar6);
                        if (i95 == 0) {
                            int i96 = 0;
                            i27 = 0;
                            int i97 = 0;
                            while (i96 < i94) {
                                d dVar13 = dVarArr9[i96];
                                int iP5 = gVar.P(dVar13, i43);
                                if (dVar13.f57109o0[0] == 3) {
                                    i27++;
                                }
                                int i98 = i27;
                                boolean z17 = (i97 == i43 || (gVar.O0 + i97) + iP5 > i43) && fVar6.f57133b != null;
                                if (!z17 && i96 > 0 && (i29 = gVar.T0) > 0 && i96 % i29 == 0) {
                                    z17 = true;
                                }
                                if (z17) {
                                    fVar6 = new f(gVar, i95, gVar.H, gVar.I, gVar.J, gVar.K, i43);
                                    fVar6.n = i96;
                                    arrayList3.add(fVar6);
                                } else {
                                    if (i96 > 0) {
                                        i97 = gVar.O0 + iP5 + i97;
                                    }
                                    fVar6.a(dVar13);
                                    i96++;
                                    i27 = i98;
                                }
                                i97 = iP5;
                                fVar6.a(dVar13);
                                i96++;
                                i27 = i98;
                            }
                        } else {
                            int i99 = 0;
                            i27 = 0;
                            int i100 = 0;
                            while (i99 < i94) {
                                d dVar14 = dVarArr9[i99];
                                int iO5 = gVar.O(dVar14, i43);
                                if (dVar14.f57109o0[1] == 3) {
                                    i27++;
                                }
                                int i101 = i27;
                                boolean z18 = (i100 == i43 || (gVar.P0 + i100) + iO5 > i43) && fVar6.f57133b != null;
                                if (!z18 && i99 > 0 && (i28 = gVar.T0) > 0 && i99 % i28 == 0) {
                                    z18 = true;
                                }
                                if (z18) {
                                    fVar6 = new f(gVar, i95, gVar.H, gVar.I, gVar.J, gVar.K, i43);
                                    fVar6.n = i99;
                                    arrayList3.add(fVar6);
                                } else {
                                    if (i99 > 0) {
                                        i100 = gVar.P0 + iO5 + i100;
                                    }
                                    fVar6.a(dVar14);
                                    i99++;
                                    i27 = i101;
                                }
                                i100 = iO5;
                                fVar6.a(dVar14);
                                i99++;
                                i27 = i101;
                            }
                        }
                        int size4 = arrayList3.size();
                        int i102 = gVar.f57153v0;
                        int i103 = gVar.f57149r0;
                        int i104 = gVar.f57154w0;
                        int i105 = gVar.f57150s0;
                        boolean z19 = iArr2[0] == 2 || iArr2[1] == 2;
                        if (i27 > 0 && z19) {
                            for (int i106 = 0; i106 < size4; i106++) {
                                f fVar7 = (f) arrayList3.get(i106);
                                if (i95 == 0) {
                                    fVar7.e(i43 - fVar7.d());
                                } else {
                                    fVar7.e(i43 - fVar7.c());
                                }
                            }
                        }
                        int i107 = i102;
                        int i108 = i103;
                        int i109 = i104;
                        int i110 = i105;
                        g4.c cVar17 = cVar8;
                        g4.c cVar18 = cVar9;
                        g4.c cVar19 = cVar10;
                        g4.c cVar20 = cVar4;
                        int iMax3 = 0;
                        int i111 = 0;
                        for (int i112 = 0; i112 < size4; i112++) {
                            f fVar8 = (f) arrayList3.get(i112);
                            if (i95 == 0) {
                                if (i112 < size4 - 1) {
                                    cVar19 = ((f) arrayList3.get(i112 + 1)).f57133b.I;
                                    i110 = 0;
                                } else {
                                    i110 = gVar.f57150s0;
                                    cVar19 = cVar10;
                                }
                                g4.c cVar21 = fVar8.f57133b.K;
                                fVar8.f(i95, cVar17, cVar20, cVar18, cVar19, i107, i108, i109, i110, i43);
                                iMax3 = Math.max(iMax3, fVar8.d());
                                int iC2 = fVar8.c() + i111;
                                if (i112 > 0) {
                                    iC2 += gVar.P0;
                                }
                                i111 = iC2;
                                cVar20 = cVar21;
                                i108 = 0;
                            } else {
                                if (i112 < size4 - 1) {
                                    cVar18 = ((f) arrayList3.get(i112 + 1)).f57133b.H;
                                    i109 = 0;
                                } else {
                                    i109 = gVar.f57154w0;
                                    cVar18 = cVar9;
                                }
                                g4.c cVar22 = fVar8.f57133b.J;
                                fVar8.f(i95, cVar17, cVar20, cVar18, cVar19, i107, i108, i109, i110, i43);
                                int iD2 = fVar8.d() + iMax3;
                                int iMax4 = Math.max(i111, fVar8.c());
                                if (i112 > 0) {
                                    iD2 += gVar.O0;
                                }
                                i111 = iMax4;
                                iMax3 = iD2;
                                cVar17 = cVar22;
                                i107 = 0;
                            }
                        }
                        iArr[0] = iMax3;
                        iArr[1] = i111;
                    }
                }
                z11 = true;
                c11 = 0;
                r12 = z11;
                int i4922 = iArr[c11] + i24 + i25;
                int i5122 = iArr[r12] + i26 + i22;
                if (mode != 1073741824) {
                }
                if (mode2 != 1073741824) {
                }
                gVar.f57156y0 = size;
                gVar.f57157z0 = iMin;
                gVar.J(size);
                gVar.G(iMin);
                gVar.f57155x0 = gVar.f57165q0 <= 0 ? r12 : false;
            }
        } else {
            g4.c cVar82 = cVar5;
            g4.c cVar92 = cVar6;
            g4.c cVar102 = cVar7;
            ArrayList arrayList32 = arrayList2;
            int i392 = gVar.f57153v0;
            int i402 = gVar.f57154w0;
            i12 = gVar.f57149r0;
            int i412 = gVar.f57150s0;
            int[] iArr32 = new int[2];
            int i422 = (size - i392) - i402;
            i13 = gVar.U0;
            if (i13 == 1) {
            }
            int i432 = i422;
            if (i13 != 0) {
            }
            d[] dVarArr22 = gVar.f57164p0;
            i15 = 0;
            i16 = 0;
            while (true) {
                i17 = gVar.f57165q0;
                i18 = i12;
                if (i15 < i17) {
                }
                i15++;
                i12 = i18;
            }
            if (i16 <= 0) {
            }
            gVar.Z0 = dVarArr;
            gVar.f57148a1 = i19;
            i21 = gVar.S0;
            if (i21 != 0) {
            }
            z11 = true;
            c11 = 0;
            r12 = z11;
            int i49222 = iArr[c11] + i24 + i25;
            int i51222 = iArr[r12] + i26 + i22;
            if (mode != 1073741824) {
            }
            if (mode2 != 1073741824) {
            }
            gVar.f57156y0 = size;
            gVar.f57157z0 = iMin;
            gVar.J(size);
            gVar.G(iMin);
            gVar.f57155x0 = gVar.f57165q0 <= 0 ? r12 : false;
        }
        setMeasuredDimension(gVar.f57156y0, gVar.f57157z0);
    }

    @Override // j4.c, android.view.View
    public final void onAttachedToWindow() throws IllegalAccessException, Resources.NotFoundException, IllegalArgumentException {
        super.onAttachedToWindow();
        if (this.f14178h || this.f14179i) {
            ViewParent parent = getParent();
            if (parent instanceof ConstraintLayout) {
                ConstraintLayout constraintLayout = (ConstraintLayout) parent;
                int visibility = getVisibility();
                float elevation = getElevation();
                for (int i5 = 0; i5 < this.f68906b; i5++) {
                    View view = (View) constraintLayout.f14181a.get(this.f68905a[i5]);
                    if (view != null) {
                        if (this.f14178h) {
                            view.setVisibility(visibility);
                        }
                        if (this.f14179i && elevation > 0.0f) {
                            view.setTranslationZ(view.getTranslationZ() + elevation);
                        }
                    }
                }
            }
        }
    }

    @Override // j4.c, android.view.View
    public final void onMeasure(int i5, int i11) {
        l(this.f14180j, i5, i11);
    }

    @Override // android.view.View
    public final void setElevation(float f11) {
        super.setElevation(f11);
        ViewParent parent = getParent();
        if (parent == null || !(parent instanceof ConstraintLayout)) {
            return;
        }
        d((ConstraintLayout) parent);
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        ViewParent parent = getParent();
        if (parent == null || !(parent instanceof ConstraintLayout)) {
            return;
        }
        d((ConstraintLayout) parent);
    }
}
