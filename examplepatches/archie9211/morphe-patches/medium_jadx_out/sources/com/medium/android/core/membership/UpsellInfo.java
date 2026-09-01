package com.medium.android.core.membership;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g76;
import defpackage.gy2;
import defpackage.km4;
import defpackage.tfd;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0087\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u000b\u0010\fJ\r\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000e\u0010\u000fJ\u001d\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\r¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0019J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u0019J\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u0019J\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u0019JV\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b!\u0010\u0019J\u0010\u0010\"\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\"\u0010\u000fJ\u001a\u0010&\u001a\u00020%2\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b&\u0010'R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010(\u001a\u0004\b)\u0010\u0017R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010*\u001a\u0004\b+\u0010\u0019R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010\u001bR\u0019\u0010\b\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\b\u0010*\u001a\u0004\b.\u0010\u0019R\u0019\u0010\t\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010*\u001a\u0004\b/\u0010\u0019R\u0019\u0010\n\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010*\u001a\u0004\b0\u0010\u0019¨\u00061"}, d2 = {"Lcom/medium/android/core/membership/UpsellInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/membership/UpsellReferrer;", "referrer", "", "dimension", "Lcom/medium/android/core/membership/UpsellPromoId;", "promoId", "postId", "authorId", "authorUsername", "<init>", "(Lcom/medium/android/core/membership/UpsellReferrer;Ljava/lang/String;Lcom/medium/android/core/membership/UpsellPromoId;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Lcom/medium/android/core/membership/UpsellReferrer;", "component2", "()Ljava/lang/String;", "component3", "()Lcom/medium/android/core/membership/UpsellPromoId;", "component4", "component5", "component6", "copy", "(Lcom/medium/android/core/membership/UpsellReferrer;Ljava/lang/String;Lcom/medium/android/core/membership/UpsellPromoId;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/core/membership/UpsellInfo;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/core/membership/UpsellReferrer;", "getReferrer", "Ljava/lang/String;", "getDimension", "Lcom/medium/android/core/membership/UpsellPromoId;", "getPromoId", "getPostId", "getAuthorId", "getAuthorUsername", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpsellInfo implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<UpsellInfo> CREATOR = new tfd(3);
    private final String authorId;
    private final String authorUsername;
    private final String dimension;
    private final String postId;
    private final UpsellPromoId promoId;
    private final UpsellReferrer referrer;

    public /* synthetic */ UpsellInfo(UpsellReferrer upsellReferrer, String str, UpsellPromoId upsellPromoId, String str2, String str3, String str4, int i, gy2 gy2Var) {
        this(upsellReferrer, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : upsellPromoId, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? null : str4);
    }

    public static /* synthetic */ UpsellInfo copy$default(UpsellInfo upsellInfo, UpsellReferrer upsellReferrer, String str, UpsellPromoId upsellPromoId, String str2, String str3, String str4, int i, Object obj) {
        if ((i & 1) != 0) {
            upsellReferrer = upsellInfo.referrer;
        }
        if ((i & 2) != 0) {
            str = upsellInfo.dimension;
        }
        if ((i & 4) != 0) {
            upsellPromoId = upsellInfo.promoId;
        }
        if ((i & 8) != 0) {
            str2 = upsellInfo.postId;
        }
        if ((i & 16) != 0) {
            str3 = upsellInfo.authorId;
        }
        if ((i & 32) != 0) {
            str4 = upsellInfo.authorUsername;
        }
        String str5 = str3;
        String str6 = str4;
        return upsellInfo.copy(upsellReferrer, str, upsellPromoId, str2, str5, str6);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final UpsellReferrer getReferrer() {
        return this.referrer;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getDimension() {
        return this.dimension;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final UpsellPromoId getPromoId() {
        return this.promoId;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getAuthorId() {
        return this.authorId;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final String getAuthorUsername() {
        return this.authorUsername;
    }

    public final UpsellInfo copy(UpsellReferrer referrer, String dimension, UpsellPromoId promoId, String postId, String authorId, String authorUsername) {
        referrer.getClass();
        return new UpsellInfo(referrer, dimension, promoId, postId, authorId, authorUsername);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpsellInfo)) {
            return false;
        }
        UpsellInfo upsellInfo = (UpsellInfo) other;
        return this.referrer == upsellInfo.referrer && g76.L(this.dimension, upsellInfo.dimension) && this.promoId == upsellInfo.promoId && g76.L(this.postId, upsellInfo.postId) && g76.L(this.authorId, upsellInfo.authorId) && g76.L(this.authorUsername, upsellInfo.authorUsername);
    }

    public final String getAuthorId() {
        return this.authorId;
    }

    public final String getAuthorUsername() {
        return this.authorUsername;
    }

    public final String getDimension() {
        return this.dimension;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final UpsellPromoId getPromoId() {
        return this.promoId;
    }

    public final UpsellReferrer getReferrer() {
        return this.referrer;
    }

    public int hashCode() {
        int iHashCode = this.referrer.hashCode() * 31;
        String str = this.dimension;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        UpsellPromoId upsellPromoId = this.promoId;
        int iHashCode3 = (iHashCode2 + (upsellPromoId == null ? 0 : upsellPromoId.hashCode())) * 31;
        String str2 = this.postId;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.authorId;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.authorUsername;
        return iHashCode5 + (str4 != null ? str4.hashCode() : 0);
    }

    public String toString() {
        UpsellReferrer upsellReferrer = this.referrer;
        String str = this.dimension;
        UpsellPromoId upsellPromoId = this.promoId;
        String str2 = this.postId;
        String str3 = this.authorId;
        String str4 = this.authorUsername;
        StringBuilder sb = new StringBuilder("UpsellInfo(referrer=");
        sb.append(upsellReferrer);
        sb.append(", dimension=");
        sb.append(str);
        sb.append(", promoId=");
        sb.append(upsellPromoId);
        sb.append(", postId=");
        sb.append(str2);
        sb.append(", authorId=");
        return km4.C(sb, str3, ", authorUsername=", str4, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.referrer.name());
        dest.writeString(this.dimension);
        UpsellPromoId upsellPromoId = this.promoId;
        if (upsellPromoId == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            upsellPromoId.writeToParcel(dest, flags);
        }
        dest.writeString(this.postId);
        dest.writeString(this.authorId);
        dest.writeString(this.authorUsername);
    }

    public UpsellInfo(UpsellReferrer upsellReferrer, String str, UpsellPromoId upsellPromoId, String str2, String str3, String str4) {
        upsellReferrer.getClass();
        this.referrer = upsellReferrer;
        this.dimension = str;
        this.promoId = upsellPromoId;
        this.postId = str2;
        this.authorId = str3;
        this.authorUsername = str4;
    }
}
