package defpackage;

import com.medium.android.domain.post.models.Highlight;
import com.medium.android.graphql.fragment.HighlightData;
import com.medium.android.graphql.fragment.InResponseToPost;
import com.medium.android.graphql.fragment.PostClapsData;
import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j06 extends que {
    public final q58 b;
    public final String c;
    public final String d;
    public final long e;
    public final long f;
    public final Highlight g;

    public j06(PostMetaData postMetaData, q58 q58Var) {
        PostMetaData.MediumQuote mediumQuote;
        HighlightData highlightData;
        InResponseToPost inResponseToPost;
        Integer responsesCount;
        InResponseToPost inResponseToPost2;
        PostClapsData postClapsData;
        Long totalClapCount;
        InResponseToPost inResponseToPost3;
        InResponseToPost.Creator creator;
        InResponseToPost inResponseToPost4;
        this.b = q58Var;
        PostMetaData.InResponseToPostResult inResponseToPostResult = postMetaData.getInResponseToPostResult();
        Highlight highlightA = null;
        String title = (inResponseToPostResult == null || (inResponseToPost4 = inResponseToPostResult.getInResponseToPost()) == null) ? null : inResponseToPost4.getTitle();
        if (title == null) {
            ay0.e("Required value 'postTitle' is null.");
            throw null;
        }
        this.c = title;
        PostMetaData.InResponseToPostResult inResponseToPostResult2 = postMetaData.getInResponseToPostResult();
        String name = (inResponseToPostResult2 == null || (inResponseToPost3 = inResponseToPostResult2.getInResponseToPost()) == null || (creator = inResponseToPost3.getCreator()) == null) ? null : creator.getName();
        if (name == null) {
            ay0.e("Required value 'authorName' is null.");
            throw null;
        }
        this.d = name;
        PostMetaData.InResponseToPostResult inResponseToPostResult3 = postMetaData.getInResponseToPostResult();
        long jIntValue = 0;
        this.e = (inResponseToPostResult3 == null || (inResponseToPost2 = inResponseToPostResult3.getInResponseToPost()) == null || (postClapsData = inResponseToPost2.getPostClapsData()) == null || (totalClapCount = postClapsData.getTotalClapCount()) == null) ? 0L : totalClapCount.longValue();
        PostMetaData.InResponseToPostResult inResponseToPostResult4 = postMetaData.getInResponseToPostResult();
        if (inResponseToPostResult4 != null && (inResponseToPost = inResponseToPostResult4.getInResponseToPost()) != null && (responsesCount = inResponseToPost.getResponsesCount()) != null) {
            jIntValue = responsesCount.intValue();
        }
        this.f = jIntValue;
        PostMetaData.InResponseToMediaResource inResponseToMediaResource = postMetaData.getInResponseToMediaResource();
        if (inResponseToMediaResource != null && (mediumQuote = inResponseToMediaResource.getMediumQuote()) != null && (highlightData = mediumQuote.getHighlightData()) != null) {
            highlightA = el5.a(highlightData);
        }
        this.g = highlightA;
    }
}
