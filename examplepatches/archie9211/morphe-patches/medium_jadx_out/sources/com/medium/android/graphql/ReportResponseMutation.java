package com.medium.android.graphql;

import com.medium.android.graphql.adapter.ReportResponseMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.ReportResponseMutation_VariablesAdapter;
import com.medium.android.graphql.selections.ReportResponseMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 22\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003342B'\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\fJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\fJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\fJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\fJ\u0010\u0010\u001f\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\fJ\u0010\u0010 \u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b \u0010!J8\u0010\"\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b$\u0010\fJ\u0010\u0010&\u001a\u00020%HÖ\u0001¢\u0006\u0004\b&\u0010'J\u001a\u0010*\u001a\u00020\u00072\b\u0010)\u001a\u0004\u0018\u00010(HÖ\u0003¢\u0006\u0004\b*\u0010+R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010,\u001a\u0004\b-\u0010\fR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010,\u001a\u0004\b.\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0006\u0010,\u001a\u0004\b/\u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u00100\u001a\u0004\b1\u0010!¨\u00065"}, d2 = {"Lcom/medium/android/graphql/ReportResponseMutation;", "Lv78;", "Lcom/medium/android/graphql/ReportResponseMutation$Data;", "", "responseId", "authorId", "reason", "", "alsoBlockAuthor", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "component4", "()Z", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/medium/android/graphql/ReportResponseMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getResponseId", "getAuthorId", "getReason", "Z", "getAlsoBlockAuthor", "Companion", "Data", "ReportStoryAndMaybeBlockAuthor", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ReportResponseMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "318969e26cc459a9cd2112bc8c0351966c944b265cee486077fb2e0702ea8129";
    public static final String OPERATION_NAME = "ReportResponseMutation";
    private final boolean alsoBlockAuthor;
    private final String authorId;
    private final String reason;
    private final String responseId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/ReportResponseMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/ReportResponseMutation$ReportStoryAndMaybeBlockAuthor;", "reportStoryAndMaybeBlockAuthor", "<init>", "(Lcom/medium/android/graphql/ReportResponseMutation$ReportStoryAndMaybeBlockAuthor;)V", "component1", "()Lcom/medium/android/graphql/ReportResponseMutation$ReportStoryAndMaybeBlockAuthor;", "copy", "(Lcom/medium/android/graphql/ReportResponseMutation$ReportStoryAndMaybeBlockAuthor;)Lcom/medium/android/graphql/ReportResponseMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/ReportResponseMutation$ReportStoryAndMaybeBlockAuthor;", "getReportStoryAndMaybeBlockAuthor", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final ReportStoryAndMaybeBlockAuthor reportStoryAndMaybeBlockAuthor;

        public Data(ReportStoryAndMaybeBlockAuthor reportStoryAndMaybeBlockAuthor) {
            this.reportStoryAndMaybeBlockAuthor = reportStoryAndMaybeBlockAuthor;
        }

        public static Data copy$default(Data data, ReportStoryAndMaybeBlockAuthor reportStoryAndMaybeBlockAuthor, int i, Object obj) {
            if ((i & 1) != 0) {
                reportStoryAndMaybeBlockAuthor = data.reportStoryAndMaybeBlockAuthor;
            }
            data.getClass();
            return new Data(reportStoryAndMaybeBlockAuthor);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ReportStoryAndMaybeBlockAuthor getReportStoryAndMaybeBlockAuthor() {
            return this.reportStoryAndMaybeBlockAuthor;
        }

        public final Data copy(ReportStoryAndMaybeBlockAuthor reportStoryAndMaybeBlockAuthor) {
            return new Data(reportStoryAndMaybeBlockAuthor);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.reportStoryAndMaybeBlockAuthor, ((Data) other).reportStoryAndMaybeBlockAuthor);
        }

        public final ReportStoryAndMaybeBlockAuthor getReportStoryAndMaybeBlockAuthor() {
            return this.reportStoryAndMaybeBlockAuthor;
        }

        public final int hashCode() {
            ReportStoryAndMaybeBlockAuthor reportStoryAndMaybeBlockAuthor = this.reportStoryAndMaybeBlockAuthor;
            if (reportStoryAndMaybeBlockAuthor == null) {
                return 0;
            }
            return reportStoryAndMaybeBlockAuthor.hashCode();
        }

        public final String toString() {
            return "Data(reportStoryAndMaybeBlockAuthor=" + this.reportStoryAndMaybeBlockAuthor + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/ReportResponseMutation$ReportStoryAndMaybeBlockAuthor;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ReportStoryAndMaybeBlockAuthor {
        private final String __typename;
        private final String id;

        public ReportStoryAndMaybeBlockAuthor(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ ReportStoryAndMaybeBlockAuthor copy$default(ReportStoryAndMaybeBlockAuthor reportStoryAndMaybeBlockAuthor, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = reportStoryAndMaybeBlockAuthor.__typename;
            }
            if ((i & 2) != 0) {
                str2 = reportStoryAndMaybeBlockAuthor.id;
            }
            return reportStoryAndMaybeBlockAuthor.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ReportStoryAndMaybeBlockAuthor copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new ReportStoryAndMaybeBlockAuthor(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ReportStoryAndMaybeBlockAuthor)) {
                return false;
            }
            ReportStoryAndMaybeBlockAuthor reportStoryAndMaybeBlockAuthor = (ReportStoryAndMaybeBlockAuthor) other;
            return g76.L(this.__typename, reportStoryAndMaybeBlockAuthor.__typename) && g76.L(this.id, reportStoryAndMaybeBlockAuthor.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("ReportStoryAndMaybeBlockAuthor(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    public ReportResponseMutation(String str, String str2, String str3, boolean z) {
        b09.I(str, str2, str3);
        this.responseId = str;
        this.authorId = str2;
        this.reason = str3;
        this.alsoBlockAuthor = z;
    }

    public static /* synthetic */ ReportResponseMutation copy$default(ReportResponseMutation reportResponseMutation, String str, String str2, String str3, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = reportResponseMutation.responseId;
        }
        if ((i & 2) != 0) {
            str2 = reportResponseMutation.authorId;
        }
        if ((i & 4) != 0) {
            str3 = reportResponseMutation.reason;
        }
        if ((i & 8) != 0) {
            z = reportResponseMutation.alsoBlockAuthor;
        }
        return reportResponseMutation.copy(str, str2, str3, z);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(ReportResponseMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getResponseId() {
        return this.responseId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getAuthorId() {
        return this.authorId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getReason() {
        return this.reason;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final boolean getAlsoBlockAuthor() {
        return this.alsoBlockAuthor;
    }

    public final ReportResponseMutation copy(String responseId, String authorId, String reason, boolean alsoBlockAuthor) {
        responseId.getClass();
        authorId.getClass();
        reason.getClass();
        return new ReportResponseMutation(responseId, authorId, reason, alsoBlockAuthor);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation ReportResponseMutation($responseId: ID!, $authorId: ID!, $reason: String!, $alsoBlockAuthor: Boolean!) { reportStoryAndMaybeBlockAuthor(targetPostId: $responseId, targetAuthorId: $authorId, reason: $reason, alsoBlockAuthor: $alsoBlockAuthor) { __typename id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ReportResponseMutation)) {
            return false;
        }
        ReportResponseMutation reportResponseMutation = (ReportResponseMutation) other;
        return g76.L(this.responseId, reportResponseMutation.responseId) && g76.L(this.authorId, reportResponseMutation.authorId) && g76.L(this.reason, reportResponseMutation.reason) && this.alsoBlockAuthor == reportResponseMutation.alsoBlockAuthor;
    }

    public final boolean getAlsoBlockAuthor() {
        return this.alsoBlockAuthor;
    }

    public final String getAuthorId() {
        return this.authorId;
    }

    public final String getReason() {
        return this.reason;
    }

    public final String getResponseId() {
        return this.responseId;
    }

    public final int hashCode() {
        return wgd.o(wgd.o(this.responseId.hashCode() * 31, 31, this.authorId), 31, this.reason) + (this.alsoBlockAuthor ? 1231 : 1237);
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
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = ReportResponseMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        ReportResponseMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.responseId;
        String str2 = this.authorId;
        String str3 = this.reason;
        boolean z = this.alsoBlockAuthor;
        StringBuilder sbU = y30.u("ReportResponseMutation(responseId=", str, ", authorId=", str2, ", reason=");
        sbU.append(str3);
        sbU.append(", alsoBlockAuthor=");
        sbU.append(z);
        sbU.append(")");
        return sbU.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/ReportResponseMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation ReportResponseMutation($responseId: ID!, $authorId: ID!, $reason: String!, $alsoBlockAuthor: Boolean!) { reportStoryAndMaybeBlockAuthor(targetPostId: $responseId, targetAuthorId: $authorId, reason: $reason, alsoBlockAuthor: $alsoBlockAuthor) { __typename id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
