package defpackage;

import com.medium.android.core.share.PostShareData;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lj6c;", "Lque;", "cs2", "g6c", "h6c", "postpage_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class j6c extends que {
    public final PostShareData b;
    public final String c;
    public final String d;
    public final String e;
    public final s26 f;
    public final ty2 g;
    public final hu7 h;
    public final String i;
    public final boolean j;
    public final r6c k;
    public final uua l;
    public final wua m;

    public j6c(PostShareData postShareData, String str, String str2, String str3, s26 s26Var, fm fmVar, ty2 ty2Var, String str4) {
        i03 i03Var = i03.a;
        postShareData.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        this.b = postShareData;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = s26Var;
        this.g = ty2Var;
        this.h = i03Var;
        this.i = str4;
        this.j = fmVar.a();
        r6c r6cVarX = k40.x(0, 7, null);
        this.k = r6cVarX;
        this.l = bo.z(r6cVarX);
        u50 u50Var = new u50(12, new eub(this, (n92) null, 7));
        gp1 gp1VarF = f76.F(this);
        String postTitle = postShareData.getPostTitle();
        String postSubtitle = postShareData.getPostSubtitle();
        String string = postShareData.getAuthorUri().toString();
        string.getClass();
        b5c b5cVar = new b5c(postTitle, postSubtitle, muc.j0("https://", string), postShareData.getAuthorName(), postShareData.getAuthorImageId(), postShareData.getPostImageData(), postShareData.getPostReadingTimeInMinutes());
        List<String> highlightedTexts = postShareData.getHighlightedTexts();
        ArrayList arrayList = new ArrayList(cu1.k0(highlightedTexts, 10));
        for (String str5 : highlightedTexts) {
            String postTitle2 = this.b.getPostTitle();
            String authorName = this.b.getAuthorName();
            String authorImageId = this.b.getAuthorImageId();
            String string2 = this.b.getAuthorUri().toString();
            string2.getClass();
            this.h.getClass();
            arrayList.add(new c5c(str5, postTitle2, authorName, authorImageId, muc.j0("https://", string2), this.b.getPostImageData()));
        }
        this.m = bo.e0(u50Var, gp1VarF, l7c.b, new h6c(0, b5cVar, arrayList, this.j, this.b.getTargetedHighlightedText(), this.b.isPostMetered()));
    }
}
