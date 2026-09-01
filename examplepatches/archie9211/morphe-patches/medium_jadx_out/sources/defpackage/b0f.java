package defpackage;

import com.medium.android.domain.post.models.Highlight;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.graphql.fragment.HighlightData;
import com.medium.android.graphql.fragment.MembershipFragment;
import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.fragment.ResponseCountData;
import com.medium.android.graphql.fragment.ResponseItemData;
import com.medium.android.graphql.fragment.ResponsePostThreadData;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.graphql.type.ResponseSortType;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class b0f {
    public final r6c a = k40.x(0, 7, null);

    public static qgb b(qgb qgbVar) {
        List list;
        ugb ugbVarG;
        qgbVar.getClass();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator it2 = qgbVar.j.iterator();
        while (it2.hasNext()) {
            qgb.a(linkedHashSet, (ugb) it2.next());
        }
        Iterator it3 = linkedHashSet.iterator();
        while (true) {
            qgb qgbVar2 = qgbVar;
            do {
                list = qgbVar2.j;
                if (!it3.hasNext()) {
                    return qgbVar2;
                }
                ugbVarG = iq7.G(list, new nmc((String) it3.next(), 9));
            } while (ugbVarG == null);
            qgbVar = qgb.b(qgbVar2, 0L, false, false, false, false, false, null, iq7.O(list, new wgb(ugbVarG, 2)), 3583);
        }
    }

    public static ugb m(ResponseItemData responseItemData, int i, boolean z, boolean z2, agb agbVar, boolean z3, List list) {
        rgb rgbVar;
        boolean z4;
        boolean z5;
        ResponseItemData.OnPost onPost;
        ResponseItemData.Post post;
        Integer count;
        Long firstPublishedAt;
        Integer count2;
        tgb tgbVar;
        zw7 zw7VarB;
        ResponseItemData.Post post2;
        ResponseItemData.Creator creator;
        MembershipFragment membershipFragment;
        ResponseItemData.InResponseToMediaResource inResponseToMediaResource;
        ResponseItemData.OnMediaResource onMediaResource;
        ResponseItemData.MediumQuote mediumQuote;
        HighlightData highlightData;
        Highlight highlightA = (!z3 || (inResponseToMediaResource = responseItemData.getInResponseToMediaResource()) == null || (onMediaResource = inResponseToMediaResource.getOnMediaResource()) == null || (mediumQuote = onMediaResource.getMediumQuote()) == null || (highlightData = mediumQuote.getHighlightData()) == null) ? null : el5.a(highlightData);
        ResponseItemData.Creator1 creator2 = responseItemData.getCreator();
        if (creator2 != null) {
            String id = creator2.getId();
            String name = creator2.getName();
            if (name == null) {
                name = "";
            }
            String str = name;
            String imageId = creator2.getImageId();
            String str2 = imageId != null ? imageId : null;
            ResponseItemData.Membership membership = creator2.getMembership();
            if (membership == null || (membershipFragment = membership.getMembershipFragment()) == null || (zw7VarB = vn7.B(membershipFragment)) == null) {
                zw7VarB = zw7.NOT_A_MEMBER;
            }
            zw7 zw7Var = zw7VarB;
            String id2 = creator2.getId();
            ResponseItemData.ResponseRootPost responseRootPost = responseItemData.getResponseRootPost();
            boolean zL = g76.L(id2, (responseRootPost == null || (post2 = responseRootPost.getPost()) == null || (creator = post2.getCreator()) == null) ? null : creator.getId());
            boolean zIsUser = creator2.getViewerEdge().isUser();
            ResponseItemData.Verifications verifications = creator2.getVerifications();
            rgbVar = new rgb(id, str, str2, zw7Var, zL, zIsUser, verifications != null ? verifications.isBookAuthor() : false, creator2.getUserBlockData().getViewerEdge().isBlocking() ? ns0.BLOCKED : ns0.NOT_BLOCKED, creator2.getPronouns());
        } else {
            rgbVar = null;
        }
        Long latestPublishedAt = responseItemData.getLatestPublishedAt();
        if (latestPublishedAt == null) {
            ay0.e("Latest published at is null");
            return null;
        }
        long jLongValue = latestPublishedAt.longValue();
        String id3 = responseItemData.getId();
        List<ResponseItemData.Paragraph> paragraphs = responseItemData.getContent().getBodyModel().getParagraphs();
        ArrayList arrayList = new ArrayList();
        for (ResponseItemData.Paragraph paragraph : paragraphs) {
            String id4 = paragraph.getId();
            String text = paragraph.getText();
            if (text == null) {
                tgbVar = null;
            } else {
                List<ResponseItemData.Markup> markups = paragraph.getMarkups();
                ArrayList arrayList2 = new ArrayList();
                Iterator<T> it2 = markups.iterator();
                while (it2.hasNext()) {
                    Markup markupO = bgf.O(((ResponseItemData.Markup) it2.next()).getMarkupData());
                    if (markupO != null) {
                        arrayList2.add(markupO);
                    }
                }
                tgbVar = new tgb(id4, text, arrayList2);
            }
            if (tgbVar != null) {
                arrayList.add(tgbVar);
            }
        }
        Long totalClapCount = responseItemData.getPostClapsData().getTotalClapCount();
        long jLongValue2 = totalClapCount != null ? totalClapCount.longValue() : 0L;
        Integer clapCount = responseItemData.getPostClapsData().getViewerEdge().getClapCount();
        sgb sgbVar = new sgb(clapCount != null ? clapCount.intValue() : 0, jLongValue2);
        ResponseCountData.PostResponses postResponses = responseItemData.getResponseCountData().getPostResponses();
        int iIntValue = (postResponses == null || (count2 = postResponses.getCount()) == null) ? 0 : count2.intValue();
        boolean z6 = true;
        if (responseItemData.getFirstPublishedAt() == null || ((firstPublishedAt = responseItemData.getFirstPublishedAt()) != null && jLongValue == firstPublishedAt.longValue())) {
            z4 = true;
            z6 = false;
        } else {
            z4 = true;
        }
        List<ResponseItemData.Paragraph> paragraphs2 = responseItemData.getContent().getBodyModel().getParagraphs();
        if (paragraphs2 == null || !paragraphs2.isEmpty()) {
            Iterator<T> it3 = paragraphs2.iterator();
            while (it3.hasNext()) {
                if (((ResponseItemData.Paragraph) it3.next()).getType() != ParagraphType.P) {
                    z5 = z4;
                    break;
                }
            }
            z5 = false;
        } else {
            z5 = false;
        }
        ResponseCountData.PostResponses postResponses2 = responseItemData.getResponseCountData().getPostResponses();
        int iMax = Math.max(((postResponses2 == null || (count = postResponses2.getCount()) == null) ? 0 : count.intValue()) - list.size(), 0);
        ResponseItemData.ResponseRootPost responseRootPost2 = responseItemData.getResponseRootPost();
        String id5 = (responseRootPost2 == null || (post = responseRootPost2.getPost()) == null) ? null : post.getId();
        ResponseItemData.InResponseToPostResult inResponseToPostResult = responseItemData.getInResponseToPostResult();
        String id6 = (inResponseToPostResult == null || (onPost = inResponseToPostResult.getOnPost()) == null) ? null : onPost.getId();
        ResponseItemData.ResponseRootPost responseRootPost3 = responseItemData.getResponseRootPost();
        Integer responseDepth = responseRootPost3 != null ? responseRootPost3.getResponseDepth() : null;
        Integer latestRev = responseItemData.getLatestRev();
        return new ugb(id3, jLongValue, arrayList, highlightA, rgbVar, sgbVar, iIntValue, z6, i, z5, z, z2, list, agbVar, iMax, id5, id6, responseDepth, false, latestRev != null ? latestRev.intValue() : 0);
    }

    public static ugb n(ResponsePostThreadData.Post post, Set set, int i) {
        ResponsePostThreadData.Next2 next;
        PagingParamsData pagingParamsData;
        ResponsePostThreadData.Next1 next2;
        PagingParamsData pagingParamsData2;
        ResponseItemData responseItemData = post.getResponseItemData();
        ResponsePostThreadData.ThreadedPostResponses threadedPostResponses = post.getThreadedPostResponses();
        ResponsePostThreadData.PagingInfo1 pagingInfo = threadedPostResponses != null ? threadedPostResponses.getPagingInfo() : null;
        agb agbVarG = (pagingInfo == null || (next2 = pagingInfo.getNext()) == null || (pagingParamsData2 = next2.getPagingParamsData()) == null) ? null : vp7.G(pagingParamsData2);
        ResponsePostThreadData.ThreadedPostResponses threadedPostResponses2 = post.getThreadedPostResponses();
        List<ResponsePostThreadData.Post1> posts = threadedPostResponses2 != null ? threadedPostResponses2.getPosts() : null;
        ey3 ey3Var = ey3.a;
        if (posts == null) {
            posts = ey3Var;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(posts, 10));
        for (ResponsePostThreadData.Post1 post1 : posts) {
            int i2 = i + 1;
            ResponsePostThreadData.ThreadedPostResponses threadedPostResponses3 = post.getThreadedPostResponses();
            List<String> autoExpandedPostIds = threadedPostResponses3 != null ? threadedPostResponses3.getAutoExpandedPostIds() : null;
            if (autoExpandedPostIds == null) {
                autoExpandedPostIds = ey3Var;
            }
            boolean zContains = bu1.v0(autoExpandedPostIds).contains(post1.getResponseItemData().getId());
            ResponseItemData responseItemData2 = post1.getResponseItemData();
            boolean zContains2 = set.contains(post1.getResponseItemData().getId());
            ResponsePostThreadData.ThreadedPostResponses1 threadedPostResponses4 = post1.getThreadedPostResponses();
            ResponsePostThreadData.PagingInfo2 pagingInfo2 = threadedPostResponses4 != null ? threadedPostResponses4.getPagingInfo() : null;
            agb agbVarG2 = (pagingInfo2 == null || (next = pagingInfo2.getNext()) == null || (pagingParamsData = next.getPagingParamsData()) == null) ? null : vp7.G(pagingParamsData);
            ResponsePostThreadData.ThreadedPostResponses1 threadedPostResponses5 = post1.getThreadedPostResponses();
            List<ResponsePostThreadData.Post2> posts2 = threadedPostResponses5 != null ? threadedPostResponses5.getPosts() : null;
            if (posts2 == null) {
                posts2 = ey3Var;
            }
            ArrayList arrayList2 = new ArrayList(cu1.k0(posts2, 10));
            for (ResponsePostThreadData.Post2 post2 : posts2) {
                ArrayList arrayList3 = arrayList2;
                int i3 = i + 2;
                ResponsePostThreadData.ThreadedPostResponses1 threadedPostResponses6 = post1.getThreadedPostResponses();
                List<String> autoExpandedPostIds2 = threadedPostResponses6 != null ? threadedPostResponses6.getAutoExpandedPostIds() : null;
                if (autoExpandedPostIds2 == null) {
                    autoExpandedPostIds2 = ey3Var;
                }
                arrayList3.add(m(post2.getResponseItemData(), i3, set.contains(post2.getResponseItemData().getId()), bu1.v0(autoExpandedPostIds2).contains(post2.getResponseItemData().getId()), null, true, ey3Var));
                arrayList2 = arrayList3;
            }
            arrayList.add(m(responseItemData2, i2, zContains2, zContains, agbVarG2, true, arrayList2));
        }
        return m(responseItemData, i, true, false, agbVarG, true, arrayList);
    }

    public abstract void a(Set set);

    public final Object c(String str, n92 n92Var) {
        Object objA = this.a.a(new bze(str), n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public abstract Object d(String str, agb agbVar, yd4 yd4Var, ResponseSortType responseSortType, int i, p92 p92Var);

    public abstract Object e(uze uzeVar, agb agbVar, yd4 yd4Var, ResponseSortType responseSortType, int i, p92 p92Var);

    public abstract Set f();

    public abstract Map g();

    public final Object h(b55 b55Var, p4d p4dVar) {
        Object objA = this.a.a(new dze(b55Var), p4dVar);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public final Object i(String str, p4d p4dVar) {
        Object objA = this.a.a(new eze(str), p4dVar);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public final Object j(n92 n92Var) {
        Object objA = this.a.a(ize.a, n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public abstract void k(Set set);

    public abstract void l(String str, agb agbVar);

    public abstract void o(uze uzeVar, ugb ugbVar, String str, String str2, String str3);

    public abstract void p(uze uzeVar, ugb ugbVar, String str, String str2, String str3);

    public abstract void q(uze uzeVar, ugb ugbVar, String str, String str2, String str3);
}
