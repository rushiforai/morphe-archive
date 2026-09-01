package com.medium.android.graphql;

import com.medium.android.graphql.adapter.MembershipStatusQuery_ResponseAdapter;
import com.medium.android.graphql.selections.MembershipStatusQuerySelections;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.PaymentProvider;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\u0018\u0000  2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006!\"#$% B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u001a\u0010\b\u001a\u00020\u00072\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0096\u0002¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\u000e\u001a\u00020\rH\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\rH\u0016¢\u0006\u0004\b\u0010\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\rH\u0016¢\u0006\u0004\b\u0011\u0010\u000fJ'\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0015\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001f¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/MembershipStatusQuery;", "Luqa;", "Lcom/medium/android/graphql/MembershipStatusQuery$Data;", "<init>", "()V", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "Companion", "Data", "Viewer", "ViewerEdge", "Membership", "MobilePlan", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MembershipStatusQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "59b792ccc8f9c6ba563f5339bf7922e61e37bc26378967322b88d47f41765ac3";
    public static final String OPERATION_NAME = "MembershipStatusQuery";

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/MembershipStatusQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;", "viewer", "<init>", "(Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;)V", "component1", "()Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;", "copy", "(Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;)Lcom/medium/android/graphql/MembershipStatusQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;", "getViewer", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Viewer viewer;

        public Data(Viewer viewer) {
            this.viewer = viewer;
        }

        public static Data copy$default(Data data, Viewer viewer, int i, Object obj) {
            if ((i & 1) != 0) {
                viewer = data.viewer;
            }
            data.getClass();
            return new Data(viewer);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Viewer getViewer() {
            return this.viewer;
        }

        public final Data copy(Viewer viewer) {
            return new Data(viewer);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.viewer, ((Data) other).viewer);
        }

        public final Viewer getViewer() {
            return this.viewer;
        }

        public final int hashCode() {
            Viewer viewer = this.viewer;
            if (viewer == null) {
                return 0;
            }
            return viewer.hashCode();
        }

        public final String toString() {
            return "Data(viewer=" + this.viewer + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b!\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B]\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\u0003\u0012\u0006\u0010\r\u001a\u00020\u0007\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u000f\u001a\u00020\u0005\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\u0004\b\u0012\u0010\u0013J\t\u0010$\u001a\u00020\u0003HÆ\u0003J\t\u0010%\u001a\u00020\u0005HÆ\u0003J\u0010\u0010&\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0018J\t\u0010'\u001a\u00020\tHÆ\u0003J\t\u0010(\u001a\u00020\u000bHÆ\u0003J\t\u0010)\u001a\u00020\u0003HÆ\u0003J\t\u0010*\u001a\u00020\u0007HÆ\u0003J\u000b\u0010+\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010,\u001a\u00020\u0005HÆ\u0003J\u000b\u0010-\u001a\u0004\u0018\u00010\u0011HÆ\u0003Jx\u0010.\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\u00032\b\b\u0002\u0010\r\u001a\u00020\u00072\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u000f\u001a\u00020\u00052\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0011HÆ\u0001¢\u0006\u0002\u0010/J\u0013\u00100\u001a\u00020\u00052\b\u00101\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00102\u001a\u000203HÖ\u0001J\t\u00104\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u0016R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0019\u001a\u0004\b\u0017\u0010\u0018R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\f\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0015R\u0011\u0010\r\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u0015R\u0011\u0010\u000f\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0016R\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#¨\u00065"}, d2 = {"Lcom/medium/android/graphql/MembershipStatusQuery$Membership;", "", "__typename", "", "isCancelled", "", "expiresAt", "", "paymentProvider", "Lcom/medium/android/graphql/type/PaymentProvider;", "membershipProductType", "Lcom/medium/android/graphql/type/MembershipType;", "membershipId", "startedAt", "membershipPlanId", "isGrantedPremium", "mobilePlan", "Lcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;", "<init>", "(Ljava/lang/String;ZLjava/lang/Long;Lcom/medium/android/graphql/type/PaymentProvider;Lcom/medium/android/graphql/type/MembershipType;Ljava/lang/String;JLjava/lang/String;ZLcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getExpiresAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getPaymentProvider", "()Lcom/medium/android/graphql/type/PaymentProvider;", "getMembershipProductType", "()Lcom/medium/android/graphql/type/MembershipType;", "getMembershipId", "getStartedAt", "()J", "getMembershipPlanId", "getMobilePlan", "()Lcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "copy", "(Ljava/lang/String;ZLjava/lang/Long;Lcom/medium/android/graphql/type/PaymentProvider;Lcom/medium/android/graphql/type/MembershipType;Ljava/lang/String;JLjava/lang/String;ZLcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;)Lcom/medium/android/graphql/MembershipStatusQuery$Membership;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Membership {
        private final String __typename;
        private final Long expiresAt;
        private final boolean isCancelled;
        private final boolean isGrantedPremium;
        private final String membershipId;
        private final String membershipPlanId;
        private final MembershipType membershipProductType;
        private final MobilePlan mobilePlan;
        private final PaymentProvider paymentProvider;
        private final long startedAt;

        public Membership(String str, boolean z, Long l, PaymentProvider paymentProvider, MembershipType membershipType, String str2, long j, String str3, boolean z2, MobilePlan mobilePlan) {
            str.getClass();
            paymentProvider.getClass();
            membershipType.getClass();
            str2.getClass();
            this.__typename = str;
            this.isCancelled = z;
            this.expiresAt = l;
            this.paymentProvider = paymentProvider;
            this.membershipProductType = membershipType;
            this.membershipId = str2;
            this.startedAt = j;
            this.membershipPlanId = str3;
            this.isGrantedPremium = z2;
            this.mobilePlan = mobilePlan;
        }

        public static /* synthetic */ Membership copy$default(Membership membership, String str, boolean z, Long l, PaymentProvider paymentProvider, MembershipType membershipType, String str2, long j, String str3, boolean z2, MobilePlan mobilePlan, int i, Object obj) {
            if ((i & 1) != 0) {
                str = membership.__typename;
            }
            if ((i & 2) != 0) {
                z = membership.isCancelled;
            }
            if ((i & 4) != 0) {
                l = membership.expiresAt;
            }
            if ((i & 8) != 0) {
                paymentProvider = membership.paymentProvider;
            }
            if ((i & 16) != 0) {
                membershipType = membership.membershipProductType;
            }
            if ((i & 32) != 0) {
                str2 = membership.membershipId;
            }
            if ((i & 64) != 0) {
                j = membership.startedAt;
            }
            if ((i & 128) != 0) {
                str3 = membership.membershipPlanId;
            }
            if ((i & 256) != 0) {
                z2 = membership.isGrantedPremium;
            }
            if ((i & 512) != 0) {
                mobilePlan = membership.mobilePlan;
            }
            MobilePlan mobilePlan2 = mobilePlan;
            String str4 = str3;
            long j2 = j;
            MembershipType membershipType2 = membershipType;
            String str5 = str2;
            Long l2 = l;
            PaymentProvider paymentProvider2 = paymentProvider;
            return membership.copy(str, z, l2, paymentProvider2, membershipType2, str5, j2, str4, z2, mobilePlan2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component10, reason: from getter */
        public final MobilePlan getMobilePlan() {
            return this.mobilePlan;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsCancelled() {
            return this.isCancelled;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Long getExpiresAt() {
            return this.expiresAt;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PaymentProvider getPaymentProvider() {
            return this.paymentProvider;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final MembershipType getMembershipProductType() {
            return this.membershipProductType;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final String getMembershipId() {
            return this.membershipId;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final long getStartedAt() {
            return this.startedAt;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final String getMembershipPlanId() {
            return this.membershipPlanId;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final boolean getIsGrantedPremium() {
            return this.isGrantedPremium;
        }

        public final Membership copy(String __typename, boolean isCancelled, Long expiresAt, PaymentProvider paymentProvider, MembershipType membershipProductType, String membershipId, long startedAt, String membershipPlanId, boolean isGrantedPremium, MobilePlan mobilePlan) {
            __typename.getClass();
            paymentProvider.getClass();
            membershipProductType.getClass();
            membershipId.getClass();
            return new Membership(__typename, isCancelled, expiresAt, paymentProvider, membershipProductType, membershipId, startedAt, membershipPlanId, isGrantedPremium, mobilePlan);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Membership)) {
                return false;
            }
            Membership membership = (Membership) other;
            return g76.L(this.__typename, membership.__typename) && this.isCancelled == membership.isCancelled && g76.L(this.expiresAt, membership.expiresAt) && this.paymentProvider == membership.paymentProvider && this.membershipProductType == membership.membershipProductType && g76.L(this.membershipId, membership.membershipId) && this.startedAt == membership.startedAt && g76.L(this.membershipPlanId, membership.membershipPlanId) && this.isGrantedPremium == membership.isGrantedPremium && g76.L(this.mobilePlan, membership.mobilePlan);
        }

        public final Long getExpiresAt() {
            return this.expiresAt;
        }

        public final String getMembershipId() {
            return this.membershipId;
        }

        public final String getMembershipPlanId() {
            return this.membershipPlanId;
        }

        public final MembershipType getMembershipProductType() {
            return this.membershipProductType;
        }

        public final MobilePlan getMobilePlan() {
            return this.mobilePlan;
        }

        public final PaymentProvider getPaymentProvider() {
            return this.paymentProvider;
        }

        public final long getStartedAt() {
            return this.startedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = ((this.__typename.hashCode() * 31) + (this.isCancelled ? 1231 : 1237)) * 31;
            Long l = this.expiresAt;
            int iO = wgd.o((this.membershipProductType.hashCode() + ((this.paymentProvider.hashCode() + ((iHashCode + (l == null ? 0 : l.hashCode())) * 31)) * 31)) * 31, 31, this.membershipId);
            long j = this.startedAt;
            int i = (iO + ((int) (j ^ (j >>> 32)))) * 31;
            String str = this.membershipPlanId;
            int iHashCode2 = (((i + (str == null ? 0 : str.hashCode())) * 31) + (this.isGrantedPremium ? 1231 : 1237)) * 31;
            MobilePlan mobilePlan = this.mobilePlan;
            return iHashCode2 + (mobilePlan != null ? mobilePlan.hashCode() : 0);
        }

        public final boolean isCancelled() {
            return this.isCancelled;
        }

        public final boolean isGrantedPremium() {
            return this.isGrantedPremium;
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.isCancelled;
            Long l = this.expiresAt;
            PaymentProvider paymentProvider = this.paymentProvider;
            MembershipType membershipType = this.membershipProductType;
            String str2 = this.membershipId;
            long j = this.startedAt;
            String str3 = this.membershipPlanId;
            boolean z2 = this.isGrantedPremium;
            MobilePlan mobilePlan = this.mobilePlan;
            StringBuilder sbD = ev6.D("Membership(__typename=", str, ", isCancelled=", ", expiresAt=", z);
            sbD.append(l);
            sbD.append(", paymentProvider=");
            sbD.append(paymentProvider);
            sbD.append(", membershipProductType=");
            sbD.append(membershipType);
            sbD.append(", membershipId=");
            sbD.append(str2);
            sbD.append(", startedAt=");
            sbD.append(j);
            sbD.append(", membershipPlanId=");
            sbD.append(str3);
            sbD.append(", isGrantedPremium=");
            sbD.append(z2);
            sbD.append(", mobilePlan=");
            sbD.append(mobilePlan);
            sbD.append(")");
            return sbD.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;", "", "__typename", "", "productId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getProductId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MobilePlan {
        private final String __typename;
        private final String productId;

        public MobilePlan(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.productId = str2;
        }

        public static /* synthetic */ MobilePlan copy$default(MobilePlan mobilePlan, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mobilePlan.__typename;
            }
            if ((i & 2) != 0) {
                str2 = mobilePlan.productId;
            }
            return mobilePlan.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getProductId() {
            return this.productId;
        }

        public final MobilePlan copy(String __typename, String productId) {
            __typename.getClass();
            productId.getClass();
            return new MobilePlan(__typename, productId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MobilePlan)) {
                return false;
            }
            MobilePlan mobilePlan = (MobilePlan) other;
            return g76.L(this.__typename, mobilePlan.__typename) && g76.L(this.productId, mobilePlan.productId);
        }

        public final String getProductId() {
            return this.productId;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.productId.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("MobilePlan(__typename=", this.__typename, ", productId=", this.productId, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;", "", "__typename", "", "viewerEdge", "Lcom/medium/android/graphql/MembershipStatusQuery$ViewerEdge;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/MembershipStatusQuery$ViewerEdge;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getViewerEdge", "()Lcom/medium/android/graphql/MembershipStatusQuery$ViewerEdge;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Viewer {
        private final String __typename;
        private final String id;
        private final ViewerEdge viewerEdge;

        public Viewer(String str, ViewerEdge viewerEdge, String str2) {
            str.getClass();
            viewerEdge.getClass();
            str2.getClass();
            this.__typename = str;
            this.viewerEdge = viewerEdge;
            this.id = str2;
        }

        public static /* synthetic */ Viewer copy$default(Viewer viewer, String str, ViewerEdge viewerEdge, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewer.__typename;
            }
            if ((i & 2) != 0) {
                viewerEdge = viewer.viewerEdge;
            }
            if ((i & 4) != 0) {
                str2 = viewer.id;
            }
            return viewer.copy(str, viewerEdge, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Viewer copy(String __typename, ViewerEdge viewerEdge, String id) {
            __typename.getClass();
            viewerEdge.getClass();
            id.getClass();
            return new Viewer(__typename, viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Viewer)) {
                return false;
            }
            Viewer viewer = (Viewer) other;
            return g76.L(this.__typename, viewer.__typename) && g76.L(this.viewerEdge, viewer.viewerEdge) && g76.L(this.id, viewer.id);
        }

        public final String getId() {
            return this.id;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.viewerEdge.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            ViewerEdge viewerEdge = this.viewerEdge;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Viewer(__typename=");
            sb.append(str);
            sb.append(", viewerEdge=");
            sb.append(viewerEdge);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/MembershipStatusQuery$ViewerEdge;", "", "__typename", "", "membership", "Lcom/medium/android/graphql/MembershipStatusQuery$Membership;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/MembershipStatusQuery$Membership;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMembership", "()Lcom/medium/android/graphql/MembershipStatusQuery$Membership;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final Membership membership;

        public ViewerEdge(String str, Membership membership, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.membership = membership;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, Membership membership, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                membership = viewerEdge.membership;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, membership, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Membership getMembership() {
            return this.membership;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, Membership membership, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, membership, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.membership, viewerEdge.membership) && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final Membership getMembership() {
            return this.membership;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Membership membership = this.membership;
            return this.id.hashCode() + ((iHashCode + (membership == null ? 0 : membership.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Membership membership = this.membership;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", membership=");
            sb.append(membership);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(MembershipStatusQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query MembershipStatusQuery { viewer { __typename viewerEdge { __typename membership { __typename isCancelled expiresAt paymentProvider membershipProductType: membershipType membershipId startedAt membershipPlanId isGrantedPremium mobilePlan { __typename productId } } id } id } }";
    }

    public final boolean equals(Object other) {
        return other != null && other.getClass() == MembershipStatusQuery.class;
    }

    public final int hashCode() {
        return n1b.a.b(MembershipStatusQuery.class).hashCode();
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
        List<sx1> list = MembershipStatusQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/MembershipStatusQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query MembershipStatusQuery { viewer { __typename viewerEdge { __typename membership { __typename isCancelled expiresAt paymentProvider membershipProductType: membershipType membershipId startedAt membershipPlanId isGrantedPremium mobilePlan { __typename productId } } id } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
