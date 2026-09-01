package com.medium.android.graphql.type;

import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/SendExplicitSignalInput;", "", "postId", "", "signal", "Lcom/medium/android/graphql/type/ExplicitUserSignal;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/ExplicitUserSignal;)V", "getPostId", "()Ljava/lang/String;", "getSignal", "()Lcom/medium/android/graphql/type/ExplicitUserSignal;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SendExplicitSignalInput {
    private final String postId;
    private final ExplicitUserSignal signal;

    public SendExplicitSignalInput(String str, ExplicitUserSignal explicitUserSignal) {
        str.getClass();
        explicitUserSignal.getClass();
        this.postId = str;
        this.signal = explicitUserSignal;
    }

    public static /* synthetic */ SendExplicitSignalInput copy$default(SendExplicitSignalInput sendExplicitSignalInput, String str, ExplicitUserSignal explicitUserSignal, int i, Object obj) {
        if ((i & 1) != 0) {
            str = sendExplicitSignalInput.postId;
        }
        if ((i & 2) != 0) {
            explicitUserSignal = sendExplicitSignalInput.signal;
        }
        return sendExplicitSignalInput.copy(str, explicitUserSignal);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final ExplicitUserSignal getSignal() {
        return this.signal;
    }

    public final SendExplicitSignalInput copy(String postId, ExplicitUserSignal signal) {
        postId.getClass();
        signal.getClass();
        return new SendExplicitSignalInput(postId, signal);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SendExplicitSignalInput)) {
            return false;
        }
        SendExplicitSignalInput sendExplicitSignalInput = (SendExplicitSignalInput) other;
        return g76.L(this.postId, sendExplicitSignalInput.postId) && this.signal == sendExplicitSignalInput.signal;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final ExplicitUserSignal getSignal() {
        return this.signal;
    }

    public final int hashCode() {
        return this.signal.hashCode() + (this.postId.hashCode() * 31);
    }

    public final String toString() {
        return "SendExplicitSignalInput(postId=" + this.postId + ", signal=" + this.signal + ")";
    }
}
