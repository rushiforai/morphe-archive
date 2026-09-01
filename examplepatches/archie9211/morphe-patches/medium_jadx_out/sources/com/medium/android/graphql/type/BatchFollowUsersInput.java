package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.ka1;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0004HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/type/BatchFollowUsersInput;", "", "userIds", "", "", "<init>", "(Ljava/util/List;)V", "getUserIds", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class BatchFollowUsersInput {
    private final List<String> userIds;

    public BatchFollowUsersInput(List<String> list) {
        list.getClass();
        this.userIds = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ BatchFollowUsersInput copy$default(BatchFollowUsersInput batchFollowUsersInput, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            list = batchFollowUsersInput.userIds;
        }
        return batchFollowUsersInput.copy(list);
    }

    public final List<String> component1() {
        return this.userIds;
    }

    public final BatchFollowUsersInput copy(List<String> userIds) {
        userIds.getClass();
        return new BatchFollowUsersInput(userIds);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof BatchFollowUsersInput) && g76.L(this.userIds, ((BatchFollowUsersInput) other).userIds);
    }

    public final List<String> getUserIds() {
        return this.userIds;
    }

    public final int hashCode() {
        return this.userIds.hashCode();
    }

    public final String toString() {
        return ka1.t("BatchFollowUsersInput(userIds=", ")", this.userIds);
    }
}
