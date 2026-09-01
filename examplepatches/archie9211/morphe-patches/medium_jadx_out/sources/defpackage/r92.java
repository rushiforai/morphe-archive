package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0087\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001c\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u0004\u001a\u0004\b\b\u0010\u0006R\u001c\u0010\u000e\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010\f\u001a\u0004\b\u000b\u0010\rR\u001a\u0010\u000f\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\b\u0010\u0004\u001a\u0004\b\u0003\u0010\u0006¨\u0006\u0010"}, d2 = {"Lr92;", "", "", "a", "Ljava/lang/String;", "b", "()Ljava/lang/String;", "postId", "d", "postTitle", "Lsw5;", "c", "Lsw5;", "()Lsw5;", "postPreviewImageData", "paragraphName", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class r92 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("postId")
    private final String postId;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("postTitle")
    private final String postTitle;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("postPreviewImageData")
    private final sw5 postPreviewImageData;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    @g0c("paragraphName")
    private final String paragraphName;

    public r92(String str, String str2, sw5 sw5Var, String str3) {
        str.getClass();
        this.postId = str;
        this.postTitle = str2;
        this.postPreviewImageData = sw5Var;
        this.paragraphName = str3;
    }

    /* JADX INFO: renamed from: a, reason: from getter */
    public final String getParagraphName() {
        return this.paragraphName;
    }

    /* JADX INFO: renamed from: b, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: c, reason: from getter */
    public final sw5 getPostPreviewImageData() {
        return this.postPreviewImageData;
    }

    /* JADX INFO: renamed from: d, reason: from getter */
    public final String getPostTitle() {
        return this.postTitle;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r92)) {
            return false;
        }
        r92 r92Var = (r92) obj;
        return g76.L(this.postId, r92Var.postId) && g76.L(this.postTitle, r92Var.postTitle) && g76.L(this.postPreviewImageData, r92Var.postPreviewImageData) && g76.L(this.paragraphName, r92Var.paragraphName);
    }

    public final int hashCode() {
        int iHashCode = this.postId.hashCode() * 31;
        String str = this.postTitle;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        sw5 sw5Var = this.postPreviewImageData;
        return this.paragraphName.hashCode() + ((iHashCode2 + (sw5Var != null ? sw5Var.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.postId;
        String str2 = this.postTitle;
        sw5 sw5Var = this.postPreviewImageData;
        String str3 = this.paragraphName;
        StringBuilder sbU = y30.u("ContinueReadingData(postId=", str, ", postTitle=", str2, ", postPreviewImageData=");
        sbU.append(sw5Var);
        sbU.append(", paragraphName=");
        sbU.append(str3);
        sbU.append(")");
        return sbU.toString();
    }
}
