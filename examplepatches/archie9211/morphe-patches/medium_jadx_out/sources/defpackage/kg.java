package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.PagingOptions;
import com.medium.android.graphql.type.RecommendedTagsInput;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kg extends p4d implements d55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public /* synthetic */ yd4 e;
    public /* synthetic */ int f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ j55 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kg(jx4 jx4Var, String str, b55 b55Var, n92 n92Var) {
        super(4, n92Var);
        this.b = 10;
        this.d = jx4Var;
        this.g = str;
        this.h = b55Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objA2;
        Object obj2;
        Object obj3;
        Object obj4;
        Object obj5;
        Object obj6;
        Object obj7;
        Object obj8;
        Object obj9;
        Object obj10;
        Object obj11;
        Object objA3;
        Object obj12;
        Object obj13;
        Object objA4;
        int i = this.b;
        j55 j55Var = this.h;
        Object obj14 = this.g;
        switch (i) {
            case 0:
                PagingOptions pagingOptions = (PagingOptions) this.d;
                yd4 yd4Var = this.e;
                int i2 = this.f;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i2;
                    this.c = 1;
                    objA = ((lg) obj14).a(i2, (tg) j55Var, this, yd4Var, pagingOptions);
                    if (objA == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA = ((bjb) obj).a;
                }
                return new bjb(objA);
            case 1:
                PagingOptions pagingOptions2 = (PagingOptions) this.d;
                yd4 yd4Var2 = this.e;
                int i4 = this.f;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i4;
                    this.c = 1;
                    objA2 = ((zg) obj14).a(i4, (tg) j55Var, this, yd4Var2, pagingOptions2);
                    if (objA2 == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA2 = ((bjb) obj).a;
                }
                return new bjb(objA2);
            case 2:
                PageInfoData pageInfoData = (PageInfoData) this.d;
                yd4 yd4Var3 = this.e;
                int i6 = this.f;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i6;
                    this.c = 1;
                    Object objA5 = ((ji) obj14).a(pageInfoData, yd4Var3, (tg) j55Var, i6, this);
                    if (objA5 == tb2Var3) {
                        return tb2Var3;
                    }
                    obj2 = objA5;
                } else {
                    if (i7 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj2 = ((bjb) obj).a;
                }
                return new bjb(obj2);
            case 3:
                RecommendedTagsInput recommendedTagsInput = (RecommendedTagsInput) this.d;
                yd4 yd4Var4 = this.e;
                int i8 = this.f;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i8;
                    this.c = 1;
                    Object objA6 = ((wi) obj14).a(recommendedTagsInput, yd4Var4, (tg) j55Var, i8, this);
                    if (objA6 == tb2Var4) {
                        return tb2Var4;
                    }
                    obj3 = objA6;
                } else {
                    if (i9 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj3 = ((bjb) obj).a;
                }
                return new bjb(obj3);
            case 4:
                PageInfoData pageInfoData2 = (PageInfoData) this.d;
                yd4 yd4Var5 = this.e;
                int i10 = this.f;
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i10;
                    this.c = 1;
                    Object objA7 = ((ij) obj14).a(pageInfoData2, yd4Var5, (tg) j55Var, i10, this);
                    if (objA7 == tb2Var5) {
                        return tb2Var5;
                    }
                    obj4 = objA7;
                } else {
                    if (i11 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj4 = ((bjb) obj).a;
                }
                return new bjb(obj4);
            case 5:
                PagingOptions pagingOptions3 = (PagingOptions) this.d;
                yd4 yd4Var6 = this.e;
                int i12 = this.f;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i12;
                    this.c = 1;
                    Object objA8 = ((ek2) obj14).a(pagingOptions3, i12, (yaf) j55Var, yd4Var6, this);
                    if (objA8 == tb2Var6) {
                        return tb2Var6;
                    }
                    obj5 = objA8;
                } else {
                    if (i13 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj5 = ((bjb) obj).a;
                }
                return new bjb(obj5);
            case 6:
                PagingOptions pagingOptions4 = (PagingOptions) this.d;
                yd4 yd4Var7 = this.e;
                int i14 = this.f;
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                if (i15 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i14;
                    this.c = 1;
                    Object objA9 = ((dl2) obj14).a(pagingOptions4, i14, (rff) j55Var, yd4Var7, this);
                    if (objA9 == tb2Var7) {
                        return tb2Var7;
                    }
                    obj6 = objA9;
                } else {
                    if (i15 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj6 = ((bjb) obj).a;
                }
                return new bjb(obj6);
            case 7:
                PageInfoData pageInfoData3 = (PageInfoData) this.d;
                yd4 yd4Var8 = this.e;
                int i16 = this.f;
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i17 = this.c;
                if (i17 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i16;
                    this.c = 1;
                    Object objA10 = ((gl2) obj14).a(pageInfoData3, i16, (zaf) j55Var, yd4Var8, this);
                    if (objA10 == tb2Var8) {
                        return tb2Var8;
                    }
                    obj7 = objA10;
                } else {
                    if (i17 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj7 = ((bjb) obj).a;
                }
                return new bjb(obj7);
            case 8:
                CatalogPagingOptionsInput catalogPagingOptionsInput = (CatalogPagingOptionsInput) this.d;
                yd4 yd4Var9 = this.e;
                int i18 = this.f;
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i19 = this.c;
                if (i19 == 0) {
                    br7.v(obj);
                    mv4 mv4Var = (mv4) obj14;
                    if (catalogPagingOptionsInput == null) {
                        ay0.e("Required value was null.");
                        return null;
                    }
                    this.d = null;
                    this.e = null;
                    this.f = i18;
                    this.c = 1;
                    Object objA11 = mv4Var.a(catalogPagingOptionsInput, i18, (l23) j55Var, yd4Var9, this);
                    if (objA11 == tb2Var9) {
                        return tb2Var9;
                    }
                    obj8 = objA11;
                } else {
                    if (i19 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj8 = ((bjb) obj).a;
                }
                return new bjb(obj8);
            case 9:
                PagingOptions pagingOptions5 = (PagingOptions) this.d;
                yd4 yd4Var10 = this.e;
                int i20 = this.f;
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i21 = this.c;
                if (i21 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i20;
                    this.c = 1;
                    Object objA12 = ((fw4) obj14).a(pagingOptions5, yd4Var10, i20, (i12) j55Var, this);
                    if (objA12 == tb2Var10) {
                        return tb2Var10;
                    }
                    obj9 = objA12;
                } else {
                    if (i21 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj9 = ((bjb) obj).a;
                }
                return new bjb(obj9);
            case 10:
                yd4 yd4Var11 = this.e;
                int i22 = this.f;
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i23 = this.c;
                if (i23 == 0) {
                    br7.v(obj);
                    this.e = null;
                    this.f = i22;
                    this.c = 1;
                    Object objA13 = ((jx4) this.d).a((String) obj14, yd4Var11, (b55) j55Var, i22, this);
                    if (objA13 == tb2Var11) {
                        return tb2Var11;
                    }
                    obj10 = objA13;
                } else {
                    if (i23 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj10 = ((bjb) obj).a;
                }
                return new bjb(obj10);
            case 11:
                PagingOptions pagingOptions6 = (PagingOptions) this.d;
                yd4 yd4Var12 = this.e;
                int i24 = this.f;
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i25 = this.c;
                if (i25 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i24;
                    this.c = 1;
                    Object objA14 = ((vl5) obj14).a(pagingOptions6, i24, (l23) j55Var, yd4Var12, this);
                    if (objA14 == tb2Var12) {
                        return tb2Var12;
                    }
                    obj11 = objA14;
                } else {
                    if (i25 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj11 = ((bjb) obj).a;
                }
                return new bjb(obj11);
            case 12:
                PagingOptions pagingOptions7 = (PagingOptions) this.d;
                yd4 yd4Var13 = this.e;
                int i26 = this.f;
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i27 = this.c;
                if (i27 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i26;
                    this.c = 1;
                    objA3 = ((go5) obj14).a(i26, (tg) j55Var, this, yd4Var13, pagingOptions7);
                    if (objA3 == tb2Var13) {
                        return tb2Var13;
                    }
                } else {
                    if (i27 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA3 = ((bjb) obj).a;
                }
                return new bjb(objA3);
            case 13:
                PagingOptions pagingOptions8 = (PagingOptions) this.d;
                yd4 yd4Var14 = this.e;
                int i28 = this.f;
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i29 = this.c;
                if (i29 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i28;
                    this.c = 1;
                    Object objA15 = ((dp5) obj14).a(pagingOptions8, i28, (k13) j55Var, yd4Var14, this);
                    if (objA15 == tb2Var14) {
                        return tb2Var14;
                    }
                    obj12 = objA15;
                } else {
                    if (i29 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj12 = ((bjb) obj).a;
                }
                return new bjb(obj12);
            case 14:
                PagingOptions pagingOptions9 = (PagingOptions) this.d;
                yd4 yd4Var15 = this.e;
                int i30 = this.f;
                tb2 tb2Var15 = tb2.COROUTINE_SUSPENDED;
                int i31 = this.c;
                if (i31 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i30;
                    this.c = 1;
                    Object objA16 = ((iq5) obj14).a(pagingOptions9, i30, (k13) j55Var, yd4Var15, this);
                    if (objA16 == tb2Var15) {
                        return tb2Var15;
                    }
                    obj13 = objA16;
                } else {
                    if (i31 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj13 = ((bjb) obj).a;
                }
                return new bjb(obj13);
            default:
                PagingOptions pagingOptions10 = (PagingOptions) this.d;
                yd4 yd4Var16 = this.e;
                int i32 = this.f;
                tb2 tb2Var16 = tb2.COROUTINE_SUSPENDED;
                int i33 = this.c;
                if (i33 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.e = null;
                    this.f = i32;
                    this.c = 1;
                    objA4 = ((zta) obj14).a(i32, (tg) j55Var, this, yd4Var16, pagingOptions10);
                    if (objA4 == tb2Var16) {
                        return tb2Var16;
                    }
                } else {
                    if (i33 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA4 = ((bjb) obj).a;
                }
                return new bjb(objA4);
        }
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        j55 j55Var = this.h;
        Object obj5 = this.g;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj3).intValue();
                kg kgVar = new kg((lg) obj5, (tg) j55Var, (n92) obj4, 0);
                kgVar.d = (PagingOptions) obj;
                kgVar.e = (yd4) obj2;
                kgVar.f = iIntValue;
                return kgVar.invokeSuspend(c1eVar);
            case 1:
                int iIntValue2 = ((Number) obj3).intValue();
                kg kgVar2 = new kg((zg) obj5, (tg) j55Var, (n92) obj4, 1);
                kgVar2.d = (PagingOptions) obj;
                kgVar2.e = (yd4) obj2;
                kgVar2.f = iIntValue2;
                return kgVar2.invokeSuspend(c1eVar);
            case 2:
                int iIntValue3 = ((Number) obj3).intValue();
                kg kgVar3 = new kg((ji) obj5, (tg) j55Var, (n92) obj4, 2);
                kgVar3.d = (PageInfoData) obj;
                kgVar3.e = (yd4) obj2;
                kgVar3.f = iIntValue3;
                return kgVar3.invokeSuspend(c1eVar);
            case 3:
                int iIntValue4 = ((Number) obj3).intValue();
                kg kgVar4 = new kg((wi) obj5, (tg) j55Var, (n92) obj4, 3);
                kgVar4.d = (RecommendedTagsInput) obj;
                kgVar4.e = (yd4) obj2;
                kgVar4.f = iIntValue4;
                return kgVar4.invokeSuspend(c1eVar);
            case 4:
                int iIntValue5 = ((Number) obj3).intValue();
                kg kgVar5 = new kg((ij) obj5, (tg) j55Var, (n92) obj4, 4);
                kgVar5.d = (PageInfoData) obj;
                kgVar5.e = (yd4) obj2;
                kgVar5.f = iIntValue5;
                return kgVar5.invokeSuspend(c1eVar);
            case 5:
                int iIntValue6 = ((Number) obj3).intValue();
                kg kgVar6 = new kg((ek2) obj5, (yaf) j55Var, (n92) obj4, 5);
                kgVar6.d = (PagingOptions) obj;
                kgVar6.e = (yd4) obj2;
                kgVar6.f = iIntValue6;
                return kgVar6.invokeSuspend(c1eVar);
            case 6:
                int iIntValue7 = ((Number) obj3).intValue();
                kg kgVar7 = new kg((dl2) obj5, (rff) j55Var, (n92) obj4, 6);
                kgVar7.d = (PagingOptions) obj;
                kgVar7.e = (yd4) obj2;
                kgVar7.f = iIntValue7;
                return kgVar7.invokeSuspend(c1eVar);
            case 7:
                int iIntValue8 = ((Number) obj3).intValue();
                kg kgVar8 = new kg((gl2) obj5, (zaf) j55Var, (n92) obj4, 7);
                kgVar8.d = (PageInfoData) obj;
                kgVar8.e = (yd4) obj2;
                kgVar8.f = iIntValue8;
                return kgVar8.invokeSuspend(c1eVar);
            case 8:
                int iIntValue9 = ((Number) obj3).intValue();
                kg kgVar9 = new kg((mv4) obj5, (l23) j55Var, (n92) obj4, 8);
                kgVar9.d = (CatalogPagingOptionsInput) obj;
                kgVar9.e = (yd4) obj2;
                kgVar9.f = iIntValue9;
                return kgVar9.invokeSuspend(c1eVar);
            case 9:
                int iIntValue10 = ((Number) obj3).intValue();
                kg kgVar10 = new kg((fw4) obj5, (i12) j55Var, (n92) obj4, 9);
                kgVar10.d = (PagingOptions) obj;
                kgVar10.e = (yd4) obj2;
                kgVar10.f = iIntValue10;
                return kgVar10.invokeSuspend(c1eVar);
            case 10:
                int iIntValue11 = ((Number) obj3).intValue();
                kg kgVar11 = new kg((jx4) this.d, (String) obj5, (b55) j55Var, (n92) obj4);
                kgVar11.e = (yd4) obj2;
                kgVar11.f = iIntValue11;
                return kgVar11.invokeSuspend(c1eVar);
            case 11:
                int iIntValue12 = ((Number) obj3).intValue();
                kg kgVar12 = new kg((vl5) obj5, (l23) j55Var, (n92) obj4, 11);
                kgVar12.d = (PagingOptions) obj;
                kgVar12.e = (yd4) obj2;
                kgVar12.f = iIntValue12;
                return kgVar12.invokeSuspend(c1eVar);
            case 12:
                int iIntValue13 = ((Number) obj3).intValue();
                kg kgVar13 = new kg((go5) obj5, (tg) j55Var, (n92) obj4, 12);
                kgVar13.d = (PagingOptions) obj;
                kgVar13.e = (yd4) obj2;
                kgVar13.f = iIntValue13;
                return kgVar13.invokeSuspend(c1eVar);
            case 13:
                int iIntValue14 = ((Number) obj3).intValue();
                kg kgVar14 = new kg((dp5) obj5, (k13) j55Var, (n92) obj4, 13);
                kgVar14.d = (PagingOptions) obj;
                kgVar14.e = (yd4) obj2;
                kgVar14.f = iIntValue14;
                return kgVar14.invokeSuspend(c1eVar);
            case 14:
                int iIntValue15 = ((Number) obj3).intValue();
                kg kgVar15 = new kg((iq5) obj5, (k13) j55Var, (n92) obj4, 14);
                kgVar15.d = (PagingOptions) obj;
                kgVar15.e = (yd4) obj2;
                kgVar15.f = iIntValue15;
                return kgVar15.invokeSuspend(c1eVar);
            default:
                int iIntValue16 = ((Number) obj3).intValue();
                kg kgVar16 = new kg((zta) obj5, (tg) j55Var, (n92) obj4, 15);
                kgVar16.d = (PagingOptions) obj;
                kgVar16.e = (yd4) obj2;
                kgVar16.f = iIntValue16;
                return kgVar16.invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kg(Object obj, j55 j55Var, n92 n92Var, int i) {
        super(4, n92Var);
        this.b = i;
        this.g = obj;
        this.h = j55Var;
    }
}
