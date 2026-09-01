package com.medium.android.core.share;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.ev6;
import defpackage.f08;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u0000\n\u0002\b\n\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\r\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\f\u0010\rJ\u001d\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u000b¢\u0006\u0004\b\u0012\u0010\u0013J\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0015J\u0010\u0010\u0019\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u001aJ<\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001d\u0010\u0015J\u0010\u0010\u001e\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b\u001e\u0010\rJ\u001a\u0010!\u001a\u00020\u00042\b\u0010 \u001a\u0004\u0018\u00010\u001fHÖ\u0003¢\u0006\u0004\b!\u0010\"R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010#\u001a\u0004\b$\u0010\u0015R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010%\u001a\u0004\b\u0005\u0010\u0017R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010#\u001a\u0004\b&\u0010\u0015R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010'\u001a\u0004\b(\u0010\u001a¨\u0006)"}, d2 = {"Lcom/medium/android/core/share/RepostShareData;", "Landroid/os/Parcelable;", "", "reposterUsername", "", "isReposterCurrentUser", "note", "Lcom/medium/android/core/share/PostShareData;", "postShareData", "<init>", "(Ljava/lang/String;ZLjava/lang/String;Lcom/medium/android/core/share/PostShareData;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "()Z", "component3", "component4", "()Lcom/medium/android/core/share/PostShareData;", "copy", "(Ljava/lang/String;ZLjava/lang/String;Lcom/medium/android/core/share/PostShareData;)Lcom/medium/android/core/share/RepostShareData;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReposterUsername", "Z", "getNote", "Lcom/medium/android/core/share/PostShareData;", "getPostShareData", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class RepostShareData implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<RepostShareData> CREATOR = new f08(20);
    private final boolean isReposterCurrentUser;
    private final String note;
    private final PostShareData postShareData;
    private final String reposterUsername;

    public RepostShareData(String str, boolean z, String str2, PostShareData postShareData) {
        postShareData.getClass();
        this.reposterUsername = str;
        this.isReposterCurrentUser = z;
        this.note = str2;
        this.postShareData = postShareData;
    }

    public static /* synthetic */ RepostShareData copy$default(RepostShareData repostShareData, String str, boolean z, String str2, PostShareData postShareData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = repostShareData.reposterUsername;
        }
        if ((i & 2) != 0) {
            z = repostShareData.isReposterCurrentUser;
        }
        if ((i & 4) != 0) {
            str2 = repostShareData.note;
        }
        if ((i & 8) != 0) {
            postShareData = repostShareData.postShareData;
        }
        return repostShareData.copy(str, z, str2, postShareData);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getReposterUsername() {
        return this.reposterUsername;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final boolean getIsReposterCurrentUser() {
        return this.isReposterCurrentUser;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getNote() {
        return this.note;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final PostShareData getPostShareData() {
        return this.postShareData;
    }

    public final RepostShareData copy(String reposterUsername, boolean isReposterCurrentUser, String note, PostShareData postShareData) {
        postShareData.getClass();
        return new RepostShareData(reposterUsername, isReposterCurrentUser, note, postShareData);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RepostShareData)) {
            return false;
        }
        RepostShareData repostShareData = (RepostShareData) other;
        return g76.L(this.reposterUsername, repostShareData.reposterUsername) && this.isReposterCurrentUser == repostShareData.isReposterCurrentUser && g76.L(this.note, repostShareData.note) && g76.L(this.postShareData, repostShareData.postShareData);
    }

    public final String getNote() {
        return this.note;
    }

    public final PostShareData getPostShareData() {
        return this.postShareData;
    }

    public final String getReposterUsername() {
        return this.reposterUsername;
    }

    public int hashCode() {
        String str = this.reposterUsername;
        int iHashCode = (((str == null ? 0 : str.hashCode()) * 31) + (this.isReposterCurrentUser ? 1231 : 1237)) * 31;
        String str2 = this.note;
        return this.postShareData.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final boolean isReposterCurrentUser() {
        return this.isReposterCurrentUser;
    }

    public String toString() {
        String str = this.reposterUsername;
        boolean z = this.isReposterCurrentUser;
        String str2 = this.note;
        PostShareData postShareData = this.postShareData;
        StringBuilder sbD = ev6.D("RepostShareData(reposterUsername=", str, ", isReposterCurrentUser=", ", note=", z);
        sbD.append(str2);
        sbD.append(", postShareData=");
        sbD.append(postShareData);
        sbD.append(")");
        return sbD.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.reposterUsername);
        dest.writeInt(this.isReposterCurrentUser ? 1 : 0);
        dest.writeString(this.note);
        this.postShareData.writeToParcel(dest, flags);
    }
}
