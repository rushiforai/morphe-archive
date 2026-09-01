package com.medium.android.core.share;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import defpackage.f08;
import defpackage.g76;
import defpackage.ka1;
import defpackage.sw5;
import defpackage.wgd;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010\u0000\n\u0002\b\u0016\b\u0087\b\u0018\u00002\u00020\u0001B\u0081\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\f\u001a\u00020\u0004\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u000e\u001a\u00020\u0002\u0012\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00040\u000f\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0015\u0010\u0016J\r\u0010\u0017\u001a\u00020\n¢\u0006\u0004\b\u0017\u0010\u0018J\u001d\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001b\u001a\u00020\n¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b#\u0010\"J\u0012\u0010$\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b$\u0010\"J\u0012\u0010%\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b%\u0010&J\u0012\u0010'\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b'\u0010(J\u0010\u0010)\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b)\u0010\"J\u0012\u0010*\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b*\u0010\"J\u0010\u0010+\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b+\u0010 J\u0016\u0010,\u001a\b\u0012\u0004\u0012\u00020\u00040\u000fHÆ\u0003¢\u0006\u0004\b,\u0010-J\u0012\u0010.\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b.\u0010\"J\u0010\u0010/\u001a\u00020\u0012HÆ\u0003¢\u0006\u0004\b/\u00100J\u0012\u00101\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b1\u0010\"J¤\u0001\u00102\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\f\u001a\u00020\u00042\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\u000e\u001a\u00020\u00022\u000e\b\u0002\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00040\u000f2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\u0013\u001a\u00020\u00122\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b2\u00103J\u0010\u00104\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b4\u0010\"J\u0010\u00105\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b5\u0010\u0018J\u001a\u00108\u001a\u00020\u00122\b\u00107\u001a\u0004\u0018\u000106HÖ\u0003¢\u0006\u0004\b8\u00109R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010:\u001a\u0004\b;\u0010 R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010<\u001a\u0004\b=\u0010\"R\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010<\u001a\u0004\b>\u0010\"R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0007\u0010<\u001a\u0004\b?\u0010\"R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010@\u001a\u0004\bA\u0010&R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010B\u001a\u0004\bC\u0010(R\u0017\u0010\f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010<\u001a\u0004\bD\u0010\"R\u0019\u0010\r\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010<\u001a\u0004\bE\u0010\"R\u0017\u0010\u000e\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000e\u0010:\u001a\u0004\bF\u0010 R\u001d\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00040\u000f8\u0006¢\u0006\f\n\u0004\b\u0010\u0010G\u001a\u0004\bH\u0010-R\u0019\u0010\u0011\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010<\u001a\u0004\bI\u0010\"R\u0017\u0010\u0013\u001a\u00020\u00128\u0006¢\u0006\f\n\u0004\b\u0013\u0010J\u001a\u0004\b\u0013\u00100R\u0019\u0010\u0014\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0014\u0010<\u001a\u0004\bK\u0010\"¨\u0006L"}, d2 = {"Lcom/medium/android/core/share/PostShareData;", "Landroid/os/Parcelable;", "Landroid/net/Uri;", "shareUri", "", "postId", "postTitle", "postSubtitle", "Lsw5;", "postImageData", "", "postReadingTimeInMinutes", "authorName", "authorImageId", "authorUri", "", "highlightedTexts", "targetedHighlightedText", "", "isPostMetered", "authorShareKey", "<init>", "(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lsw5;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/List;Ljava/lang/String;ZLjava/lang/String;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Landroid/net/Uri;", "component2", "()Ljava/lang/String;", "component3", "component4", "component5", "()Lsw5;", "component6", "()Ljava/lang/Integer;", "component7", "component8", "component9", "component10", "()Ljava/util/List;", "component11", "component12", "()Z", "component13", "copy", "(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lsw5;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/List;Ljava/lang/String;ZLjava/lang/String;)Lcom/medium/android/core/share/PostShareData;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Landroid/net/Uri;", "getShareUri", "Ljava/lang/String;", "getPostId", "getPostTitle", "getPostSubtitle", "Lsw5;", "getPostImageData", "Ljava/lang/Integer;", "getPostReadingTimeInMinutes", "getAuthorName", "getAuthorImageId", "getAuthorUri", "Ljava/util/List;", "getHighlightedTexts", "getTargetedHighlightedText", "Z", "getAuthorShareKey", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostShareData implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<PostShareData> CREATOR = new f08(11);
    private final String authorImageId;
    private final String authorName;
    private final String authorShareKey;
    private final Uri authorUri;
    private final List<String> highlightedTexts;
    private final boolean isPostMetered;
    private final String postId;
    private final sw5 postImageData;
    private final Integer postReadingTimeInMinutes;
    private final String postSubtitle;
    private final String postTitle;
    private final Uri shareUri;
    private final String targetedHighlightedText;

    public PostShareData(Uri uri, String str, String str2, String str3, sw5 sw5Var, Integer num, String str4, String str5, Uri uri2, List<String> list, String str6, boolean z, String str7) {
        uri.getClass();
        str.getClass();
        str2.getClass();
        str4.getClass();
        uri2.getClass();
        list.getClass();
        this.shareUri = uri;
        this.postId = str;
        this.postTitle = str2;
        this.postSubtitle = str3;
        this.postImageData = sw5Var;
        this.postReadingTimeInMinutes = num;
        this.authorName = str4;
        this.authorImageId = str5;
        this.authorUri = uri2;
        this.highlightedTexts = list;
        this.targetedHighlightedText = str6;
        this.isPostMetered = z;
        this.authorShareKey = str7;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PostShareData copy$default(PostShareData postShareData, Uri uri, String str, String str2, String str3, sw5 sw5Var, Integer num, String str4, String str5, Uri uri2, List list, String str6, boolean z, String str7, int i, Object obj) {
        if ((i & 1) != 0) {
            uri = postShareData.shareUri;
        }
        return postShareData.copy(uri, (i & 2) != 0 ? postShareData.postId : str, (i & 4) != 0 ? postShareData.postTitle : str2, (i & 8) != 0 ? postShareData.postSubtitle : str3, (i & 16) != 0 ? postShareData.postImageData : sw5Var, (i & 32) != 0 ? postShareData.postReadingTimeInMinutes : num, (i & 64) != 0 ? postShareData.authorName : str4, (i & 128) != 0 ? postShareData.authorImageId : str5, (i & 256) != 0 ? postShareData.authorUri : uri2, (i & 512) != 0 ? postShareData.highlightedTexts : list, (i & 1024) != 0 ? postShareData.targetedHighlightedText : str6, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? postShareData.isPostMetered : z, (i & 4096) != 0 ? postShareData.authorShareKey : str7);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final Uri getShareUri() {
        return this.shareUri;
    }

    public final List<String> component10() {
        return this.highlightedTexts;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final String getTargetedHighlightedText() {
        return this.targetedHighlightedText;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final boolean getIsPostMetered() {
        return this.isPostMetered;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final String getAuthorShareKey() {
        return this.authorShareKey;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getPostTitle() {
        return this.postTitle;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getPostSubtitle() {
        return this.postSubtitle;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final sw5 getPostImageData() {
        return this.postImageData;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Integer getPostReadingTimeInMinutes() {
        return this.postReadingTimeInMinutes;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getAuthorName() {
        return this.authorName;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final String getAuthorImageId() {
        return this.authorImageId;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Uri getAuthorUri() {
        return this.authorUri;
    }

    public final PostShareData copy(Uri shareUri, String postId, String postTitle, String postSubtitle, sw5 postImageData, Integer postReadingTimeInMinutes, String authorName, String authorImageId, Uri authorUri, List<String> highlightedTexts, String targetedHighlightedText, boolean isPostMetered, String authorShareKey) {
        shareUri.getClass();
        postId.getClass();
        postTitle.getClass();
        authorName.getClass();
        authorUri.getClass();
        highlightedTexts.getClass();
        return new PostShareData(shareUri, postId, postTitle, postSubtitle, postImageData, postReadingTimeInMinutes, authorName, authorImageId, authorUri, highlightedTexts, targetedHighlightedText, isPostMetered, authorShareKey);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostShareData)) {
            return false;
        }
        PostShareData postShareData = (PostShareData) other;
        return g76.L(this.shareUri, postShareData.shareUri) && g76.L(this.postId, postShareData.postId) && g76.L(this.postTitle, postShareData.postTitle) && g76.L(this.postSubtitle, postShareData.postSubtitle) && g76.L(this.postImageData, postShareData.postImageData) && g76.L(this.postReadingTimeInMinutes, postShareData.postReadingTimeInMinutes) && g76.L(this.authorName, postShareData.authorName) && g76.L(this.authorImageId, postShareData.authorImageId) && g76.L(this.authorUri, postShareData.authorUri) && g76.L(this.highlightedTexts, postShareData.highlightedTexts) && g76.L(this.targetedHighlightedText, postShareData.targetedHighlightedText) && this.isPostMetered == postShareData.isPostMetered && g76.L(this.authorShareKey, postShareData.authorShareKey);
    }

    public final String getAuthorImageId() {
        return this.authorImageId;
    }

    public final String getAuthorName() {
        return this.authorName;
    }

    public final String getAuthorShareKey() {
        return this.authorShareKey;
    }

    public final Uri getAuthorUri() {
        return this.authorUri;
    }

    public final List<String> getHighlightedTexts() {
        return this.highlightedTexts;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final sw5 getPostImageData() {
        return this.postImageData;
    }

    public final Integer getPostReadingTimeInMinutes() {
        return this.postReadingTimeInMinutes;
    }

    public final String getPostSubtitle() {
        return this.postSubtitle;
    }

    public final String getPostTitle() {
        return this.postTitle;
    }

    public final Uri getShareUri() {
        return this.shareUri;
    }

    public final String getTargetedHighlightedText() {
        return this.targetedHighlightedText;
    }

    public int hashCode() {
        int iO = wgd.o(wgd.o(this.shareUri.hashCode() * 31, 31, this.postId), 31, this.postTitle);
        String str = this.postSubtitle;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        sw5 sw5Var = this.postImageData;
        int iHashCode2 = (iHashCode + (sw5Var == null ? 0 : sw5Var.hashCode())) * 31;
        Integer num = this.postReadingTimeInMinutes;
        int iO2 = wgd.o((iHashCode2 + (num == null ? 0 : num.hashCode())) * 31, 31, this.authorName);
        String str2 = this.authorImageId;
        int iP = wgd.p((this.authorUri.hashCode() + ((iO2 + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31, 31, this.highlightedTexts);
        String str3 = this.targetedHighlightedText;
        int iHashCode3 = (((iP + (str3 == null ? 0 : str3.hashCode())) * 31) + (this.isPostMetered ? 1231 : 1237)) * 31;
        String str4 = this.authorShareKey;
        return iHashCode3 + (str4 != null ? str4.hashCode() : 0);
    }

    public final boolean isPostMetered() {
        return this.isPostMetered;
    }

    public String toString() {
        Uri uri = this.shareUri;
        String str = this.postId;
        String str2 = this.postTitle;
        String str3 = this.postSubtitle;
        sw5 sw5Var = this.postImageData;
        Integer num = this.postReadingTimeInMinutes;
        String str4 = this.authorName;
        String str5 = this.authorImageId;
        Uri uri2 = this.authorUri;
        List<String> list = this.highlightedTexts;
        String str6 = this.targetedHighlightedText;
        boolean z = this.isPostMetered;
        String str7 = this.authorShareKey;
        StringBuilder sb = new StringBuilder("PostShareData(shareUri=");
        sb.append(uri);
        sb.append(", postId=");
        sb.append(str);
        sb.append(", postTitle=");
        ka1.C(sb, str2, ", postSubtitle=", str3, ", postImageData=");
        sb.append(sw5Var);
        sb.append(", postReadingTimeInMinutes=");
        sb.append(num);
        sb.append(", authorName=");
        ka1.C(sb, str4, ", authorImageId=", str5, ", authorUri=");
        sb.append(uri2);
        sb.append(", highlightedTexts=");
        sb.append(list);
        sb.append(", targetedHighlightedText=");
        ka1.D(sb, str6, ", isPostMetered=", z, ", authorShareKey=");
        return ka1.v(sb, str7, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeParcelable(this.shareUri, flags);
        dest.writeString(this.postId);
        dest.writeString(this.postTitle);
        dest.writeString(this.postSubtitle);
        sw5 sw5Var = this.postImageData;
        if (sw5Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sw5Var.writeToParcel(dest, flags);
        }
        Integer num = this.postReadingTimeInMinutes;
        if (num == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeInt(num.intValue());
        }
        dest.writeString(this.authorName);
        dest.writeString(this.authorImageId);
        dest.writeParcelable(this.authorUri, flags);
        dest.writeStringList(this.highlightedTexts);
        dest.writeString(this.targetedHighlightedText);
        dest.writeInt(this.isPostMetered ? 1 : 0);
        dest.writeString(this.authorShareKey);
    }
}
