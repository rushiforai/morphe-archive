package defpackage;

import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wtd {
    public final String a;
    public final String b;
    public final String c;
    public final sw5 d;
    public final vtd e;
    public final vtd f;
    public final String g;
    public final boolean h;
    public final boolean i;
    public final boolean j;
    public final PostShareData k;

    public wtd(FullPostData fullPostData, boolean z, PostShareData postShareData) {
        PostMetaData.ViewerEdge2 viewerEdge;
        PostMetaData.ViewerEdge2 viewerEdge2;
        PostMetaData.ViewerEdge2 viewerEdge3;
        ImageMetadataData imageMetadataData;
        fullPostData.getClass();
        String id = fullPostData.getPostMetaData().getId();
        String mediumUrl = fullPostData.getPostMetaData().getMediumUrl();
        String title = fullPostData.getPostMetaData().getTitle();
        PostMetaData.PreviewImage previewImage = fullPostData.getPostMetaData().getPreviewImage();
        sw5 sw5VarM = (previewImage == null || (imageMetadataData = previewImage.getImageMetadataData()) == null) ? null : pxf.M(imageMetadataData);
        PostMetaData.Creator creator = fullPostData.getPostMetaData().getCreator();
        vtd vtdVar = creator != null ? new vtd(creator.getId(), creator.getName()) : null;
        PostMetaData.Collection collection = fullPostData.getPostMetaData().getCollection();
        vtd vtdVar2 = collection != null ? new vtd(collection.getId(), collection.getName()) : null;
        String detectedLanguage = fullPostData.getPostMetaData().getDetectedLanguage();
        PostMetaData.Creator creator2 = fullPostData.getPostMetaData().getCreator();
        boolean z2 = false;
        boolean z3 = (creator2 == null || (viewerEdge3 = creator2.getViewerEdge()) == null || !viewerEdge3.isUser()) && !z;
        PostMetaData.Creator creator3 = fullPostData.getPostMetaData().getCreator();
        boolean z4 = (creator3 == null || (viewerEdge2 = creator3.getViewerEdge()) == null || !viewerEdge2.isUser()) && !z;
        PostMetaData.Creator creator4 = fullPostData.getPostMetaData().getCreator();
        if ((creator4 == null || (viewerEdge = creator4.getViewerEdge()) == null || !viewerEdge.isUser()) && !z) {
            z2 = true;
        }
        id.getClass();
        this.a = id;
        this.b = mediumUrl;
        this.c = title;
        this.d = sw5VarM;
        this.e = vtdVar;
        this.f = vtdVar2;
        this.g = detectedLanguage;
        this.h = z4;
        this.i = z3;
        this.j = z2;
        this.k = postShareData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wtd)) {
            return false;
        }
        wtd wtdVar = (wtd) obj;
        return this.a.equals(wtdVar.a) && g76.L(this.b, wtdVar.b) && g76.L(this.c, wtdVar.c) && g76.L(this.d, wtdVar.d) && g76.L(this.e, wtdVar.e) && g76.L(this.f, wtdVar.f) && g76.L(this.g, wtdVar.g) && this.h == wtdVar.h && this.i == wtdVar.i && this.j == wtdVar.j && g76.L(this.k, wtdVar.k);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        sw5 sw5Var = this.d;
        int iHashCode4 = (iHashCode3 + (sw5Var == null ? 0 : sw5Var.hashCode())) * 31;
        vtd vtdVar = this.e;
        int iHashCode5 = (iHashCode4 + (vtdVar == null ? 0 : vtdVar.hashCode())) * 31;
        vtd vtdVar2 = this.f;
        int iHashCode6 = (iHashCode5 + (vtdVar2 == null ? 0 : vtdVar2.hashCode())) * 31;
        String str3 = this.g;
        int iHashCode7 = (((((((iHashCode6 + (str3 == null ? 0 : str3.hashCode())) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31) + (this.j ? 1231 : 1237)) * 31;
        PostShareData postShareData = this.k;
        return iHashCode7 + (postShareData != null ? postShareData.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Post(postId=", this.a, ", mediumUrl=", this.b, ", postTitle=");
        sbU.append(this.c);
        sbU.append(", imageData=");
        sbU.append(this.d);
        sbU.append(", author=");
        sbU.append(this.e);
        sbU.append(", publication=");
        sbU.append(this.f);
        sbU.append(", detectedLanguage=");
        ka1.D(sbU, this.g, ", canBeReported=", this.h, ", canBeMuted=");
        ho2.R(sbU, this.i, ", canDisplayShowLessLikeThis=", this.j, ", postShareData=");
        sbU.append(this.k);
        sbU.append(")");
        return sbU.toString();
    }
}
