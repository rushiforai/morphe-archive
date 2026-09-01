package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.km4;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ$\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u000e\u0010\tJ\u0010\u0010\u0010\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0014\u001a\u00020\u00042\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0016\u001a\u0004\b\u0017\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0018\u001a\u0004\b\u0019\u0010\u000b¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/fragment/MutationSuccessData;", "Lg15;", "", "__typename", "", "success", "<init>", "(Ljava/lang/String;Z)V", "component1", "()Ljava/lang/String;", "component2", "()Z", "copy", "(Ljava/lang/String;Z)Lcom/medium/android/graphql/fragment/MutationSuccessData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Z", "getSuccess", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MutationSuccessData implements g15 {
    private final String __typename;
    private final boolean success;

    public MutationSuccessData(String str, boolean z) {
        str.getClass();
        this.__typename = str;
        this.success = z;
    }

    public static /* synthetic */ MutationSuccessData copy$default(MutationSuccessData mutationSuccessData, String str, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = mutationSuccessData.__typename;
        }
        if ((i & 2) != 0) {
            z = mutationSuccessData.success;
        }
        return mutationSuccessData.copy(str, z);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final boolean getSuccess() {
        return this.success;
    }

    public final MutationSuccessData copy(String __typename, boolean success) {
        __typename.getClass();
        return new MutationSuccessData(__typename, success);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MutationSuccessData)) {
            return false;
        }
        MutationSuccessData mutationSuccessData = (MutationSuccessData) other;
        return g76.L(this.__typename, mutationSuccessData.__typename) && this.success == mutationSuccessData.success;
    }

    public final boolean getSuccess() {
        return this.success;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return (this.__typename.hashCode() * 31) + (this.success ? 1231 : 1237);
    }

    public final String toString() {
        return km4.z("MutationSuccessData(__typename=", this.__typename, ", success=", ")", this.success);
    }
}
