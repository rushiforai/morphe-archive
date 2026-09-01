package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.type.PublicationStaffRole;
import com.medium.android.graphql.type.Sort;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ac4 extends p4d implements d55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ PageInfoData d;
    public /* synthetic */ yd4 e;
    public /* synthetic */ int f;
    public final /* synthetic */ String g;
    public final /* synthetic */ c55 h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Enum j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ac4(Object obj, String str, Enum r3, c55 c55Var, n92 n92Var, int i) {
        super(4, n92Var);
        this.b = i;
        this.i = obj;
        this.g = str;
        this.j = r3;
        this.h = c55Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objA2;
        int i = this.b;
        Enum r1 = this.j;
        Object obj2 = this.i;
        switch (i) {
            case 0:
                PageInfoData pageInfoData = this.d;
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
                    objA = ((bc4) obj2).a(this.g, (Sort) r1, 25, pageInfoData, yd4Var, i2, this.h, this);
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
            default:
                PageInfoData pageInfoData2 = this.d;
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
                    objA2 = ((yye) obj2).a(this.g, 15, (PublicationStaffRole) r1, pageInfoData2, yd4Var2, i4, this.h, this);
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
        }
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Enum r2 = this.j;
        Object obj5 = this.i;
        PageInfoData pageInfoData = (PageInfoData) obj;
        yd4 yd4Var = (yd4) obj2;
        int iIntValue = ((Number) obj3).intValue();
        n92 n92Var = (n92) obj4;
        switch (i) {
            case 0:
                ac4 ac4Var = new ac4((bc4) obj5, this.g, (Sort) r2, this.h, n92Var, 0);
                ac4Var.d = pageInfoData;
                ac4Var.e = yd4Var;
                ac4Var.f = iIntValue;
                return ac4Var.invokeSuspend(c1eVar);
            default:
                ac4 ac4Var2 = new ac4((yye) obj5, this.g, (PublicationStaffRole) r2, this.h, n92Var, 1);
                ac4Var2.d = pageInfoData;
                ac4Var2.e = yd4Var;
                ac4Var2.f = iIntValue;
                return ac4Var2.invokeSuspend(c1eVar);
        }
    }
}
