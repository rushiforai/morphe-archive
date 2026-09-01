package com.medium.android.graphql;

import com.medium.android.graphql.adapter.NotificationsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.NotificationsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.NotificationDetail;
import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.selections.NotificationsQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006/0123.B1\u0012\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00040\u0003\u0012\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0003¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\r\u0010\fJ\u000f\u0010\u000e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000e\u0010\fJ'\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u001e\u0010\u001e\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00040\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0018\u0010 \u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0003HÆ\u0003¢\u0006\u0004\b \u0010\u001fJ:\u0010!\u001a\u00020\u00002\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00040\u00032\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0003HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b#\u0010\fJ\u0010\u0010%\u001a\u00020$HÖ\u0001¢\u0006\u0004\b%\u0010&J\u001a\u0010)\u001a\u00020\u00132\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R%\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00040\u00038\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001fR\u001f\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00038\u0006¢\u0006\f\n\u0004\b\b\u0010+\u001a\u0004\b-\u0010\u001f¨\u00064"}, d2 = {"Lcom/medium/android/graphql/NotificationsQuery;", "Luqa;", "Lcom/medium/android/graphql/NotificationsQuery$Data;", "Lzv8;", "", "", "activityTypes", "Lcom/medium/android/graphql/type/PagingOptions;", "pagingInfo", "<init>", "(Lzv8;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lzv8;", "component2", "copy", "(Lzv8;Lzv8;)Lcom/medium/android/graphql/NotificationsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getActivityTypes", "getPagingInfo", "Companion", "Data", "NotificationsConnectionByActivityTypes", "Notification", "PagingInfo", "Next", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class NotificationsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d1963d00cbab02a1409719a068d356e2f04ff22e6b1f9ebf5352959b3489cea4";
    public static final String OPERATION_NAME = "NotificationsQuery";
    private final zv8 activityTypes;
    private final zv8 pagingInfo;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/NotificationsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/NotificationsQuery$NotificationsConnectionByActivityTypes;", "notificationsConnectionByActivityTypes", "<init>", "(Lcom/medium/android/graphql/NotificationsQuery$NotificationsConnectionByActivityTypes;)V", "component1", "()Lcom/medium/android/graphql/NotificationsQuery$NotificationsConnectionByActivityTypes;", "copy", "(Lcom/medium/android/graphql/NotificationsQuery$NotificationsConnectionByActivityTypes;)Lcom/medium/android/graphql/NotificationsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/NotificationsQuery$NotificationsConnectionByActivityTypes;", "getNotificationsConnectionByActivityTypes", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final NotificationsConnectionByActivityTypes notificationsConnectionByActivityTypes;

        public Data(NotificationsConnectionByActivityTypes notificationsConnectionByActivityTypes) {
            this.notificationsConnectionByActivityTypes = notificationsConnectionByActivityTypes;
        }

        public static Data copy$default(Data data, NotificationsConnectionByActivityTypes notificationsConnectionByActivityTypes, int i, Object obj) {
            if ((i & 1) != 0) {
                notificationsConnectionByActivityTypes = data.notificationsConnectionByActivityTypes;
            }
            data.getClass();
            return new Data(notificationsConnectionByActivityTypes);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final NotificationsConnectionByActivityTypes getNotificationsConnectionByActivityTypes() {
            return this.notificationsConnectionByActivityTypes;
        }

        public final Data copy(NotificationsConnectionByActivityTypes notificationsConnectionByActivityTypes) {
            return new Data(notificationsConnectionByActivityTypes);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.notificationsConnectionByActivityTypes, ((Data) other).notificationsConnectionByActivityTypes);
        }

        public final NotificationsConnectionByActivityTypes getNotificationsConnectionByActivityTypes() {
            return this.notificationsConnectionByActivityTypes;
        }

        public final int hashCode() {
            NotificationsConnectionByActivityTypes notificationsConnectionByActivityTypes = this.notificationsConnectionByActivityTypes;
            if (notificationsConnectionByActivityTypes == null) {
                return 0;
            }
            return notificationsConnectionByActivityTypes.hashCode();
        }

        public final String toString() {
            return "Data(notificationsConnectionByActivityTypes=" + this.notificationsConnectionByActivityTypes + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/NotificationsQuery$Next;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Next {
        private final String __typename;
        private final PagingParamsData pagingParamsData;

        public Next(String str, PagingParamsData pagingParamsData) {
            str.getClass();
            pagingParamsData.getClass();
            this.__typename = str;
            this.pagingParamsData = pagingParamsData;
        }

        public static /* synthetic */ Next copy$default(Next next, String str, PagingParamsData pagingParamsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = next.__typename;
            }
            if ((i & 2) != 0) {
                pagingParamsData = next.pagingParamsData;
            }
            return next.copy(str, pagingParamsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final Next copy(String __typename, PagingParamsData pagingParamsData) {
            __typename.getClass();
            pagingParamsData.getClass();
            return new Next(__typename, pagingParamsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Next)) {
                return false;
            }
            Next next = (Next) other;
            return g76.L(this.__typename, next.__typename) && g76.L(this.pagingParamsData, next.pagingParamsData);
        }

        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pagingParamsData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return lv8.q("Next(__typename=", this.__typename, ", pagingParamsData=", this.pagingParamsData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/NotificationsQuery$Notification;", "", "__typename", "", "notificationName", "notificationDetail", "Lcom/medium/android/graphql/fragment/NotificationDetail;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationDetail;)V", "get__typename", "()Ljava/lang/String;", "getNotificationName", "getNotificationDetail", "()Lcom/medium/android/graphql/fragment/NotificationDetail;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Notification {
        private final String __typename;
        private final NotificationDetail notificationDetail;
        private final String notificationName;

        public Notification(String str, String str2, NotificationDetail notificationDetail) {
            str.getClass();
            str2.getClass();
            notificationDetail.getClass();
            this.__typename = str;
            this.notificationName = str2;
            this.notificationDetail = notificationDetail;
        }

        public static /* synthetic */ Notification copy$default(Notification notification, String str, String str2, NotificationDetail notificationDetail, int i, Object obj) {
            if ((i & 1) != 0) {
                str = notification.__typename;
            }
            if ((i & 2) != 0) {
                str2 = notification.notificationName;
            }
            if ((i & 4) != 0) {
                notificationDetail = notification.notificationDetail;
            }
            return notification.copy(str, str2, notificationDetail);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getNotificationName() {
            return this.notificationName;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final NotificationDetail getNotificationDetail() {
            return this.notificationDetail;
        }

        public final Notification copy(String __typename, String notificationName, NotificationDetail notificationDetail) {
            __typename.getClass();
            notificationName.getClass();
            notificationDetail.getClass();
            return new Notification(__typename, notificationName, notificationDetail);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Notification)) {
                return false;
            }
            Notification notification = (Notification) other;
            return g76.L(this.__typename, notification.__typename) && g76.L(this.notificationName, notification.notificationName) && g76.L(this.notificationDetail, notification.notificationDetail);
        }

        public final NotificationDetail getNotificationDetail() {
            return this.notificationDetail;
        }

        public final String getNotificationName() {
            return this.notificationName;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.notificationDetail.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.notificationName);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.notificationName;
            NotificationDetail notificationDetail = this.notificationDetail;
            StringBuilder sbU = y30.u("Notification(__typename=", str, ", notificationName=", str2, ", notificationDetail=");
            sbU.append(notificationDetail);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\bHÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/NotificationsQuery$NotificationsConnectionByActivityTypes;", "", "__typename", "", "notifications", "", "Lcom/medium/android/graphql/NotificationsQuery$Notification;", "pagingInfo", "Lcom/medium/android/graphql/NotificationsQuery$PagingInfo;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/NotificationsQuery$PagingInfo;)V", "get__typename", "()Ljava/lang/String;", "getNotifications", "()Ljava/util/List;", "getPagingInfo", "()Lcom/medium/android/graphql/NotificationsQuery$PagingInfo;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class NotificationsConnectionByActivityTypes {
        private final String __typename;
        private final List<Notification> notifications;
        private final PagingInfo pagingInfo;

        public NotificationsConnectionByActivityTypes(String str, List<Notification> list, PagingInfo pagingInfo) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.notifications = list;
            this.pagingInfo = pagingInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ NotificationsConnectionByActivityTypes copy$default(NotificationsConnectionByActivityTypes notificationsConnectionByActivityTypes, String str, List list, PagingInfo pagingInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                str = notificationsConnectionByActivityTypes.__typename;
            }
            if ((i & 2) != 0) {
                list = notificationsConnectionByActivityTypes.notifications;
            }
            if ((i & 4) != 0) {
                pagingInfo = notificationsConnectionByActivityTypes.pagingInfo;
            }
            return notificationsConnectionByActivityTypes.copy(str, list, pagingInfo);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Notification> component2() {
            return this.notifications;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final NotificationsConnectionByActivityTypes copy(String __typename, List<Notification> notifications, PagingInfo pagingInfo) {
            __typename.getClass();
            notifications.getClass();
            return new NotificationsConnectionByActivityTypes(__typename, notifications, pagingInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof NotificationsConnectionByActivityTypes)) {
                return false;
            }
            NotificationsConnectionByActivityTypes notificationsConnectionByActivityTypes = (NotificationsConnectionByActivityTypes) other;
            return g76.L(this.__typename, notificationsConnectionByActivityTypes.__typename) && g76.L(this.notifications, notificationsConnectionByActivityTypes.notifications) && g76.L(this.pagingInfo, notificationsConnectionByActivityTypes.pagingInfo);
        }

        public final List<Notification> getNotifications() {
            return this.notifications;
        }

        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iP = wgd.p(this.__typename.hashCode() * 31, 31, this.notifications);
            PagingInfo pagingInfo = this.pagingInfo;
            return iP + (pagingInfo == null ? 0 : pagingInfo.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            List<Notification> list = this.notifications;
            PagingInfo pagingInfo = this.pagingInfo;
            StringBuilder sbE = b09.E("NotificationsConnectionByActivityTypes(__typename=", str, ", notifications=", ", pagingInfo=", list);
            sbE.append(pagingInfo);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/NotificationsQuery$PagingInfo;", "", "__typename", "", "next", "Lcom/medium/android/graphql/NotificationsQuery$Next;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/NotificationsQuery$Next;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/NotificationsQuery$Next;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PagingInfo {
        private final String __typename;
        private final Next next;

        public PagingInfo(String str, Next next) {
            str.getClass();
            this.__typename = str;
            this.next = next;
        }

        public static /* synthetic */ PagingInfo copy$default(PagingInfo pagingInfo, String str, Next next, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pagingInfo.__typename;
            }
            if ((i & 2) != 0) {
                next = pagingInfo.next;
            }
            return pagingInfo.copy(str, next);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Next getNext() {
            return this.next;
        }

        public final PagingInfo copy(String __typename, Next next) {
            __typename.getClass();
            return new PagingInfo(__typename, next);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PagingInfo)) {
                return false;
            }
            PagingInfo pagingInfo = (PagingInfo) other;
            return g76.L(this.__typename, pagingInfo.__typename) && g76.L(this.next, pagingInfo.next);
        }

        public final Next getNext() {
            return this.next;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Next next = this.next;
            return iHashCode + (next == null ? 0 : next.hashCode());
        }

        public final String toString() {
            return "PagingInfo(__typename=" + this.__typename + ", next=" + this.next + ")";
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ NotificationsQuery(zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2);
    }

    public static /* synthetic */ NotificationsQuery copy$default(NotificationsQuery notificationsQuery, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = notificationsQuery.activityTypes;
        }
        if ((i & 2) != 0) {
            zv8Var2 = notificationsQuery.pagingInfo;
        }
        return notificationsQuery.copy(zv8Var, zv8Var2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(NotificationsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getActivityTypes() {
        return this.activityTypes;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPagingInfo() {
        return this.pagingInfo;
    }

    public final NotificationsQuery copy(zv8 activityTypes, zv8 pagingInfo) {
        activityTypes.getClass();
        pagingInfo.getClass();
        return new NotificationsQuery(activityTypes, pagingInfo);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query NotificationsQuery($activityTypes: [String!], $pagingInfo: PagingOptions) { notificationsConnectionByActivityTypes(activityTypes: $activityTypes, paging: $pagingInfo) { __typename notifications { __typename ...NotificationDetail notificationName } pagingInfo { __typename next { __typename ...PagingParamsData } } } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment NotificationData on Notification { __typename notificationName notificationType isUnread occurredAt milestoneArg post { __typename id title creator { __typename id imageId } } responsePost { __typename id content { __typename bodyModel { __typename paragraphs { __typename id text markups { __typename type start end } } } } } quote { __typename ...HighlightData id } actor { __typename id imageId name bio ...UserFollowData newsletterV3 { __typename ...NewsletterData id } } catalog { __typename id name predefined creator { __typename id name imageId } } collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } } rollupItems { __typename notificationName } }  fragment NotificationDetail on Notification { __typename ...NotificationData rollupItems { __typename ...NotificationData notificationName } notificationName }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof NotificationsQuery)) {
            return false;
        }
        NotificationsQuery notificationsQuery = (NotificationsQuery) other;
        return g76.L(this.activityTypes, notificationsQuery.activityTypes) && g76.L(this.pagingInfo, notificationsQuery.pagingInfo);
    }

    public final zv8 getActivityTypes() {
        return this.activityTypes;
    }

    public final zv8 getPagingInfo() {
        return this.pagingInfo;
    }

    public final int hashCode() {
        return this.pagingInfo.hashCode() + (this.activityTypes.hashCode() * 31);
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = NotificationsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        NotificationsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "NotificationsQuery(activityTypes=" + this.activityTypes + ", pagingInfo=" + this.pagingInfo + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/NotificationsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query NotificationsQuery($activityTypes: [String!], $pagingInfo: PagingOptions) { notificationsConnectionByActivityTypes(activityTypes: $activityTypes, paging: $pagingInfo) { __typename notifications { __typename ...NotificationDetail notificationName } pagingInfo { __typename next { __typename ...PagingParamsData } } } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment NotificationData on Notification { __typename notificationName notificationType isUnread occurredAt milestoneArg post { __typename id title creator { __typename id imageId } } responsePost { __typename id content { __typename bodyModel { __typename paragraphs { __typename id text markups { __typename type start end } } } } } quote { __typename ...HighlightData id } actor { __typename id imageId name bio ...UserFollowData newsletterV3 { __typename ...NewsletterData id } } catalog { __typename id name predefined creator { __typename id name imageId } } collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } } rollupItems { __typename notificationName } }  fragment NotificationDetail on Notification { __typename ...NotificationData rollupItems { __typename ...NotificationData notificationName } notificationName }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public NotificationsQuery(zv8 zv8Var, zv8 zv8Var2) {
        zv8Var.getClass();
        zv8Var2.getClass();
        this.activityTypes = zv8Var;
        this.pagingInfo = zv8Var2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public NotificationsQuery() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }
}
