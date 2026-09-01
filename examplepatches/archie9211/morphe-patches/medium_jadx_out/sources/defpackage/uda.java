package defpackage;

import com.medium.android.postpublishing.ui.TopicsSelection;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class uda implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ db8 b;

    public /* synthetic */ uda(db8 db8Var, int i) {
        this.a = i;
        this.b = db8Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        vob vobVarA;
        vob vobVarA2;
        int i = this.a;
        c1e c1eVar = c1e.a;
        db8 db8Var = this.b;
        switch (i) {
            case 0:
                PublicationData publicationData = (PublicationData) obj;
                Object ylaVar = publicationData != null ? new yla(publicationData) : xla.a;
                ba8 ba8VarB = db8Var.b();
                if (ba8VarB != null && (vobVarA = ba8VarB.a()) != null) {
                    vobVarA.d("publications_result", ylaVar);
                }
                db8Var.e();
                break;
            default:
                List list = (List) obj;
                list.getClass();
                ba8 ba8VarB2 = db8Var.b();
                if (ba8VarB2 != null && (vobVarA2 = ba8VarB2.a()) != null) {
                    vobVarA2.d("topics_result", new TopicsSelection(list));
                }
                db8Var.e();
                break;
        }
        return c1eVar;
    }
}
