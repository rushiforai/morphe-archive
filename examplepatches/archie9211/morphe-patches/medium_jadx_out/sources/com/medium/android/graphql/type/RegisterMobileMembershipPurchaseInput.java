package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\fJ\u0010\u0010\u0010\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J@\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\fR\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001e\u001a\u0004\b\u001f\u0010\u000eR\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b \u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010!\u001a\u0004\b\"\u0010\u0011¨\u0006#"}, d2 = {"Lcom/medium/android/graphql/type/RegisterMobileMembershipPurchaseInput;", "", "", "membershipPlanId", "Lzv8;", "discountCode", "receiptData", "Lcom/medium/android/graphql/type/Platform;", "platform", "<init>", "(Ljava/lang/String;Lzv8;Ljava/lang/String;Lcom/medium/android/graphql/type/Platform;)V", "component1", "()Ljava/lang/String;", "component2", "()Lzv8;", "component3", "component4", "()Lcom/medium/android/graphql/type/Platform;", "copy", "(Ljava/lang/String;Lzv8;Ljava/lang/String;Lcom/medium/android/graphql/type/Platform;)Lcom/medium/android/graphql/type/RegisterMobileMembershipPurchaseInput;", "toString", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getMembershipPlanId", "Lzv8;", "getDiscountCode", "getReceiptData", "Lcom/medium/android/graphql/type/Platform;", "getPlatform", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class RegisterMobileMembershipPurchaseInput {
    private final zv8 discountCode;
    private final String membershipPlanId;
    private final Platform platform;
    private final String receiptData;

    public RegisterMobileMembershipPurchaseInput(String str, zv8 zv8Var, String str2, Platform platform) {
        str.getClass();
        zv8Var.getClass();
        str2.getClass();
        platform.getClass();
        this.membershipPlanId = str;
        this.discountCode = zv8Var;
        this.receiptData = str2;
        this.platform = platform;
    }

    public static /* synthetic */ RegisterMobileMembershipPurchaseInput copy$default(RegisterMobileMembershipPurchaseInput registerMobileMembershipPurchaseInput, String str, zv8 zv8Var, String str2, Platform platform, int i, Object obj) {
        if ((i & 1) != 0) {
            str = registerMobileMembershipPurchaseInput.membershipPlanId;
        }
        if ((i & 2) != 0) {
            zv8Var = registerMobileMembershipPurchaseInput.discountCode;
        }
        if ((i & 4) != 0) {
            str2 = registerMobileMembershipPurchaseInput.receiptData;
        }
        if ((i & 8) != 0) {
            platform = registerMobileMembershipPurchaseInput.platform;
        }
        return registerMobileMembershipPurchaseInput.copy(str, zv8Var, str2, platform);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getMembershipPlanId() {
        return this.membershipPlanId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getDiscountCode() {
        return this.discountCode;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getReceiptData() {
        return this.receiptData;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Platform getPlatform() {
        return this.platform;
    }

    public final RegisterMobileMembershipPurchaseInput copy(String membershipPlanId, zv8 discountCode, String receiptData, Platform platform) {
        membershipPlanId.getClass();
        discountCode.getClass();
        receiptData.getClass();
        platform.getClass();
        return new RegisterMobileMembershipPurchaseInput(membershipPlanId, discountCode, receiptData, platform);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RegisterMobileMembershipPurchaseInput)) {
            return false;
        }
        RegisterMobileMembershipPurchaseInput registerMobileMembershipPurchaseInput = (RegisterMobileMembershipPurchaseInput) other;
        return g76.L(this.membershipPlanId, registerMobileMembershipPurchaseInput.membershipPlanId) && g76.L(this.discountCode, registerMobileMembershipPurchaseInput.discountCode) && g76.L(this.receiptData, registerMobileMembershipPurchaseInput.receiptData) && this.platform == registerMobileMembershipPurchaseInput.platform;
    }

    public final zv8 getDiscountCode() {
        return this.discountCode;
    }

    public final String getMembershipPlanId() {
        return this.membershipPlanId;
    }

    public final Platform getPlatform() {
        return this.platform;
    }

    public final String getReceiptData() {
        return this.receiptData;
    }

    public final int hashCode() {
        return this.platform.hashCode() + wgd.o(lv8.h(this.discountCode, this.membershipPlanId.hashCode() * 31, 31), 31, this.receiptData);
    }

    public final String toString() {
        return "RegisterMobileMembershipPurchaseInput(membershipPlanId=" + this.membershipPlanId + ", discountCode=" + this.discountCode + ", receiptData=" + this.receiptData + ", platform=" + this.platform + ")";
    }

    public /* synthetic */ RegisterMobileMembershipPurchaseInput(String str, zv8 zv8Var, String str2, Platform platform, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var, str2, platform);
    }
}
