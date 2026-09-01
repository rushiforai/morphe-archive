package com.medium.android.donkey.push;

import android.app.PendingIntent;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.core.susi.SusiDestination;
import com.medium.proto.event.NotificationContentOpened;
import defpackage.b09;
import defpackage.ev6;
import defpackage.g76;
import defpackage.gp7;
import defpackage.i03;
import defpackage.km4;
import defpackage.p13;
import defpackage.py2;
import defpackage.qb8;
import defpackage.qn5;
import defpackage.rqd;
import defpackage.tj2;
import defpackage.w50;
import defpackage.wgd;
import defpackage.y30;
import defpackage.ygf;
import defpackage.yx2;
import defpackage.zk2;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class TrampolineActivity extends qn5 {
    public static final /* synthetic */ int v = 0;
    public p13 q;
    public py2 r;
    public yx2 s;
    public zk2 t;
    public w50 u;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\bÀ\u0006\u0003"}, d2 = {"Lcom/medium/android/donkey/push/TrampolineActivity$Action;", "Landroid/os/Parcelable;", "OpenDeeplinkFromPushNotification", "OpenPostFromAudioControllerNotification", "OpenPostFromPushNotification", "Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenDeeplinkFromPushNotification;", "Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenPostFromAudioControllerNotification;", "Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenPostFromPushNotification;", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public interface Action extends Parcelable {

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0007\u0010\bJ\r\u0010\n\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\t¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0013J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0013J:\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u0013J\u0010\u0010\u001a\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b\u001a\u0010\u000bJ\u001a\u0010\u001e\u001a\u00020\u001d2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bHÖ\u0003¢\u0006\u0004\b\u001e\u0010\u001fR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010 \u001a\u0004\b!\u0010\u0013R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010 \u001a\u0004\b\"\u0010\u0013R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010 \u001a\u0004\b#\u0010\u0013R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010 \u001a\u0004\b$\u0010\u0013¨\u0006%"}, d2 = {"Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenDeeplinkFromPushNotification;", "Lcom/medium/android/donkey/push/TrampolineActivity$Action;", "", "deeplink", "notificationType", "notificationUri", "postId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenDeeplinkFromPushNotification;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getDeeplink", "getNotificationType", "getNotificationUri", "getPostId", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class OpenDeeplinkFromPushNotification implements Action {
            public static final int $stable = 0;
            public static final Parcelable.Creator<OpenDeeplinkFromPushNotification> CREATOR = new a();
            private final String deeplink;
            private final String notificationType;
            private final String notificationUri;
            private final String postId;

            public OpenDeeplinkFromPushNotification(String str, String str2, String str3, String str4) {
                b09.I(str, str2, str3);
                this.deeplink = str;
                this.notificationType = str2;
                this.notificationUri = str3;
                this.postId = str4;
            }

            public static /* synthetic */ OpenDeeplinkFromPushNotification copy$default(OpenDeeplinkFromPushNotification openDeeplinkFromPushNotification, String str, String str2, String str3, String str4, int i, Object obj) {
                if ((i & 1) != 0) {
                    str = openDeeplinkFromPushNotification.deeplink;
                }
                if ((i & 2) != 0) {
                    str2 = openDeeplinkFromPushNotification.notificationType;
                }
                if ((i & 4) != 0) {
                    str3 = openDeeplinkFromPushNotification.notificationUri;
                }
                if ((i & 8) != 0) {
                    str4 = openDeeplinkFromPushNotification.postId;
                }
                return openDeeplinkFromPushNotification.copy(str, str2, str3, str4);
            }

            /* JADX INFO: renamed from: component1, reason: from getter */
            public final String getDeeplink() {
                return this.deeplink;
            }

            /* JADX INFO: renamed from: component2, reason: from getter */
            public final String getNotificationType() {
                return this.notificationType;
            }

            /* JADX INFO: renamed from: component3, reason: from getter */
            public final String getNotificationUri() {
                return this.notificationUri;
            }

            /* JADX INFO: renamed from: component4, reason: from getter */
            public final String getPostId() {
                return this.postId;
            }

            public final OpenDeeplinkFromPushNotification copy(String deeplink, String notificationType, String notificationUri, String postId) {
                deeplink.getClass();
                notificationType.getClass();
                notificationUri.getClass();
                return new OpenDeeplinkFromPushNotification(deeplink, notificationType, notificationUri, postId);
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof OpenDeeplinkFromPushNotification)) {
                    return false;
                }
                OpenDeeplinkFromPushNotification openDeeplinkFromPushNotification = (OpenDeeplinkFromPushNotification) other;
                return g76.L(this.deeplink, openDeeplinkFromPushNotification.deeplink) && g76.L(this.notificationType, openDeeplinkFromPushNotification.notificationType) && g76.L(this.notificationUri, openDeeplinkFromPushNotification.notificationUri) && g76.L(this.postId, openDeeplinkFromPushNotification.postId);
            }

            public final String getDeeplink() {
                return this.deeplink;
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

            public int hashCode() {
                int iO = wgd.o(wgd.o(this.deeplink.hashCode() * 31, 31, this.notificationType), 31, this.notificationUri);
                String str = this.postId;
                return iO + (str == null ? 0 : str.hashCode());
            }

            public String toString() {
                String str = this.deeplink;
                String str2 = this.notificationType;
                return km4.C(y30.u("OpenDeeplinkFromPushNotification(deeplink=", str, ", notificationType=", str2, ", notificationUri="), this.notificationUri, ", postId=", this.postId, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeString(this.deeplink);
                dest.writeString(this.notificationType);
                dest.writeString(this.notificationUri);
                dest.writeString(this.postId);
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenPostFromAudioControllerNotification;", "Lcom/medium/android/donkey/push/TrampolineActivity$Action;", "", "postId", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenPostFromAudioControllerNotification;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class OpenPostFromAudioControllerNotification implements Action {
            public static final int $stable = 0;
            public static final Parcelable.Creator<OpenPostFromAudioControllerNotification> CREATOR = new b();
            private final String postId;

            public OpenPostFromAudioControllerNotification(String str) {
                str.getClass();
                this.postId = str;
            }

            public static /* synthetic */ OpenPostFromAudioControllerNotification copy$default(OpenPostFromAudioControllerNotification openPostFromAudioControllerNotification, String str, int i, Object obj) {
                if ((i & 1) != 0) {
                    str = openPostFromAudioControllerNotification.postId;
                }
                return openPostFromAudioControllerNotification.copy(str);
            }

            /* JADX INFO: renamed from: component1, reason: from getter */
            public final String getPostId() {
                return this.postId;
            }

            public final OpenPostFromAudioControllerNotification copy(String postId) {
                postId.getClass();
                return new OpenPostFromAudioControllerNotification(postId);
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof OpenPostFromAudioControllerNotification) && g76.L(this.postId, ((OpenPostFromAudioControllerNotification) other).postId);
            }

            public final String getPostId() {
                return this.postId;
            }

            public int hashCode() {
                return this.postId.hashCode();
            }

            public String toString() {
                return ev6.x("OpenPostFromAudioControllerNotification(postId=", this.postId, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeString(this.postId);
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u0000\n\u0002\b\n\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\r\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ\u001d\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\n¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0014J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0014J\u0010\u0010\u0017\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J8\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001b\u0010\u0014J\u0010\u0010\u001c\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u001c\u0010\fJ\u001a\u0010\u001f\u001a\u00020\u00062\b\u0010\u001e\u001a\u0004\u0018\u00010\u001dHÖ\u0003¢\u0006\u0004\b\u001f\u0010 R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010!\u001a\u0004\b\"\u0010\u0014R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010!\u001a\u0004\b#\u0010\u0014R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010!\u001a\u0004\b$\u0010\u0014R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010%\u001a\u0004\b&\u0010\u0018¨\u0006'"}, d2 = {"Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenPostFromPushNotification;", "Lcom/medium/android/donkey/push/TrampolineActivity$Action;", "", "postId", "notificationType", "notificationUri", "", "reportPostId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Z", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/medium/android/donkey/push/TrampolineActivity$Action$OpenPostFromPushNotification;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getNotificationType", "getNotificationUri", "Z", "getReportPostId", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class OpenPostFromPushNotification implements Action {
            public static final int $stable = 0;
            public static final Parcelable.Creator<OpenPostFromPushNotification> CREATOR = new c();
            private final String notificationType;
            private final String notificationUri;
            private final String postId;
            private final boolean reportPostId;

            public OpenPostFromPushNotification(String str, String str2, String str3, boolean z) {
                b09.I(str, str2, str3);
                this.postId = str;
                this.notificationType = str2;
                this.notificationUri = str3;
                this.reportPostId = z;
            }

            public static /* synthetic */ OpenPostFromPushNotification copy$default(OpenPostFromPushNotification openPostFromPushNotification, String str, String str2, String str3, boolean z, int i, Object obj) {
                if ((i & 1) != 0) {
                    str = openPostFromPushNotification.postId;
                }
                if ((i & 2) != 0) {
                    str2 = openPostFromPushNotification.notificationType;
                }
                if ((i & 4) != 0) {
                    str3 = openPostFromPushNotification.notificationUri;
                }
                if ((i & 8) != 0) {
                    z = openPostFromPushNotification.reportPostId;
                }
                return openPostFromPushNotification.copy(str, str2, str3, z);
            }

            /* JADX INFO: renamed from: component1, reason: from getter */
            public final String getPostId() {
                return this.postId;
            }

            /* JADX INFO: renamed from: component2, reason: from getter */
            public final String getNotificationType() {
                return this.notificationType;
            }

            /* JADX INFO: renamed from: component3, reason: from getter */
            public final String getNotificationUri() {
                return this.notificationUri;
            }

            /* JADX INFO: renamed from: component4, reason: from getter */
            public final boolean getReportPostId() {
                return this.reportPostId;
            }

            public final OpenPostFromPushNotification copy(String postId, String notificationType, String notificationUri, boolean reportPostId) {
                postId.getClass();
                notificationType.getClass();
                notificationUri.getClass();
                return new OpenPostFromPushNotification(postId, notificationType, notificationUri, reportPostId);
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof OpenPostFromPushNotification)) {
                    return false;
                }
                OpenPostFromPushNotification openPostFromPushNotification = (OpenPostFromPushNotification) other;
                return g76.L(this.postId, openPostFromPushNotification.postId) && g76.L(this.notificationType, openPostFromPushNotification.notificationType) && g76.L(this.notificationUri, openPostFromPushNotification.notificationUri) && this.reportPostId == openPostFromPushNotification.reportPostId;
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

            public final boolean getReportPostId() {
                return this.reportPostId;
            }

            public int hashCode() {
                return wgd.o(wgd.o(this.postId.hashCode() * 31, 31, this.notificationType), 31, this.notificationUri) + (this.reportPostId ? 1231 : 1237);
            }

            public String toString() {
                String str = this.postId;
                String str2 = this.notificationType;
                String str3 = this.notificationUri;
                boolean z = this.reportPostId;
                StringBuilder sbU = y30.u("OpenPostFromPushNotification(postId=", str, ", notificationType=", str2, ", notificationUri=");
                sbU.append(str3);
                sbU.append(", reportPostId=");
                sbU.append(z);
                sbU.append(")");
                return sbU.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeString(this.postId);
                dest.writeString(this.notificationType);
                dest.writeString(this.notificationUri);
                dest.writeInt(this.reportPostId ? 1 : 0);
            }
        }
    }

    @Override // defpackage.qn5, defpackage.lv5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) throws PendingIntent.CanceledException {
        super.onCreate(bundle);
        if (bundle == null) {
            Intent intent = getIntent();
            intent.getClass();
            Action action = (Action) ((Parcelable) qb8.G(intent, "action", Action.class));
            if (action != null) {
                if (action instanceof Action.OpenDeeplinkFromPushNotification) {
                    s((Action.OpenDeeplinkFromPushNotification) action);
                    return;
                }
                if (!(action instanceof Action.OpenPostFromAudioControllerNotification)) {
                    if (!(action instanceof Action.OpenPostFromPushNotification)) {
                        ygf.a();
                        return;
                    }
                    if (this.j == null) {
                        g76.g0("mediumUris");
                        throw null;
                    }
                    Action.OpenPostFromPushNotification openPostFromPushNotification = (Action.OpenPostFromPushNotification) action;
                    String string = Uri.parse(i03.b).buildUpon().appendEncodedPath("p").appendEncodedPath(openPostFromPushNotification.getPostId()).build().toString();
                    string.getClass();
                    s(new Action.OpenDeeplinkFromPushNotification(string, openPostFromPushNotification.getNotificationType(), openPostFromPushNotification.getNotificationUri(), openPostFromPushNotification.getPostId()));
                    return;
                }
                Action.OpenPostFromAudioControllerNotification openPostFromAudioControllerNotification = (Action.OpenPostFromAudioControllerNotification) action;
                String strU = gp7.u(new SourceParameter("tts_notification", null, null, null, null, openPostFromAudioControllerNotification.getPostId(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null));
                w50 w50Var = this.u;
                if (w50Var == null) {
                    g76.g0("appLifecycleTracker");
                    throw null;
                }
                w50Var.a(strU);
                zk2 zk2Var = this.t;
                if (zk2Var == null) {
                    g76.g0("currentUserRepo");
                    throw null;
                }
                String strM = zk2Var.m();
                if (!tj2.a(strM)) {
                    strM = null;
                }
                p13 p13Var = this.q;
                if (strM != null) {
                    if (p13Var != null) {
                        b09.O(p13Var, this, openPostFromAudioControllerNotification.getPostId(), strU, null, null, null, 120);
                        return;
                    } else {
                        g76.g0("router");
                        throw null;
                    }
                }
                if (p13Var != null) {
                    p13Var.K(this, strU, new SusiDestination.Post(openPostFromAudioControllerNotification.getPostId()));
                } else {
                    g76.g0("router");
                    throw null;
                }
            }
        }
    }

    public final void s(Action.OpenDeeplinkFromPushNotification openDeeplinkFromPushNotification) {
        String strU = gp7.u(new SourceParameter("push_notification", null, null, null, null, openDeeplinkFromPushNotification.getPostId(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, openDeeplinkFromPushNotification.getNotificationType(), null, null, null, null, null, null, null, null, null, null, null, null, null, 2147483614, 8191, null));
        w50 w50Var = this.u;
        if (w50Var == null) {
            g76.g0("appLifecycleTracker");
            throw null;
        }
        w50Var.a(strU);
        yx2 yx2Var = this.s;
        if (yx2Var == null) {
            g76.g0("pushNotificationTracker");
            throw null;
        }
        String notificationType = openDeeplinkFromPushNotification.getNotificationType();
        String notificationUri = openDeeplinkFromPushNotification.getNotificationUri();
        String postId = openDeeplinkFromPushNotification.getPostId();
        notificationType.getClass();
        rqd.a(yx2Var.a, new NotificationContentOpened(null, notificationType, notificationUri, 1, postId, null, 33, null), "", strU, true, null, "push_notification", 16);
        zk2 zk2Var = this.t;
        if (zk2Var == null) {
            g76.g0("currentUserRepo");
            throw null;
        }
        String strM = zk2Var.m();
        if (!tj2.a(strM)) {
            strM = null;
        }
        if (strM == null) {
            p13 p13Var = this.q;
            if (p13Var != null) {
                p13Var.K(this, strU, new SusiDestination.Deeplink(openDeeplinkFromPushNotification.getDeeplink()));
                return;
            } else {
                g76.g0("router");
                throw null;
            }
        }
        py2 py2Var = this.r;
        if (py2Var == null) {
            g76.g0("deepLinkHandler");
            throw null;
        }
        Uri uri = Uri.parse(openDeeplinkFromPushNotification.getDeeplink());
        uri.getClass();
        py2Var.a(this, uri, strU, null);
    }
}
