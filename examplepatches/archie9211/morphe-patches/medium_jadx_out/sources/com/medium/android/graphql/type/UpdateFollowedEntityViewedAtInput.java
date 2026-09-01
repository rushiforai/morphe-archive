package com.medium.android.graphql.type;

import defpackage.ev6;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/type/UpdateFollowedEntityViewedAtInput;", "", "userId", "", "feedId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getUserId", "()Ljava/lang/String;", "getFeedId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateFollowedEntityViewedAtInput {
    private final String feedId;
    private final String userId;

    public UpdateFollowedEntityViewedAtInput(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.userId = str;
        this.feedId = str2;
    }

    public static /* synthetic */ UpdateFollowedEntityViewedAtInput copy$default(UpdateFollowedEntityViewedAtInput updateFollowedEntityViewedAtInput, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = updateFollowedEntityViewedAtInput.userId;
        }
        if ((i & 2) != 0) {
            str2 = updateFollowedEntityViewedAtInput.feedId;
        }
        return updateFollowedEntityViewedAtInput.copy(str, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getFeedId() {
        return this.feedId;
    }

    public final UpdateFollowedEntityViewedAtInput copy(String userId, String feedId) {
        userId.getClass();
        feedId.getClass();
        return new UpdateFollowedEntityViewedAtInput(userId, feedId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateFollowedEntityViewedAtInput)) {
            return false;
        }
        UpdateFollowedEntityViewedAtInput updateFollowedEntityViewedAtInput = (UpdateFollowedEntityViewedAtInput) other;
        return g76.L(this.userId, updateFollowedEntityViewedAtInput.userId) && g76.L(this.feedId, updateFollowedEntityViewedAtInput.feedId);
    }

    public final String getFeedId() {
        return this.feedId;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.feedId.hashCode() + (this.userId.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("UpdateFollowedEntityViewedAtInput(userId=", this.userId, ", feedId=", this.feedId, ")");
    }
}
