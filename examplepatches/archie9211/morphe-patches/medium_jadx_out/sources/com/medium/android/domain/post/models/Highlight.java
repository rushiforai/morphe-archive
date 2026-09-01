package com.medium.android.domain.post.models;

import android.os.Parcel;
import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.android.core.models.HighlightType;
import defpackage.az5;
import defpackage.g76;
import defpackage.h74;
import defpackage.ka1;
import defpackage.t0;
import defpackage.wgd;
import defpackage.y30;
import java.util.Iterator;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0016\b\u0087\b\u0018\u00002\u00020\u0001Bw\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\b\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0006\u0012\u0006\u0010\n\u001a\u00020\u0002\u0012\u0006\u0010\u000b\u001a\u00020\u0002\u0012\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0013\u0010\u0014J\r\u0010\u0015\u001a\u00020\u0006¢\u0006\u0004\b\u0015\u0010\u0016J\u001d\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0019\u001a\u00020\u0006¢\u0006\u0004\b\u001b\u0010\u001cJ\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u001eJ\u0012\u0010 \u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b \u0010\u001eJ\u0012\u0010!\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b#\u0010\u0016J\u0010\u0010$\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b$\u0010\u0016J\u0010\u0010%\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b%\u0010\u001eJ\u0010\u0010&\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b&\u0010\u001eJ\u0016\u0010'\u001a\b\u0012\u0004\u0012\u00020\r0\fHÆ\u0003¢\u0006\u0004\b'\u0010(J\u0012\u0010)\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b)\u0010\u001eJ\u0012\u0010*\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b*\u0010\u001eJ\u0010\u0010+\u001a\u00020\u0011HÆ\u0003¢\u0006\u0004\b+\u0010,J\u0098\u0001\u0010-\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\b\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\u00062\b\b\u0002\u0010\n\u001a\u00020\u00022\b\b\u0002\u0010\u000b\u001a\u00020\u00022\u000e\b\u0002\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0012\u001a\u00020\u0011HÆ\u0001¢\u0006\u0004\b-\u0010.J\u0010\u0010/\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b/\u0010\u001eJ\u0010\u00100\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b0\u0010\u0016J\u001a\u00104\u001a\u0002032\b\u00102\u001a\u0004\u0018\u000101HÖ\u0003¢\u0006\u0004\b4\u00105R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u00106\u001a\u0004\b7\u0010\u001eR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u00106\u001a\u0004\b8\u0010\u001eR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u00106\u001a\u0004\b9\u0010\u001eR\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010:\u001a\u0004\b;\u0010\"R\u0017\u0010\b\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\b\u0010<\u001a\u0004\b=\u0010\u0016R\u0017\u0010\t\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\t\u0010<\u001a\u0004\b>\u0010\u0016R\u0017\u0010\n\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\n\u00106\u001a\u0004\b?\u0010\u001eR\u0017\u0010\u000b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u00106\u001a\u0004\b@\u0010\u001eR\u001d\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\f8\u0006¢\u0006\f\n\u0004\b\u000e\u0010A\u001a\u0004\bB\u0010(R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u000f\u00106\u001a\u0004\bC\u0010\u001eR\u0019\u0010\u0010\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0010\u00106\u001a\u0004\bD\u0010\u001eR\u0017\u0010\u0012\u001a\u00020\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010E\u001a\u0004\bF\u0010,R\u0013\u0010H\u001a\u0004\u0018\u00010\u00028F¢\u0006\u0006\u001a\u0004\bG\u0010\u001e¨\u0006I"}, d2 = {"Lcom/medium/android/domain/post/models/Highlight;", "Landroid/os/Parcelable;", "", "id", "postId", "groupId", "", "responseCount", "startOffset", "endOffset", "paragraphName", "paragraphText", "Laz5;", "Lcom/medium/android/domain/post/models/Markup;", "paragraphMarkups", "userId", "userName", "Lcom/medium/android/core/models/HighlightType;", "type", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;IILjava/lang/String;Ljava/lang/String;Laz5;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/models/HighlightType;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Ljava/lang/Integer;", "component5", "component6", "component7", "component8", "component9", "()Laz5;", "component10", "component11", "component12", "()Lcom/medium/android/core/models/HighlightType;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;IILjava/lang/String;Ljava/lang/String;Laz5;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/models/HighlightType;)Lcom/medium/android/domain/post/models/Highlight;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getId", "getPostId", "getGroupId", "Ljava/lang/Integer;", "getResponseCount", "I", "getStartOffset", "getEndOffset", "getParagraphName", "getParagraphText", "Laz5;", "getParagraphMarkups", "getUserId", "getUserName", "Lcom/medium/android/core/models/HighlightType;", "getType", "getBoundedText", "boundedText", "domain_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class Highlight implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<Highlight> CREATOR = new h74(11);
    private final int endOffset;
    private final String groupId;
    private final String id;
    private final az5 paragraphMarkups;
    private final String paragraphName;
    private final String paragraphText;
    private final String postId;
    private final Integer responseCount;
    private final int startOffset;
    private final HighlightType type;
    private final String userId;
    private final String userName;

    public Highlight(String str, String str2, String str3, Integer num, int i, int i2, String str4, String str5, az5 az5Var, String str6, String str7, HighlightType highlightType) {
        str2.getClass();
        str4.getClass();
        str5.getClass();
        az5Var.getClass();
        highlightType.getClass();
        this.id = str;
        this.postId = str2;
        this.groupId = str3;
        this.responseCount = num;
        this.startOffset = i;
        this.endOffset = i2;
        this.paragraphName = str4;
        this.paragraphText = str5;
        this.paragraphMarkups = az5Var;
        this.userId = str6;
        this.userName = str7;
        this.type = highlightType;
    }

    public static /* synthetic */ Highlight copy$default(Highlight highlight, String str, String str2, String str3, Integer num, int i, int i2, String str4, String str5, az5 az5Var, String str6, String str7, HighlightType highlightType, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = highlight.id;
        }
        if ((i3 & 2) != 0) {
            str2 = highlight.postId;
        }
        if ((i3 & 4) != 0) {
            str3 = highlight.groupId;
        }
        if ((i3 & 8) != 0) {
            num = highlight.responseCount;
        }
        if ((i3 & 16) != 0) {
            i = highlight.startOffset;
        }
        if ((i3 & 32) != 0) {
            i2 = highlight.endOffset;
        }
        if ((i3 & 64) != 0) {
            str4 = highlight.paragraphName;
        }
        if ((i3 & 128) != 0) {
            str5 = highlight.paragraphText;
        }
        if ((i3 & 256) != 0) {
            az5Var = highlight.paragraphMarkups;
        }
        if ((i3 & 512) != 0) {
            str6 = highlight.userId;
        }
        if ((i3 & 1024) != 0) {
            str7 = highlight.userName;
        }
        if ((i3 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0) {
            highlightType = highlight.type;
        }
        String str8 = str7;
        HighlightType highlightType2 = highlightType;
        az5 az5Var2 = az5Var;
        String str9 = str6;
        String str10 = str4;
        String str11 = str5;
        int i4 = i;
        int i5 = i2;
        return highlight.copy(str, str2, str3, num, i4, i5, str10, str11, az5Var2, str9, str8, highlightType2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final String getUserName() {
        return this.userName;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final HighlightType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getGroupId() {
        return this.groupId;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Integer getResponseCount() {
        return this.responseCount;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final int getStartOffset() {
        return this.startOffset;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final int getEndOffset() {
        return this.endOffset;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getParagraphName() {
        return this.paragraphName;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final String getParagraphText() {
        return this.paragraphText;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final az5 getParagraphMarkups() {
        return this.paragraphMarkups;
    }

    public final Highlight copy(String id, String postId, String groupId, Integer responseCount, int startOffset, int endOffset, String paragraphName, String paragraphText, az5 paragraphMarkups, String userId, String userName, HighlightType type) {
        postId.getClass();
        paragraphName.getClass();
        paragraphText.getClass();
        paragraphMarkups.getClass();
        type.getClass();
        return new Highlight(id, postId, groupId, responseCount, startOffset, endOffset, paragraphName, paragraphText, paragraphMarkups, userId, userName, type);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Highlight)) {
            return false;
        }
        Highlight highlight = (Highlight) other;
        return g76.L(this.id, highlight.id) && g76.L(this.postId, highlight.postId) && g76.L(this.groupId, highlight.groupId) && g76.L(this.responseCount, highlight.responseCount) && this.startOffset == highlight.startOffset && this.endOffset == highlight.endOffset && g76.L(this.paragraphName, highlight.paragraphName) && g76.L(this.paragraphText, highlight.paragraphText) && g76.L(this.paragraphMarkups, highlight.paragraphMarkups) && g76.L(this.userId, highlight.userId) && g76.L(this.userName, highlight.userName) && this.type == highlight.type;
    }

    public final String getBoundedText() {
        int i;
        String str = this.paragraphText;
        int i2 = this.startOffset;
        if (i2 < 0 || (i = this.endOffset) <= 0 || i2 >= i || i2 >= str.length()) {
            str = null;
        }
        if (str == null) {
            return null;
        }
        int i3 = this.endOffset;
        int length = str.length();
        int i4 = this.startOffset;
        return i3 > length ? str.substring(i4, str.length()) : str.substring(i4, this.endOffset);
    }

    public final int getEndOffset() {
        return this.endOffset;
    }

    public final String getGroupId() {
        return this.groupId;
    }

    public final String getId() {
        return this.id;
    }

    public final az5 getParagraphMarkups() {
        return this.paragraphMarkups;
    }

    public final String getParagraphName() {
        return this.paragraphName;
    }

    public final String getParagraphText() {
        return this.paragraphText;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final Integer getResponseCount() {
        return this.responseCount;
    }

    public final int getStartOffset() {
        return this.startOffset;
    }

    public final HighlightType getType() {
        return this.type;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final String getUserName() {
        return this.userName;
    }

    public int hashCode() {
        String str = this.id;
        int iO = wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.postId);
        String str2 = this.groupId;
        int iHashCode = (iO + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num = this.responseCount;
        int iB = ka1.b(this.paragraphMarkups, wgd.o(wgd.o((((((iHashCode + (num == null ? 0 : num.hashCode())) * 31) + this.startOffset) * 31) + this.endOffset) * 31, 31, this.paragraphName), 31, this.paragraphText), 31);
        String str3 = this.userId;
        int iHashCode2 = (iB + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.userName;
        return this.type.hashCode() + ((iHashCode2 + (str4 != null ? str4.hashCode() : 0)) * 31);
    }

    public String toString() {
        String str = this.id;
        String str2 = this.postId;
        String str3 = this.groupId;
        Integer num = this.responseCount;
        int i = this.startOffset;
        int i2 = this.endOffset;
        String str4 = this.paragraphName;
        String str5 = this.paragraphText;
        az5 az5Var = this.paragraphMarkups;
        String str6 = this.userId;
        String str7 = this.userName;
        HighlightType highlightType = this.type;
        StringBuilder sbU = y30.u("Highlight(id=", str, ", postId=", str2, ", groupId=");
        sbU.append(str3);
        sbU.append(", responseCount=");
        sbU.append(num);
        sbU.append(", startOffset=");
        sbU.append(i);
        sbU.append(", endOffset=");
        sbU.append(i2);
        sbU.append(", paragraphName=");
        ka1.C(sbU, str4, ", paragraphText=", str5, ", paragraphMarkups=");
        sbU.append(az5Var);
        sbU.append(", userId=");
        sbU.append(str6);
        sbU.append(", userName=");
        sbU.append(str7);
        sbU.append(", type=");
        sbU.append(highlightType);
        sbU.append(")");
        return sbU.toString();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        int iIntValue;
        dest.getClass();
        dest.writeString(this.id);
        dest.writeString(this.postId);
        dest.writeString(this.groupId);
        Integer num = this.responseCount;
        if (num == null) {
            iIntValue = 0;
        } else {
            dest.writeInt(1);
            iIntValue = num.intValue();
        }
        dest.writeInt(iIntValue);
        dest.writeInt(this.startOffset);
        dest.writeInt(this.endOffset);
        dest.writeString(this.paragraphName);
        dest.writeString(this.paragraphText);
        az5 az5Var = this.paragraphMarkups;
        dest.writeInt(((t0) az5Var).getSize());
        Iterator it2 = az5Var.iterator();
        while (it2.hasNext()) {
            ((Markup) it2.next()).writeToParcel(dest, flags);
        }
        dest.writeString(this.userId);
        dest.writeString(this.userName);
        dest.writeString(this.type.name());
    }
}
