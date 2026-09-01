package com.medium.android.graphql;

import com.medium.android.graphql.adapter.GetDefaultFrequencyQuery_ResponseAdapter;
import com.medium.android.graphql.selections.GetDefaultFrequencyQuerySelections;
import com.medium.android.graphql.type.MembershipFrequency;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\u0018\u0000  2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004!\"# B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u001a\u0010\b\u001a\u00020\u00072\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0096\u0002¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\u000e\u001a\u00020\rH\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\rH\u0016¢\u0006\u0004\b\u0010\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\rH\u0016¢\u0006\u0004\b\u0011\u0010\u000fJ'\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0015\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001f¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/GetDefaultFrequencyQuery;", "Luqa;", "Lcom/medium/android/graphql/GetDefaultFrequencyQuery$Data;", "<init>", "()V", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "Companion", "Data", "MembershipPlans", "OnMembershipPlansResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetDefaultFrequencyQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "0947c181c223f73620e51077f6d23c1c9cba4680ea5db3e7b8c5d9a43a66474d";
    public static final String OPERATION_NAME = "GetDefaultFrequencyQuery";

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/GetDefaultFrequencyQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetDefaultFrequencyQuery$MembershipPlans;", "membershipPlans", "<init>", "(Lcom/medium/android/graphql/GetDefaultFrequencyQuery$MembershipPlans;)V", "component1", "()Lcom/medium/android/graphql/GetDefaultFrequencyQuery$MembershipPlans;", "copy", "(Lcom/medium/android/graphql/GetDefaultFrequencyQuery$MembershipPlans;)Lcom/medium/android/graphql/GetDefaultFrequencyQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetDefaultFrequencyQuery$MembershipPlans;", "getMembershipPlans", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final MembershipPlans membershipPlans;

        public Data(MembershipPlans membershipPlans) {
            membershipPlans.getClass();
            this.membershipPlans = membershipPlans;
        }

        public static /* synthetic */ Data copy$default(Data data, MembershipPlans membershipPlans, int i, Object obj) {
            if ((i & 1) != 0) {
                membershipPlans = data.membershipPlans;
            }
            return data.copy(membershipPlans);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final MembershipPlans getMembershipPlans() {
            return this.membershipPlans;
        }

        public final Data copy(MembershipPlans membershipPlans) {
            membershipPlans.getClass();
            return new Data(membershipPlans);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.membershipPlans, ((Data) other).membershipPlans);
        }

        public final MembershipPlans getMembershipPlans() {
            return this.membershipPlans;
        }

        public final int hashCode() {
            return this.membershipPlans.hashCode();
        }

        public final String toString() {
            return "Data(membershipPlans=" + this.membershipPlans + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetDefaultFrequencyQuery$MembershipPlans;", "", "__typename", "", "onMembershipPlansResult", "Lcom/medium/android/graphql/GetDefaultFrequencyQuery$OnMembershipPlansResult;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetDefaultFrequencyQuery$OnMembershipPlansResult;)V", "get__typename", "()Ljava/lang/String;", "getOnMembershipPlansResult", "()Lcom/medium/android/graphql/GetDefaultFrequencyQuery$OnMembershipPlansResult;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MembershipPlans {
        private final String __typename;
        private final OnMembershipPlansResult onMembershipPlansResult;

        public MembershipPlans(String str, OnMembershipPlansResult onMembershipPlansResult) {
            str.getClass();
            onMembershipPlansResult.getClass();
            this.__typename = str;
            this.onMembershipPlansResult = onMembershipPlansResult;
        }

        public static /* synthetic */ MembershipPlans copy$default(MembershipPlans membershipPlans, String str, OnMembershipPlansResult onMembershipPlansResult, int i, Object obj) {
            if ((i & 1) != 0) {
                str = membershipPlans.__typename;
            }
            if ((i & 2) != 0) {
                onMembershipPlansResult = membershipPlans.onMembershipPlansResult;
            }
            return membershipPlans.copy(str, onMembershipPlansResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnMembershipPlansResult getOnMembershipPlansResult() {
            return this.onMembershipPlansResult;
        }

        public final MembershipPlans copy(String __typename, OnMembershipPlansResult onMembershipPlansResult) {
            __typename.getClass();
            onMembershipPlansResult.getClass();
            return new MembershipPlans(__typename, onMembershipPlansResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MembershipPlans)) {
                return false;
            }
            MembershipPlans membershipPlans = (MembershipPlans) other;
            return g76.L(this.__typename, membershipPlans.__typename) && g76.L(this.onMembershipPlansResult, membershipPlans.onMembershipPlansResult);
        }

        public final OnMembershipPlansResult getOnMembershipPlansResult() {
            return this.onMembershipPlansResult;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onMembershipPlansResult.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "MembershipPlans(__typename=" + this.__typename + ", onMembershipPlansResult=" + this.onMembershipPlansResult + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/GetDefaultFrequencyQuery$OnMembershipPlansResult;", "", "defaultFrequency", "Lcom/medium/android/graphql/type/MembershipFrequency;", "<init>", "(Lcom/medium/android/graphql/type/MembershipFrequency;)V", "getDefaultFrequency", "()Lcom/medium/android/graphql/type/MembershipFrequency;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMembershipPlansResult {
        private final MembershipFrequency defaultFrequency;

        public OnMembershipPlansResult(MembershipFrequency membershipFrequency) {
            membershipFrequency.getClass();
            this.defaultFrequency = membershipFrequency;
        }

        public static /* synthetic */ OnMembershipPlansResult copy$default(OnMembershipPlansResult onMembershipPlansResult, MembershipFrequency membershipFrequency, int i, Object obj) {
            if ((i & 1) != 0) {
                membershipFrequency = onMembershipPlansResult.defaultFrequency;
            }
            return onMembershipPlansResult.copy(membershipFrequency);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final MembershipFrequency getDefaultFrequency() {
            return this.defaultFrequency;
        }

        public final OnMembershipPlansResult copy(MembershipFrequency defaultFrequency) {
            defaultFrequency.getClass();
            return new OnMembershipPlansResult(defaultFrequency);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnMembershipPlansResult) && this.defaultFrequency == ((OnMembershipPlansResult) other).defaultFrequency;
        }

        public final MembershipFrequency getDefaultFrequency() {
            return this.defaultFrequency;
        }

        public final int hashCode() {
            return this.defaultFrequency.hashCode();
        }

        public final String toString() {
            return "OnMembershipPlansResult(defaultFrequency=" + this.defaultFrequency + ")";
        }
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetDefaultFrequencyQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetDefaultFrequencyQuery { membershipPlans(platform: ANDROID) { __typename ... on MembershipPlansResult { defaultFrequency } } }";
    }

    public final boolean equals(Object other) {
        return other != null && other.getClass() == GetDefaultFrequencyQuery.class;
    }

    public final int hashCode() {
        return n1b.a.b(GetDefaultFrequencyQuery.class).hashCode();
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = GetDefaultFrequencyQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetDefaultFrequencyQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetDefaultFrequencyQuery { membershipPlans(platform: ANDROID) { __typename ... on MembershipPlansResult { defaultFrequency } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
