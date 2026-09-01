package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.ka1;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/type/UserRepostsConnectionInput;", "", "after", "", "first", "", "userId", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getAfter", "()Ljava/lang/String;", "getFirst", "()I", "getUserId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserRepostsConnectionInput {
    private final String after;
    private final int first;
    private final String userId;

    public UserRepostsConnectionInput(String str, int i, String str2) {
        str.getClass();
        str2.getClass();
        this.after = str;
        this.first = i;
        this.userId = str2;
    }

    public static /* synthetic */ UserRepostsConnectionInput copy$default(UserRepostsConnectionInput userRepostsConnectionInput, String str, int i, String str2, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = userRepostsConnectionInput.after;
        }
        if ((i2 & 2) != 0) {
            i = userRepostsConnectionInput.first;
        }
        if ((i2 & 4) != 0) {
            str2 = userRepostsConnectionInput.userId;
        }
        return userRepostsConnectionInput.copy(str, i, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getAfter() {
        return this.after;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final UserRepostsConnectionInput copy(String after, int first, String userId) {
        after.getClass();
        userId.getClass();
        return new UserRepostsConnectionInput(after, first, userId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserRepostsConnectionInput)) {
            return false;
        }
        UserRepostsConnectionInput userRepostsConnectionInput = (UserRepostsConnectionInput) other;
        return g76.L(this.after, userRepostsConnectionInput.after) && this.first == userRepostsConnectionInput.first && g76.L(this.userId, userRepostsConnectionInput.userId);
    }

    public final String getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode() + (((this.after.hashCode() * 31) + this.first) * 31);
    }

    public final String toString() {
        String str = this.after;
        int i = this.first;
        return ka1.v(y30.t(i, "UserRepostsConnectionInput(after=", str, ", first=", ", userId="), this.userId, ")");
    }
}
