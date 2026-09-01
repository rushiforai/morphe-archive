package com.medium.android.graphql.type;

import com.google.android.gms.analytics.wYI.ivbZv;
import defpackage.b09;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J'\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/type/UpdateAndroidMembershipPlanInput;", "", "membershipId", "", "productId", "receiptData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getMembershipId", "()Ljava/lang/String;", "getProductId", "getReceiptData", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateAndroidMembershipPlanInput {
    private final String membershipId;
    private final String productId;
    private final String receiptData;

    public UpdateAndroidMembershipPlanInput(String str, String str2, String str3) {
        b09.I(str, str2, str3);
        this.membershipId = str;
        this.productId = str2;
        this.receiptData = str3;
    }

    public static /* synthetic */ UpdateAndroidMembershipPlanInput copy$default(UpdateAndroidMembershipPlanInput updateAndroidMembershipPlanInput, String str, String str2, String str3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = updateAndroidMembershipPlanInput.membershipId;
        }
        if ((i & 2) != 0) {
            str2 = updateAndroidMembershipPlanInput.productId;
        }
        if ((i & 4) != 0) {
            str3 = updateAndroidMembershipPlanInput.receiptData;
        }
        return updateAndroidMembershipPlanInput.copy(str, str2, str3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getMembershipId() {
        return this.membershipId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getProductId() {
        return this.productId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getReceiptData() {
        return this.receiptData;
    }

    public final UpdateAndroidMembershipPlanInput copy(String membershipId, String productId, String receiptData) {
        membershipId.getClass();
        productId.getClass();
        receiptData.getClass();
        return new UpdateAndroidMembershipPlanInput(membershipId, productId, receiptData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateAndroidMembershipPlanInput)) {
            return false;
        }
        UpdateAndroidMembershipPlanInput updateAndroidMembershipPlanInput = (UpdateAndroidMembershipPlanInput) other;
        return g76.L(this.membershipId, updateAndroidMembershipPlanInput.membershipId) && g76.L(this.productId, updateAndroidMembershipPlanInput.productId) && g76.L(this.receiptData, updateAndroidMembershipPlanInput.receiptData);
    }

    public final String getMembershipId() {
        return this.membershipId;
    }

    public final String getProductId() {
        return this.productId;
    }

    public final String getReceiptData() {
        return this.receiptData;
    }

    public final int hashCode() {
        return this.receiptData.hashCode() + wgd.o(this.membershipId.hashCode() * 31, 31, this.productId);
    }

    public final String toString() {
        String str = this.membershipId;
        String str2 = this.productId;
        return ka1.v(y30.u("UpdateAndroidMembershipPlanInput(membershipId=", str, ", productId=", str2, ivbZv.xjmsT), this.receiptData, ")");
    }
}
