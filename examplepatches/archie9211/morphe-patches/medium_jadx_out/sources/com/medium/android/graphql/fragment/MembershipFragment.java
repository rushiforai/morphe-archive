package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.MembershipTier;
import defpackage.g15;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0012\u0010\u0011\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J:\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0015\u0010\fJ\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010\fR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010 \u001a\u0004\b!\u0010\u000eR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\"\u001a\u0004\b#\u0010\u0010R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\b\u0010$\u001a\u0004\b%\u0010\u0012¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/fragment/MembershipFragment;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/type/MembershipTier;", "tier", "", "memberSince", "friendSince", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/MembershipTier;JLjava/lang/Long;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/type/MembershipTier;", "component3", "()J", "component4", "()Ljava/lang/Long;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/MembershipTier;JLjava/lang/Long;)Lcom/medium/android/graphql/fragment/MembershipFragment;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/type/MembershipTier;", "getTier", "J", "getMemberSince", "Ljava/lang/Long;", "getFriendSince", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MembershipFragment implements g15 {
    private final String __typename;
    private final Long friendSince;
    private final long memberSince;
    private final MembershipTier tier;

    public MembershipFragment(String str, MembershipTier membershipTier, long j, Long l) {
        str.getClass();
        membershipTier.getClass();
        this.__typename = str;
        this.tier = membershipTier;
        this.memberSince = j;
        this.friendSince = l;
    }

    public static /* synthetic */ MembershipFragment copy$default(MembershipFragment membershipFragment, String str, MembershipTier membershipTier, long j, Long l, int i, Object obj) {
        if ((i & 1) != 0) {
            str = membershipFragment.__typename;
        }
        if ((i & 2) != 0) {
            membershipTier = membershipFragment.tier;
        }
        if ((i & 4) != 0) {
            j = membershipFragment.memberSince;
        }
        if ((i & 8) != 0) {
            l = membershipFragment.friendSince;
        }
        Long l2 = l;
        return membershipFragment.copy(str, membershipTier, j, l2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final MembershipTier getTier() {
        return this.tier;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final long getMemberSince() {
        return this.memberSince;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Long getFriendSince() {
        return this.friendSince;
    }

    public final MembershipFragment copy(String __typename, MembershipTier tier, long memberSince, Long friendSince) {
        __typename.getClass();
        tier.getClass();
        return new MembershipFragment(__typename, tier, memberSince, friendSince);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MembershipFragment)) {
            return false;
        }
        MembershipFragment membershipFragment = (MembershipFragment) other;
        return g76.L(this.__typename, membershipFragment.__typename) && this.tier == membershipFragment.tier && this.memberSince == membershipFragment.memberSince && g76.L(this.friendSince, membershipFragment.friendSince);
    }

    public final Long getFriendSince() {
        return this.friendSince;
    }

    public final long getMemberSince() {
        return this.memberSince;
    }

    public final MembershipTier getTier() {
        return this.tier;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = (this.tier.hashCode() + (this.__typename.hashCode() * 31)) * 31;
        long j = this.memberSince;
        int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
        Long l = this.friendSince;
        return i + (l == null ? 0 : l.hashCode());
    }

    public final String toString() {
        return "MembershipFragment(__typename=" + this.__typename + ", tier=" + this.tier + ", memberSince=" + this.memberSince + ", friendSince=" + this.friendSince + ")";
    }
}
