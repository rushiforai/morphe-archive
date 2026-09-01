package com.medium.android.domain.post.models;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h74;
import defpackage.km4;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\b\u0087\b\u0018\u00002\u00020\u0001BC\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\f\u0010\rJ\r\u0010\u000e\u001a\u00020\u0004¢\u0006\u0004\b\u000e\u0010\u000fJ\u001d\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\u0004¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u000fJ\u0010\u0010\u0019\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u000fJ\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0012\u0010\u001e\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001dJR\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\tHÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b!\u0010\u001dJ\u0010\u0010\"\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\"\u0010\u000fJ\u001a\u0010&\u001a\u00020%2\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b&\u0010'R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010(\u001a\u0004\b)\u0010\u0017R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010*\u001a\u0004\b+\u0010\u000fR\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010*\u001a\u0004\b,\u0010\u000fR\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010-\u001a\u0004\b.\u0010\u001bR\u0019\u0010\n\u001a\u0004\u0018\u00010\t8\u0006¢\u0006\f\n\u0004\b\n\u0010/\u001a\u0004\b0\u0010\u001dR\u0019\u0010\u000b\u001a\u0004\u0018\u00010\t8\u0006¢\u0006\f\n\u0004\b\u000b\u0010/\u001a\u0004\b1\u0010\u001d¨\u00062"}, d2 = {"Lcom/medium/android/domain/post/models/Markup;", "Landroid/os/Parcelable;", "Lcom/medium/android/domain/post/models/MarkupType;", "type", "", "start", "end", "Lcom/medium/android/domain/post/models/AnchorType;", "anchorType", "", "href", "userId", "<init>", "(Lcom/medium/android/domain/post/models/MarkupType;IILcom/medium/android/domain/post/models/AnchorType;Ljava/lang/String;Ljava/lang/String;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Lcom/medium/android/domain/post/models/MarkupType;", "component2", "component3", "component4", "()Lcom/medium/android/domain/post/models/AnchorType;", "component5", "()Ljava/lang/String;", "component6", "copy", "(Lcom/medium/android/domain/post/models/MarkupType;IILcom/medium/android/domain/post/models/AnchorType;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/domain/post/models/Markup;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/domain/post/models/MarkupType;", "getType", "I", "getStart", "getEnd", "Lcom/medium/android/domain/post/models/AnchorType;", "getAnchorType", "Ljava/lang/String;", "getHref", "getUserId", "domain_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class Markup implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<Markup> CREATOR = new h74(22);
    private final AnchorType anchorType;
    private final int end;
    private final String href;
    private final int start;
    private final MarkupType type;
    private final String userId;

    public /* synthetic */ Markup(MarkupType markupType, int i, int i2, AnchorType anchorType, String str, String str2, int i3, gy2 gy2Var) {
        this(markupType, i, i2, (i3 & 8) != 0 ? null : anchorType, (i3 & 16) != 0 ? null : str, (i3 & 32) != 0 ? null : str2);
    }

    public static /* synthetic */ Markup copy$default(Markup markup, MarkupType markupType, int i, int i2, AnchorType anchorType, String str, String str2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            markupType = markup.type;
        }
        if ((i3 & 2) != 0) {
            i = markup.start;
        }
        if ((i3 & 4) != 0) {
            i2 = markup.end;
        }
        if ((i3 & 8) != 0) {
            anchorType = markup.anchorType;
        }
        if ((i3 & 16) != 0) {
            str = markup.href;
        }
        if ((i3 & 32) != 0) {
            str2 = markup.userId;
        }
        String str3 = str;
        String str4 = str2;
        return markup.copy(markupType, i, i2, anchorType, str3, str4);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final MarkupType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getStart() {
        return this.start;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getEnd() {
        return this.end;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final AnchorType getAnchorType() {
        return this.anchorType;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getHref() {
        return this.href;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final Markup copy(MarkupType type, int start, int end, AnchorType anchorType, String href, String userId) {
        type.getClass();
        return new Markup(type, start, end, anchorType, href, userId);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Markup)) {
            return false;
        }
        Markup markup = (Markup) other;
        return this.type == markup.type && this.start == markup.start && this.end == markup.end && this.anchorType == markup.anchorType && g76.L(this.href, markup.href) && g76.L(this.userId, markup.userId);
    }

    public final AnchorType getAnchorType() {
        return this.anchorType;
    }

    public final int getEnd() {
        return this.end;
    }

    public final String getHref() {
        return this.href;
    }

    public final int getStart() {
        return this.start;
    }

    public final MarkupType getType() {
        return this.type;
    }

    public final String getUserId() {
        return this.userId;
    }

    public int hashCode() {
        int iHashCode = ((((this.type.hashCode() * 31) + this.start) * 31) + this.end) * 31;
        AnchorType anchorType = this.anchorType;
        int iHashCode2 = (iHashCode + (anchorType == null ? 0 : anchorType.hashCode())) * 31;
        String str = this.href;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.userId;
        return iHashCode3 + (str2 != null ? str2.hashCode() : 0);
    }

    public String toString() {
        MarkupType markupType = this.type;
        int i = this.start;
        int i2 = this.end;
        AnchorType anchorType = this.anchorType;
        String str = this.href;
        String str2 = this.userId;
        StringBuilder sb = new StringBuilder("Markup(type=");
        sb.append(markupType);
        sb.append(", start=");
        sb.append(i);
        sb.append(", end=");
        sb.append(i2);
        sb.append(", anchorType=");
        sb.append(anchorType);
        sb.append(", href=");
        return km4.C(sb, str, ", userId=", str2, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.type.name());
        dest.writeInt(this.start);
        dest.writeInt(this.end);
        AnchorType anchorType = this.anchorType;
        if (anchorType == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(anchorType.name());
        }
        dest.writeString(this.href);
        dest.writeString(this.userId);
    }

    public Markup(MarkupType markupType, int i, int i2, AnchorType anchorType, String str, String str2) {
        markupType.getClass();
        this.type = markupType;
        this.start = i;
        this.end = i2;
        this.anchorType = anchorType;
        this.href = str;
        this.userId = str2;
    }
}
