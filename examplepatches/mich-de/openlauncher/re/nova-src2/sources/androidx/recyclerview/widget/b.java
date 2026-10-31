package androidx.recyclerview.widget;

import java.util.ArrayList;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: d, reason: collision with root package name */
    public final k1 f14887d;

    /* renamed from: a, reason: collision with root package name */
    public final fa.t f14884a = new fa.t(30, 6);

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f14885b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f14886c = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public int f14889f = 0;

    /* renamed from: e, reason: collision with root package name */
    public final w1 f14888e = new w1(this, 2);

    public b(k1 k1Var) {
        this.f14887d = k1Var;
    }

    public final boolean a(int i5) {
        ArrayList arrayList = this.f14886c;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            a aVar = (a) arrayList.get(i11);
            int i12 = aVar.f14873a;
            if (i12 != 8) {
                if (i12 == 1) {
                    int i13 = aVar.f14874b;
                    int i14 = aVar.f14876d + i13;
                    while (i13 < i14) {
                        if (f(i13, i11 + 1) == i5) {
                            return true;
                        }
                        i13++;
                    }
                } else {
                    continue;
                }
            } else {
                if (f(aVar.f14876d, i11 + 1) == i5) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void b() {
        ArrayList arrayList = this.f14886c;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.f14887d.a((a) arrayList.get(i5));
        }
        k(arrayList);
        this.f14889f = 0;
    }

    public final void c() {
        b();
        ArrayList arrayList = this.f14885b;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            a aVar = (a) arrayList.get(i5);
            int i11 = aVar.f14873a;
            k1 k1Var = this.f14887d;
            if (i11 == 1) {
                k1Var.a(aVar);
                int i12 = aVar.f14874b;
                int i13 = aVar.f14876d;
                RecyclerView recyclerView = k1Var.f15030a;
                recyclerView.offsetPositionRecordsForInsert(i12, i13);
                recyclerView.mItemsAddedOrRemoved = true;
            } else if (i11 == 2) {
                k1Var.a(aVar);
                int i14 = aVar.f14874b;
                int i15 = aVar.f14876d;
                RecyclerView recyclerView2 = k1Var.f15030a;
                recyclerView2.offsetPositionRecordsForRemove(i14, i15, true);
                recyclerView2.mItemsAddedOrRemoved = true;
                recyclerView2.mState.f15071c += i15;
            } else if (i11 == 4) {
                k1Var.a(aVar);
                int i16 = aVar.f14874b;
                int i17 = aVar.f14876d;
                Object obj = aVar.f14875c;
                RecyclerView recyclerView3 = k1Var.f15030a;
                recyclerView3.viewRangeUpdate(i16, i17, obj);
                recyclerView3.mItemsChanged = true;
            } else if (i11 == 8) {
                k1Var.a(aVar);
                int i18 = aVar.f14874b;
                int i19 = aVar.f14876d;
                RecyclerView recyclerView4 = k1Var.f15030a;
                recyclerView4.offsetPositionRecordsForMove(i18, i19);
                recyclerView4.mItemsAddedOrRemoved = true;
            }
        }
        k(arrayList);
        this.f14889f = 0;
    }

    public final void d(a aVar) {
        int i5;
        fa.t tVar;
        int i11 = aVar.f14873a;
        if (i11 == 1 || i11 == 8) {
            throw new IllegalArgumentException("should not dispatch add or move for pre layout");
        }
        int iL = l(aVar.f14874b, i11);
        int i12 = aVar.f14874b;
        int i13 = aVar.f14873a;
        if (i13 == 2) {
            i5 = 0;
        } else {
            if (i13 != 4) {
                throw new IllegalArgumentException("op should be remove or update." + aVar);
            }
            i5 = 1;
        }
        int i14 = 1;
        int i15 = 1;
        while (true) {
            int i16 = aVar.f14876d;
            tVar = this.f14884a;
            if (i14 >= i16) {
                break;
            }
            int iL2 = l((i5 * i14) + aVar.f14874b, aVar.f14873a);
            int i17 = aVar.f14873a;
            if (i17 == 2 ? iL2 != iL : !(i17 == 4 && iL2 == iL + 1)) {
                a aVarH = h(aVar.f14875c, i17, iL, i15);
                e(aVarH, i12);
                aVarH.f14875c = null;
                tVar.n(aVarH);
                if (aVar.f14873a == 4) {
                    i12 += i15;
                }
                i15 = 1;
                iL = iL2;
            } else {
                i15++;
            }
            i14++;
        }
        Object obj = aVar.f14875c;
        aVar.f14875c = null;
        tVar.n(aVar);
        if (i15 > 0) {
            a aVarH2 = h(obj, aVar.f14873a, iL, i15);
            e(aVarH2, i12);
            aVarH2.f14875c = null;
            tVar.n(aVarH2);
        }
    }

    public final void e(a aVar, int i5) {
        k1 k1Var = this.f14887d;
        k1Var.a(aVar);
        int i11 = aVar.f14873a;
        if (i11 == 2) {
            int i12 = aVar.f14876d;
            RecyclerView recyclerView = k1Var.f15030a;
            recyclerView.offsetPositionRecordsForRemove(i5, i12, true);
            recyclerView.mItemsAddedOrRemoved = true;
            recyclerView.mState.f15071c += i12;
            return;
        }
        if (i11 != 4) {
            throw new IllegalArgumentException("only remove and update ops can be dispatched in first pass");
        }
        int i13 = aVar.f14876d;
        Object obj = aVar.f14875c;
        RecyclerView recyclerView2 = k1Var.f15030a;
        recyclerView2.viewRangeUpdate(i5, i13, obj);
        recyclerView2.mItemsChanged = true;
    }

    public final int f(int i5, int i11) {
        ArrayList arrayList = this.f14886c;
        int size = arrayList.size();
        while (i11 < size) {
            a aVar = (a) arrayList.get(i11);
            int i12 = aVar.f14873a;
            if (i12 == 8) {
                int i13 = aVar.f14874b;
                if (i13 == i5) {
                    i5 = aVar.f14876d;
                } else {
                    if (i13 < i5) {
                        i5--;
                    }
                    if (aVar.f14876d <= i5) {
                        i5++;
                    }
                }
            } else {
                int i14 = aVar.f14874b;
                if (i14 > i5) {
                    continue;
                } else if (i12 == 2) {
                    int i15 = aVar.f14876d;
                    if (i5 < i14 + i15) {
                        return -1;
                    }
                    i5 -= i15;
                } else if (i12 == 1) {
                    i5 += aVar.f14876d;
                }
            }
            i11++;
        }
        return i5;
    }

    public final boolean g() {
        return this.f14885b.size() > 0;
    }

    public final a h(Object obj, int i5, int i11, int i12) {
        a aVar = (a) this.f14884a.a();
        if (aVar == null) {
            return new a(obj, i5, i11, i12);
        }
        aVar.f14873a = i5;
        aVar.f14874b = i11;
        aVar.f14876d = i12;
        aVar.f14875c = obj;
        return aVar;
    }

    public final void i(a aVar) {
        this.f14886c.add(aVar);
        int i5 = aVar.f14873a;
        k1 k1Var = this.f14887d;
        if (i5 == 1) {
            int i11 = aVar.f14874b;
            int i12 = aVar.f14876d;
            RecyclerView recyclerView = k1Var.f15030a;
            recyclerView.offsetPositionRecordsForInsert(i11, i12);
            recyclerView.mItemsAddedOrRemoved = true;
            return;
        }
        if (i5 == 2) {
            int i13 = aVar.f14874b;
            int i14 = aVar.f14876d;
            RecyclerView recyclerView2 = k1Var.f15030a;
            recyclerView2.offsetPositionRecordsForRemove(i13, i14, false);
            recyclerView2.mItemsAddedOrRemoved = true;
            return;
        }
        if (i5 == 4) {
            int i15 = aVar.f14874b;
            int i16 = aVar.f14876d;
            Object obj = aVar.f14875c;
            RecyclerView recyclerView3 = k1Var.f15030a;
            recyclerView3.viewRangeUpdate(i15, i16, obj);
            recyclerView3.mItemsChanged = true;
            return;
        }
        if (i5 != 8) {
            throw new IllegalArgumentException("Unknown update op type for " + aVar);
        }
        int i17 = aVar.f14874b;
        int i18 = aVar.f14876d;
        RecyclerView recyclerView4 = k1Var.f15030a;
        recyclerView4.offsetPositionRecordsForMove(i17, i18);
        recyclerView4.mItemsAddedOrRemoved = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:200:0x00a1 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:201:0x0123 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:204:0x0116 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:218:0x0007 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x009c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void j() {
        ArrayList arrayList;
        int i5;
        char c11;
        int i11;
        int i12;
        int i13;
        boolean z11;
        char c12;
        a aVarH;
        int i14;
        int i15;
        a aVarH2;
        boolean z12;
        boolean z13;
        Object obj;
        a aVar;
        w1 w1Var = this.f14888e;
        w1Var.getClass();
        while (true) {
            arrayList = this.f14885b;
            int size = arrayList.size() - 1;
            boolean z14 = false;
            while (true) {
                i5 = 8;
                c11 = 65535;
                if (size < 0) {
                    size = -1;
                    break;
                }
                if (((a) arrayList.get(size)).f14873a != 8) {
                    z14 = true;
                } else if (z14) {
                    break;
                }
                size--;
            }
            i11 = 2;
            i12 = 4;
            if (size == -1) {
                break;
            }
            int i16 = size + 1;
            b bVar = (b) w1Var.f15162b;
            fa.t tVar = bVar.f14884a;
            a aVar2 = (a) arrayList.get(size);
            a aVar3 = (a) arrayList.get(i16);
            int i17 = aVar3.f14873a;
            if (i17 == 1) {
                int i18 = aVar2.f14876d;
                int i19 = aVar3.f14874b;
                int i21 = i18 < i19 ? -1 : 0;
                int i22 = aVar2.f14874b;
                if (i22 < i19) {
                    i21++;
                }
                if (i19 <= i22) {
                    aVar2.f14874b = i22 + aVar3.f14876d;
                }
                int i23 = aVar3.f14874b;
                if (i23 <= i18) {
                    aVar2.f14876d = i18 + aVar3.f14876d;
                }
                aVar3.f14874b = i23 + i21;
                arrayList.set(size, aVar3);
                arrayList.set(i16, aVar2);
            } else if (i17 == 2) {
                int i24 = aVar2.f14874b;
                int i25 = aVar2.f14876d;
                if (i24 < i25) {
                    z13 = aVar3.f14874b == i24 && aVar3.f14876d == i25 - i24;
                    z12 = false;
                } else if (aVar3.f14874b == i25 + 1 && aVar3.f14876d == i24 - i25) {
                    z13 = true;
                    z12 = true;
                } else {
                    z12 = true;
                    z13 = false;
                }
                int i26 = aVar3.f14874b;
                if (i25 < i26) {
                    aVar3.f14874b = i26 - 1;
                } else {
                    int i27 = aVar3.f14876d;
                    if (i25 < i26 + i27) {
                        aVar3.f14876d = i27 - 1;
                        aVar2.f14873a = 2;
                        aVar2.f14876d = 1;
                        if (aVar3.f14876d == 0) {
                            arrayList.remove(i16);
                            aVar3.f14875c = null;
                            tVar.n(aVar3);
                        }
                    }
                }
                int i28 = aVar2.f14874b;
                int i29 = aVar3.f14874b;
                if (i28 <= i29) {
                    aVar3.f14874b = i29 + 1;
                } else {
                    int i31 = i29 + aVar3.f14876d;
                    if (i28 < i31) {
                        obj = null;
                        a aVarH3 = bVar.h(null, 2, i28 + 1, i31 - i28);
                        aVar3.f14876d = aVar2.f14874b - aVar3.f14874b;
                        aVar = aVarH3;
                    }
                    if (z13) {
                        if (z12) {
                            if (aVar != null) {
                                int i32 = aVar2.f14874b;
                                if (i32 > aVar.f14874b) {
                                    aVar2.f14874b = i32 - aVar.f14876d;
                                }
                                int i33 = aVar2.f14876d;
                                if (i33 > aVar.f14874b) {
                                    aVar2.f14876d = i33 - aVar.f14876d;
                                }
                            }
                            int i34 = aVar2.f14874b;
                            if (i34 > aVar3.f14874b) {
                                aVar2.f14874b = i34 - aVar3.f14876d;
                            }
                            int i35 = aVar2.f14876d;
                            if (i35 > aVar3.f14874b) {
                                aVar2.f14876d = i35 - aVar3.f14876d;
                            }
                        } else {
                            if (aVar != null) {
                                int i36 = aVar2.f14874b;
                                if (i36 >= aVar.f14874b) {
                                    aVar2.f14874b = i36 - aVar.f14876d;
                                }
                                int i37 = aVar2.f14876d;
                                if (i37 >= aVar.f14874b) {
                                    aVar2.f14876d = i37 - aVar.f14876d;
                                }
                            }
                            int i38 = aVar2.f14874b;
                            if (i38 >= aVar3.f14874b) {
                                aVar2.f14874b = i38 - aVar3.f14876d;
                            }
                            int i39 = aVar2.f14876d;
                            if (i39 >= aVar3.f14874b) {
                                aVar2.f14876d = i39 - aVar3.f14876d;
                            }
                        }
                        arrayList.set(size, aVar3);
                        if (aVar2.f14874b != aVar2.f14876d) {
                            arrayList.set(i16, aVar2);
                        } else {
                            arrayList.remove(i16);
                        }
                        if (aVar != null) {
                            arrayList.add(size, aVar);
                        }
                    } else {
                        arrayList.set(size, aVar3);
                        arrayList.remove(i16);
                        aVar2.f14875c = obj;
                        tVar.n(aVar2);
                    }
                }
                obj = null;
                aVar = null;
                if (z13) {
                }
            } else if (i17 == 4) {
                int i40 = aVar2.f14876d;
                int i41 = aVar3.f14874b;
                if (i40 < i41) {
                    aVar3.f14874b = i41 - 1;
                } else {
                    int i42 = aVar3.f14876d;
                    if (i40 < i41 + i42) {
                        aVar3.f14876d = i42 - 1;
                        aVarH = bVar.h(aVar3.f14875c, 4, aVar2.f14874b, 1);
                    }
                    i14 = aVar2.f14874b;
                    i15 = aVar3.f14874b;
                    if (i14 > i15) {
                        aVar3.f14874b = i15 + 1;
                    } else {
                        int i43 = i15 + aVar3.f14876d;
                        if (i14 < i43) {
                            int i44 = i43 - i14;
                            aVarH2 = bVar.h(aVar3.f14875c, 4, i14 + 1, i44);
                            aVar3.f14876d -= i44;
                        }
                        arrayList.set(i16, aVar2);
                        if (aVar3.f14876d > 0) {
                            arrayList.set(size, aVar3);
                        } else {
                            arrayList.remove(size);
                            aVar3.f14875c = null;
                            tVar.n(aVar3);
                        }
                        if (aVarH != null) {
                            arrayList.add(size, aVarH);
                        }
                        if (aVarH2 != null) {
                            arrayList.add(size, aVarH2);
                        }
                    }
                    aVarH2 = null;
                    arrayList.set(i16, aVar2);
                    if (aVar3.f14876d > 0) {
                    }
                    if (aVarH != null) {
                    }
                    if (aVarH2 != null) {
                    }
                }
                aVarH = null;
                i14 = aVar2.f14874b;
                i15 = aVar3.f14874b;
                if (i14 > i15) {
                }
                aVarH2 = null;
                arrayList.set(i16, aVar2);
                if (aVar3.f14876d > 0) {
                }
                if (aVarH != null) {
                }
                if (aVarH2 != null) {
                }
            }
        }
        int size2 = arrayList.size();
        int i45 = 0;
        while (i45 < size2) {
            a aVarH4 = (a) arrayList.get(i45);
            int i46 = aVarH4.f14873a;
            if (i46 != 1) {
                fa.t tVar2 = this.f14884a;
                k1 k1Var = this.f14887d;
                if (i46 == i11) {
                    int i47 = aVarH4.f14874b;
                    int i48 = aVarH4.f14876d + i47;
                    int i49 = i47;
                    int i51 = 0;
                    char c13 = 65535;
                    while (i49 < i48) {
                        RecyclerView recyclerView = k1Var.f15030a;
                        s2 s2VarFindViewHolderForPosition = recyclerView.findViewHolderForPosition(i49, true);
                        if (s2VarFindViewHolderForPosition == null) {
                            s2VarFindViewHolderForPosition = null;
                        } else {
                            if (recyclerView.mChildHelper.f14995c.contains(s2VarFindViewHolderForPosition.itemView)) {
                                int i52 = RecyclerView.HORIZONTAL;
                                s2VarFindViewHolderForPosition = null;
                            }
                        }
                        if (s2VarFindViewHolderForPosition != null || a(i49)) {
                            if (c13 == 0) {
                                d(h(null, 2, i47, i51));
                                z11 = true;
                            } else {
                                z11 = false;
                            }
                            c12 = 1;
                        } else {
                            if (c13 == 1) {
                                i(h(null, 2, i47, i51));
                                z11 = true;
                            } else {
                                z11 = false;
                            }
                            c12 = 0;
                        }
                        if (z11) {
                            i49 -= i51;
                            i48 -= i51;
                            i51 = 1;
                        } else {
                            i51++;
                        }
                        i49++;
                        c13 = c12;
                    }
                    if (i51 != aVarH4.f14876d) {
                        aVarH4.f14875c = null;
                        tVar2.n(aVarH4);
                        i13 = 2;
                        aVarH4 = h(null, 2, i47, i51);
                    } else {
                        i13 = 2;
                    }
                    if (c13 == 0) {
                        d(aVarH4);
                    } else {
                        i(aVarH4);
                    }
                } else if (i46 != i12) {
                    if (i46 == i5) {
                        i(aVarH4);
                    }
                    i13 = i11;
                } else {
                    int i53 = aVarH4.f14874b;
                    int i54 = aVarH4.f14876d + i53;
                    char c14 = c11;
                    int i55 = i53;
                    int i56 = 0;
                    while (i53 < i54) {
                        RecyclerView recyclerView2 = k1Var.f15030a;
                        s2 s2VarFindViewHolderForPosition2 = recyclerView2.findViewHolderForPosition(i53, true);
                        if (s2VarFindViewHolderForPosition2 == null) {
                            s2VarFindViewHolderForPosition2 = null;
                        } else {
                            if (recyclerView2.mChildHelper.f14995c.contains(s2VarFindViewHolderForPosition2.itemView)) {
                                int i57 = RecyclerView.HORIZONTAL;
                                s2VarFindViewHolderForPosition2 = null;
                            }
                        }
                        if (s2VarFindViewHolderForPosition2 != null || a(i53)) {
                            if (c14 == 0) {
                                d(h(aVarH4.f14875c, 4, i55, i56));
                                i55 = i53;
                                i56 = 0;
                            }
                            c14 = 1;
                        } else {
                            if (c14 == 1) {
                                i(h(aVarH4.f14875c, 4, i55, i56));
                                i55 = i53;
                                i56 = 0;
                            }
                            c14 = 0;
                        }
                        i56++;
                        i53++;
                    }
                    if (i56 != aVarH4.f14876d) {
                        Object obj2 = aVarH4.f14875c;
                        aVarH4.f14875c = null;
                        tVar2.n(aVarH4);
                        aVarH4 = h(obj2, 4, i55, i56);
                    }
                    if (c14 == 0) {
                        d(aVarH4);
                    } else {
                        i(aVarH4);
                    }
                    i13 = 2;
                }
            } else {
                i13 = i11;
                i(aVarH4);
            }
            i45++;
            i11 = i13;
            i5 = 8;
            c11 = 65535;
            i12 = 4;
        }
        arrayList.clear();
    }

    public final void k(ArrayList arrayList) {
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            a aVar = (a) arrayList.get(i5);
            aVar.f14875c = null;
            this.f14884a.n(aVar);
        }
        arrayList.clear();
    }

    public final int l(int i5, int i11) {
        int i12;
        int i13;
        ArrayList arrayList = this.f14886c;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            a aVar = (a) arrayList.get(size);
            int i14 = aVar.f14873a;
            if (i14 == 8) {
                int i15 = aVar.f14874b;
                int i16 = aVar.f14876d;
                if (i15 < i16) {
                    i13 = i15;
                    i12 = i16;
                } else {
                    i12 = i15;
                    i13 = i16;
                }
                if (i5 < i13 || i5 > i12) {
                    if (i5 < i15) {
                        if (i11 == 1) {
                            aVar.f14874b = i15 + 1;
                            aVar.f14876d = i16 + 1;
                        } else if (i11 == 2) {
                            aVar.f14874b = i15 - 1;
                            aVar.f14876d = i16 - 1;
                        }
                    }
                } else if (i13 == i15) {
                    if (i11 == 1) {
                        aVar.f14876d = i16 + 1;
                    } else if (i11 == 2) {
                        aVar.f14876d = i16 - 1;
                    }
                    i5++;
                } else {
                    if (i11 == 1) {
                        aVar.f14874b = i15 + 1;
                    } else if (i11 == 2) {
                        aVar.f14874b = i15 - 1;
                    }
                    i5--;
                }
            } else {
                int i17 = aVar.f14874b;
                if (i17 <= i5) {
                    if (i14 == 1) {
                        i5 -= aVar.f14876d;
                    } else if (i14 == 2) {
                        i5 += aVar.f14876d;
                    }
                } else if (i11 == 1) {
                    aVar.f14874b = i17 + 1;
                } else if (i11 == 2) {
                    aVar.f14874b = i17 - 1;
                }
            }
        }
        for (int size2 = arrayList.size() - 1; size2 >= 0; size2--) {
            a aVar2 = (a) arrayList.get(size2);
            int i18 = aVar2.f14873a;
            fa.t tVar = this.f14884a;
            if (i18 == 8) {
                int i19 = aVar2.f14876d;
                if (i19 == aVar2.f14874b || i19 < 0) {
                    arrayList.remove(size2);
                    aVar2.f14875c = null;
                    tVar.n(aVar2);
                }
            } else if (aVar2.f14876d <= 0) {
                arrayList.remove(size2);
                aVar2.f14875c = null;
                tVar.n(aVar2);
            }
        }
        return i5;
    }
}
