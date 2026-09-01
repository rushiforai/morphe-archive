package defpackage;

import com.medium.android.graphql.type.PublicationSubmissionStatus;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ke0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ ke0(pq9 pq9Var, rq9 rq9Var, boolean z, SourceParameter sourceParameter, b55 b55Var, r28 r28Var, int i) {
        this.a = 1;
        this.b = pq9Var;
        this.c = rq9Var;
        this.d = z;
        this.e = sourceParameter;
        this.f = b55Var;
        this.g = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.g;
        Object obj4 = this.f;
        Object obj5 = this.e;
        Object obj6 = this.b;
        Object obj7 = this.c;
        switch (i) {
            case 0:
                rq9 rq9Var = (rq9) obj7;
                pq9 pq9Var = (pq9) obj6;
                SourceParameter sourceParameter = (SourceParameter) obj5;
                b55 b55Var = (b55) obj4;
                PublicationSubmissionStatus publicationSubmissionStatus = (PublicationSubmissionStatus) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    vc2.l(rq9Var, pq9Var, this.d, sourceParameter, b55Var, null, publicationSubmissionStatus, p65Var, 0);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                vc2.d((pq9) obj6, (rq9) obj7, this.d, (SourceParameter) obj5, (b55) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                w2g.d((m45) obj7, (r28) obj6, this.d, (m3c) obj5, (fy2) obj4, (mz1) obj3, (x12) obj, tr7.y(100663297));
                break;
            case 3:
                ((Integer) obj2).getClass();
                wo7.c((m45) obj7, (mz1) obj6, (r28) obj5, this.d, (m3c) obj4, (nl1) obj3, (x12) obj, tr7.y(49));
                break;
            case 4:
                ((Integer) obj2).getClass();
                xz5.m((uga) obj7, (wda) obj6, (sda) obj5, this.d, (r28) obj4, (kv6) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                hk7.l((String) obj7, (String) obj6, this.d, (r6f) obj5, (r28) obj4, (w6f) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ke0(rq9 rq9Var, pq9 pq9Var, boolean z, SourceParameter sourceParameter, b55 b55Var, PublicationSubmissionStatus publicationSubmissionStatus) {
        this.a = 0;
        this.c = rq9Var;
        this.b = pq9Var;
        this.d = z;
        this.e = sourceParameter;
        this.f = b55Var;
        this.g = publicationSubmissionStatus;
    }

    public /* synthetic */ ke0(Object obj, Object obj2, Object obj3, boolean z, Object obj4, Object obj5, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.b = obj2;
        this.e = obj3;
        this.d = z;
        this.f = obj4;
        this.g = obj5;
    }

    public /* synthetic */ ke0(Object obj, Object obj2, boolean z, Object obj3, Object obj4, Object obj5, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.b = obj2;
        this.d = z;
        this.e = obj3;
        this.f = obj4;
        this.g = obj5;
    }
}
