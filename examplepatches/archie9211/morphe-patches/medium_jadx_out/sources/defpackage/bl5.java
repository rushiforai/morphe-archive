package defpackage;

import com.medium.android.core.share.PostShareData;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.graphql.PostHighlightQuery;
import com.medium.android.graphql.fragment.HighlightsData;
import com.medium.android.graphql.fragment.PostMetaData;
import com.medium.android.graphql.fragment.ResponseCountData;
import gen.model.SourceParameter;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bl5 implements do4 {
    public final /* synthetic */ rya a;
    public final /* synthetic */ do4 b;
    public final /* synthetic */ dl5 c;
    public final /* synthetic */ rya d;

    public bl5(rya ryaVar, do4 do4Var, dl5 dl5Var, rya ryaVar2) {
        this.a = ryaVar;
        this.b = do4Var;
        this.c = dl5Var;
        this.d = ryaVar2;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        Object next;
        List<HighlightsData.Highlight> highlights;
        Integer count;
        hk5 hk5Var = (hk5) obj;
        dl5 dl5Var = this.c;
        SourceParameter sourceParameter = dl5Var.d;
        w5d w5dVar = dl5Var.j;
        Object obj2 = this.a.a;
        if (obj2 == null) {
            ay0.e("PostResult is required");
            return null;
        }
        PostHighlightQuery.PostResult postResult = (PostHighlightQuery.PostResult) obj2;
        PostMetaData postMetaData = postResult.getPostMetaData();
        if (postMetaData == null) {
            ay0.e("PostMetaData is required");
            return null;
        }
        boolean z = hk5Var instanceof fk5;
        rya ryaVar = this.d;
        if (z) {
            PostMetaData.Creator creator = postMetaData.getCreator();
            String name = creator != null ? creator.getName() : null;
            if (name == null) {
                ay0.e("Creator name is required");
                return null;
            }
            Long totalClapCount = postMetaData.getPostClapsData().getTotalClapCount();
            long jLongValue = totalClapCount != null ? totalClapCount.longValue() : 0L;
            uk5 uk5Var = ((fk5) hk5Var).a;
            long j = jLongValue;
            String title = postMetaData.getTitle();
            if (title == null) {
                ay0.e("Post title missing");
                return null;
            }
            long jIntValue = 0;
            String latestPublishedVersion = postMetaData.getLatestPublishedVersion();
            ResponseCountData.PostResponses postResponses = postMetaData.getResponseCountData().getPostResponses();
            if (postResponses != null && (count = postResponses.getCount()) != null) {
                jIntValue = count.intValue();
            }
            Object objA = this.b.a(new vk5(name, j, uk5Var, title, latestPublishedVersion, jIntValue, (String) w5dVar.getValue(), (List) ryaVar.a, gp7.u(sourceParameter)), n92Var);
            if (objA == tb2.COROUTINE_SUSPENDED) {
                return objA;
            }
        } else {
            if (!(hk5Var instanceof gk5)) {
                ygf.a();
                return null;
            }
            HighlightsData highlightsData = postResult.getHighlightsData();
            List listC = (highlightsData == null || (highlights = highlightsData.getHighlights()) == null) ? ey3.a : el5.c(highlights);
            Iterator it2 = ((Iterable) ryaVar.a).iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((Highlight) next).getUserId(), (String) w5dVar.getValue())) {
                    break;
                }
            }
            Highlight highlight = (Highlight) next;
            if (highlight == null) {
                highlight = (Highlight) bu1.z0((List) ryaVar.a);
            }
            PostShareData postShareDataA = dl5Var.i.a(postMetaData, listC, highlight != null ? highlight.getBoundedText() : null);
            if (postShareDataA == null) {
                ygf.f("Post share data cannot be null");
                return null;
            }
            Object objA2 = dl5Var.k.a(new mk5(postShareDataA, gp7.u(sourceParameter), dl5Var.c, dl5Var.e), n92Var);
            if (objA2 == tb2.COROUTINE_SUSPENDED) {
                return objA2;
            }
        }
        return c1e.a;
    }
}
