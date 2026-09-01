package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.PagingOptions;
import com.medium.android.graphql.type.PostType;
import com.medium.android.graphql.type.SearchPagingOptions;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yj2 extends p4d implements d55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ j55 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yj2(Object obj, Object obj2, j55 j55Var, n92 n92Var, int i) {
        super(4, n92Var);
        this.b = i;
        this.g = obj;
        this.h = obj2;
        this.i = j55Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        Object objA;
        Object objA2;
        Object objA3;
        Object objA4;
        Object objA5;
        Object objA6;
        Object objA7;
        Object objA8;
        Object objA9;
        Object objA10;
        Object objA11;
        Object objA12;
        Object objA13;
        Object objA14;
        Object objA15;
        Object objA16;
        Object objA17;
        Object objA18;
        Object objA19;
        Object objA20;
        Object objA21;
        int i = this.b;
        j55 j55Var = this.i;
        Object obj2 = this.h;
        Object obj3 = this.g;
        switch (i) {
            case 0:
                PagingOptions pagingOptions = (PagingOptions) this.f;
                yd4 yd4Var = this.d;
                int i2 = this.e;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i2;
                    this.c = 1;
                    objA = ((zj2) obj3).a((PostType) obj2, pagingOptions, i2, (c55) j55Var, yd4Var, this);
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
                PageInfoData pageInfoData = (PageInfoData) this.f;
                yd4 yd4Var2 = this.d;
                int i4 = this.e;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i4;
                    this.c = 1;
                    objA2 = ((zv4) obj3).a((String) obj2, 20, pageInfoData, i4, yd4Var2, (def) j55Var, this);
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
                PageInfoData pageInfoData2 = (PageInfoData) this.f;
                yd4 yd4Var3 = this.d;
                int i6 = this.e;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i6;
                    this.c = 1;
                    objA3 = ((cw4) obj3).a((String) obj2, pageInfoData2, i6, yd4Var3, (yk) j55Var, this);
                    if (objA3 == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i7 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA3 = ((bjb) obj).a;
                }
                return new bjb(objA3);
            case 3:
                PagingOptions pagingOptions2 = (PagingOptions) this.f;
                yd4 yd4Var4 = this.d;
                int i8 = this.e;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i8;
                    this.c = 1;
                    objA4 = ((iw4) obj3).a((String) obj2, pagingOptions2, i8, yd4Var4, (def) j55Var, this);
                    if (objA4 == tb2Var4) {
                        return tb2Var4;
                    }
                } else {
                    if (i9 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA4 = ((bjb) obj).a;
                }
                return new bjb(objA4);
            case 4:
                PagingOptions pagingOptions3 = (PagingOptions) this.f;
                yd4 yd4Var5 = this.d;
                int i10 = this.e;
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i10;
                    this.c = 1;
                    objA5 = ((hy4) obj3).a((String) obj2, pagingOptions3, yd4Var5, (b55) j55Var, i10, this);
                    if (objA5 == tb2Var5) {
                        return tb2Var5;
                    }
                } else {
                    if (i11 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA5 = ((bjb) obj).a;
                }
                return new bjb(objA5);
            case 5:
                PagingOptions pagingOptions4 = (PagingOptions) this.f;
                yd4 yd4Var6 = this.d;
                int i12 = this.e;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i12;
                    this.c = 1;
                    objA6 = ((xc5) obj3).a((String) obj2, pagingOptions4, i12, (bie) j55Var, yd4Var6, this);
                    if (objA6 == tb2Var6) {
                        return tb2Var6;
                    }
                } else {
                    if (i13 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA6 = ((bjb) obj).a;
                }
                return new bjb(objA6);
            case 6:
                PagingOptions pagingOptions5 = (PagingOptions) this.f;
                yd4 yd4Var7 = this.d;
                int i14 = this.e;
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                if (i15 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i14;
                    this.c = 1;
                    objA7 = ((zk8) obj3).a(25, (List) obj2, pagingOptions5, yd4Var7, i14, (c55) j55Var, this);
                    if (objA7 == tb2Var7) {
                        return tb2Var7;
                    }
                } else {
                    if (i15 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA7 = ((bjb) obj).a;
                }
                return new bjb(objA7);
            case 7:
                PagingOptions pagingOptions6 = (PagingOptions) this.f;
                yd4 yd4Var8 = this.d;
                int i16 = this.e;
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i17 = this.c;
                if (i17 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i16;
                    this.c = 1;
                    objA8 = ((nha) obj3).a((String) obj2, pagingOptions6, i16, (v08) j55Var, yd4Var8, this);
                    if (objA8 == tb2Var8) {
                        return tb2Var8;
                    }
                } else {
                    if (i17 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA8 = ((bjb) obj).a;
                }
                return new bjb(objA8);
            case 8:
                PageInfoData pageInfoData3 = (PageInfoData) this.f;
                yd4 yd4Var9 = this.d;
                int i18 = this.e;
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i19 = this.c;
                if (i19 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i18;
                    this.c = 1;
                    objA9 = ((uja) obj3).a(15, i18, (tg) j55Var, this, yd4Var9, pageInfoData3, (String) obj2);
                    if (objA9 == tb2Var9) {
                        return tb2Var9;
                    }
                } else {
                    if (i19 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA9 = ((bjb) obj).a;
                }
                return new bjb(objA9);
            case 9:
                SearchPagingOptions searchPagingOptions = (SearchPagingOptions) this.f;
                yd4 yd4Var10 = this.d;
                int i20 = this.e;
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i21 = this.c;
                if (i21 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i20;
                    this.c = 1;
                    objA10 = ((ctb) obj3).a((String) obj2, searchPagingOptions, i20, (tg) j55Var, yd4Var10, this);
                    if (objA10 == tb2Var10) {
                        return tb2Var10;
                    }
                } else {
                    if (i21 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA10 = ((bjb) obj).a;
                }
                return new bjb(objA10);
            case 10:
                SearchPagingOptions searchPagingOptions2 = (SearchPagingOptions) this.f;
                yd4 yd4Var11 = this.d;
                int i22 = this.e;
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i23 = this.c;
                if (i23 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i22;
                    this.c = 1;
                    objA11 = ((etb) obj3).a((String) obj2, searchPagingOptions2, i22, (tg) j55Var, yd4Var11, this);
                    if (objA11 == tb2Var11) {
                        return tb2Var11;
                    }
                } else {
                    if (i23 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA11 = ((bjb) obj).a;
                }
                return new bjb(objA11);
            case 11:
                SearchPagingOptions searchPagingOptions3 = (SearchPagingOptions) this.f;
                yd4 yd4Var12 = this.d;
                int i24 = this.e;
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i25 = this.c;
                if (i25 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i24;
                    this.c = 1;
                    objA12 = ((otb) obj3).a((String) obj2, searchPagingOptions3, i24, (tg) j55Var, yd4Var12, this);
                    if (objA12 == tb2Var12) {
                        return tb2Var12;
                    }
                } else {
                    if (i25 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA12 = ((bjb) obj).a;
                }
                return new bjb(objA12);
            case 12:
                SearchPagingOptions searchPagingOptions4 = (SearchPagingOptions) this.f;
                yd4 yd4Var13 = this.d;
                int i26 = this.e;
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i27 = this.c;
                if (i27 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i26;
                    this.c = 1;
                    objA13 = ((kub) obj3).a((String) obj2, searchPagingOptions4, i26, (tg) j55Var, yd4Var13, this);
                    if (objA13 == tb2Var13) {
                        return tb2Var13;
                    }
                } else {
                    if (i27 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA13 = ((bjb) obj).a;
                }
                return new bjb(objA13);
            case 13:
                SearchPagingOptions searchPagingOptions5 = (SearchPagingOptions) this.f;
                yd4 yd4Var14 = this.d;
                int i28 = this.e;
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i29 = this.c;
                if (i29 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i28;
                    this.c = 1;
                    objA14 = ((rub) obj3).a((String) obj2, searchPagingOptions5, i28, (tg) j55Var, yd4Var14, this);
                    if (objA14 == tb2Var14) {
                        return tb2Var14;
                    }
                } else {
                    if (i29 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA14 = ((bjb) obj).a;
                }
                return new bjb(objA14);
            case 14:
                PageInfoData pageInfoData4 = (PageInfoData) this.f;
                yd4 yd4Var15 = this.d;
                int i30 = this.e;
                tb2 tb2Var15 = tb2.COROUTINE_SUSPENDED;
                int i31 = this.c;
                if (i31 == 0) {
                    br7.v(obj);
                    c9d c9dVar = (c9d) obj3;
                    String str = (String) obj2;
                    int i32 = i30 == 0 ? 5 : 10;
                    this.f = null;
                    this.d = null;
                    this.e = i30;
                    this.c = 1;
                    objA15 = c9dVar.a(i32, i30, (tg) j55Var, this, yd4Var15, pageInfoData4, str);
                    if (objA15 == tb2Var15) {
                        return tb2Var15;
                    }
                } else {
                    if (i31 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA15 = ((bjb) obj).a;
                }
                return new bjb(objA15);
            case 15:
                PagingOptions pagingOptions7 = (PagingOptions) this.f;
                yd4 yd4Var16 = this.d;
                int i33 = this.e;
                tb2 tb2Var16 = tb2.COROUTINE_SUSPENDED;
                int i34 = this.c;
                if (i34 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i33;
                    this.c = 1;
                    objA16 = ((x9d) obj3).a((String) obj2, pagingOptions7, i33, (d55) j55Var, yd4Var16, this);
                    if (objA16 == tb2Var16) {
                        return tb2Var16;
                    }
                } else {
                    if (i34 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA16 = ((bjb) obj).a;
                }
                return new bjb(objA16);
            case 16:
                PagingOptions pagingOptions8 = (PagingOptions) this.f;
                yd4 yd4Var17 = this.d;
                int i35 = this.e;
                tb2 tb2Var17 = tb2.COROUTINE_SUSPENDED;
                int i36 = this.c;
                if (i36 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i35;
                    this.c = 1;
                    objA17 = ((xae) obj3).a((String) obj2, pagingOptions8, i35, (l23) j55Var, yd4Var17, this);
                    if (objA17 == tb2Var17) {
                        return tb2Var17;
                    }
                } else {
                    if (i36 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA17 = ((bjb) obj).a;
                }
                return new bjb(objA17);
            case 17:
                PageInfoData pageInfoData5 = (PageInfoData) this.f;
                yd4 yd4Var18 = this.d;
                int i37 = this.e;
                tb2 tb2Var18 = tb2.COROUTINE_SUSPENDED;
                int i38 = this.c;
                if (i38 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i37;
                    this.c = 1;
                    objA18 = ((kle) obj3).a((String) obj2, 20, pageInfoData5, yd4Var18, i37, (xnc) j55Var, this);
                    if (objA18 == tb2Var18) {
                        return tb2Var18;
                    }
                } else {
                    if (i38 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA18 = ((bjb) obj).a;
                }
                return new bjb(objA18);
            case 18:
                CatalogPagingOptionsInput catalogPagingOptionsInput = (CatalogPagingOptionsInput) this.f;
                yd4 yd4Var19 = this.d;
                int i39 = this.e;
                tb2 tb2Var19 = tb2.COROUTINE_SUSPENDED;
                int i40 = this.c;
                if (i40 == 0) {
                    br7.v(obj);
                    if (catalogPagingOptionsInput == null) {
                        ay0.e("Required value was null.");
                        return null;
                    }
                    this.f = null;
                    this.d = null;
                    this.e = i39;
                    this.c = 1;
                    objA19 = ((kxe) obj3).a((String) obj2, catalogPagingOptionsInput, yd4Var19, i39, (tg) j55Var, this);
                    if (objA19 == tb2Var19) {
                        return tb2Var19;
                    }
                } else {
                    if (i40 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA19 = ((bjb) obj).a;
                }
                return new bjb(objA19);
            case 19:
                PageInfoData pageInfoData6 = (PageInfoData) this.f;
                yd4 yd4Var20 = this.d;
                int i41 = this.e;
                tb2 tb2Var20 = tb2.COROUTINE_SUSPENDED;
                int i42 = this.c;
                if (i42 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i41;
                    this.c = 1;
                    objA20 = ((pye) obj3).a((String) obj2, 20, pageInfoData6, yd4Var20, i41, (hbb) j55Var, this);
                    if (objA20 == tb2Var20) {
                        return tb2Var20;
                    }
                } else {
                    if (i42 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA20 = ((bjb) obj).a;
                }
                return new bjb(objA20);
            default:
                PagingOptions pagingOptions9 = (PagingOptions) this.f;
                yd4 yd4Var21 = this.d;
                int i43 = this.e;
                tb2 tb2Var21 = tb2.COROUTINE_SUSPENDED;
                int i44 = this.c;
                if (i44 == 0) {
                    br7.v(obj);
                    this.f = null;
                    this.d = null;
                    this.e = i43;
                    this.c = 1;
                    objA21 = ((wye) obj3).a((String) obj2, pagingOptions9, yd4Var21, i43, (tg) j55Var, this);
                    if (objA21 == tb2Var21) {
                        return tb2Var21;
                    }
                } else {
                    if (i44 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA21 = ((bjb) obj).a;
                }
                return new bjb(objA21);
        }
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        j55 j55Var = this.i;
        Object obj5 = this.h;
        Object obj6 = this.g;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj3).intValue();
                yj2 yj2Var = new yj2((zj2) obj6, (PostType) obj5, (c55) j55Var, (n92) obj4, 0);
                yj2Var.f = (PagingOptions) obj;
                yj2Var.d = (yd4) obj2;
                yj2Var.e = iIntValue;
                return yj2Var.invokeSuspend(c1eVar);
            case 1:
                int iIntValue2 = ((Number) obj3).intValue();
                yj2 yj2Var2 = new yj2((zv4) obj6, (String) obj5, (def) j55Var, (n92) obj4, 1);
                yj2Var2.f = (PageInfoData) obj;
                yj2Var2.d = (yd4) obj2;
                yj2Var2.e = iIntValue2;
                return yj2Var2.invokeSuspend(c1eVar);
            case 2:
                int iIntValue3 = ((Number) obj3).intValue();
                yj2 yj2Var3 = new yj2((cw4) obj6, (String) obj5, (yk) j55Var, (n92) obj4, 2);
                yj2Var3.f = (PageInfoData) obj;
                yj2Var3.d = (yd4) obj2;
                yj2Var3.e = iIntValue3;
                return yj2Var3.invokeSuspend(c1eVar);
            case 3:
                int iIntValue4 = ((Number) obj3).intValue();
                yj2 yj2Var4 = new yj2((iw4) obj6, (String) obj5, (def) j55Var, (n92) obj4, 3);
                yj2Var4.f = (PagingOptions) obj;
                yj2Var4.d = (yd4) obj2;
                yj2Var4.e = iIntValue4;
                return yj2Var4.invokeSuspend(c1eVar);
            case 4:
                int iIntValue5 = ((Number) obj3).intValue();
                yj2 yj2Var5 = new yj2((hy4) obj6, (String) obj5, (b55) j55Var, (n92) obj4, 4);
                yj2Var5.f = (PagingOptions) obj;
                yj2Var5.d = (yd4) obj2;
                yj2Var5.e = iIntValue5;
                return yj2Var5.invokeSuspend(c1eVar);
            case 5:
                int iIntValue6 = ((Number) obj3).intValue();
                yj2 yj2Var6 = new yj2((xc5) obj6, (String) obj5, (bie) j55Var, (n92) obj4, 5);
                yj2Var6.f = (PagingOptions) obj;
                yj2Var6.d = (yd4) obj2;
                yj2Var6.e = iIntValue6;
                return yj2Var6.invokeSuspend(c1eVar);
            case 6:
                int iIntValue7 = ((Number) obj3).intValue();
                yj2 yj2Var7 = new yj2((zk8) obj6, (List) obj5, (c55) j55Var, (n92) obj4, 6);
                yj2Var7.f = (PagingOptions) obj;
                yj2Var7.d = (yd4) obj2;
                yj2Var7.e = iIntValue7;
                return yj2Var7.invokeSuspend(c1eVar);
            case 7:
                int iIntValue8 = ((Number) obj3).intValue();
                yj2 yj2Var8 = new yj2((nha) obj6, (String) obj5, (v08) j55Var, (n92) obj4, 7);
                yj2Var8.f = (PagingOptions) obj;
                yj2Var8.d = (yd4) obj2;
                yj2Var8.e = iIntValue8;
                return yj2Var8.invokeSuspend(c1eVar);
            case 8:
                int iIntValue9 = ((Number) obj3).intValue();
                yj2 yj2Var9 = new yj2((uja) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 8);
                yj2Var9.f = (PageInfoData) obj;
                yj2Var9.d = (yd4) obj2;
                yj2Var9.e = iIntValue9;
                return yj2Var9.invokeSuspend(c1eVar);
            case 9:
                int iIntValue10 = ((Number) obj3).intValue();
                yj2 yj2Var10 = new yj2((ctb) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 9);
                yj2Var10.f = (SearchPagingOptions) obj;
                yj2Var10.d = (yd4) obj2;
                yj2Var10.e = iIntValue10;
                return yj2Var10.invokeSuspend(c1eVar);
            case 10:
                int iIntValue11 = ((Number) obj3).intValue();
                yj2 yj2Var11 = new yj2((etb) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 10);
                yj2Var11.f = (SearchPagingOptions) obj;
                yj2Var11.d = (yd4) obj2;
                yj2Var11.e = iIntValue11;
                return yj2Var11.invokeSuspend(c1eVar);
            case 11:
                int iIntValue12 = ((Number) obj3).intValue();
                yj2 yj2Var12 = new yj2((otb) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 11);
                yj2Var12.f = (SearchPagingOptions) obj;
                yj2Var12.d = (yd4) obj2;
                yj2Var12.e = iIntValue12;
                return yj2Var12.invokeSuspend(c1eVar);
            case 12:
                int iIntValue13 = ((Number) obj3).intValue();
                yj2 yj2Var13 = new yj2((kub) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 12);
                yj2Var13.f = (SearchPagingOptions) obj;
                yj2Var13.d = (yd4) obj2;
                yj2Var13.e = iIntValue13;
                return yj2Var13.invokeSuspend(c1eVar);
            case 13:
                int iIntValue14 = ((Number) obj3).intValue();
                yj2 yj2Var14 = new yj2((rub) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 13);
                yj2Var14.f = (SearchPagingOptions) obj;
                yj2Var14.d = (yd4) obj2;
                yj2Var14.e = iIntValue14;
                return yj2Var14.invokeSuspend(c1eVar);
            case 14:
                int iIntValue15 = ((Number) obj3).intValue();
                yj2 yj2Var15 = new yj2((c9d) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 14);
                yj2Var15.f = (PageInfoData) obj;
                yj2Var15.d = (yd4) obj2;
                yj2Var15.e = iIntValue15;
                return yj2Var15.invokeSuspend(c1eVar);
            case 15:
                int iIntValue16 = ((Number) obj3).intValue();
                yj2 yj2Var16 = new yj2((x9d) obj6, (String) obj5, (d55) j55Var, (n92) obj4, 15);
                yj2Var16.f = (PagingOptions) obj;
                yj2Var16.d = (yd4) obj2;
                yj2Var16.e = iIntValue16;
                return yj2Var16.invokeSuspend(c1eVar);
            case 16:
                int iIntValue17 = ((Number) obj3).intValue();
                yj2 yj2Var17 = new yj2((xae) obj6, (String) obj5, (l23) j55Var, (n92) obj4, 16);
                yj2Var17.f = (PagingOptions) obj;
                yj2Var17.d = (yd4) obj2;
                yj2Var17.e = iIntValue17;
                return yj2Var17.invokeSuspend(c1eVar);
            case 17:
                int iIntValue18 = ((Number) obj3).intValue();
                yj2 yj2Var18 = new yj2((kle) obj6, (String) obj5, (xnc) j55Var, (n92) obj4, 17);
                yj2Var18.f = (PageInfoData) obj;
                yj2Var18.d = (yd4) obj2;
                yj2Var18.e = iIntValue18;
                return yj2Var18.invokeSuspend(c1eVar);
            case 18:
                int iIntValue19 = ((Number) obj3).intValue();
                yj2 yj2Var19 = new yj2((kxe) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 18);
                yj2Var19.f = (CatalogPagingOptionsInput) obj;
                yj2Var19.d = (yd4) obj2;
                yj2Var19.e = iIntValue19;
                return yj2Var19.invokeSuspend(c1eVar);
            case 19:
                int iIntValue20 = ((Number) obj3).intValue();
                yj2 yj2Var20 = new yj2((pye) obj6, (String) obj5, (hbb) j55Var, (n92) obj4, 19);
                yj2Var20.f = (PageInfoData) obj;
                yj2Var20.d = (yd4) obj2;
                yj2Var20.e = iIntValue20;
                return yj2Var20.invokeSuspend(c1eVar);
            default:
                int iIntValue21 = ((Number) obj3).intValue();
                yj2 yj2Var21 = new yj2((wye) obj6, (String) obj5, (tg) j55Var, (n92) obj4, 20);
                yj2Var21.f = (PagingOptions) obj;
                yj2Var21.d = (yd4) obj2;
                yj2Var21.e = iIntValue21;
                return yj2Var21.invokeSuspend(c1eVar);
        }
    }
}
