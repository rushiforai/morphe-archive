package com.medium.android.postpublishing.ui.publicationSelection;

import com.medium.android.graphql.GetPostPublishingDataQuery;
import defpackage.bjb;
import defpackage.br7;
import defpackage.c1e;
import defpackage.cu1;
import defpackage.e55;
import defpackage.g76;
import defpackage.gp7;
import defpackage.hma;
import defpackage.ima;
import defpackage.ja5;
import defpackage.la5;
import defpackage.lma;
import defpackage.n92;
import defpackage.p4d;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e extends p4d implements e55 {
    public /* synthetic */ Object b;
    public /* synthetic */ la5 c;
    public /* synthetic */ String d;
    public /* synthetic */ boolean e;
    public final /* synthetic */ lma f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(lma lmaVar, n92 n92Var) {
        super(5, n92Var);
        this.f = lmaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        GetPostPublishingDataQuery.Publication publication;
        Object obj2 = this.b;
        la5 la5Var = this.c;
        String str = this.d;
        boolean z = this.e;
        br7.v(obj);
        if (bjb.b(obj2) == null) {
            List<PublicationData> list = (List) obj2;
            boolean z2 = la5Var instanceof ja5;
            ja5 ja5Var = z2 ? (ja5) la5Var : null;
            boolean zL = ja5Var != null ? g76.L(ja5Var.b.isPublished(), Boolean.TRUE) : false;
            if (z2) {
                GetPostPublishingDataQuery.Post post = ((ja5) la5Var).b;
                GetPostPublishingDataQuery.MostRecentSubmission mostRecentSubmission = post.getViewerEdge().getMostRecentSubmission();
                if (mostRecentSubmission == null || gp7.v(mostRecentSubmission.getStatus()) == null) {
                    mostRecentSubmission = null;
                }
                lma lmaVar = this.f;
                if (mostRecentSubmission != null && lmaVar.h == null) {
                    lmaVar.h = mostRecentSubmission.getPublication().getId();
                    lmaVar.g.l(mostRecentSubmission.getPublication().getId());
                }
                ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                for (PublicationData publicationData : list) {
                    arrayList.add(PublicationData.copy$default(publicationData, null, null, null, null, g76.L(publicationData.getId(), str), null, false, null, g76.L(publicationData.getId(), (mostRecentSubmission == null || (publication = mostRecentSubmission.getPublication()) == null) ? null : publication.getId()) && gp7.v(mostRecentSubmission.getStatus()) != null, 239, null));
                }
                return new ima(mostRecentSubmission == null, arrayList, g76.L(post.isPublished(), Boolean.FALSE), g76.L(post.isPublished(), Boolean.TRUE), mostRecentSubmission != null, !g76.L(str, lmaVar.h), zL, z);
            }
        }
        return hma.a;
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        Object obj6 = ((bjb) obj).a;
        boolean zBooleanValue = ((Boolean) obj4).booleanValue();
        e eVar = new e(this.f, (n92) obj5);
        eVar.b = obj6;
        eVar.c = (la5) obj2;
        eVar.d = (String) obj3;
        eVar.e = zBooleanValue;
        return eVar.invokeSuspend(c1e.a);
    }
}
