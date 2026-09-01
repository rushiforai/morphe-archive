package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.type.PublicationPostsBetweenFilter;
import com.medium.android.graphql.type.PublicationPostsFilter;
import com.medium.android.graphql.type.PublicationPostsOrderBy;
import com.medium.android.graphql.type.Sort;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gba extends p4d implements d55 {
    public int b;
    public /* synthetic */ PageInfoData c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ hba f;
    public final /* synthetic */ String g;
    public final /* synthetic */ rba h;
    public final /* synthetic */ f09 i;
    public final /* synthetic */ String j;
    public final /* synthetic */ tg k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gba(hba hbaVar, String str, rba rbaVar, f09 f09Var, String str2, tg tgVar, n92 n92Var) {
        super(4, n92Var);
        this.f = hbaVar;
        this.g = str;
        this.h = rbaVar;
        this.i = f09Var;
        this.j = str2;
        this.k = tgVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        PublicationPostsOrderBy publicationPostsOrderBy;
        PublicationPostsBetweenFilter publicationPostsBetweenFilter;
        Object objA;
        PageInfoData pageInfoData = this.c;
        yd4 yd4Var = this.d;
        int i = this.e;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i2 = this.b;
        if (i2 == 0) {
            br7.v(obj);
            int i3 = iba.a[this.h.ordinal()];
            if (i3 == 1) {
                publicationPostsOrderBy = new PublicationPostsOrderBy(new yv8(Sort.DESC), null, null, 6, null);
            } else if (i3 == 2) {
                publicationPostsOrderBy = new PublicationPostsOrderBy(new yv8(Sort.ASC), null, null, 6, null);
            } else {
                if (i3 != 3) {
                    ygf.a();
                    return null;
                }
                publicationPostsOrderBy = new PublicationPostsOrderBy(null, new yv8(Sort.DESC), null, 5, null);
            }
            f09 f09Var = this.i;
            if (f09Var != null) {
                publicationPostsBetweenFilter = new PublicationPostsBetweenFilter(new yv8(new Long(((Number) f09Var.b).longValue())), new yv8(new Long(((Number) f09Var.a).longValue())));
            } else {
                publicationPostsBetweenFilter = null;
            }
            zv8 yv8Var = xv8.a;
            zv8 yv8Var2 = publicationPostsBetweenFilter == null ? yv8Var : new yv8(publicationPostsBetweenFilter);
            String str = this.j;
            List listQ = str != null ? d46.Q(str) : null;
            if (listQ != null) {
                yv8Var = new yv8(listQ);
            }
            PublicationPostsFilter publicationPostsFilter = new PublicationPostsFilter(yv8Var2, null, null, new yv8(Boolean.TRUE), yv8Var, 6, null);
            this.c = null;
            this.d = null;
            this.e = i;
            this.b = 1;
            objA = this.f.a(this.g, publicationPostsOrderBy, publicationPostsFilter, 15, pageInfoData, yd4Var, i, this.k, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i2 != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objA = ((bjb) obj).a;
        }
        return new bjb(objA);
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int iIntValue = ((Number) obj3).intValue();
        String str = this.j;
        tg tgVar = this.k;
        gba gbaVar = new gba(this.f, this.g, this.h, this.i, str, tgVar, (n92) obj4);
        gbaVar.c = (PageInfoData) obj;
        gbaVar.d = (yd4) obj2;
        gbaVar.e = iIntValue;
        return gbaVar.invokeSuspend(c1e.a);
    }
}
