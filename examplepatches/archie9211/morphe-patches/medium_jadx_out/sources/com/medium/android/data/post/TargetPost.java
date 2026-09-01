package com.medium.android.data.post;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.tfd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\b¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0012\u0010\u0013\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0012J\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0012J2\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0012J\u0010\u0010\u0018\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u0018\u0010\nJ\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010\u0012R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001e\u001a\u0004\b \u0010\u0012R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001e\u001a\u0004\b!\u0010\u0012¨\u0006\""}, d2 = {"Lcom/medium/android/data/post/TargetPost;", "Landroid/os/Parcelable;", "", "id", "paragraphName", "shareKey", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/data/post/TargetPost;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getId", "getParagraphName", "getShareKey", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TargetPost implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<TargetPost> CREATOR = new tfd(0);
    private final String id;
    private final String paragraphName;
    private final String shareKey;

    public /* synthetic */ TargetPost(String str, String str2, String str3, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3);
    }

    public static /* synthetic */ TargetPost copy$default(TargetPost targetPost, String str, String str2, String str3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = targetPost.id;
        }
        if ((i & 2) != 0) {
            str2 = targetPost.paragraphName;
        }
        if ((i & 4) != 0) {
            str3 = targetPost.shareKey;
        }
        return targetPost.copy(str, str2, str3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getParagraphName() {
        return this.paragraphName;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getShareKey() {
        return this.shareKey;
    }

    public final TargetPost copy(String id, String paragraphName, String shareKey) {
        id.getClass();
        return new TargetPost(id, paragraphName, shareKey);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TargetPost)) {
            return false;
        }
        TargetPost targetPost = (TargetPost) other;
        return g76.L(this.id, targetPost.id) && g76.L(this.paragraphName, targetPost.paragraphName) && g76.L(this.shareKey, targetPost.shareKey);
    }

    public final String getId() {
        return this.id;
    }

    public final String getParagraphName() {
        return this.paragraphName;
    }

    public final String getShareKey() {
        return this.shareKey;
    }

    public int hashCode() {
        int iHashCode = this.id.hashCode() * 31;
        String str = this.paragraphName;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.shareKey;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public String toString() {
        String str = this.id;
        String str2 = this.paragraphName;
        return ka1.v(y30.u("TargetPost(id=", str, ", paragraphName=", str2, ", shareKey="), this.shareKey, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.id);
        dest.writeString(this.paragraphName);
        dest.writeString(this.shareKey);
    }

    public TargetPost(String str, String str2, String str3) {
        str.getClass();
        this.id = str;
        this.paragraphName = str2;
        this.shareKey = str3;
    }
}
