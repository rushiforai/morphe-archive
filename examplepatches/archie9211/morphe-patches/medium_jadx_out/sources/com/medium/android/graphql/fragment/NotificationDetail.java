package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001:\u0001%B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0018\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\rJ\u0010\u0010\u0011\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J@\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0015\u0010\rJ\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010\rR\u001f\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010 \u001a\u0004\b!\u0010\u000fR\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001e\u001a\u0004\b\"\u0010\rR\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010#\u001a\u0004\b$\u0010\u0012¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDetail;", "Lg15;", "", "__typename", "", "Lcom/medium/android/graphql/fragment/NotificationDetail$RollupItem;", "rollupItems", "notificationName", "Lcom/medium/android/graphql/fragment/NotificationData;", "notificationData", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData;)V", "component1", "()Ljava/lang/String;", "component2", "()Ljava/util/List;", "component3", "component4", "()Lcom/medium/android/graphql/fragment/NotificationData;", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData;)Lcom/medium/android/graphql/fragment/NotificationDetail;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Ljava/util/List;", "getRollupItems", "getNotificationName", "Lcom/medium/android/graphql/fragment/NotificationData;", "getNotificationData", "RollupItem", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class NotificationDetail implements g15 {
    private final String __typename;
    private final NotificationData notificationData;
    private final String notificationName;
    private final List<RollupItem> rollupItems;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDetail$RollupItem;", "", "__typename", "", "notificationName", "notificationData", "Lcom/medium/android/graphql/fragment/NotificationData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData;)V", "get__typename", "()Ljava/lang/String;", "getNotificationName", "getNotificationData", "()Lcom/medium/android/graphql/fragment/NotificationData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RollupItem {
        private final String __typename;
        private final NotificationData notificationData;
        private final String notificationName;

        public RollupItem(String str, String str2, NotificationData notificationData) {
            str.getClass();
            str2.getClass();
            notificationData.getClass();
            this.__typename = str;
            this.notificationName = str2;
            this.notificationData = notificationData;
        }

        public static /* synthetic */ RollupItem copy$default(RollupItem rollupItem, String str, String str2, NotificationData notificationData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = rollupItem.__typename;
            }
            if ((i & 2) != 0) {
                str2 = rollupItem.notificationName;
            }
            if ((i & 4) != 0) {
                notificationData = rollupItem.notificationData;
            }
            return rollupItem.copy(str, str2, notificationData);
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
        public final NotificationData getNotificationData() {
            return this.notificationData;
        }

        public final RollupItem copy(String __typename, String notificationName, NotificationData notificationData) {
            __typename.getClass();
            notificationName.getClass();
            notificationData.getClass();
            return new RollupItem(__typename, notificationName, notificationData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RollupItem)) {
                return false;
            }
            RollupItem rollupItem = (RollupItem) other;
            return g76.L(this.__typename, rollupItem.__typename) && g76.L(this.notificationName, rollupItem.notificationName) && g76.L(this.notificationData, rollupItem.notificationData);
        }

        public final NotificationData getNotificationData() {
            return this.notificationData;
        }

        public final String getNotificationName() {
            return this.notificationName;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.notificationData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.notificationName);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.notificationName;
            NotificationData notificationData = this.notificationData;
            StringBuilder sbU = y30.u("RollupItem(__typename=", str, ", notificationName=", str2, ", notificationData=");
            sbU.append(notificationData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public NotificationDetail(String str, List<RollupItem> list, String str2, NotificationData notificationData) {
        str.getClass();
        str2.getClass();
        notificationData.getClass();
        this.__typename = str;
        this.rollupItems = list;
        this.notificationName = str2;
        this.notificationData = notificationData;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ NotificationDetail copy$default(NotificationDetail notificationDetail, String str, List list, String str2, NotificationData notificationData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = notificationDetail.__typename;
        }
        if ((i & 2) != 0) {
            list = notificationDetail.rollupItems;
        }
        if ((i & 4) != 0) {
            str2 = notificationDetail.notificationName;
        }
        if ((i & 8) != 0) {
            notificationData = notificationDetail.notificationData;
        }
        return notificationDetail.copy(str, list, str2, notificationData);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    public final List<RollupItem> component2() {
        return this.rollupItems;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getNotificationName() {
        return this.notificationName;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final NotificationData getNotificationData() {
        return this.notificationData;
    }

    public final NotificationDetail copy(String __typename, List<RollupItem> rollupItems, String notificationName, NotificationData notificationData) {
        __typename.getClass();
        notificationName.getClass();
        notificationData.getClass();
        return new NotificationDetail(__typename, rollupItems, notificationName, notificationData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof NotificationDetail)) {
            return false;
        }
        NotificationDetail notificationDetail = (NotificationDetail) other;
        return g76.L(this.__typename, notificationDetail.__typename) && g76.L(this.rollupItems, notificationDetail.rollupItems) && g76.L(this.notificationName, notificationDetail.notificationName) && g76.L(this.notificationData, notificationDetail.notificationData);
    }

    public final NotificationData getNotificationData() {
        return this.notificationData;
    }

    public final String getNotificationName() {
        return this.notificationName;
    }

    public final List<RollupItem> getRollupItems() {
        return this.rollupItems;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        List<RollupItem> list = this.rollupItems;
        return this.notificationData.hashCode() + wgd.o((iHashCode + (list == null ? 0 : list.hashCode())) * 31, 31, this.notificationName);
    }

    public final String toString() {
        String str = this.__typename;
        List<RollupItem> list = this.rollupItems;
        String str2 = this.notificationName;
        NotificationData notificationData = this.notificationData;
        StringBuilder sbE = b09.E("NotificationDetail(__typename=", str, ", rollupItems=", ", notificationName=", list);
        sbE.append(str2);
        sbE.append(", notificationData=");
        sbE.append(notificationData);
        sbE.append(")");
        return sbE.toString();
    }
}
