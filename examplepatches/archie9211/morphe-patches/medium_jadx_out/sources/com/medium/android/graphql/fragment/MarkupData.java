package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.AnchorType;
import com.medium.android.graphql.type.MarkupType;
import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0017\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0013\b\u0086\b\u0018\u00002\u00020\u0001Bw\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\u0007\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0002\u0012\u0010\u0010\u0011\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0018\u00010\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0015J\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001aJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u0015J\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u0015J\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u0015J\u0012\u0010\u001f\u001a\u0004\u0018\u00010\rHÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0012\u0010!\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b!\u0010\u0015J\u001a\u0010\"\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0018\u00010\u0010HÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0096\u0001\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\t\u001a\u00020\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00022\u0012\b\u0002\u0010\u0011\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0018\u00010\u0010HÆ\u0001¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b&\u0010\u0015J\u0010\u0010'\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b'\u0010\u001aJ\u001a\u0010+\u001a\u00020*2\b\u0010)\u001a\u0004\u0018\u00010(HÖ\u0003¢\u0006\u0004\b+\u0010,R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010-\u001a\u0004\b.\u0010\u0015R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010-\u001a\u0004\b/\u0010\u0015R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00100\u001a\u0004\b1\u0010\u0018R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u00102\u001a\u0004\b3\u0010\u001aR\u0017\u0010\t\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\t\u00102\u001a\u0004\b4\u0010\u001aR\u0019\u0010\n\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\n\u0010-\u001a\u0004\b5\u0010\u0015R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u0010-\u001a\u0004\b6\u0010\u0015R\u0019\u0010\f\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\f\u0010-\u001a\u0004\b7\u0010\u0015R\u0019\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006¢\u0006\f\n\u0004\b\u000e\u00108\u001a\u0004\b9\u0010 R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u000f\u0010-\u001a\u0004\b:\u0010\u0015R!\u0010\u0011\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0018\u00010\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010;\u001a\u0004\b<\u0010#¨\u0006="}, d2 = {"Lcom/medium/android/graphql/fragment/MarkupData;", "Lg15;", "", "__typename", "name", "Lcom/medium/android/graphql/type/MarkupType;", "type", "", "start", "end", "href", "title", "rel", "Lcom/medium/android/graphql/type/AnchorType;", "anchorType", "userId", "", "creatorIds", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/MarkupType;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/AnchorType;Ljava/lang/String;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/type/MarkupType;", "component4", "()I", "component5", "component6", "component7", "component8", "component9", "()Lcom/medium/android/graphql/type/AnchorType;", "component10", "component11", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/MarkupType;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/AnchorType;Ljava/lang/String;Ljava/util/List;)Lcom/medium/android/graphql/fragment/MarkupData;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getName", "Lcom/medium/android/graphql/type/MarkupType;", "getType", "I", "getStart", "getEnd", "getHref", "getTitle", "getRel", "Lcom/medium/android/graphql/type/AnchorType;", "getAnchorType", "getUserId", "Ljava/util/List;", "getCreatorIds", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MarkupData implements g15 {
    private final String __typename;
    private final AnchorType anchorType;
    private final List<String> creatorIds;
    private final int end;
    private final String href;
    private final String name;
    private final String rel;
    private final int start;
    private final String title;
    private final MarkupType type;
    private final String userId;

    public MarkupData(String str, String str2, MarkupType markupType, int i, int i2, String str3, String str4, String str5, AnchorType anchorType, String str6, List<String> list) {
        str.getClass();
        this.__typename = str;
        this.name = str2;
        this.type = markupType;
        this.start = i;
        this.end = i2;
        this.href = str3;
        this.title = str4;
        this.rel = str5;
        this.anchorType = anchorType;
        this.userId = str6;
        this.creatorIds = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ MarkupData copy$default(MarkupData markupData, String str, String str2, MarkupType markupType, int i, int i2, String str3, String str4, String str5, AnchorType anchorType, String str6, List list, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = markupData.__typename;
        }
        if ((i3 & 2) != 0) {
            str2 = markupData.name;
        }
        if ((i3 & 4) != 0) {
            markupType = markupData.type;
        }
        if ((i3 & 8) != 0) {
            i = markupData.start;
        }
        if ((i3 & 16) != 0) {
            i2 = markupData.end;
        }
        if ((i3 & 32) != 0) {
            str3 = markupData.href;
        }
        if ((i3 & 64) != 0) {
            str4 = markupData.title;
        }
        if ((i3 & 128) != 0) {
            str5 = markupData.rel;
        }
        if ((i3 & 256) != 0) {
            anchorType = markupData.anchorType;
        }
        if ((i3 & 512) != 0) {
            str6 = markupData.userId;
        }
        if ((i3 & 1024) != 0) {
            list = markupData.creatorIds;
        }
        String str7 = str6;
        List list2 = list;
        String str8 = str5;
        AnchorType anchorType2 = anchorType;
        String str9 = str3;
        String str10 = str4;
        int i4 = i2;
        MarkupType markupType2 = markupType;
        return markupData.copy(str, str2, markupType2, i, i4, str9, str10, str8, anchorType2, str7, list2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final List<String> component11() {
        return this.creatorIds;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final MarkupType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final int getStart() {
        return this.start;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final int getEnd() {
        return this.end;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final String getHref() {
        return this.href;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final String getRel() {
        return this.rel;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final AnchorType getAnchorType() {
        return this.anchorType;
    }

    public final MarkupData copy(String __typename, String name, MarkupType type, int start, int end, String href, String title, String rel, AnchorType anchorType, String userId, List<String> creatorIds) {
        __typename.getClass();
        return new MarkupData(__typename, name, type, start, end, href, title, rel, anchorType, userId, creatorIds);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MarkupData)) {
            return false;
        }
        MarkupData markupData = (MarkupData) other;
        return g76.L(this.__typename, markupData.__typename) && g76.L(this.name, markupData.name) && this.type == markupData.type && this.start == markupData.start && this.end == markupData.end && g76.L(this.href, markupData.href) && g76.L(this.title, markupData.title) && g76.L(this.rel, markupData.rel) && this.anchorType == markupData.anchorType && g76.L(this.userId, markupData.userId) && g76.L(this.creatorIds, markupData.creatorIds);
    }

    public final AnchorType getAnchorType() {
        return this.anchorType;
    }

    public final List<String> getCreatorIds() {
        return this.creatorIds;
    }

    public final int getEnd() {
        return this.end;
    }

    public final String getHref() {
        return this.href;
    }

    public final String getName() {
        return this.name;
    }

    public final String getRel() {
        return this.rel;
    }

    public final int getStart() {
        return this.start;
    }

    public final String getTitle() {
        return this.title;
    }

    public final MarkupType getType() {
        return this.type;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        String str = this.name;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        MarkupType markupType = this.type;
        int iHashCode3 = (((((iHashCode2 + (markupType == null ? 0 : markupType.hashCode())) * 31) + this.start) * 31) + this.end) * 31;
        String str2 = this.href;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.title;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.rel;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        AnchorType anchorType = this.anchorType;
        int iHashCode7 = (iHashCode6 + (anchorType == null ? 0 : anchorType.hashCode())) * 31;
        String str5 = this.userId;
        int iHashCode8 = (iHashCode7 + (str5 == null ? 0 : str5.hashCode())) * 31;
        List<String> list = this.creatorIds;
        return iHashCode8 + (list != null ? list.hashCode() : 0);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.name;
        MarkupType markupType = this.type;
        int i = this.start;
        int i2 = this.end;
        String str3 = this.href;
        String str4 = this.title;
        String str5 = this.rel;
        AnchorType anchorType = this.anchorType;
        String str6 = this.userId;
        List<String> list = this.creatorIds;
        StringBuilder sbU = y30.u("MarkupData(__typename=", str, ", name=", str2, ", type=");
        sbU.append(markupType);
        sbU.append(", start=");
        sbU.append(i);
        sbU.append(", end=");
        sbU.append(i2);
        sbU.append(", href=");
        sbU.append(str3);
        sbU.append(", title=");
        ka1.C(sbU, str4, ", rel=", str5, ", anchorType=");
        sbU.append(anchorType);
        sbU.append(", userId=");
        sbU.append(str6);
        sbU.append(", creatorIds=");
        return b09.B(sbU, list, ")");
    }
}
