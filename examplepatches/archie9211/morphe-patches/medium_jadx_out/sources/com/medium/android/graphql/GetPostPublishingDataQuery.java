package com.medium.android.graphql;

import com.medium.android.graphql.adapter.GetPostPublishingDataQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.GetPostPublishingDataQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.DraftData;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.fragment.PublishingFlowPublication;
import com.medium.android.graphql.selections.GetPostPublishingDataQuerySelections;
import com.medium.android.graphql.type.PostVisibilityType;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0013\b\u0086\b\u0018\u0000 *2\b\u0012\u0004\u0012\u00020\u00020\u0001:\f+,-./012345*B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\tJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\tJ$\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b)\u0010\t¨\u00066"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery;", "Luqa;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$Data;", "", "postId", "userId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/GetPostPublishingDataQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getUserId", "Companion", "Data", "DraftResult", "OnDraft", "OnUnauthorized", "OnNotFound", "Post", "PreviewContent", "PreviewImage", "ViewerEdge", "MostRecentSubmission", "Publication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class GetPostPublishingDataQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "eacb27ebcc3d81fb857e806c74ea4e4e8357b6b390a187cf2dd0f046b3e8a845";
    public static final String OPERATION_NAME = "GetPostPublishingDataQuery";
    private final String postId;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010\n\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ&\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\tR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;", "draftResult", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;", "post", "<init>", "(Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;)V", "component1", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;", "component2", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;", "copy", "(Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;", "getDraftResult", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;", "getPost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final DraftResult draftResult;
        private final Post post;

        public Data(DraftResult draftResult, Post post) {
            draftResult.getClass();
            this.draftResult = draftResult;
            this.post = post;
        }

        public static /* synthetic */ Data copy$default(Data data, DraftResult draftResult, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                draftResult = data.draftResult;
            }
            if ((i & 2) != 0) {
                post = data.post;
            }
            return data.copy(draftResult, post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final DraftResult getDraftResult() {
            return this.draftResult;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final Data copy(DraftResult draftResult, Post post) {
            draftResult.getClass();
            return new Data(draftResult, post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.draftResult, data.draftResult) && g76.L(this.post, data.post);
        }

        public final DraftResult getDraftResult() {
            return this.draftResult;
        }

        public final Post getPost() {
            return this.post;
        }

        public final int hashCode() {
            int iHashCode = this.draftResult.hashCode() * 31;
            Post post = this.post;
            return iHashCode + (post == null ? 0 : post.hashCode());
        }

        public final String toString() {
            return "Data(draftResult=" + this.draftResult + ", post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;", "", "__typename", "", "onDraft", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnDraft;", "onUnauthorized", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnUnauthorized;", "onNotFound", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnNotFound;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnDraft;Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnUnauthorized;Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnNotFound;)V", "get__typename", "()Ljava/lang/String;", "getOnDraft", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnDraft;", "getOnUnauthorized", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnUnauthorized;", "getOnNotFound", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnNotFound;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class DraftResult {
        private final String __typename;
        private final OnDraft onDraft;
        private final OnNotFound onNotFound;
        private final OnUnauthorized onUnauthorized;

        public DraftResult(String str, OnDraft onDraft, OnUnauthorized onUnauthorized, OnNotFound onNotFound) {
            str.getClass();
            this.__typename = str;
            this.onDraft = onDraft;
            this.onUnauthorized = onUnauthorized;
            this.onNotFound = onNotFound;
        }

        public static /* synthetic */ DraftResult copy$default(DraftResult draftResult, String str, OnDraft onDraft, OnUnauthorized onUnauthorized, OnNotFound onNotFound, int i, Object obj) {
            if ((i & 1) != 0) {
                str = draftResult.__typename;
            }
            if ((i & 2) != 0) {
                onDraft = draftResult.onDraft;
            }
            if ((i & 4) != 0) {
                onUnauthorized = draftResult.onUnauthorized;
            }
            if ((i & 8) != 0) {
                onNotFound = draftResult.onNotFound;
            }
            return draftResult.copy(str, onDraft, onUnauthorized, onNotFound);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnDraft getOnDraft() {
            return this.onDraft;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final DraftResult copy(String __typename, OnDraft onDraft, OnUnauthorized onUnauthorized, OnNotFound onNotFound) {
            __typename.getClass();
            return new DraftResult(__typename, onDraft, onUnauthorized, onNotFound);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof DraftResult)) {
                return false;
            }
            DraftResult draftResult = (DraftResult) other;
            return g76.L(this.__typename, draftResult.__typename) && g76.L(this.onDraft, draftResult.onDraft) && g76.L(this.onUnauthorized, draftResult.onUnauthorized) && g76.L(this.onNotFound, draftResult.onNotFound);
        }

        public final OnDraft getOnDraft() {
            return this.onDraft;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnDraft onDraft = this.onDraft;
            int iHashCode2 = (iHashCode + (onDraft == null ? 0 : onDraft.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            int iHashCode3 = (iHashCode2 + (onUnauthorized == null ? 0 : onUnauthorized.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            return iHashCode3 + (onNotFound != null ? onNotFound.hashCode() : 0);
        }

        public final String toString() {
            return "DraftResult(__typename=" + this.__typename + ", onDraft=" + this.onDraft + ", onUnauthorized=" + this.onUnauthorized + ", onNotFound=" + this.onNotFound + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\f¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$MostRecentSubmission;", "", "__typename", "", "status", "Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "publication", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$Publication;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PublicationSubmissionStatus;Lcom/medium/android/graphql/GetPostPublishingDataQuery$Publication;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getStatus", "()Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "getPublication", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$Publication;", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MostRecentSubmission {
        private final String __typename;
        private final String id;
        private final Publication publication;
        private final PublicationSubmissionStatus status;

        public MostRecentSubmission(String str, PublicationSubmissionStatus publicationSubmissionStatus, Publication publication, String str2) {
            str.getClass();
            publicationSubmissionStatus.getClass();
            publication.getClass();
            str2.getClass();
            this.__typename = str;
            this.status = publicationSubmissionStatus;
            this.publication = publication;
            this.id = str2;
        }

        public static /* synthetic */ MostRecentSubmission copy$default(MostRecentSubmission mostRecentSubmission, String str, PublicationSubmissionStatus publicationSubmissionStatus, Publication publication, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mostRecentSubmission.__typename;
            }
            if ((i & 2) != 0) {
                publicationSubmissionStatus = mostRecentSubmission.status;
            }
            if ((i & 4) != 0) {
                publication = mostRecentSubmission.publication;
            }
            if ((i & 8) != 0) {
                str2 = mostRecentSubmission.id;
            }
            return mostRecentSubmission.copy(str, publicationSubmissionStatus, publication, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationSubmissionStatus getStatus() {
            return this.status;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Publication getPublication() {
            return this.publication;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final MostRecentSubmission copy(String __typename, PublicationSubmissionStatus status, Publication publication, String id) {
            __typename.getClass();
            status.getClass();
            publication.getClass();
            id.getClass();
            return new MostRecentSubmission(__typename, status, publication, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MostRecentSubmission)) {
                return false;
            }
            MostRecentSubmission mostRecentSubmission = (MostRecentSubmission) other;
            return g76.L(this.__typename, mostRecentSubmission.__typename) && this.status == mostRecentSubmission.status && g76.L(this.publication, mostRecentSubmission.publication) && g76.L(this.id, mostRecentSubmission.id);
        }

        public final String getId() {
            return this.id;
        }

        public final Publication getPublication() {
            return this.publication;
        }

        public final PublicationSubmissionStatus getStatus() {
            return this.status;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.publication.hashCode() + ((this.status.hashCode() + (this.__typename.hashCode() * 31)) * 31)) * 31);
        }

        public final String toString() {
            return "MostRecentSubmission(__typename=" + this.__typename + ", status=" + this.status + ", publication=" + this.publication + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnDraft;", "", "draftData", "Lcom/medium/android/graphql/fragment/DraftData;", "<init>", "(Lcom/medium/android/graphql/fragment/DraftData;)V", "getDraftData", "()Lcom/medium/android/graphql/fragment/DraftData;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnDraft {
        private final DraftData draftData;

        public OnDraft(DraftData draftData) {
            draftData.getClass();
            this.draftData = draftData;
        }

        public static /* synthetic */ OnDraft copy$default(OnDraft onDraft, DraftData draftData, int i, Object obj) {
            if ((i & 1) != 0) {
                draftData = onDraft.draftData;
            }
            return onDraft.copy(draftData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final DraftData getDraftData() {
            return this.draftData;
        }

        public final OnDraft copy(DraftData draftData) {
            draftData.getClass();
            return new OnDraft(draftData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnDraft) && g76.L(this.draftData, ((OnDraft) other).draftData);
        }

        public final DraftData getDraftData() {
            return this.draftData;
        }

        public final int hashCode() {
            return this.draftData.hashCode();
        }

        public final String toString() {
            return "OnDraft(draftData=" + this.draftData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnNotFound {
        private final String message;

        public OnNotFound(String str) {
            this.message = str;
        }

        public static OnNotFound copy$default(OnNotFound onNotFound, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onNotFound.message;
            }
            onNotFound.getClass();
            return new OnNotFound(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnNotFound copy(String message) {
            return new OnNotFound(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnNotFound) && g76.L(this.message, ((OnNotFound) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnNotFound(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUnauthorized {
        private final String message;

        public OnUnauthorized(String str) {
            this.message = str;
        }

        public static OnUnauthorized copy$default(OnUnauthorized onUnauthorized, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUnauthorized.message;
            }
            onUnauthorized.getClass();
            return new OnUnauthorized(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnUnauthorized copy(String message) {
            return new OnUnauthorized(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUnauthorized) && g76.L(this.message, ((OnUnauthorized) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnUnauthorized(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001f\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BY\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\f\u001a\u00020\r\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0010\u001a\u00020\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\t\u0010!\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\bHÆ\u0003J\u0010\u0010%\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010\u001aJ\u0010\u0010&\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010\u001aJ\t\u0010'\u001a\u00020\rHÆ\u0003J\t\u0010(\u001a\u00020\u000fHÆ\u0003J\t\u0010)\u001a\u00020\u0003HÆ\u0003Jr\u0010*\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010+J\u0013\u0010,\u001a\u00020\n2\b\u0010-\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010.\u001a\u00020/HÖ\u0001J\t\u00100\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0014R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0015\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\t\u0010\u001aR\u0015\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u000b\u0010\u001aR\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0011\u0010\u0010\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u0014¨\u00061"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;", "", "__typename", "", "title", "previewContent", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;", "previewImage", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;", "isPublished", "", "isPublishToEmail", "visibility", "Lcom/medium/android/graphql/type/PostVisibilityType;", "viewerEdge", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/medium/android/graphql/type/PostVisibilityType;Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getTitle", "getPreviewContent", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;", "getPreviewImage", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getVisibility", "()Lcom/medium/android/graphql/type/PostVisibilityType;", "getViewerEdge", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;", "getId", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/medium/android/graphql/type/PostVisibilityType;Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;Ljava/lang/String;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final Boolean isPublishToEmail;
        private final Boolean isPublished;
        private final PreviewContent previewContent;
        private final PreviewImage previewImage;
        private final String title;
        private final ViewerEdge viewerEdge;
        private final PostVisibilityType visibility;

        public Post(String str, String str2, PreviewContent previewContent, PreviewImage previewImage, Boolean bool, Boolean bool2, PostVisibilityType postVisibilityType, ViewerEdge viewerEdge, String str3) {
            str.getClass();
            postVisibilityType.getClass();
            viewerEdge.getClass();
            str3.getClass();
            this.__typename = str;
            this.title = str2;
            this.previewContent = previewContent;
            this.previewImage = previewImage;
            this.isPublished = bool;
            this.isPublishToEmail = bool2;
            this.visibility = postVisibilityType;
            this.viewerEdge = viewerEdge;
            this.id = str3;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, PreviewContent previewContent, PreviewImage previewImage, Boolean bool, Boolean bool2, PostVisibilityType postVisibilityType, ViewerEdge viewerEdge, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.title;
            }
            if ((i & 4) != 0) {
                previewContent = post.previewContent;
            }
            if ((i & 8) != 0) {
                previewImage = post.previewImage;
            }
            if ((i & 16) != 0) {
                bool = post.isPublished;
            }
            if ((i & 32) != 0) {
                bool2 = post.isPublishToEmail;
            }
            if ((i & 64) != 0) {
                postVisibilityType = post.visibility;
            }
            if ((i & 128) != 0) {
                viewerEdge = post.viewerEdge;
            }
            if ((i & 256) != 0) {
                str3 = post.id;
            }
            ViewerEdge viewerEdge2 = viewerEdge;
            String str4 = str3;
            Boolean bool3 = bool2;
            PostVisibilityType postVisibilityType2 = postVisibilityType;
            Boolean bool4 = bool;
            PreviewContent previewContent2 = previewContent;
            return post.copy(str, str2, previewContent2, previewImage, bool4, bool3, postVisibilityType2, viewerEdge2, str4);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PreviewContent getPreviewContent() {
            return this.previewContent;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PreviewImage getPreviewImage() {
            return this.previewImage;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Boolean getIsPublished() {
            return this.isPublished;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final Boolean getIsPublishToEmail() {
            return this.isPublishToEmail;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final PostVisibilityType getVisibility() {
            return this.visibility;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Post copy(String __typename, String title, PreviewContent previewContent, PreviewImage previewImage, Boolean isPublished, Boolean isPublishToEmail, PostVisibilityType visibility, ViewerEdge viewerEdge, String id) {
            __typename.getClass();
            visibility.getClass();
            viewerEdge.getClass();
            id.getClass();
            return new Post(__typename, title, previewContent, previewImage, isPublished, isPublishToEmail, visibility, viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.title, post.title) && g76.L(this.previewContent, post.previewContent) && g76.L(this.previewImage, post.previewImage) && g76.L(this.isPublished, post.isPublished) && g76.L(this.isPublishToEmail, post.isPublishToEmail) && this.visibility == post.visibility && g76.L(this.viewerEdge, post.viewerEdge) && g76.L(this.id, post.id);
        }

        public final String getId() {
            return this.id;
        }

        public final PreviewContent getPreviewContent() {
            return this.previewContent;
        }

        public final PreviewImage getPreviewImage() {
            return this.previewImage;
        }

        public final String getTitle() {
            return this.title;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final PostVisibilityType getVisibility() {
            return this.visibility;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.title;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            PreviewContent previewContent = this.previewContent;
            int iHashCode3 = (iHashCode2 + (previewContent == null ? 0 : previewContent.hashCode())) * 31;
            PreviewImage previewImage = this.previewImage;
            int iHashCode4 = (iHashCode3 + (previewImage == null ? 0 : previewImage.hashCode())) * 31;
            Boolean bool = this.isPublished;
            int iHashCode5 = (iHashCode4 + (bool == null ? 0 : bool.hashCode())) * 31;
            Boolean bool2 = this.isPublishToEmail;
            return this.id.hashCode() + ((this.viewerEdge.hashCode() + ((this.visibility.hashCode() + ((iHashCode5 + (bool2 != null ? bool2.hashCode() : 0)) * 31)) * 31)) * 31);
        }

        public final Boolean isPublishToEmail() {
            return this.isPublishToEmail;
        }

        public final Boolean isPublished() {
            return this.isPublished;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.title;
            PreviewContent previewContent = this.previewContent;
            PreviewImage previewImage = this.previewImage;
            Boolean bool = this.isPublished;
            Boolean bool2 = this.isPublishToEmail;
            PostVisibilityType postVisibilityType = this.visibility;
            ViewerEdge viewerEdge = this.viewerEdge;
            String str3 = this.id;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", title=", str2, ", previewContent=");
            sbU.append(previewContent);
            sbU.append(", previewImage=");
            sbU.append(previewImage);
            sbU.append(", isPublished=");
            sbU.append(bool);
            sbU.append(", isPublishToEmail=");
            sbU.append(bool2);
            sbU.append(", visibility=");
            sbU.append(postVisibilityType);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge);
            sbU.append(", id=");
            return ka1.v(sbU, str3, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;", "", "__typename", "", "subtitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getSubtitle", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewContent {
        private final String __typename;
        private final String subtitle;

        public PreviewContent(String str, String str2) {
            str.getClass();
            this.__typename = str;
            this.subtitle = str2;
        }

        public static /* synthetic */ PreviewContent copy$default(PreviewContent previewContent, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewContent.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewContent.subtitle;
            }
            return previewContent.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getSubtitle() {
            return this.subtitle;
        }

        public final PreviewContent copy(String __typename, String subtitle) {
            __typename.getClass();
            return new PreviewContent(__typename, subtitle);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewContent)) {
                return false;
            }
            PreviewContent previewContent = (PreviewContent) other;
            return g76.L(this.__typename, previewContent.__typename) && g76.L(this.subtitle, previewContent.subtitle);
        }

        public final String getSubtitle() {
            return this.subtitle;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.subtitle;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return ev6.y("PreviewContent(__typename=", this.__typename, ", subtitle=", this.subtitle, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewImage {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public PreviewImage(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ PreviewImage copy$default(PreviewImage previewImage, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewImage.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewImage.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = previewImage.imageMetadataData;
            }
            return previewImage.copy(str, str2, imageMetadataData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final PreviewImage copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new PreviewImage(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewImage)) {
                return false;
            }
            PreviewImage previewImage = (PreviewImage) other;
            return g76.L(this.__typename, previewImage.__typename) && g76.L(this.id, previewImage.id) && g76.L(this.imageMetadataData, previewImage.imageMetadataData);
        }

        public final String getId() {
            return this.id;
        }

        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.imageMetadataData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ImageMetadataData imageMetadataData = this.imageMetadataData;
            StringBuilder sbU = y30.u("PreviewImage(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$Publication;", "", "__typename", "", "id", "publishingFlowPublication", "Lcom/medium/android/graphql/fragment/PublishingFlowPublication;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublishingFlowPublication;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPublishingFlowPublication", "()Lcom/medium/android/graphql/fragment/PublishingFlowPublication;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final String id;
        private final PublishingFlowPublication publishingFlowPublication;

        public Publication(String str, String str2, PublishingFlowPublication publishingFlowPublication) {
            str.getClass();
            str2.getClass();
            publishingFlowPublication.getClass();
            this.__typename = str;
            this.id = str2;
            this.publishingFlowPublication = publishingFlowPublication;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, String str2, PublishingFlowPublication publishingFlowPublication, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publication.id;
            }
            if ((i & 4) != 0) {
                publishingFlowPublication = publication.publishingFlowPublication;
            }
            return publication.copy(str, str2, publishingFlowPublication);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PublishingFlowPublication getPublishingFlowPublication() {
            return this.publishingFlowPublication;
        }

        public final Publication copy(String __typename, String id, PublishingFlowPublication publishingFlowPublication) {
            __typename.getClass();
            id.getClass();
            publishingFlowPublication.getClass();
            return new Publication(__typename, id, publishingFlowPublication);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.id, publication.id) && g76.L(this.publishingFlowPublication, publication.publishingFlowPublication);
        }

        public final String getId() {
            return this.id;
        }

        public final PublishingFlowPublication getPublishingFlowPublication() {
            return this.publishingFlowPublication;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.publishingFlowPublication.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            PublishingFlowPublication publishingFlowPublication = this.publishingFlowPublication;
            StringBuilder sbU = y30.u("Publication(__typename=", str, ", id=", str2, ", publishingFlowPublication=");
            sbU.append(publishingFlowPublication);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;", "", "__typename", "", "mostRecentSubmission", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$MostRecentSubmission;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostPublishingDataQuery$MostRecentSubmission;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMostRecentSubmission", "()Lcom/medium/android/graphql/GetPostPublishingDataQuery$MostRecentSubmission;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final MostRecentSubmission mostRecentSubmission;

        public ViewerEdge(String str, MostRecentSubmission mostRecentSubmission, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.mostRecentSubmission = mostRecentSubmission;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, MostRecentSubmission mostRecentSubmission, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                mostRecentSubmission = viewerEdge.mostRecentSubmission;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, mostRecentSubmission, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MostRecentSubmission getMostRecentSubmission() {
            return this.mostRecentSubmission;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, MostRecentSubmission mostRecentSubmission, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, mostRecentSubmission, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.mostRecentSubmission, viewerEdge.mostRecentSubmission) && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final MostRecentSubmission getMostRecentSubmission() {
            return this.mostRecentSubmission;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            MostRecentSubmission mostRecentSubmission = this.mostRecentSubmission;
            return this.id.hashCode() + ((iHashCode + (mostRecentSubmission == null ? 0 : mostRecentSubmission.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            MostRecentSubmission mostRecentSubmission = this.mostRecentSubmission;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", mostRecentSubmission=");
            sb.append(mostRecentSubmission);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public GetPostPublishingDataQuery(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.postId = str;
        this.userId = str2;
    }

    public static /* synthetic */ GetPostPublishingDataQuery copy$default(GetPostPublishingDataQuery getPostPublishingDataQuery, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = getPostPublishingDataQuery.postId;
        }
        if ((i & 2) != 0) {
            str2 = getPostPublishingDataQuery.userId;
        }
        return getPostPublishingDataQuery.copy(str, str2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetPostPublishingDataQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final GetPostPublishingDataQuery copy(String postId, String userId) {
        postId.getClass();
        userId.getClass();
        return new GetPostPublishingDataQuery(postId, userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetPostPublishingDataQuery($postId: ID!, $userId: String!) { draftResult(id: $postId) { __typename ... on Draft { ...DraftData } ... on Unauthorized { message } ... on NotFound { message } } post(id: $postId) { __typename title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } isPublished isPublishToEmail visibility viewerEdge { __typename mostRecentSubmission { __typename status publication { __typename ...PublishingFlowPublication id } id } id } id } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }  fragment DraftData on Draft { __typename creator { __typename id name imageId newsletterV3 { __typename subscribersCount id } } title featuredImageId subtitle curationEligible tags { __typename ...TagData normalizedTagSlug } imageIds }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment PublishingFlowPublication on Publication { __typename id name slug avatar { __typename id } viewerEdge { __typename viewerStaffRole } userEdge(userId: $userId) { __typename canSubmit } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof GetPostPublishingDataQuery)) {
            return false;
        }
        GetPostPublishingDataQuery getPostPublishingDataQuery = (GetPostPublishingDataQuery) other;
        return g76.L(this.postId, getPostPublishingDataQuery.postId) && g76.L(this.userId, getPostPublishingDataQuery.userId);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode() + (this.postId.hashCode() * 31);
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
        List<sx1> list = GetPostPublishingDataQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        GetPostPublishingDataQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.y("GetPostPublishingDataQuery(postId=", this.postId, ", userId=", this.userId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetPostPublishingDataQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetPostPublishingDataQuery($postId: ID!, $userId: String!) { draftResult(id: $postId) { __typename ... on Draft { ...DraftData } ... on Unauthorized { message } ... on NotFound { message } } post(id: $postId) { __typename title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } isPublished isPublishToEmail visibility viewerEdge { __typename mostRecentSubmission { __typename status publication { __typename ...PublishingFlowPublication id } id } id } id } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }  fragment DraftData on Draft { __typename creator { __typename id name imageId newsletterV3 { __typename subscribersCount id } } title featuredImageId subtitle curationEligible tags { __typename ...TagData normalizedTagSlug } imageIds }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment PublishingFlowPublication on Publication { __typename id name slug avatar { __typename id } viewerEdge { __typename viewerStaffRole } userEdge(userId: $userId) { __typename canSubmit } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
