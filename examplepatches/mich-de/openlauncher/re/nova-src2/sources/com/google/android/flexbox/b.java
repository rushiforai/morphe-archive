package com.google.android.flexbox;

import android.graphics.drawable.Drawable;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import b.c0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final ag.a f31677a;

    /* renamed from: b, reason: collision with root package name */
    public boolean[] f31678b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f31679c;

    /* renamed from: d, reason: collision with root package name */
    public long[] f31680d;

    /* renamed from: e, reason: collision with root package name */
    public long[] f31681e;

    public b(ag.a aVar) {
        this.f31677a = aVar;
    }

    public static ArrayList e(int i5, int i11, List list) {
        int i12 = (i5 - i11) / 2;
        ArrayList arrayList = new ArrayList();
        a aVar = new a();
        aVar.f31667g = i12;
        int size = list.size();
        for (int i13 = 0; i13 < size; i13++) {
            if (i13 == 0) {
                arrayList.add(aVar);
            }
            arrayList.add((a) list.get(i13));
            if (i13 == list.size() - 1) {
                arrayList.add(aVar);
            }
        }
        return arrayList;
    }

    public static int[] r(int i5, ArrayList arrayList, SparseIntArray sparseIntArray) {
        Collections.sort(arrayList);
        sparseIntArray.clear();
        int[] iArr = new int[i5];
        Iterator it = arrayList.iterator();
        int i11 = 0;
        while (it.hasNext()) {
            ag.c cVar = (ag.c) it.next();
            int i12 = cVar.f12782a;
            iArr[i11] = i12;
            sparseIntArray.append(i12, cVar.f12783b);
            i11++;
        }
        return iArr;
    }

    public final void a(List list, a aVar, int i5, int i11) {
        aVar.f31673m = i11;
        this.f31677a.f(aVar);
        aVar.f31674p = i5;
        list.add(aVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:119:0x028d  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x028f  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x029d  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x029f  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x02a7  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x02b1  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02b6  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x02c1  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x02c9  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02ce  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x02ee  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x02f3  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x02f9  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0305  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x030a  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x0322  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0355  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0366  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x038b A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(ag.b bVar, int i5, int i11, int i12, int i13, int i14, List list) {
        List list2;
        int i15;
        int iD;
        FlexItem flexItem;
        int i16;
        int[] iArr;
        boolean z11;
        int i17 = i5;
        ag.a aVar = this.f31677a;
        boolean zK = aVar.k();
        int mode = View.MeasureSpec.getMode(i17);
        int size = View.MeasureSpec.getSize(i17);
        List arrayList = list == null ? new ArrayList() : list;
        bVar.f12781b = arrayList;
        boolean z12 = i14 == -1;
        int paddingStart = zK ? aVar.getPaddingStart() : aVar.getPaddingTop();
        int paddingEnd = zK ? aVar.getPaddingEnd() : aVar.getPaddingBottom();
        int paddingTop = zK ? aVar.getPaddingTop() : aVar.getPaddingStart();
        int paddingBottom = zK ? aVar.getPaddingBottom() : aVar.getPaddingEnd();
        a aVar2 = new a();
        int i18 = i13;
        int i19 = 1;
        aVar2.o = i18;
        int i21 = paddingStart + paddingEnd;
        aVar2.f31665e = i21;
        int flexItemCount = aVar.getFlexItemCount();
        boolean z13 = z12;
        int i22 = Integer.MIN_VALUE;
        int iCombineMeasuredStates = 0;
        int i23 = 0;
        int i24 = 0;
        while (i18 < flexItemCount) {
            int i25 = flexItemCount;
            View viewG = aVar.g(i18);
            if (viewG == null) {
                if (i18 == i25 - 1 && aVar2.a() != 0) {
                    a(arrayList, aVar2, i18, i23);
                }
            } else if (viewG.getVisibility() == 8) {
                aVar2.f31669i++;
                aVar2.f31668h++;
                if (i18 == i25 - 1 && aVar2.a() != 0) {
                    a(arrayList, aVar2, i18, i23);
                }
            } else {
                if (viewG instanceof CompoundButton) {
                    CompoundButton compoundButton = (CompoundButton) viewG;
                    FlexItem flexItem2 = (FlexItem) compoundButton.getLayoutParams();
                    int iB = flexItem2.B();
                    i15 = i21;
                    int iA0 = flexItem2.A0();
                    Drawable buttonDrawable = compoundButton.getButtonDrawable();
                    int minimumWidth = buttonDrawable == null ? 0 : buttonDrawable.getMinimumWidth();
                    int minimumHeight = buttonDrawable == null ? 0 : buttonDrawable.getMinimumHeight();
                    list2 = arrayList;
                    if (iB == -1) {
                        iB = minimumWidth;
                    }
                    flexItem2.setMinWidth(iB);
                    if (iA0 == -1) {
                        iA0 = minimumHeight;
                    }
                    flexItem2.I(iA0);
                } else {
                    list2 = arrayList;
                    i15 = i21;
                }
                FlexItem flexItem3 = (FlexItem) viewG.getLayoutParams();
                if (flexItem3.t() == 4) {
                    aVar2.n.add(Integer.valueOf(i18));
                }
                int width = zK ? flexItem3.getWidth() : flexItem3.getHeight();
                if (flexItem3.L() != -1.0f && mode == 1073741824) {
                    width = Math.round(size * flexItem3.L());
                }
                if (zK) {
                    iD = aVar.b(i17, i15 + flexItem3.n0() + flexItem3.z0(), width);
                    int iD2 = aVar.d(i11, paddingTop + paddingBottom + flexItem3.G() + flexItem3.l0() + i23, flexItem3.getHeight());
                    viewG.measure(iD, iD2);
                    v(i18, iD, iD2, viewG);
                } else {
                    int iB2 = aVar.b(i11, paddingTop + paddingBottom + flexItem3.n0() + flexItem3.z0() + i23, flexItem3.getWidth());
                    iD = aVar.d(i17, i15 + flexItem3.G() + flexItem3.l0(), width);
                    viewG.measure(iB2, iD);
                    v(i18, iB2, iD, viewG);
                }
                aVar.h(i18, viewG);
                c(i18, viewG);
                iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, viewG.getMeasuredState());
                int i26 = aVar2.f31665e;
                int measuredWidth = (zK ? viewG.getMeasuredWidth() : viewG.getMeasuredHeight()) + (zK ? flexItem3.n0() : flexItem3.G()) + (zK ? flexItem3.z0() : flexItem3.l0());
                int size2 = list2.size();
                if (aVar.getFlexWrap() != 0) {
                    if (flexItem3.R()) {
                        flexItem = flexItem3;
                    } else {
                        if (mode != 0) {
                            flexItem = flexItem3;
                            int maxLine = aVar.getMaxLine();
                            if (maxLine == -1 || maxLine > size2 + 1) {
                                int iJ = aVar.j(viewG, i18, i24);
                                if (iJ > 0) {
                                    measuredWidth += iJ;
                                }
                                if (size < i26 + measuredWidth) {
                                }
                                aVar2.f31675q |= flexItem.K() == 0.0f;
                                aVar2.f31676r |= flexItem.v() == 0.0f;
                                iArr = this.f31679c;
                                if (iArr != null) {
                                    iArr[i18] = arrayList.size();
                                }
                                aVar2.f31665e = (!zK ? viewG.getMeasuredWidth() : viewG.getMeasuredHeight()) + (!zK ? flexItem.n0() : flexItem.G()) + (!zK ? flexItem.z0() : flexItem.l0()) + aVar2.f31665e;
                                aVar2.f31670j += flexItem.K();
                                aVar2.f31671k += flexItem.v();
                                aVar.a(viewG, i18, i24, aVar2);
                                int iMax = Math.max(i16, aVar.e(viewG) + (!zK ? viewG.getMeasuredHeight() : viewG.getMeasuredWidth()) + (!zK ? flexItem.G() : flexItem.n0()) + (!zK ? flexItem.l0() : flexItem.z0()));
                                aVar2.f31667g = Math.max(aVar2.f31667g, iMax);
                                if (zK) {
                                    if (aVar.getFlexWrap() != 2) {
                                        aVar2.f31672l = Math.max(aVar2.f31672l, viewG.getBaseline() + flexItem.G());
                                    } else {
                                        aVar2.f31672l = Math.max(aVar2.f31672l, (viewG.getMeasuredHeight() - viewG.getBaseline()) + flexItem.l0());
                                    }
                                }
                                if (i18 == i25 - 1 && aVar2.a() != 0) {
                                    a(arrayList, aVar2, i18, i23);
                                    i23 += aVar2.f31667g;
                                }
                                if (i14 == -1 && arrayList.size() > 0) {
                                    if (((a) a2.c.e(1, arrayList)).f31674p >= i14 && i18 >= i14 && !z13) {
                                        i23 = -aVar2.f31667g;
                                        z11 = true;
                                    }
                                    if (i23 <= i12 && z11) {
                                        break;
                                    }
                                    i22 = iMax;
                                    i18++;
                                    z13 = z11;
                                    flexItemCount = i25;
                                    i19 = 1;
                                    i17 = i5;
                                }
                                z11 = z13;
                                if (i23 <= i12) {
                                }
                                i22 = iMax;
                                i18++;
                                z13 = z11;
                                flexItemCount = i25;
                                i19 = 1;
                                i17 = i5;
                            }
                        }
                        i21 = i15;
                        arrayList = list2;
                        aVar2.f31668h += i19;
                        i24++;
                        i16 = i22;
                        aVar2.f31675q |= flexItem.K() == 0.0f;
                        aVar2.f31676r |= flexItem.v() == 0.0f;
                        iArr = this.f31679c;
                        if (iArr != null) {
                        }
                        aVar2.f31665e = (!zK ? viewG.getMeasuredWidth() : viewG.getMeasuredHeight()) + (!zK ? flexItem.n0() : flexItem.G()) + (!zK ? flexItem.z0() : flexItem.l0()) + aVar2.f31665e;
                        aVar2.f31670j += flexItem.K();
                        aVar2.f31671k += flexItem.v();
                        aVar.a(viewG, i18, i24, aVar2);
                        int iMax2 = Math.max(i16, aVar.e(viewG) + (!zK ? viewG.getMeasuredHeight() : viewG.getMeasuredWidth()) + (!zK ? flexItem.G() : flexItem.n0()) + (!zK ? flexItem.l0() : flexItem.z0()));
                        aVar2.f31667g = Math.max(aVar2.f31667g, iMax2);
                        if (zK) {
                        }
                        if (i18 == i25 - 1) {
                            a(arrayList, aVar2, i18, i23);
                            i23 += aVar2.f31667g;
                        }
                        if (i14 == -1) {
                        }
                        z11 = z13;
                        if (i23 <= i12) {
                        }
                        i22 = iMax2;
                        i18++;
                        z13 = z11;
                        flexItemCount = i25;
                        i19 = 1;
                        i17 = i5;
                    }
                    if (aVar2.a() > 0) {
                        arrayList = list2;
                        a(arrayList, aVar2, i18 > 0 ? i18 - 1 : 0, i23);
                        i23 += aVar2.f31667g;
                    } else {
                        arrayList = list2;
                    }
                    if (zK) {
                        if (flexItem.getHeight() == -1) {
                            viewG.measure(iD, aVar.d(i11, aVar.getPaddingBottom() + aVar.getPaddingTop() + flexItem.G() + flexItem.l0() + i23, flexItem.getHeight()));
                            c(i18, viewG);
                        }
                    } else if (flexItem.getWidth() == -1) {
                        viewG.measure(aVar.b(i11, aVar.getPaddingRight() + aVar.getPaddingLeft() + flexItem.n0() + flexItem.z0() + i23, flexItem.getWidth()), iD);
                        c(i18, viewG);
                    }
                    aVar2 = new a();
                    aVar2.f31668h = i19;
                    i21 = i15;
                    aVar2.f31665e = i21;
                    aVar2.o = i18;
                    i16 = Integer.MIN_VALUE;
                    i24 = 0;
                    aVar2.f31675q |= flexItem.K() == 0.0f;
                    aVar2.f31676r |= flexItem.v() == 0.0f;
                    iArr = this.f31679c;
                    if (iArr != null) {
                    }
                    aVar2.f31665e = (!zK ? viewG.getMeasuredWidth() : viewG.getMeasuredHeight()) + (!zK ? flexItem.n0() : flexItem.G()) + (!zK ? flexItem.z0() : flexItem.l0()) + aVar2.f31665e;
                    aVar2.f31670j += flexItem.K();
                    aVar2.f31671k += flexItem.v();
                    aVar.a(viewG, i18, i24, aVar2);
                    int iMax22 = Math.max(i16, aVar.e(viewG) + (!zK ? viewG.getMeasuredHeight() : viewG.getMeasuredWidth()) + (!zK ? flexItem.G() : flexItem.n0()) + (!zK ? flexItem.l0() : flexItem.z0()));
                    aVar2.f31667g = Math.max(aVar2.f31667g, iMax22);
                    if (zK) {
                    }
                    if (i18 == i25 - 1) {
                    }
                    if (i14 == -1) {
                    }
                    z11 = z13;
                    if (i23 <= i12) {
                    }
                    i22 = iMax22;
                    i18++;
                    z13 = z11;
                    flexItemCount = i25;
                    i19 = 1;
                    i17 = i5;
                }
                flexItem = flexItem3;
                i21 = i15;
                arrayList = list2;
                aVar2.f31668h += i19;
                i24++;
                i16 = i22;
                aVar2.f31675q |= flexItem.K() == 0.0f;
                aVar2.f31676r |= flexItem.v() == 0.0f;
                iArr = this.f31679c;
                if (iArr != null) {
                }
                aVar2.f31665e = (!zK ? viewG.getMeasuredWidth() : viewG.getMeasuredHeight()) + (!zK ? flexItem.n0() : flexItem.G()) + (!zK ? flexItem.z0() : flexItem.l0()) + aVar2.f31665e;
                aVar2.f31670j += flexItem.K();
                aVar2.f31671k += flexItem.v();
                aVar.a(viewG, i18, i24, aVar2);
                int iMax222 = Math.max(i16, aVar.e(viewG) + (!zK ? viewG.getMeasuredHeight() : viewG.getMeasuredWidth()) + (!zK ? flexItem.G() : flexItem.n0()) + (!zK ? flexItem.l0() : flexItem.z0()));
                aVar2.f31667g = Math.max(aVar2.f31667g, iMax222);
                if (zK) {
                }
                if (i18 == i25 - 1) {
                }
                if (i14 == -1) {
                }
                z11 = z13;
                if (i23 <= i12) {
                }
                i22 = iMax222;
                i18++;
                z13 = z11;
                flexItemCount = i25;
                i19 = 1;
                i17 = i5;
            }
            z11 = z13;
            i18++;
            z13 = z11;
            flexItemCount = i25;
            i19 = 1;
            i17 = i5;
        }
        bVar.f12780a = iCombineMeasuredStates;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:20:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(int i5, View view) {
        boolean z11;
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        boolean z12 = true;
        if (measuredWidth < flexItem.B()) {
            measuredWidth = flexItem.B();
        } else {
            if (measuredWidth <= flexItem.U()) {
                z11 = false;
                if (measuredHeight >= flexItem.A0()) {
                    measuredHeight = flexItem.A0();
                } else if (measuredHeight > flexItem.D0()) {
                    measuredHeight = flexItem.D0();
                } else {
                    z12 = z11;
                }
                if (z12) {
                    return;
                }
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824);
                int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
                view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
                v(i5, iMakeMeasureSpec, iMakeMeasureSpec2, view);
                this.f31677a.h(i5, view);
                return;
            }
            measuredWidth = flexItem.U();
        }
        z11 = true;
        if (measuredHeight >= flexItem.A0()) {
        }
        if (z12) {
        }
    }

    public final void d(int i5, List list) {
        int i11 = this.f31679c[i5];
        if (i11 == -1) {
            i11 = 0;
        }
        if (list.size() > i11) {
            list.subList(i11, list.size()).clear();
        }
        int[] iArr = this.f31679c;
        int length = iArr.length - 1;
        if (i5 > length) {
            Arrays.fill(iArr, -1);
        } else {
            Arrays.fill(iArr, i5, length, -1);
        }
        long[] jArr = this.f31680d;
        int length2 = jArr.length - 1;
        if (i5 > length2) {
            Arrays.fill(jArr, 0L);
        } else {
            Arrays.fill(jArr, i5, length2, 0L);
        }
    }

    public final ArrayList f(int i5) {
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            FlexItem flexItem = (FlexItem) this.f31677a.c(i11).getLayoutParams();
            ag.c cVar = new ag.c();
            cVar.f12783b = flexItem.getOrder();
            cVar.f12782a = i11;
            arrayList.add(cVar);
        }
        return arrayList;
    }

    public final void g(int i5, int i11, int i12) {
        int mode;
        int size;
        ag.a aVar = this.f31677a;
        int flexDirection = aVar.getFlexDirection();
        if (flexDirection == 0 || flexDirection == 1) {
            mode = View.MeasureSpec.getMode(i11);
            size = View.MeasureSpec.getSize(i11);
        } else {
            if (flexDirection != 2 && flexDirection != 3) {
                throw new IllegalArgumentException(c0.h(flexDirection, "Invalid flex direction: "));
            }
            mode = View.MeasureSpec.getMode(i5);
            size = View.MeasureSpec.getSize(i5);
        }
        List<a> flexLinesInternal = aVar.getFlexLinesInternal();
        if (mode == 1073741824) {
            int sumOfCrossSize = aVar.getSumOfCrossSize() + i12;
            int i13 = 0;
            if (flexLinesInternal.size() == 1) {
                ((a) flexLinesInternal.get(0)).f31667g = size - i12;
                return;
            }
            if (flexLinesInternal.size() >= 2) {
                int alignContent = aVar.getAlignContent();
                if (alignContent == 1) {
                    a aVar2 = new a();
                    aVar2.f31667g = size - sumOfCrossSize;
                    flexLinesInternal.add(0, aVar2);
                    return;
                }
                if (alignContent == 2) {
                    aVar.i(e(size, sumOfCrossSize, flexLinesInternal));
                    return;
                }
                if (alignContent == 3) {
                    if (sumOfCrossSize >= size) {
                        return;
                    }
                    float size2 = (size - sumOfCrossSize) / (flexLinesInternal.size() - 1);
                    ArrayList arrayList = new ArrayList();
                    int size3 = flexLinesInternal.size();
                    float f11 = 0.0f;
                    while (i13 < size3) {
                        arrayList.add((a) flexLinesInternal.get(i13));
                        if (i13 != flexLinesInternal.size() - 1) {
                            a aVar3 = new a();
                            if (i13 == flexLinesInternal.size() - 2) {
                                aVar3.f31667g = Math.round(f11 + size2);
                                f11 = 0.0f;
                            } else {
                                aVar3.f31667g = Math.round(size2);
                            }
                            int i14 = aVar3.f31667g;
                            float f12 = (size2 - i14) + f11;
                            if (f12 > 1.0f) {
                                aVar3.f31667g = i14 + 1;
                                f12 -= 1.0f;
                            } else if (f12 < -1.0f) {
                                aVar3.f31667g = i14 - 1;
                                f12 += 1.0f;
                            }
                            f11 = f12;
                            arrayList.add(aVar3);
                        }
                        i13++;
                    }
                    aVar.i(arrayList);
                    return;
                }
                if (alignContent == 4) {
                    if (sumOfCrossSize >= size) {
                        aVar.i(e(size, sumOfCrossSize, flexLinesInternal));
                        return;
                    }
                    int size4 = (size - sumOfCrossSize) / (flexLinesInternal.size() * 2);
                    ArrayList arrayList2 = new ArrayList();
                    a aVar4 = new a();
                    aVar4.f31667g = size4;
                    for (a aVar5 : flexLinesInternal) {
                        arrayList2.add(aVar4);
                        arrayList2.add(aVar5);
                        arrayList2.add(aVar4);
                    }
                    aVar.i(arrayList2);
                    return;
                }
                if (alignContent == 5 && sumOfCrossSize < size) {
                    float size5 = (size - sumOfCrossSize) / flexLinesInternal.size();
                    int size6 = flexLinesInternal.size();
                    float f13 = 0.0f;
                    while (i13 < size6) {
                        a aVar6 = (a) flexLinesInternal.get(i13);
                        float f14 = aVar6.f31667g + size5;
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
                        aVar6.f31667g = iRound;
                        i13++;
                    }
                }
            }
        }
    }

    public final void h(int i5, int i11, int i12) {
        int size;
        int paddingLeft;
        int paddingRight;
        int i13;
        int i14;
        ag.a aVar = this.f31677a;
        int flexItemCount = aVar.getFlexItemCount();
        boolean[] zArr = this.f31678b;
        if (zArr == null) {
            this.f31678b = new boolean[Math.max(flexItemCount, 10)];
        } else if (zArr.length < flexItemCount) {
            this.f31678b = new boolean[Math.max(zArr.length * 2, flexItemCount)];
        } else {
            Arrays.fill(zArr, false);
        }
        if (i12 >= aVar.getFlexItemCount()) {
            return;
        }
        int flexDirection = aVar.getFlexDirection();
        int flexDirection2 = aVar.getFlexDirection();
        if (flexDirection2 == 0 || flexDirection2 == 1) {
            int mode = View.MeasureSpec.getMode(i5);
            size = View.MeasureSpec.getSize(i5);
            int largestMainSize = aVar.getLargestMainSize();
            if (mode != 1073741824) {
                size = Math.min(largestMainSize, size);
            }
            paddingLeft = aVar.getPaddingLeft();
            paddingRight = aVar.getPaddingRight();
        } else {
            if (flexDirection2 != 2 && flexDirection2 != 3) {
                throw new IllegalArgumentException(c0.h(flexDirection, "Invalid flex direction: "));
            }
            int mode2 = View.MeasureSpec.getMode(i11);
            size = View.MeasureSpec.getSize(i11);
            if (mode2 != 1073741824) {
                size = aVar.getLargestMainSize();
            }
            paddingLeft = aVar.getPaddingTop();
            paddingRight = aVar.getPaddingBottom();
        }
        int i15 = paddingRight + paddingLeft;
        int i16 = size;
        int[] iArr = this.f31679c;
        int i17 = iArr != null ? iArr[i12] : 0;
        List flexLinesInternal = aVar.getFlexLinesInternal();
        int size2 = flexLinesInternal.size();
        while (i17 < size2) {
            a aVar2 = (a) flexLinesInternal.get(i17);
            int i18 = aVar2.f31665e;
            if (i18 >= i16 || !aVar2.f31675q) {
                i13 = i5;
                i14 = i11;
                if (i18 > i16 && aVar2.f31676r) {
                    q(i13, i14, aVar2, i16, i15, false);
                }
            } else {
                i13 = i5;
                i14 = i11;
                l(i13, i14, aVar2, i16, i15, false);
            }
            i17++;
            i5 = i13;
            i11 = i14;
        }
    }

    public final void i(int i5) {
        int[] iArr = this.f31679c;
        if (iArr == null) {
            this.f31679c = new int[Math.max(i5, 10)];
        } else if (iArr.length < i5) {
            this.f31679c = Arrays.copyOf(this.f31679c, Math.max(iArr.length * 2, i5));
        }
    }

    public final void j(int i5) {
        long[] jArr = this.f31680d;
        if (jArr == null) {
            this.f31680d = new long[Math.max(i5, 10)];
        } else if (jArr.length < i5) {
            this.f31680d = Arrays.copyOf(this.f31680d, Math.max(jArr.length * 2, i5));
        }
    }

    public final void k(int i5) {
        long[] jArr = this.f31681e;
        if (jArr == null) {
            this.f31681e = new long[Math.max(i5, 10)];
        } else if (jArr.length < i5) {
            this.f31681e = Arrays.copyOf(this.f31681e, Math.max(jArr.length * 2, i5));
        }
    }

    public final void l(int i5, int i11, a aVar, int i12, int i13, boolean z11) {
        int i14;
        float f11;
        int i15;
        float f12;
        boolean z12;
        int i16;
        int iMax;
        double d5;
        float f13;
        boolean z13;
        boolean z14;
        double d11;
        float f14 = aVar.f31670j;
        float f15 = 0.0f;
        if (f14 <= 0.0f || i12 < (i14 = aVar.f31665e)) {
            return;
        }
        float f16 = (i12 - i14) / f14;
        aVar.f31665e = i13 + aVar.f31666f;
        if (!z11) {
            aVar.f31667g = Integer.MIN_VALUE;
        }
        int i17 = 0;
        boolean z15 = false;
        int i18 = 0;
        float f17 = 0.0f;
        while (i17 < aVar.f31668h) {
            int i19 = aVar.o + i17;
            ag.a aVar2 = this.f31677a;
            View viewG = aVar2.g(i19);
            if (viewG == null || viewG.getVisibility() == 8) {
                f11 = f15;
                i15 = i14;
                f12 = f16;
                z12 = z15;
                i16 = i17;
            } else {
                FlexItem flexItem = (FlexItem) viewG.getLayoutParams();
                int flexDirection = aVar2.getFlexDirection();
                f11 = f15;
                if (flexDirection == 0 || flexDirection == 1) {
                    i15 = i14;
                    float f18 = f16;
                    z12 = z15;
                    int measuredWidth = viewG.getMeasuredWidth();
                    long[] jArr = this.f31681e;
                    if (jArr != null) {
                        measuredWidth = (int) jArr[i19];
                    }
                    int measuredHeight = viewG.getMeasuredHeight();
                    long[] jArr2 = this.f31681e;
                    if (jArr2 != null) {
                        measuredHeight = (int) (jArr2[i19] >> 32);
                    }
                    if (this.f31678b[i19] || flexItem.K() <= f11) {
                        i16 = i17;
                        f12 = f18;
                    } else {
                        float fK = (f18 * flexItem.K()) + measuredWidth;
                        if (i17 == aVar.f31668h - 1) {
                            fK += f17;
                            f17 = f11;
                        }
                        int iRound = Math.round(fK);
                        if (iRound > flexItem.U()) {
                            iRound = flexItem.U();
                            this.f31678b[i19] = true;
                            aVar.f31670j -= flexItem.K();
                            z12 = true;
                            i16 = i17;
                            f12 = f18;
                        } else {
                            float f19 = (fK - iRound) + f17;
                            i16 = i17;
                            f12 = f18;
                            double d12 = f19;
                            if (d12 > 1.0d) {
                                iRound++;
                                d5 = d12 - 1.0d;
                            } else if (d12 < -1.0d) {
                                iRound--;
                                d5 = d12 + 1.0d;
                            } else {
                                f17 = f19;
                            }
                            f17 = (float) d5;
                        }
                        int iM = m(i11, flexItem, aVar.f31673m);
                        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iRound, 1073741824);
                        viewG.measure(iMakeMeasureSpec, iM);
                        int measuredWidth2 = viewG.getMeasuredWidth();
                        int measuredHeight2 = viewG.getMeasuredHeight();
                        v(i19, iMakeMeasureSpec, iM, viewG);
                        aVar2.h(i19, viewG);
                        measuredWidth = measuredWidth2;
                        measuredHeight = measuredHeight2;
                    }
                    int iMax2 = Math.max(i18, aVar2.e(viewG) + measuredHeight + flexItem.G() + flexItem.l0());
                    aVar.f31665e = measuredWidth + flexItem.n0() + flexItem.z0() + aVar.f31665e;
                    iMax = iMax2;
                } else {
                    int measuredHeight3 = viewG.getMeasuredHeight();
                    long[] jArr3 = this.f31681e;
                    if (jArr3 != null) {
                        long j11 = jArr3[i19];
                        f13 = f16;
                        z13 = z15;
                        measuredHeight3 = (int) (j11 >> 32);
                    } else {
                        f13 = f16;
                        z13 = z15;
                    }
                    int measuredWidth3 = viewG.getMeasuredWidth();
                    long[] jArr4 = this.f31681e;
                    if (jArr4 != null) {
                        measuredWidth3 = (int) jArr4[i19];
                    }
                    if (this.f31678b[i19] || flexItem.K() <= f11) {
                        i15 = i14;
                        z14 = z13;
                    } else {
                        float fK2 = (flexItem.K() * f13) + measuredHeight3;
                        if (i17 == aVar.f31668h - 1) {
                            fK2 += f17;
                            f17 = f11;
                        }
                        int iRound2 = Math.round(fK2);
                        if (iRound2 > flexItem.D0()) {
                            iRound2 = flexItem.D0();
                            this.f31678b[i19] = true;
                            aVar.f31670j -= flexItem.K();
                            z14 = true;
                            i15 = i14;
                        } else {
                            float f21 = (fK2 - iRound2) + f17;
                            i15 = i14;
                            double d13 = f21;
                            if (d13 > 1.0d) {
                                iRound2++;
                                d11 = d13 - 1.0d;
                            } else if (d13 < -1.0d) {
                                iRound2--;
                                d11 = d13 + 1.0d;
                            } else {
                                f17 = f21;
                                z14 = z13;
                            }
                            f17 = (float) d11;
                            z14 = z13;
                        }
                        int iN = n(i5, flexItem, aVar.f31673m);
                        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iRound2, 1073741824);
                        viewG.measure(iN, iMakeMeasureSpec2);
                        int measuredWidth4 = viewG.getMeasuredWidth();
                        int measuredHeight4 = viewG.getMeasuredHeight();
                        v(i19, iN, iMakeMeasureSpec2, viewG);
                        aVar2.h(i19, viewG);
                        measuredWidth3 = measuredWidth4;
                        measuredHeight3 = measuredHeight4;
                    }
                    iMax = Math.max(i18, aVar2.e(viewG) + measuredWidth3 + flexItem.n0() + flexItem.z0());
                    aVar.f31665e = measuredHeight3 + flexItem.G() + flexItem.l0() + aVar.f31665e;
                    f12 = f13;
                    z12 = z14;
                    i16 = i17;
                }
                aVar.f31667g = Math.max(aVar.f31667g, iMax);
                i18 = iMax;
            }
            i17 = i16 + 1;
            f16 = f12;
            f15 = f11;
            i14 = i15;
            z15 = z12;
        }
        int i21 = i14;
        if (!z15 || i21 == aVar.f31665e) {
            return;
        }
        l(i5, i11, aVar, i12, i13, true);
    }

    public final int m(int i5, FlexItem flexItem, int i11) {
        ag.a aVar = this.f31677a;
        int iD = aVar.d(i5, aVar.getPaddingBottom() + aVar.getPaddingTop() + flexItem.G() + flexItem.l0() + i11, flexItem.getHeight());
        int size = View.MeasureSpec.getSize(iD);
        return size > flexItem.D0() ? View.MeasureSpec.makeMeasureSpec(flexItem.D0(), View.MeasureSpec.getMode(iD)) : size < flexItem.A0() ? View.MeasureSpec.makeMeasureSpec(flexItem.A0(), View.MeasureSpec.getMode(iD)) : iD;
    }

    public final int n(int i5, FlexItem flexItem, int i11) {
        ag.a aVar = this.f31677a;
        int iB = aVar.b(i5, aVar.getPaddingRight() + aVar.getPaddingLeft() + flexItem.n0() + flexItem.z0() + i11, flexItem.getWidth());
        int size = View.MeasureSpec.getSize(iB);
        return size > flexItem.U() ? View.MeasureSpec.makeMeasureSpec(flexItem.U(), View.MeasureSpec.getMode(iB)) : size < flexItem.B() ? View.MeasureSpec.makeMeasureSpec(flexItem.B(), View.MeasureSpec.getMode(iB)) : iB;
    }

    public final void o(View view, a aVar, int i5, int i11, int i12, int i13) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        ag.a aVar2 = this.f31677a;
        int alignItems = aVar2.getAlignItems();
        if (flexItem.t() != -1) {
            alignItems = flexItem.t();
        }
        int i14 = aVar.f31667g;
        if (alignItems != 0) {
            if (alignItems == 1) {
                if (aVar2.getFlexWrap() != 2) {
                    int i15 = i11 + i14;
                    view.layout(i5, (i15 - view.getMeasuredHeight()) - flexItem.l0(), i12, i15 - flexItem.l0());
                    return;
                } else {
                    view.layout(i5, view.getMeasuredHeight() + (i11 - i14) + flexItem.G(), i12, view.getMeasuredHeight() + (i13 - i14) + flexItem.G());
                    return;
                }
            }
            if (alignItems == 2) {
                int measuredHeight = (((i14 - view.getMeasuredHeight()) + flexItem.G()) - flexItem.l0()) / 2;
                if (aVar2.getFlexWrap() != 2) {
                    int i16 = i11 + measuredHeight;
                    view.layout(i5, i16, i12, view.getMeasuredHeight() + i16);
                    return;
                } else {
                    int i17 = i11 - measuredHeight;
                    view.layout(i5, i17, i12, view.getMeasuredHeight() + i17);
                    return;
                }
            }
            if (alignItems == 3) {
                if (aVar2.getFlexWrap() != 2) {
                    int iMax = Math.max(aVar.f31672l - view.getBaseline(), flexItem.G());
                    view.layout(i5, i11 + iMax, i12, i13 + iMax);
                    return;
                } else {
                    int iMax2 = Math.max(view.getBaseline() + (aVar.f31672l - view.getMeasuredHeight()), flexItem.l0());
                    view.layout(i5, i11 - iMax2, i12, i13 - iMax2);
                    return;
                }
            }
            if (alignItems != 4) {
                return;
            }
        }
        if (aVar2.getFlexWrap() != 2) {
            view.layout(i5, i11 + flexItem.G(), i12, i13 + flexItem.G());
        } else {
            view.layout(i5, i11 - flexItem.l0(), i12, i13 - flexItem.l0());
        }
    }

    public final void p(View view, a aVar, boolean z11, int i5, int i11, int i12, int i13) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int alignItems = this.f31677a.getAlignItems();
        if (flexItem.t() != -1) {
            alignItems = flexItem.t();
        }
        int i14 = aVar.f31667g;
        if (alignItems != 0) {
            if (alignItems == 1) {
                if (!z11) {
                    view.layout(((i5 + i14) - view.getMeasuredWidth()) - flexItem.z0(), i11, ((i12 + i14) - view.getMeasuredWidth()) - flexItem.z0(), i13);
                    return;
                }
                view.layout(view.getMeasuredWidth() + (i5 - i14) + flexItem.n0(), i11, view.getMeasuredWidth() + (i12 - i14) + flexItem.n0(), i13);
                return;
            }
            if (alignItems == 2) {
                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                int marginStart = ((marginLayoutParams.getMarginStart() + (i14 - view.getMeasuredWidth())) - marginLayoutParams.getMarginEnd()) / 2;
                if (z11) {
                    view.layout(i5 - marginStart, i11, i12 - marginStart, i13);
                    return;
                } else {
                    view.layout(i5 + marginStart, i11, i12 + marginStart, i13);
                    return;
                }
            }
            if (alignItems != 3 && alignItems != 4) {
                return;
            }
        }
        if (z11) {
            view.layout(i5 - flexItem.z0(), i11, i12 - flexItem.z0(), i13);
        } else {
            view.layout(i5 + flexItem.n0(), i11, i12 + flexItem.n0(), i13);
        }
    }

    public final void q(int i5, int i11, a aVar, int i12, int i13, boolean z11) {
        float f11;
        float f12;
        int iMax;
        int iB;
        int iA0;
        int i14 = aVar.f31665e;
        float f13 = aVar.f31671k;
        float f14 = 0.0f;
        if (f13 <= 0.0f || i12 > i14) {
            return;
        }
        float f15 = (i14 - i12) / f13;
        aVar.f31665e = i13 + aVar.f31666f;
        if (!z11) {
            aVar.f31667g = Integer.MIN_VALUE;
        }
        int i15 = 0;
        boolean z12 = false;
        int i16 = 0;
        float f16 = 0.0f;
        while (i15 < aVar.f31668h) {
            int i17 = aVar.o + i15;
            ag.a aVar2 = this.f31677a;
            View viewG = aVar2.g(i17);
            if (viewG == null || viewG.getVisibility() == 8) {
                f11 = f14;
                f12 = f15;
            } else {
                FlexItem flexItem = (FlexItem) viewG.getLayoutParams();
                int flexDirection = aVar2.getFlexDirection();
                f11 = f14;
                if (flexDirection == 0 || flexDirection == 1) {
                    f12 = f15;
                    int measuredWidth = viewG.getMeasuredWidth();
                    long[] jArr = this.f31681e;
                    if (jArr != null) {
                        measuredWidth = (int) jArr[i17];
                    }
                    int measuredHeight = viewG.getMeasuredHeight();
                    long[] jArr2 = this.f31681e;
                    if (jArr2 != null) {
                        measuredHeight = (int) (jArr2[i17] >> 32);
                    }
                    if (!this.f31678b[i17] && flexItem.v() > f11) {
                        float fV = measuredWidth - (f12 * flexItem.v());
                        if (i15 == aVar.f31668h - 1) {
                            fV += f16;
                            f16 = f11;
                        }
                        int iRound = Math.round(fV);
                        if (iRound < flexItem.B()) {
                            iB = flexItem.B();
                            this.f31678b[i17] = true;
                            aVar.f31671k -= flexItem.v();
                            z12 = true;
                        } else {
                            float f17 = (fV - iRound) + f16;
                            double d5 = f17;
                            if (d5 > 1.0d) {
                                iB = iRound + 1;
                                f17 -= 1.0f;
                            } else if (d5 < -1.0d) {
                                iB = iRound - 1;
                                f17 += 1.0f;
                            } else {
                                iB = iRound;
                            }
                            f16 = f17;
                        }
                        int iM = m(i11, flexItem, aVar.f31673m);
                        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iB, 1073741824);
                        viewG.measure(iMakeMeasureSpec, iM);
                        int measuredWidth2 = viewG.getMeasuredWidth();
                        int measuredHeight2 = viewG.getMeasuredHeight();
                        v(i17, iMakeMeasureSpec, iM, viewG);
                        aVar2.h(i17, viewG);
                        measuredWidth = measuredWidth2;
                        measuredHeight = measuredHeight2;
                    }
                    int iMax2 = Math.max(i16, aVar2.e(viewG) + measuredHeight + flexItem.G() + flexItem.l0());
                    aVar.f31665e = measuredWidth + flexItem.n0() + flexItem.z0() + aVar.f31665e;
                    iMax = iMax2;
                } else {
                    int measuredHeight3 = viewG.getMeasuredHeight();
                    long[] jArr3 = this.f31681e;
                    if (jArr3 != null) {
                        measuredHeight3 = (int) (jArr3[i17] >> 32);
                    }
                    int measuredWidth3 = viewG.getMeasuredWidth();
                    long[] jArr4 = this.f31681e;
                    if (jArr4 != null) {
                        measuredWidth3 = (int) jArr4[i17];
                    }
                    if (this.f31678b[i17] || flexItem.v() <= f11) {
                        f12 = f15;
                    } else {
                        float fV2 = measuredHeight3 - (flexItem.v() * f15);
                        if (i15 == aVar.f31668h - 1) {
                            fV2 += f16;
                            f16 = f11;
                        }
                        int iRound2 = Math.round(fV2);
                        if (iRound2 < flexItem.A0()) {
                            iA0 = flexItem.A0();
                            this.f31678b[i17] = true;
                            aVar.f31671k -= flexItem.v();
                            z12 = true;
                            f12 = f15;
                        } else {
                            float f18 = (fV2 - iRound2) + f16;
                            f12 = f15;
                            double d11 = f18;
                            if (d11 > 1.0d) {
                                iA0 = iRound2 + 1;
                                f18 -= 1.0f;
                            } else if (d11 < -1.0d) {
                                iA0 = iRound2 - 1;
                                f18 += 1.0f;
                            } else {
                                iA0 = iRound2;
                            }
                            f16 = f18;
                        }
                        int iN = n(i5, flexItem, aVar.f31673m);
                        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iA0, 1073741824);
                        viewG.measure(iN, iMakeMeasureSpec2);
                        int measuredWidth4 = viewG.getMeasuredWidth();
                        int measuredHeight4 = viewG.getMeasuredHeight();
                        v(i17, iN, iMakeMeasureSpec2, viewG);
                        aVar2.h(i17, viewG);
                        measuredWidth3 = measuredWidth4;
                        measuredHeight3 = measuredHeight4;
                    }
                    iMax = Math.max(i16, aVar2.e(viewG) + measuredWidth3 + flexItem.n0() + flexItem.z0());
                    aVar.f31665e = measuredHeight3 + flexItem.G() + flexItem.l0() + aVar.f31665e;
                }
                aVar.f31667g = Math.max(aVar.f31667g, iMax);
                i16 = iMax;
            }
            i15++;
            f14 = f11;
            f15 = f12;
        }
        if (!z12 || i14 == aVar.f31665e) {
            return;
        }
        q(i5, i11, aVar, i12, i13, true);
    }

    public final void s(View view, int i5, int i11) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int iN0 = (i5 - flexItem.n0()) - flexItem.z0();
        ag.a aVar = this.f31677a;
        int iMin = Math.min(Math.max(iN0 - aVar.e(view), flexItem.B()), flexItem.U());
        long[] jArr = this.f31681e;
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(jArr != null ? (int) (jArr[i11] >> 32) : view.getMeasuredHeight(), 1073741824);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iMin, 1073741824);
        view.measure(iMakeMeasureSpec2, iMakeMeasureSpec);
        v(i11, iMakeMeasureSpec2, iMakeMeasureSpec, view);
        aVar.h(i11, view);
    }

    public final void t(View view, int i5, int i11) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int iG = (i5 - flexItem.G()) - flexItem.l0();
        ag.a aVar = this.f31677a;
        int iMin = Math.min(Math.max(iG - aVar.e(view), flexItem.A0()), flexItem.D0());
        long[] jArr = this.f31681e;
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(jArr != null ? (int) jArr[i11] : view.getMeasuredWidth(), 1073741824);
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iMin, 1073741824);
        view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
        v(i11, iMakeMeasureSpec, iMakeMeasureSpec2, view);
        aVar.h(i11, view);
    }

    public final void u(int i5) {
        View viewG;
        ag.a aVar = this.f31677a;
        if (i5 >= aVar.getFlexItemCount()) {
            return;
        }
        int flexDirection = aVar.getFlexDirection();
        if (aVar.getAlignItems() != 4) {
            for (a aVar2 : aVar.getFlexLinesInternal()) {
                Iterator it = aVar2.n.iterator();
                while (it.hasNext()) {
                    Integer num = (Integer) it.next();
                    View viewG2 = aVar.g(num.intValue());
                    if (flexDirection == 0 || flexDirection == 1) {
                        t(viewG2, aVar2.f31667g, num.intValue());
                    } else {
                        if (flexDirection != 2 && flexDirection != 3) {
                            throw new IllegalArgumentException(c0.h(flexDirection, "Invalid flex direction: "));
                        }
                        s(viewG2, aVar2.f31667g, num.intValue());
                    }
                }
            }
            return;
        }
        int[] iArr = this.f31679c;
        List flexLinesInternal = aVar.getFlexLinesInternal();
        int size = flexLinesInternal.size();
        for (int i11 = iArr != null ? iArr[i5] : 0; i11 < size; i11++) {
            a aVar3 = (a) flexLinesInternal.get(i11);
            int i12 = aVar3.f31668h;
            for (int i13 = 0; i13 < i12; i13++) {
                int i14 = aVar3.o + i13;
                if (i13 < aVar.getFlexItemCount() && (viewG = aVar.g(i14)) != null && viewG.getVisibility() != 8) {
                    FlexItem flexItem = (FlexItem) viewG.getLayoutParams();
                    if (flexItem.t() == -1 || flexItem.t() == 4) {
                        if (flexDirection == 0 || flexDirection == 1) {
                            t(viewG, aVar3.f31667g, i14);
                        } else {
                            if (flexDirection != 2 && flexDirection != 3) {
                                throw new IllegalArgumentException(c0.h(flexDirection, "Invalid flex direction: "));
                            }
                            s(viewG, aVar3.f31667g, i14);
                        }
                    }
                }
            }
        }
    }

    public final void v(int i5, int i11, int i12, View view) {
        long[] jArr = this.f31680d;
        if (jArr != null) {
            jArr[i5] = (i11 & 4294967295L) | (i12 << 32);
        }
        long[] jArr2 = this.f31681e;
        if (jArr2 != null) {
            jArr2[i5] = (view.getMeasuredWidth() & 4294967295L) | (view.getMeasuredHeight() << 32);
        }
    }
}
