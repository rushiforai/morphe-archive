package com.medium.android.graphql.type;

import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/MobileDeviceToken;", "", "kind", "Lcom/medium/android/graphql/type/MobileDeviceTokenKind;", "token", "", "<init>", "(Lcom/medium/android/graphql/type/MobileDeviceTokenKind;Ljava/lang/String;)V", "getKind", "()Lcom/medium/android/graphql/type/MobileDeviceTokenKind;", "getToken", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MobileDeviceToken {
    private final MobileDeviceTokenKind kind;
    private final String token;

    public MobileDeviceToken(MobileDeviceTokenKind mobileDeviceTokenKind, String str) {
        mobileDeviceTokenKind.getClass();
        str.getClass();
        this.kind = mobileDeviceTokenKind;
        this.token = str;
    }

    public static /* synthetic */ MobileDeviceToken copy$default(MobileDeviceToken mobileDeviceToken, MobileDeviceTokenKind mobileDeviceTokenKind, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            mobileDeviceTokenKind = mobileDeviceToken.kind;
        }
        if ((i & 2) != 0) {
            str = mobileDeviceToken.token;
        }
        return mobileDeviceToken.copy(mobileDeviceTokenKind, str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final MobileDeviceTokenKind getKind() {
        return this.kind;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getToken() {
        return this.token;
    }

    public final MobileDeviceToken copy(MobileDeviceTokenKind kind, String token) {
        kind.getClass();
        token.getClass();
        return new MobileDeviceToken(kind, token);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MobileDeviceToken)) {
            return false;
        }
        MobileDeviceToken mobileDeviceToken = (MobileDeviceToken) other;
        return this.kind == mobileDeviceToken.kind && g76.L(this.token, mobileDeviceToken.token);
    }

    public final MobileDeviceTokenKind getKind() {
        return this.kind;
    }

    public final String getToken() {
        return this.token;
    }

    public final int hashCode() {
        return this.token.hashCode() + (this.kind.hashCode() * 31);
    }

    public final String toString() {
        return "MobileDeviceToken(kind=" + this.kind + ", token=" + this.token + ")";
    }
}
