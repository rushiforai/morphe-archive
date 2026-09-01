package com.medium.android.postpublishing.ui;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g76;
import defpackage.ka1;
import defpackage.tfd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0007\u0010\bJ\r\u0010\t\u001a\u00020\u0004¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u0004¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0013\u0010\nJ\u0010\u0010\u0014\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0012J.\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0012J\u0010\u0010\u0018\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0018\u0010\nJ\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010\u0012R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010 \u001a\u0004\b!\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001e\u001a\u0004\b\"\u0010\u0012¨\u0006#"}, d2 = {"Lcom/medium/android/postpublishing/ui/TopicData;", "Landroid/os/Parcelable;", "", "id", "", "followerCount", "displayTitle", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "copy", "(Ljava/lang/String;ILjava/lang/String;)Lcom/medium/android/postpublishing/ui/TopicData;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getId", "I", "getFollowerCount", "getDisplayTitle", "postpublishing_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TopicData implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<TopicData> CREATOR = new tfd(1);
    private final String displayTitle;
    private final int followerCount;
    private final String id;

    public TopicData(String str, int i, String str2) {
        str.getClass();
        str2.getClass();
        this.id = str;
        this.followerCount = i;
        this.displayTitle = str2;
    }

    public static /* synthetic */ TopicData copy$default(TopicData topicData, String str, int i, String str2, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = topicData.id;
        }
        if ((i2 & 2) != 0) {
            i = topicData.followerCount;
        }
        if ((i2 & 4) != 0) {
            str2 = topicData.displayTitle;
        }
        return topicData.copy(str, i, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getFollowerCount() {
        return this.followerCount;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getDisplayTitle() {
        return this.displayTitle;
    }

    public final TopicData copy(String id, int followerCount, String displayTitle) {
        id.getClass();
        displayTitle.getClass();
        return new TopicData(id, followerCount, displayTitle);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TopicData)) {
            return false;
        }
        TopicData topicData = (TopicData) other;
        return g76.L(this.id, topicData.id) && this.followerCount == topicData.followerCount && g76.L(this.displayTitle, topicData.displayTitle);
    }

    public final String getDisplayTitle() {
        return this.displayTitle;
    }

    public final int getFollowerCount() {
        return this.followerCount;
    }

    public final String getId() {
        return this.id;
    }

    public int hashCode() {
        return this.displayTitle.hashCode() + (((this.id.hashCode() * 31) + this.followerCount) * 31);
    }

    public String toString() {
        String str = this.id;
        int i = this.followerCount;
        return ka1.v(y30.t(i, "TopicData(id=", str, ", followerCount=", ", displayTitle="), this.displayTitle, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.id);
        dest.writeInt(this.followerCount);
        dest.writeString(this.displayTitle);
    }
}
