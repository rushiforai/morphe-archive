package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class me0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ me0(rq9 rq9Var, pq9 pq9Var, boolean z, SourceParameter sourceParameter, b55 b55Var, r28 r28Var, PublicationSubmissionStatus publicationSubmissionStatus, int i) {
        this.a = 0;
        this.e = rq9Var;
        this.f = pq9Var;
        this.c = z;
        this.g = sourceParameter;
        this.b = b55Var;
        this.d = r28Var;
        this.h = publicationSubmissionStatus;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.h;
        Object obj4 = this.b;
        Object obj5 = this.g;
        Object obj6 = this.f;
        Object obj7 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                vc2.l((rq9) obj7, (pq9) obj6, this.c, (SourceParameter) obj5, (b55) obj4, this.d, (PublicationSubmissionStatus) obj3, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                m40.e((List) obj7, (lv0) obj6, (b55) obj4, (String) obj5, (zw7) obj3, this.c, this.d, (x12) obj, iY2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(1);
                ok7.k((String) obj7, (g08) obj6, (zm7) obj5, this.d, (String) obj4, this.c, (z9b) obj3, (x12) obj, iY3);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(1);
                t40.q((String) obj7, (String) obj6, (SusiDestination) obj5, this.c, (qlb) obj4, this.d, (wac) obj3, (x12) obj, iY4);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(1);
                m40.D((String) obj7, (String) obj6, (SusiDestination) obj5, this.c, (nec) obj4, this.d, (e2e) obj3, (x12) obj, iY5);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ me0(String str, g08 g08Var, zm7 zm7Var, r28 r28Var, String str2, boolean z, z9b z9bVar, int i) {
        this.a = 2;
        this.e = str;
        this.f = g08Var;
        this.g = zm7Var;
        this.d = r28Var;
        this.b = str2;
        this.c = z;
        this.h = z9bVar;
    }

    public /* synthetic */ me0(String str, String str2, SusiDestination susiDestination, boolean z, Object obj, r28 r28Var, que queVar, int i, int i2) {
        this.a = i2;
        this.e = str;
        this.f = str2;
        this.g = susiDestination;
        this.c = z;
        this.b = obj;
        this.d = r28Var;
        this.h = queVar;
    }

    public /* synthetic */ me0(List list, lv0 lv0Var, b55 b55Var, String str, zw7 zw7Var, boolean z, r28 r28Var, int i) {
        this.a = 1;
        this.e = list;
        this.f = lv0Var;
        this.b = b55Var;
        this.g = str;
        this.h = zw7Var;
        this.c = z;
        this.d = r28Var;
    }
}
