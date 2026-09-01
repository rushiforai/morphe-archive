package defpackage;

import com.medium.android.postpublishing.ui.PublicationSelection;
import com.medium.android.postpublishing.ui.TopicsSelection;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xda implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ fha b;
    public final /* synthetic */ vob c;

    public /* synthetic */ xda(fha fhaVar, vob vobVar, int i) {
        this.a = i;
        this.b = fhaVar;
        this.c = vobVar;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        vob vobVar = this.c;
        fha fhaVar = this.b;
        n92 n92Var2 = null;
        switch (i) {
            case 0:
                PublicationSelection publicationSelection = (PublicationSelection) obj;
                if (publicationSelection != null) {
                    fhaVar.getClass();
                    vx0.c0(f76.F(fhaVar), null, null, new nx9(publicationSelection, fhaVar, n92Var2, 11), 3);
                    iq1 iq1Var = vobVar.b;
                    ((LinkedHashMap) iq1Var.b).remove("publications_result");
                    ((LinkedHashMap) iq1Var.d).remove("publications_result");
                    ((LinkedHashMap) iq1Var.e).remove("publications_result");
                    if (vobVar.a.remove("publications_result") != null) {
                        rd6.m();
                        break;
                    }
                }
                break;
            default:
                TopicsSelection topicsSelection = (TopicsSelection) obj;
                if (topicsSelection != null) {
                    fhaVar.j(topicsSelection.getTopics());
                }
                iq1 iq1Var2 = vobVar.b;
                ((LinkedHashMap) iq1Var2.b).remove("topics_result");
                ((LinkedHashMap) iq1Var2.d).remove("topics_result");
                ((LinkedHashMap) iq1Var2.e).remove("topics_result");
                if (vobVar.a.remove("topics_result") != null) {
                    rd6.m();
                    break;
                }
                break;
        }
        return null;
    }
}
