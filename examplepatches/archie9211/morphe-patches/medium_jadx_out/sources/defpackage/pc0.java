package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pc0 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Object j;
    public final /* synthetic */ Object k;

    public /* synthetic */ pc0(String str, String str2, fha fhaVar, wea weaVar, lma lmaVar, db8 db8Var, r28 r28Var, x45 x45Var, String str3, m45 m45Var, int i) {
        this.b = str;
        this.c = str2;
        this.e = fhaVar;
        this.f = weaVar;
        this.g = lmaVar;
        this.h = db8Var;
        this.d = r28Var;
        this.i = x45Var;
        this.j = str3;
        this.k = m45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.k;
        Object obj4 = this.j;
        Object obj5 = this.i;
        Object obj6 = this.h;
        Object obj7 = this.g;
        Object obj8 = this.f;
        Object obj9 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                gsa.j((List) obj9, this.b, (o41) obj8, (aa7) obj7, (zg7) obj6, this.c, (SusiDestination) obj5, (SusiOperation) obj4, this.d, (yd0) obj3, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                jq7.c(this.b, this.c, (fha) obj9, (wea) obj8, (lma) obj7, (db8) obj6, this.d, (x45) obj5, (String) obj4, (m45) obj3, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pc0(List list, String str, o41 o41Var, aa7 aa7Var, zg7 zg7Var, String str2, SusiDestination susiDestination, SusiOperation susiOperation, r28 r28Var, yd0 yd0Var, int i) {
        this.e = list;
        this.b = str;
        this.f = o41Var;
        this.g = aa7Var;
        this.h = zg7Var;
        this.c = str2;
        this.i = susiDestination;
        this.j = susiOperation;
        this.d = r28Var;
        this.k = yd0Var;
    }
}
