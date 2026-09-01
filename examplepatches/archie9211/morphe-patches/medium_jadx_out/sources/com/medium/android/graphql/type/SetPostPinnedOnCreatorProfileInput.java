package com.medium.android.graphql.type;

import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00032\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0002\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/type/SetPostPinnedOnCreatorProfileInput;", "", "isPinned", "", "targetPostId", "", "<init>", "(ZLjava/lang/String;)V", "()Z", "getTargetPostId", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetPostPinnedOnCreatorProfileInput {
    private final boolean isPinned;
    private final String targetPostId;

    public SetPostPinnedOnCreatorProfileInput(boolean z, String str) {
        str.getClass();
        this.isPinned = z;
        this.targetPostId = str;
    }

    public static /* synthetic */ SetPostPinnedOnCreatorProfileInput copy$default(SetPostPinnedOnCreatorProfileInput setPostPinnedOnCreatorProfileInput, boolean z, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            z = setPostPinnedOnCreatorProfileInput.isPinned;
        }
        if ((i & 2) != 0) {
            str = setPostPinnedOnCreatorProfileInput.targetPostId;
        }
        return setPostPinnedOnCreatorProfileInput.copy(z, str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final boolean getIsPinned() {
        return this.isPinned;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final SetPostPinnedOnCreatorProfileInput copy(boolean isPinned, String targetPostId) {
        targetPostId.getClass();
        return new SetPostPinnedOnCreatorProfileInput(isPinned, targetPostId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SetPostPinnedOnCreatorProfileInput)) {
            return false;
        }
        SetPostPinnedOnCreatorProfileInput setPostPinnedOnCreatorProfileInput = (SetPostPinnedOnCreatorProfileInput) other;
        return this.isPinned == setPostPinnedOnCreatorProfileInput.isPinned && g76.L(this.targetPostId, setPostPinnedOnCreatorProfileInput.targetPostId);
    }

    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final int hashCode() {
        return this.targetPostId.hashCode() + ((this.isPinned ? 1231 : 1237) * 31);
    }

    public final boolean isPinned() {
        return this.isPinned;
    }

    public final String toString() {
        return "SetPostPinnedOnCreatorProfileInput(isPinned=" + this.isPinned + ", targetPostId=" + this.targetPostId + ")";
    }
}
