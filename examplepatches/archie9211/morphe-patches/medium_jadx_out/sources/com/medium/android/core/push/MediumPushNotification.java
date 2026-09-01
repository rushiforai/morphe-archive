package com.medium.android.core.push;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.fr7;
import defpackage.g76;
import defpackage.h74;
import defpackage.ho2;
import defpackage.hz2;
import defpackage.jb6;
import defpackage.ka1;
import defpackage.n70;
import defpackage.wgd;
import defpackage.x38;
import defpackage.y30;
import defpackage.yoe;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\b\u0087\b\u0018\u0000 52\u00020\u0001:\u00016BW\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\u0002\u0012\u0006\u0010\u000b\u001a\u00020\u0002\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\r\u0010\u000eJ\r\u0010\u000f\u001a\u00020\b¢\u0006\u0004\b\u000f\u0010\u0010J\u001d\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\b¢\u0006\u0004\b\u0015\u0010\u0016J\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0018J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u0018J\u0010\u0010\u001b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u0018J\u0010\u0010\u001c\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u0018J\u0010\u0010\u001d\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u001d\u0010\u0010J\u0010\u0010\u001e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u0018J\u0010\u0010\u001f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u0018J\u0012\u0010 \u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b \u0010\u0018Jr\u0010!\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\u00022\b\b\u0002\u0010\u000b\u001a\u00020\u00022\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b#\u0010\u0018J\u0010\u0010$\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b$\u0010\u0010J\u001a\u0010(\u001a\u00020'2\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010*\u001a\u0004\b+\u0010\u0018R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b,\u0010\u0018R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010*\u001a\u0004\b-\u0010\u0018R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010*\u001a\u0004\b.\u0010\u0018R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010*\u001a\u0004\b/\u0010\u0018R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00100\u001a\u0004\b1\u0010\u0010R\u0017\u0010\n\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\n\u0010*\u001a\u0004\b2\u0010\u0018R\u0017\u0010\u000b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u0010*\u001a\u0004\b3\u0010\u0018R\u0019\u0010\f\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\f\u0010*\u001a\u0004\b4\u0010\u0018¨\u00067"}, d2 = {"Lcom/medium/android/core/push/MediumPushNotification;", "Landroid/os/Parcelable;", "", "title", "body", "imageUrl", "deeplink", "channelId", "", "notificationId", "notificationType", "notificationUri", "postId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/core/push/MediumPushNotification;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTitle", "getBody", "getImageUrl", "getDeeplink", "getChannelId", "I", "getNotificationId", "getNotificationType", "getNotificationUri", "getPostId", "Companion", "fr7", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MediumPushNotification implements Parcelable {
    public static final int $stable = 0;
    private static final jb6 adapter;
    private final String body;
    private final String channelId;
    private final String deeplink;
    private final String imageUrl;
    private final int notificationId;
    private final String notificationType;
    private final String notificationUri;
    private final String postId;
    private final String title;
    public static final fr7 Companion = new fr7();
    public static final Parcelable.Creator<MediumPushNotification> CREATOR = new h74(29);

    static {
        hz2 hz2Var = new hz2(1);
        hz2Var.b(new n70(3));
        adapter = new x38(hz2Var).a(MediumPushNotification.class, yoe.a, null);
    }

    public MediumPushNotification(String str, String str2, String str3, String str4, String str5, int i, String str6, String str7, String str8) {
        ho2.Q(str4, str5, str6, str7);
        this.title = str;
        this.body = str2;
        this.imageUrl = str3;
        this.deeplink = str4;
        this.channelId = str5;
        this.notificationId = i;
        this.notificationType = str6;
        this.notificationUri = str7;
        this.postId = str8;
    }

    public static /* synthetic */ MediumPushNotification copy$default(MediumPushNotification mediumPushNotification, String str, String str2, String str3, String str4, String str5, int i, String str6, String str7, String str8, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = mediumPushNotification.title;
        }
        if ((i2 & 2) != 0) {
            str2 = mediumPushNotification.body;
        }
        if ((i2 & 4) != 0) {
            str3 = mediumPushNotification.imageUrl;
        }
        if ((i2 & 8) != 0) {
            str4 = mediumPushNotification.deeplink;
        }
        if ((i2 & 16) != 0) {
            str5 = mediumPushNotification.channelId;
        }
        if ((i2 & 32) != 0) {
            i = mediumPushNotification.notificationId;
        }
        if ((i2 & 64) != 0) {
            str6 = mediumPushNotification.notificationType;
        }
        if ((i2 & 128) != 0) {
            str7 = mediumPushNotification.notificationUri;
        }
        if ((i2 & 256) != 0) {
            str8 = mediumPushNotification.postId;
        }
        String str9 = str7;
        String str10 = str8;
        int i3 = i;
        String str11 = str6;
        String str12 = str5;
        String str13 = str3;
        return mediumPushNotification.copy(str, str2, str13, str4, str12, i3, str11, str9, str10);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getBody() {
        return this.body;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getImageUrl() {
        return this.imageUrl;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getDeeplink() {
        return this.deeplink;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getChannelId() {
        return this.channelId;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final int getNotificationId() {
        return this.notificationId;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getNotificationType() {
        return this.notificationType;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final String getNotificationUri() {
        return this.notificationUri;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final MediumPushNotification copy(String title, String body, String imageUrl, String deeplink, String channelId, int notificationId, String notificationType, String notificationUri, String postId) {
        deeplink.getClass();
        channelId.getClass();
        notificationType.getClass();
        notificationUri.getClass();
        return new MediumPushNotification(title, body, imageUrl, deeplink, channelId, notificationId, notificationType, notificationUri, postId);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MediumPushNotification)) {
            return false;
        }
        MediumPushNotification mediumPushNotification = (MediumPushNotification) other;
        return g76.L(this.title, mediumPushNotification.title) && g76.L(this.body, mediumPushNotification.body) && g76.L(this.imageUrl, mediumPushNotification.imageUrl) && g76.L(this.deeplink, mediumPushNotification.deeplink) && g76.L(this.channelId, mediumPushNotification.channelId) && this.notificationId == mediumPushNotification.notificationId && g76.L(this.notificationType, mediumPushNotification.notificationType) && g76.L(this.notificationUri, mediumPushNotification.notificationUri) && g76.L(this.postId, mediumPushNotification.postId);
    }

    public final String getBody() {
        return this.body;
    }

    public final String getChannelId() {
        return this.channelId;
    }

    public final String getDeeplink() {
        return this.deeplink;
    }

    public final String getImageUrl() {
        return this.imageUrl;
    }

    public final int getNotificationId() {
        return this.notificationId;
    }

    public final String getNotificationType() {
        return this.notificationType;
    }

    public final String getNotificationUri() {
        return this.notificationUri;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final String getTitle() {
        return this.title;
    }

    public int hashCode() {
        String str = this.title;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.body;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.imageUrl;
        int iO = wgd.o(wgd.o((wgd.o(wgd.o((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.deeplink), 31, this.channelId) + this.notificationId) * 31, 31, this.notificationType), 31, this.notificationUri);
        String str4 = this.postId;
        return iO + (str4 != null ? str4.hashCode() : 0);
    }

    public String toString() {
        String str = this.title;
        String str2 = this.body;
        String str3 = this.imageUrl;
        String str4 = this.deeplink;
        String str5 = this.channelId;
        int i = this.notificationId;
        String str6 = this.notificationType;
        String str7 = this.notificationUri;
        String str8 = this.postId;
        StringBuilder sbU = y30.u("MediumPushNotification(title=", str, ", body=", str2, ", imageUrl=");
        ka1.C(sbU, str3, ", deeplink=", str4, ", channelId=");
        sbU.append(str5);
        sbU.append(", notificationId=");
        sbU.append(i);
        sbU.append(", notificationType=");
        ka1.C(sbU, str6, ", notificationUri=", str7, ", postId=");
        return ka1.v(sbU, str8, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.title);
        dest.writeString(this.body);
        dest.writeString(this.imageUrl);
        dest.writeString(this.deeplink);
        dest.writeString(this.channelId);
        dest.writeInt(this.notificationId);
        dest.writeString(this.notificationType);
        dest.writeString(this.notificationUri);
        dest.writeString(this.postId);
    }
}
