package com.bytedance.adsdk.ugeno.lt;

import a2.c;
import android.graphics.drawable.Drawable;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
class dj {
    static final /* synthetic */ boolean sya = true;

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.ugeno.lt.ycx f22396dj;

    /* renamed from: lt, reason: collision with root package name */
    private long[] f22397lt;
    private boolean[] lud;
    int[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    long[] f22398zb;

    public static class ycx {
        List<sya> ycx;

        /* renamed from: zb, reason: collision with root package name */
        int f22399zb;

        public void ycx() {
            this.ycx = null;
            this.f22399zb = 0;
        }
    }

    public static class zb implements Comparable<zb> {
        int ycx;

        /* renamed from: zb, reason: collision with root package name */
        int f22400zb;

        private zb() {
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Order{order=");
            sb2.append(this.f22400zb);
            sb2.append(", index=");
            return c.m(sb2, this.ycx, AbstractJsonLexerKt.END_OBJ);
        }

        @Override // java.lang.Comparable
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public int compareTo(zb zbVar) {
            int i5 = this.f22400zb;
            int i11 = zbVar.f22400zb;
            return i5 != i11 ? i5 - i11 : this.ycx - zbVar.ycx;
        }
    }

    public dj(com.bytedance.adsdk.ugeno.lt.ycx ycxVar) {
        this.f22396dj = ycxVar;
    }

    private int dj(boolean z11) {
        return z11 ? this.f22396dj.getPaddingBottom() : this.f22396dj.getPaddingEnd();
    }

    private int lt(com.bytedance.adsdk.ugeno.lt.zb zbVar, boolean z11) {
        return z11 ? zbVar.dy() : zbVar.syc();
    }

    private int lud(com.bytedance.adsdk.ugeno.lt.zb zbVar, boolean z11) {
        return z11 ? zbVar.xkz() : zbVar.ry();
    }

    private int sya(boolean z11) {
        return z11 ? this.f22396dj.getPaddingTop() : this.f22396dj.getPaddingStart();
    }

    public int ycx(long j11) {
        return (int) j11;
    }

    public int zb(long j11) {
        return (int) (j11 >> 32);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public int[] ycx(View view, int i5, ViewGroup.LayoutParams layoutParams, SparseIntArray sparseIntArray) {
        int flexItemCount = this.f22396dj.getFlexItemCount();
        List<zb> listZb = zb(flexItemCount);
        zb zbVar = new zb();
        if (view == null || !(layoutParams instanceof com.bytedance.adsdk.ugeno.lt.zb)) {
            zbVar.f22400zb = 1;
        } else {
            zbVar.f22400zb = ((com.bytedance.adsdk.ugeno.lt.zb) layoutParams).sya();
        }
        if (i5 == -1 || i5 == flexItemCount || i5 >= this.f22396dj.getFlexItemCount()) {
            zbVar.ycx = flexItemCount;
        } else {
            zbVar.ycx = i5;
            while (i5 < flexItemCount) {
                listZb.get(i5).ycx++;
                i5++;
            }
        }
        listZb.add(zbVar);
        return ycx(flexItemCount + 1, listZb, sparseIntArray);
    }

    public long zb(int i5, int i11) {
        return (i5 & 4294967295L) | (i11 << 32);
    }

    private int dj(com.bytedance.adsdk.ugeno.lt.zb zbVar, boolean z11) {
        if (z11) {
            return zbVar.syc();
        }
        return zbVar.dy();
    }

    private int sya(com.bytedance.adsdk.ugeno.lt.zb zbVar, boolean z11) {
        if (z11) {
            return zbVar.ry();
        }
        return zbVar.xkz();
    }

    private List<zb> zb(int i5) {
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) this.f22396dj.ycx(i11).getLayoutParams();
            zb zbVar2 = new zb();
            zbVar2.f22400zb = zbVar.sya();
            zbVar2.ycx = i11;
            arrayList.add(zbVar2);
        }
        return arrayList;
    }

    private void sya(int i5) {
        boolean[] zArr = this.lud;
        if (zArr == null) {
            this.lud = new boolean[Math.max(i5, 10)];
        } else if (zArr.length < i5) {
            this.lud = new boolean[Math.max(zArr.length * 2, i5)];
        } else {
            Arrays.fill(zArr, false);
        }
    }

    public boolean zb(SparseIntArray sparseIntArray) {
        int flexItemCount = this.f22396dj.getFlexItemCount();
        if (sparseIntArray.size() != flexItemCount) {
            return true;
        }
        for (int i5 = 0; i5 < flexItemCount; i5++) {
            View viewYcx = this.f22396dj.ycx(i5);
            if (viewYcx != null && ((com.bytedance.adsdk.ugeno.lt.zb) viewYcx.getLayoutParams()).sya() != sparseIntArray.get(i5)) {
                return true;
            }
        }
        return false;
    }

    public void zb(ycx ycxVar, int i5, int i11) {
        ycx(ycxVar, i11, i5, LayoutNode.NotPlacedPlaceOrder, 0, -1, (List<sya>) null);
    }

    private int zb(boolean z11) {
        if (z11) {
            return this.f22396dj.getPaddingEnd();
        }
        return this.f22396dj.getPaddingBottom();
    }

    public int[] ycx(SparseIntArray sparseIntArray) {
        int flexItemCount = this.f22396dj.getFlexItemCount();
        return ycx(flexItemCount, zb(flexItemCount), sparseIntArray);
    }

    private int zb(View view, boolean z11) {
        if (z11) {
            return view.getMeasuredHeight();
        }
        return view.getMeasuredWidth();
    }

    private int[] ycx(int i5, List<zb> list, SparseIntArray sparseIntArray) {
        Collections.sort(list);
        sparseIntArray.clear();
        int[] iArr = new int[i5];
        int i11 = 0;
        for (zb zbVar : list) {
            int i12 = zbVar.ycx;
            iArr[i11] = i12;
            sparseIntArray.append(i12, zbVar.f22400zb);
            i11++;
        }
        return iArr;
    }

    private int zb(com.bytedance.adsdk.ugeno.lt.zb zbVar, boolean z11) {
        if (z11) {
            return zbVar.zb();
        }
        return zbVar.ycx();
    }

    private void zb(int i5, int i11, sya syaVar, int i12, int i13, boolean z11) {
        float f11;
        float f12;
        int iMax;
        int iUl;
        int i14 = syaVar.lud;
        float f13 = syaVar.f22426ea;
        float f14 = 0.0f;
        if (f13 <= 0.0f || i12 > i14) {
            return;
        }
        float f15 = (i14 - i12) / f13;
        syaVar.lud = i13 + syaVar.f22429lt;
        if (!z11) {
            syaVar.f22432ul = Integer.MIN_VALUE;
        }
        int i15 = 0;
        boolean z12 = false;
        int i16 = 0;
        float f16 = 0.0f;
        while (i15 < syaVar.fby) {
            int i17 = syaVar.syc + i15;
            View viewZb = this.f22396dj.zb(i17);
            if (viewZb == null || viewZb.getVisibility() == 8) {
                f11 = f14;
                f12 = f15;
            } else {
                com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) viewZb.getLayoutParams();
                int flexDirection = this.f22396dj.getFlexDirection();
                f11 = f14;
                if (flexDirection != 0 && flexDirection != 1) {
                    int measuredHeight = viewZb.getMeasuredHeight();
                    long[] jArr = this.f22397lt;
                    if (jArr != null) {
                        measuredHeight = zb(jArr[i17]);
                    }
                    int measuredWidth = viewZb.getMeasuredWidth();
                    long[] jArr2 = this.f22397lt;
                    if (jArr2 != null) {
                        measuredWidth = ycx(jArr2[i17]);
                    }
                    if (!this.lud[i17] && zbVar.lud() > f11) {
                        float fLud = measuredHeight - (zbVar.lud() * f15);
                        if (i15 == syaVar.fby - 1) {
                            fLud += f16;
                            f16 = f11;
                        }
                        int iRound = Math.round(fLud);
                        if (iRound < zbVar.fby()) {
                            iRound = zbVar.fby();
                            this.lud[i17] = true;
                            syaVar.f22426ea -= zbVar.lud();
                            z12 = true;
                        } else {
                            float f17 = (fLud - iRound) + f16;
                            double d5 = f17;
                            if (d5 > 1.0d) {
                                iRound++;
                                f17 -= 1.0f;
                            } else if (d5 < -1.0d) {
                                iRound--;
                                f17 += 1.0f;
                            }
                            f16 = f17;
                        }
                        int iYcx = ycx(i5, zbVar, syaVar.f22431ry);
                        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iRound, 1073741824);
                        viewZb.measure(iYcx, iMakeMeasureSpec);
                        int measuredWidth2 = viewZb.getMeasuredWidth();
                        int measuredHeight2 = viewZb.getMeasuredHeight();
                        ycx(i17, iYcx, iMakeMeasureSpec, viewZb);
                        measuredWidth = measuredWidth2;
                        measuredHeight = measuredHeight2;
                    }
                    iMax = Math.max(i16, zbVar.syc() + zbVar.ry() + measuredWidth + this.f22396dj.ycx(viewZb));
                    syaVar.lud = zbVar.dy() + zbVar.xkz() + measuredHeight + syaVar.lud;
                    f12 = f15;
                } else {
                    int measuredWidth3 = viewZb.getMeasuredWidth();
                    long[] jArr3 = this.f22397lt;
                    if (jArr3 != null) {
                        measuredWidth3 = ycx(jArr3[i17]);
                    }
                    int measuredHeight3 = viewZb.getMeasuredHeight();
                    long[] jArr4 = this.f22397lt;
                    f12 = f15;
                    if (jArr4 != null) {
                        measuredHeight3 = zb(jArr4[i17]);
                    }
                    if (!this.lud[i17] && zbVar.lud() > f11) {
                        float fLud2 = measuredWidth3 - (zbVar.lud() * f12);
                        if (i15 == syaVar.fby - 1) {
                            fLud2 += f16;
                            f16 = f11;
                        }
                        int iRound2 = Math.round(fLud2);
                        if (iRound2 < zbVar.ul()) {
                            iUl = zbVar.ul();
                            this.lud[i17] = true;
                            syaVar.f22426ea -= zbVar.lud();
                            z12 = true;
                        } else {
                            float f18 = (fLud2 - iRound2) + f16;
                            double d11 = f18;
                            if (d11 > 1.0d) {
                                iUl = iRound2 + 1;
                                f18 -= 1.0f;
                            } else if (d11 < -1.0d) {
                                iUl = iRound2 - 1;
                                f18 += 1.0f;
                            } else {
                                iUl = iRound2;
                            }
                            f16 = f18;
                        }
                        int iZb = zb(i11, zbVar, syaVar.f22431ry);
                        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iUl, 1073741824);
                        viewZb.measure(iMakeMeasureSpec2, iZb);
                        int measuredWidth4 = viewZb.getMeasuredWidth();
                        int measuredHeight4 = viewZb.getMeasuredHeight();
                        ycx(i17, iMakeMeasureSpec2, iZb, viewZb);
                        measuredWidth3 = measuredWidth4;
                        measuredHeight3 = measuredHeight4;
                    }
                    int iMax2 = Math.max(i16, zbVar.dy() + zbVar.xkz() + measuredHeight3 + this.f22396dj.ycx(viewZb));
                    syaVar.lud = zbVar.syc() + zbVar.ry() + measuredWidth3 + syaVar.lud;
                    iMax = iMax2;
                }
                syaVar.f22432ul = Math.max(syaVar.f22432ul, iMax);
                i16 = iMax;
            }
            i15++;
            f15 = f12;
            f14 = f11;
        }
        if (!z12 || i14 == syaVar.lud) {
            return;
        }
        zb(i5, i11, syaVar, i12, i13, true);
    }

    public void ycx(ycx ycxVar, int i5, int i11) {
        ycx(ycxVar, i5, i11, LayoutNode.NotPlacedPlaceOrder, 0, -1, (List<sya>) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void ycx(ycx ycxVar, int i5, int i11, int i12, int i13, int i14, List<sya> list) {
        int i15;
        ycx ycxVar2;
        boolean z11;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int iYcx;
        int i22;
        int i23;
        int i24;
        sya syaVar;
        int i25;
        int i26;
        boolean z12;
        int i27;
        int i28;
        int i29 = i5;
        boolean zYcx = this.f22396dj.ycx();
        int mode = View.MeasureSpec.getMode(i29);
        int size = View.MeasureSpec.getSize(i29);
        List<sya> arrayList = list == null ? new ArrayList() : list;
        ycxVar.ycx = arrayList;
        boolean z13 = i14 == -1;
        int iYcx2 = ycx(zYcx);
        int iZb = zb(zYcx);
        int iSya = sya(zYcx);
        int iDj = dj(zYcx);
        sya syaVar2 = new sya();
        int i31 = i13;
        syaVar2.syc = i31;
        int i32 = iYcx2 + iZb;
        syaVar2.lud = i32;
        int flexItemCount = this.f22396dj.getFlexItemCount();
        boolean z14 = z13;
        sya syaVar3 = syaVar2;
        int i33 = Integer.MIN_VALUE;
        int i34 = 0;
        int iCombineMeasuredStates = 0;
        int i35 = 0;
        while (true) {
            if (i31 >= flexItemCount) {
                i15 = iCombineMeasuredStates;
                ycxVar2 = ycxVar;
                break;
            }
            View viewZb = this.f22396dj.zb(i31);
            if (viewZb == null) {
                if (ycx(i31, flexItemCount, syaVar3)) {
                    ycx(arrayList, syaVar3, i31, i34);
                }
                i16 = i32;
                z11 = true;
            } else {
                z11 = true;
                i16 = i32;
                if (viewZb.getVisibility() == 8) {
                    syaVar3.f22428jw++;
                    syaVar3.fby++;
                    if (ycx(i31, flexItemCount, syaVar3)) {
                        ycx(arrayList, syaVar3, i31, i34);
                    }
                } else {
                    if (viewZb instanceof CompoundButton) {
                        ycx((CompoundButton) viewZb);
                    }
                    com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) viewZb.getLayoutParams();
                    int i36 = flexItemCount;
                    if (zbVar.lt() == 4) {
                        syaVar3.xkz.add(Integer.valueOf(i31));
                    }
                    int iYcx3 = ycx(zbVar, zYcx);
                    if (zbVar.ok() != -1.0f && mode == 1073741824) {
                        iYcx3 = Math.round(zbVar.ok() * size);
                    }
                    if (zYcx) {
                        i18 = mode;
                        iYcx = this.f22396dj.ycx(i29, i16 + sya(zbVar, true) + dj(zbVar, true), iYcx3);
                        i17 = size;
                        i19 = i34;
                        int iZb2 = this.f22396dj.zb(i11, iSya + iDj + lud(zbVar, true) + lt(zbVar, true) + i34, zb(zbVar, true));
                        viewZb.measure(iYcx, iZb2);
                        ycx(i31, iYcx, iZb2, viewZb);
                        i21 = 0;
                    } else {
                        i17 = size;
                        i18 = mode;
                        i19 = i34;
                        i21 = 0;
                        int iYcx4 = this.f22396dj.ycx(i11, iSya + iDj + lud(zbVar, false) + lt(zbVar, false) + i19, zb(zbVar, false));
                        int iZb3 = this.f22396dj.zb(i29, i16 + sya(zbVar, false) + dj(zbVar, false), iYcx3);
                        viewZb.measure(iYcx4, iZb3);
                        ycx(i31, iYcx4, iZb3, viewZb);
                        iYcx = iZb3;
                    }
                    ycx(viewZb, i31);
                    iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, viewZb.getMeasuredState());
                    int i37 = i21;
                    i22 = i31;
                    int i38 = iYcx;
                    sya syaVar4 = syaVar3;
                    int i39 = i35;
                    i23 = i16;
                    i24 = i19;
                    boolean z15 = zYcx;
                    size = i17;
                    if (ycx(viewZb, i18, size, syaVar3.lud, ycx(viewZb, zYcx) + sya(zbVar, zYcx) + dj(zbVar, zYcx), zbVar, i22, i39, arrayList.size())) {
                        if (syaVar4.zb() > 0) {
                            ycx(arrayList, syaVar4, i22 > 0 ? i22 - 1 : i37, i24);
                            i28 = i24 + syaVar4.f22432ul;
                        } else {
                            i28 = i24;
                        }
                        if (z15) {
                            if (zbVar.zb() == -1) {
                                com.bytedance.adsdk.ugeno.lt.ycx ycxVar3 = this.f22396dj;
                                viewZb.measure(i38, ycxVar3.zb(i11, zbVar.dy() + zbVar.xkz() + ycxVar3.getPaddingTop() + this.f22396dj.getPaddingBottom() + i28, zbVar.zb()));
                                ycx(viewZb, i22);
                            }
                        } else if (zbVar.ycx() == -1) {
                            com.bytedance.adsdk.ugeno.lt.ycx ycxVar4 = this.f22396dj;
                            viewZb.measure(ycxVar4.ycx(i11, zbVar.syc() + zbVar.ry() + ycxVar4.getPaddingLeft() + this.f22396dj.getPaddingRight() + i28, zbVar.ycx()), i38);
                            ycx(viewZb, i22);
                        }
                        sya syaVar5 = new sya();
                        syaVar5.fby = 1;
                        syaVar5.lud = i23;
                        syaVar5.syc = i22;
                        i24 = i28;
                        i25 = i37;
                        syaVar = syaVar5;
                        i26 = Integer.MIN_VALUE;
                    } else {
                        syaVar = syaVar4;
                        syaVar.fby++;
                        i25 = i39 + 1;
                        i26 = i33;
                    }
                    syaVar.wie = (syaVar.wie ? 1 : 0) | (zbVar.dj() != 0.0f ? 1 : i37);
                    syaVar.pmi = (syaVar.pmi ? 1 : 0) | (zbVar.lud() != 0.0f ? 1 : i37);
                    int[] iArr = this.ycx;
                    if (iArr != null) {
                        iArr[i22] = arrayList.size();
                    }
                    z12 = z15;
                    syaVar.lud = ycx(viewZb, z12) + sya(zbVar, z12) + dj(zbVar, z12) + syaVar.lud;
                    syaVar.f22427jc = zbVar.dj() + syaVar.f22427jc;
                    syaVar.f22426ea = zbVar.lud() + syaVar.f22426ea;
                    this.f22396dj.ycx(viewZb, i22, i25, syaVar);
                    int iMax = Math.max(i26, zb(viewZb, z12) + lud(zbVar, z12) + lt(zbVar, z12) + this.f22396dj.ycx(viewZb));
                    syaVar.f22432ul = Math.max(syaVar.f22432ul, iMax);
                    if (z12) {
                        if (this.f22396dj.getFlexWrap() != 2) {
                            syaVar.f22430ok = Math.max(syaVar.f22430ok, zbVar.xkz() + viewZb.getBaseline());
                        } else {
                            syaVar.f22430ok = Math.max(syaVar.f22430ok, zbVar.dy() + (viewZb.getMeasuredHeight() - viewZb.getBaseline()));
                        }
                    }
                    i27 = i36;
                    if (ycx(i22, i27, syaVar)) {
                        ycx(arrayList, syaVar, i22, i24);
                        i24 += syaVar.f22432ul;
                    }
                    if (i14 != -1 && arrayList.size() > 0) {
                        if (((sya) c.e(1, arrayList)).f22425dy >= i14 && i22 >= i14 && !z14) {
                            i24 = -syaVar.ycx();
                            z14 = true;
                        }
                    }
                    if (i24 > i12 && z14) {
                        ycxVar2 = ycxVar;
                        i15 = iCombineMeasuredStates;
                        break;
                    }
                    i33 = iMax;
                    i35 = i25;
                    int i40 = i22 + 1;
                    zYcx = z12;
                    syaVar3 = syaVar;
                    i32 = i23;
                    i34 = i24;
                    i29 = i5;
                    flexItemCount = i27;
                    i31 = i40;
                    mode = i18;
                }
            }
            i22 = i31;
            i18 = mode;
            i27 = flexItemCount;
            i24 = i34;
            z12 = zYcx;
            i23 = i16;
            syaVar = syaVar3;
            int i402 = i22 + 1;
            zYcx = z12;
            syaVar3 = syaVar;
            i32 = i23;
            i34 = i24;
            i29 = i5;
            flexItemCount = i27;
            i31 = i402;
            mode = i18;
        }
        ycxVar2.f22399zb = i15;
    }

    private int zb(int i5, com.bytedance.adsdk.ugeno.lt.zb zbVar, int i11) {
        com.bytedance.adsdk.ugeno.lt.ycx ycxVar = this.f22396dj;
        int iZb = ycxVar.zb(i5, zbVar.dy() + zbVar.xkz() + ycxVar.getPaddingTop() + this.f22396dj.getPaddingBottom() + i11, zbVar.zb());
        int size = View.MeasureSpec.getSize(iZb);
        if (size > zbVar.jc()) {
            return View.MeasureSpec.makeMeasureSpec(zbVar.jc(), View.MeasureSpec.getMode(iZb));
        }
        return size < zbVar.fby() ? View.MeasureSpec.makeMeasureSpec(zbVar.fby(), View.MeasureSpec.getMode(iZb)) : iZb;
    }

    public void zb(int i5, int i11, int i12) {
        int mode;
        int size;
        int flexDirection = this.f22396dj.getFlexDirection();
        if (flexDirection != 0 && flexDirection != 1) {
            if (flexDirection != 2 && flexDirection != 3) {
                throw new IllegalArgumentException("Invalid flex direction: ".concat(String.valueOf(flexDirection)));
            }
            mode = View.MeasureSpec.getMode(i5);
            size = View.MeasureSpec.getSize(i5);
        } else {
            int mode2 = View.MeasureSpec.getMode(i11);
            int size2 = View.MeasureSpec.getSize(i11);
            mode = mode2;
            size = size2;
        }
        List<sya> flexLinesInternal = this.f22396dj.getFlexLinesInternal();
        if (mode == 1073741824) {
            int sumOfCrossSize = this.f22396dj.getSumOfCrossSize() + i12;
            int i13 = 0;
            if (flexLinesInternal.size() == 1) {
                flexLinesInternal.get(0).f22432ul = size - i12;
                return;
            }
            if (flexLinesInternal.size() >= 2) {
                int alignContent = this.f22396dj.getAlignContent();
                if (alignContent == 1) {
                    int i14 = size - sumOfCrossSize;
                    sya syaVar = new sya();
                    syaVar.f22432ul = i14;
                    flexLinesInternal.add(0, syaVar);
                    return;
                }
                if (alignContent == 2) {
                    this.f22396dj.setFlexLines(ycx(flexLinesInternal, size, sumOfCrossSize));
                    return;
                }
                if (alignContent == 3) {
                    if (sumOfCrossSize < size) {
                        float size3 = (size - sumOfCrossSize) / (flexLinesInternal.size() - 1);
                        ArrayList arrayList = new ArrayList();
                        int size4 = flexLinesInternal.size();
                        float f11 = 0.0f;
                        while (i13 < size4) {
                            arrayList.add(flexLinesInternal.get(i13));
                            if (i13 != flexLinesInternal.size() - 1) {
                                sya syaVar2 = new sya();
                                if (i13 == flexLinesInternal.size() - 2) {
                                    syaVar2.f22432ul = Math.round(f11 + size3);
                                    f11 = 0.0f;
                                } else {
                                    syaVar2.f22432ul = Math.round(size3);
                                }
                                int i15 = syaVar2.f22432ul;
                                float f12 = (size3 - i15) + f11;
                                if (f12 > 1.0f) {
                                    syaVar2.f22432ul = i15 + 1;
                                    f12 -= 1.0f;
                                } else if (f12 < -1.0f) {
                                    syaVar2.f22432ul = i15 - 1;
                                    f12 += 1.0f;
                                }
                                f11 = f12;
                                arrayList.add(syaVar2);
                            }
                            i13++;
                        }
                        this.f22396dj.setFlexLines(arrayList);
                        return;
                    }
                    return;
                }
                if (alignContent == 4) {
                    if (sumOfCrossSize >= size) {
                        this.f22396dj.setFlexLines(ycx(flexLinesInternal, size, sumOfCrossSize));
                        return;
                    }
                    int size5 = (size - sumOfCrossSize) / (flexLinesInternal.size() * 2);
                    ArrayList arrayList2 = new ArrayList();
                    sya syaVar3 = new sya();
                    syaVar3.f22432ul = size5;
                    for (sya syaVar4 : flexLinesInternal) {
                        arrayList2.add(syaVar3);
                        arrayList2.add(syaVar4);
                        arrayList2.add(syaVar3);
                    }
                    this.f22396dj.setFlexLines(arrayList2);
                    return;
                }
                if (alignContent == 5 && sumOfCrossSize < size) {
                    float size6 = (size - sumOfCrossSize) / flexLinesInternal.size();
                    int size7 = flexLinesInternal.size();
                    float f13 = 0.0f;
                    while (i13 < size7) {
                        sya syaVar5 = flexLinesInternal.get(i13);
                        float f14 = syaVar5.f22432ul + size6;
                        if (i13 == flexLinesInternal.size() - 1) {
                            f14 += f13;
                            f13 = 0.0f;
                        }
                        int iRound = Math.round(f14);
                        float f15 = (f14 - iRound) + f13;
                        if (f15 > 1.0f) {
                            iRound++;
                            f15 -= 1.0f;
                        } else if (f15 < -1.0f) {
                            iRound--;
                            f15 += 1.0f;
                        }
                        f13 = f15;
                        syaVar5.f22432ul = iRound;
                        i13++;
                    }
                }
            }
        }
    }

    private void ycx(CompoundButton compoundButton) {
        com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) compoundButton.getLayoutParams();
        int iUl = zbVar.ul();
        int iFby = zbVar.fby();
        Drawable drawableYcx = com.bytedance.adsdk.ugeno.fby.lud.ycx(compoundButton);
        int minimumWidth = drawableYcx == null ? 0 : drawableYcx.getMinimumWidth();
        int minimumHeight = drawableYcx != null ? drawableYcx.getMinimumHeight() : 0;
        if (iUl == -1) {
            iUl = minimumWidth;
        }
        zbVar.ycx(iUl);
        if (iFby == -1) {
            iFby = minimumHeight;
        }
        zbVar.zb(iFby);
    }

    private int ycx(boolean z11) {
        if (z11) {
            return this.f22396dj.getPaddingStart();
        }
        return this.f22396dj.getPaddingTop();
    }

    private void zb(View view, int i5, int i11) {
        int measuredHeight;
        com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) view.getLayoutParams();
        int iMin = Math.min(Math.max(((i5 - zbVar.ry()) - zbVar.syc()) - this.f22396dj.ycx(view), zbVar.ul()), zbVar.jw());
        long[] jArr = this.f22397lt;
        if (jArr != null) {
            measuredHeight = zb(jArr[i11]);
        } else {
            measuredHeight = view.getMeasuredHeight();
        }
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iMin, 1073741824);
        view.measure(iMakeMeasureSpec2, iMakeMeasureSpec);
        ycx(i11, iMakeMeasureSpec2, iMakeMeasureSpec, view);
    }

    private int ycx(View view, boolean z11) {
        if (z11) {
            return view.getMeasuredWidth();
        }
        return view.getMeasuredHeight();
    }

    private int ycx(com.bytedance.adsdk.ugeno.lt.zb zbVar, boolean z11) {
        if (z11) {
            return zbVar.ycx();
        }
        return zbVar.zb();
    }

    private boolean ycx(View view, int i5, int i11, int i12, int i13, com.bytedance.adsdk.ugeno.lt.zb zbVar, int i14, int i15, int i16) {
        if (this.f22396dj.getFlexWrap() == 0) {
            return false;
        }
        if (zbVar.ea()) {
            return true;
        }
        if (i5 == 0) {
            return false;
        }
        int maxLine = this.f22396dj.getMaxLine();
        if (maxLine != -1 && maxLine <= i16 + 1) {
            return false;
        }
        int iYcx = this.f22396dj.ycx(view, i14, i15);
        if (iYcx > 0) {
            i13 += iYcx;
        }
        return i11 < i12 + i13;
    }

    private boolean ycx(int i5, int i11, sya syaVar) {
        return i5 == i11 - 1 && syaVar.zb() != 0;
    }

    private void ycx(List<sya> list, sya syaVar, int i5, int i11) {
        syaVar.f22431ry = i11;
        this.f22396dj.ycx(syaVar);
        syaVar.f22425dy = i5;
        list.add(syaVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:20:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(View view, int i5) {
        boolean z11;
        com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) view.getLayoutParams();
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        boolean z12 = true;
        if (measuredWidth < zbVar.ul()) {
            measuredWidth = zbVar.ul();
        } else if (measuredWidth > zbVar.jw()) {
            measuredWidth = zbVar.jw();
        } else {
            z11 = false;
            if (measuredHeight >= zbVar.fby()) {
                measuredHeight = zbVar.fby();
            } else if (measuredHeight > zbVar.jc()) {
                measuredHeight = zbVar.jc();
            } else {
                z12 = z11;
            }
            if (z12) {
                return;
            }
            int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824);
            int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
            view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
            ycx(i5, iMakeMeasureSpec, iMakeMeasureSpec2, view);
            return;
        }
        z11 = true;
        if (measuredHeight >= zbVar.fby()) {
        }
        if (z12) {
        }
    }

    public void ycx(int i5, int i11) {
        ycx(i5, i11, 0);
    }

    public void ycx(int i5, int i11, int i12) {
        int size;
        int paddingLeft;
        int paddingRight;
        int i13;
        int i14;
        sya(this.f22396dj.getFlexItemCount());
        if (i12 >= this.f22396dj.getFlexItemCount()) {
            return;
        }
        int flexDirection = this.f22396dj.getFlexDirection();
        int flexDirection2 = this.f22396dj.getFlexDirection();
        if (flexDirection2 == 0 || flexDirection2 == 1) {
            int mode = View.MeasureSpec.getMode(i5);
            size = View.MeasureSpec.getSize(i5);
            int largestMainSize = this.f22396dj.getLargestMainSize();
            if (mode != 1073741824) {
                size = Math.min(largestMainSize, size);
            }
            paddingLeft = this.f22396dj.getPaddingLeft();
            paddingRight = this.f22396dj.getPaddingRight();
        } else {
            if (flexDirection2 != 2 && flexDirection2 != 3) {
                throw new IllegalArgumentException("Invalid flex direction: ".concat(String.valueOf(flexDirection)));
            }
            int mode2 = View.MeasureSpec.getMode(i11);
            size = View.MeasureSpec.getSize(i11);
            if (mode2 != 1073741824) {
                size = this.f22396dj.getLargestMainSize();
            }
            paddingLeft = this.f22396dj.getPaddingTop();
            paddingRight = this.f22396dj.getPaddingBottom();
        }
        int i15 = paddingLeft + paddingRight;
        int i16 = size;
        int[] iArr = this.ycx;
        int i17 = iArr != null ? iArr[i12] : 0;
        List<sya> flexLinesInternal = this.f22396dj.getFlexLinesInternal();
        int size2 = flexLinesInternal.size();
        while (i17 < size2) {
            sya syaVar = flexLinesInternal.get(i17);
            int i18 = syaVar.lud;
            if (i18 < i16 && syaVar.wie) {
                i13 = i5;
                i14 = i11;
                ycx(i13, i14, syaVar, i16, i15, false);
            } else {
                i13 = i5;
                i14 = i11;
                if (i18 > i16 && syaVar.pmi) {
                    zb(i13, i14, syaVar, i16, i15, false);
                }
            }
            i17++;
            i5 = i13;
            i11 = i14;
        }
    }

    private void ycx(int i5, int i11, sya syaVar, int i12, int i13, boolean z11) {
        int i14;
        float f11;
        float f12;
        int iMax;
        double d5;
        double d11;
        float f13 = syaVar.f22427jc;
        float f14 = 0.0f;
        if (f13 <= 0.0f || i12 < (i14 = syaVar.lud)) {
            return;
        }
        float f15 = (i12 - i14) / f13;
        syaVar.lud = i13 + syaVar.f22429lt;
        if (!z11) {
            syaVar.f22432ul = Integer.MIN_VALUE;
        }
        int i15 = 0;
        boolean z12 = false;
        int i16 = 0;
        float f16 = 0.0f;
        while (i15 < syaVar.fby) {
            int i17 = syaVar.syc + i15;
            View viewZb = this.f22396dj.zb(i17);
            if (viewZb == null || viewZb.getVisibility() == 8) {
                f11 = f14;
                f12 = f15;
                z12 = z12;
            } else {
                com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) viewZb.getLayoutParams();
                int flexDirection = this.f22396dj.getFlexDirection();
                f11 = f14;
                if (flexDirection != 0 && flexDirection != 1) {
                    int measuredHeight = viewZb.getMeasuredHeight();
                    long[] jArr = this.f22397lt;
                    if (jArr != null) {
                        measuredHeight = zb(jArr[i17]);
                    }
                    int measuredWidth = viewZb.getMeasuredWidth();
                    long[] jArr2 = this.f22397lt;
                    f12 = f15;
                    boolean z13 = z12;
                    if (jArr2 != null) {
                        measuredWidth = ycx(jArr2[i17]);
                    }
                    if (this.lud[i17] || zbVar.dj() <= f11) {
                        z12 = z13;
                    } else {
                        float fDj = (zbVar.dj() * f12) + measuredHeight;
                        if (i15 == syaVar.fby - 1) {
                            fDj += f16;
                            f16 = f11;
                        }
                        int iRound = Math.round(fDj);
                        if (iRound > zbVar.jc()) {
                            iRound = zbVar.jc();
                            this.lud[i17] = true;
                            syaVar.f22427jc -= zbVar.dj();
                            z12 = true;
                        } else {
                            float f17 = (fDj - iRound) + f16;
                            double d12 = f17;
                            if (d12 > 1.0d) {
                                iRound++;
                                d11 = d12 - 1.0d;
                            } else {
                                if (d12 < -1.0d) {
                                    iRound--;
                                    d11 = d12 + 1.0d;
                                }
                                f16 = f17;
                                z12 = z13;
                            }
                            f17 = (float) d11;
                            f16 = f17;
                            z12 = z13;
                        }
                        int iYcx = ycx(i5, zbVar, syaVar.f22431ry);
                        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iRound, 1073741824);
                        viewZb.measure(iYcx, iMakeMeasureSpec);
                        int measuredWidth2 = viewZb.getMeasuredWidth();
                        int measuredHeight2 = viewZb.getMeasuredHeight();
                        ycx(i17, iYcx, iMakeMeasureSpec, viewZb);
                        measuredWidth = measuredWidth2;
                        measuredHeight = measuredHeight2;
                    }
                    iMax = Math.max(i16, zbVar.syc() + zbVar.ry() + measuredWidth + this.f22396dj.ycx(viewZb));
                    syaVar.lud = zbVar.dy() + zbVar.xkz() + measuredHeight + syaVar.lud;
                } else {
                    f12 = f15;
                    boolean z14 = z12;
                    int measuredWidth3 = viewZb.getMeasuredWidth();
                    long[] jArr3 = this.f22397lt;
                    if (jArr3 != null) {
                        measuredWidth3 = ycx(jArr3[i17]);
                    }
                    int measuredHeight3 = viewZb.getMeasuredHeight();
                    long[] jArr4 = this.f22397lt;
                    if (jArr4 != null) {
                        measuredHeight3 = zb(jArr4[i17]);
                    }
                    if (this.lud[i17] || zbVar.dj() <= f11) {
                        z12 = z14;
                    } else {
                        float fDj2 = (zbVar.dj() * f12) + measuredWidth3;
                        if (i15 == syaVar.fby - 1) {
                            fDj2 += f16;
                            f16 = f11;
                        }
                        int iRound2 = Math.round(fDj2);
                        if (iRound2 > zbVar.jw()) {
                            iRound2 = zbVar.jw();
                            this.lud[i17] = true;
                            syaVar.f22427jc -= zbVar.dj();
                            z12 = true;
                        } else {
                            float f18 = (fDj2 - iRound2) + f16;
                            double d13 = f18;
                            if (d13 > 1.0d) {
                                iRound2++;
                                d5 = d13 - 1.0d;
                            } else {
                                if (d13 < -1.0d) {
                                    iRound2--;
                                    d5 = d13 + 1.0d;
                                }
                                f16 = f18;
                                z12 = z14;
                            }
                            f18 = (float) d5;
                            f16 = f18;
                            z12 = z14;
                        }
                        int iZb = zb(i11, zbVar, syaVar.f22431ry);
                        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iRound2, 1073741824);
                        viewZb.measure(iMakeMeasureSpec2, iZb);
                        int measuredWidth4 = viewZb.getMeasuredWidth();
                        int measuredHeight4 = viewZb.getMeasuredHeight();
                        ycx(i17, iMakeMeasureSpec2, iZb, viewZb);
                        measuredWidth3 = measuredWidth4;
                        measuredHeight3 = measuredHeight4;
                    }
                    int iMax2 = Math.max(i16, zbVar.dy() + zbVar.xkz() + measuredHeight3 + this.f22396dj.ycx(viewZb));
                    syaVar.lud = zbVar.syc() + zbVar.ry() + measuredWidth3 + syaVar.lud;
                    iMax = iMax2;
                }
                syaVar.f22432ul = Math.max(syaVar.f22432ul, iMax);
                i16 = iMax;
            }
            i15++;
            f15 = f12;
            f14 = f11;
        }
        if (!z12 || i14 == syaVar.lud) {
            return;
        }
        ycx(i5, i11, syaVar, i12, i13, true);
    }

    private int ycx(int i5, com.bytedance.adsdk.ugeno.lt.zb zbVar, int i11) {
        com.bytedance.adsdk.ugeno.lt.ycx ycxVar = this.f22396dj;
        int iYcx = ycxVar.ycx(i5, zbVar.syc() + zbVar.ry() + ycxVar.getPaddingLeft() + this.f22396dj.getPaddingRight() + i11, zbVar.ycx());
        int size = View.MeasureSpec.getSize(iYcx);
        if (size > zbVar.jw()) {
            return View.MeasureSpec.makeMeasureSpec(zbVar.jw(), View.MeasureSpec.getMode(iYcx));
        }
        return size < zbVar.ul() ? View.MeasureSpec.makeMeasureSpec(zbVar.ul(), View.MeasureSpec.getMode(iYcx)) : iYcx;
    }

    private List<sya> ycx(List<sya> list, int i5, int i11) {
        int i12 = (i5 - i11) / 2;
        ArrayList arrayList = new ArrayList();
        sya syaVar = new sya();
        syaVar.f22432ul = i12;
        int size = list.size();
        for (int i13 = 0; i13 < size; i13++) {
            if (i13 == 0) {
                arrayList.add(syaVar);
            }
            arrayList.add(list.get(i13));
            if (i13 == list.size() - 1) {
                arrayList.add(syaVar);
            }
        }
        return arrayList;
    }

    public void ycx() {
        ycx(0);
    }

    public void ycx(int i5) {
        View viewZb;
        if (i5 >= this.f22396dj.getFlexItemCount()) {
            return;
        }
        int flexDirection = this.f22396dj.getFlexDirection();
        if (this.f22396dj.getAlignItems() == 4) {
            int[] iArr = this.ycx;
            List<sya> flexLinesInternal = this.f22396dj.getFlexLinesInternal();
            int size = flexLinesInternal.size();
            for (int i11 = iArr != null ? iArr[i5] : 0; i11 < size; i11++) {
                sya syaVar = flexLinesInternal.get(i11);
                int i12 = syaVar.fby;
                for (int i13 = 0; i13 < i12; i13++) {
                    int i14 = syaVar.syc + i13;
                    if (i13 < this.f22396dj.getFlexItemCount() && (viewZb = this.f22396dj.zb(i14)) != null && viewZb.getVisibility() != 8) {
                        com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) viewZb.getLayoutParams();
                        if (zbVar.lt() == -1 || zbVar.lt() == 4) {
                            if (flexDirection != 0 && flexDirection != 1) {
                                if (flexDirection != 2 && flexDirection != 3) {
                                    throw new IllegalArgumentException("Invalid flex direction: ".concat(String.valueOf(flexDirection)));
                                }
                                zb(viewZb, syaVar.f22432ul, i14);
                            } else {
                                ycx(viewZb, syaVar.f22432ul, i14);
                            }
                        }
                    }
                }
            }
            return;
        }
        for (sya syaVar2 : this.f22396dj.getFlexLinesInternal()) {
            for (Integer num : syaVar2.xkz) {
                View viewZb2 = this.f22396dj.zb(num.intValue());
                if (flexDirection != 0 && flexDirection != 1) {
                    if (flexDirection != 2 && flexDirection != 3) {
                        throw new IllegalArgumentException("Invalid flex direction: ".concat(String.valueOf(flexDirection)));
                    }
                    zb(viewZb2, syaVar2.f22432ul, num.intValue());
                } else {
                    ycx(viewZb2, syaVar2.f22432ul, num.intValue());
                }
            }
        }
    }

    private void ycx(View view, int i5, int i11) {
        int measuredWidth;
        com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) view.getLayoutParams();
        int iMin = Math.min(Math.max(((i5 - zbVar.xkz()) - zbVar.dy()) - this.f22396dj.ycx(view), zbVar.fby()), zbVar.jc());
        long[] jArr = this.f22397lt;
        if (jArr != null) {
            measuredWidth = ycx(jArr[i11]);
        } else {
            measuredWidth = view.getMeasuredWidth();
        }
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iMin, 1073741824);
        view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        ycx(i11, iMakeMeasureSpec, iMakeMeasureSpec2, view);
    }

    public void ycx(View view, sya syaVar, int i5, int i11, int i12, int i13) {
        com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) view.getLayoutParams();
        int alignItems = this.f22396dj.getAlignItems();
        if (zbVar.lt() != -1) {
            alignItems = zbVar.lt();
        }
        int i14 = syaVar.f22432ul;
        if (alignItems != 0) {
            if (alignItems == 1) {
                if (this.f22396dj.getFlexWrap() != 2) {
                    int i15 = i11 + i14;
                    view.layout(i5, (i15 - view.getMeasuredHeight()) - zbVar.dy(), i12, i15 - zbVar.dy());
                    return;
                }
                view.layout(i5, zbVar.xkz() + view.getMeasuredHeight() + (i11 - i14), i12, zbVar.xkz() + view.getMeasuredHeight() + (i13 - i14));
                return;
            }
            if (alignItems == 2) {
                int iXkz = ((zbVar.xkz() + (i14 - view.getMeasuredHeight())) - zbVar.dy()) / 2;
                if (this.f22396dj.getFlexWrap() != 2) {
                    int i16 = i11 + iXkz;
                    view.layout(i5, i16, i12, view.getMeasuredHeight() + i16);
                    return;
                } else {
                    int i17 = i11 - iXkz;
                    view.layout(i5, i17, i12, view.getMeasuredHeight() + i17);
                    return;
                }
            }
            if (alignItems == 3) {
                if (this.f22396dj.getFlexWrap() != 2) {
                    int iMax = Math.max(syaVar.f22430ok - view.getBaseline(), zbVar.xkz());
                    view.layout(i5, i11 + iMax, i12, i13 + iMax);
                    return;
                } else {
                    int iMax2 = Math.max(view.getBaseline() + (syaVar.f22430ok - view.getMeasuredHeight()), zbVar.dy());
                    view.layout(i5, i11 - iMax2, i12, i13 - iMax2);
                    return;
                }
            }
            if (alignItems != 4) {
                return;
            }
        }
        if (this.f22396dj.getFlexWrap() != 2) {
            view.layout(i5, zbVar.xkz() + i11, i12, zbVar.xkz() + i13);
        } else {
            view.layout(i5, i11 - zbVar.dy(), i12, i13 - zbVar.dy());
        }
    }

    public void ycx(View view, sya syaVar, boolean z11, int i5, int i11, int i12, int i13) {
        com.bytedance.adsdk.ugeno.lt.zb zbVar = (com.bytedance.adsdk.ugeno.lt.zb) view.getLayoutParams();
        int alignItems = this.f22396dj.getAlignItems();
        if (zbVar.lt() != -1) {
            alignItems = zbVar.lt();
        }
        int i14 = syaVar.f22432ul;
        if (alignItems != 0) {
            if (alignItems == 1) {
                if (!z11) {
                    view.layout(((i5 + i14) - view.getMeasuredWidth()) - zbVar.syc(), i11, ((i12 + i14) - view.getMeasuredWidth()) - zbVar.syc(), i13);
                    return;
                }
                view.layout(zbVar.ry() + view.getMeasuredWidth() + (i5 - i14), i11, zbVar.ry() + view.getMeasuredWidth() + (i12 - i14), i13);
                return;
            }
            if (alignItems == 2) {
                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                int iYcx = ((com.bytedance.adsdk.ugeno.fby.lt.ycx(marginLayoutParams) + (i14 - view.getMeasuredWidth())) - com.bytedance.adsdk.ugeno.fby.lt.zb(marginLayoutParams)) / 2;
                if (!z11) {
                    view.layout(i5 + iYcx, i11, i12 + iYcx, i13);
                    return;
                } else {
                    view.layout(i5 - iYcx, i11, i12 - iYcx, i13);
                    return;
                }
            }
            if (alignItems != 3 && alignItems != 4) {
                return;
            }
        }
        if (!z11) {
            view.layout(zbVar.ry() + i5, i11, zbVar.ry() + i12, i13);
        } else {
            view.layout(i5 - zbVar.syc(), i11, i12 - zbVar.syc(), i13);
        }
    }

    private void ycx(int i5, int i11, int i12, View view) {
        long[] jArr = this.f22398zb;
        if (jArr != null) {
            jArr[i5] = zb(i11, i12);
        }
        long[] jArr2 = this.f22397lt;
        if (jArr2 != null) {
            jArr2[i5] = zb(view.getMeasuredWidth(), view.getMeasuredHeight());
        }
    }
}
