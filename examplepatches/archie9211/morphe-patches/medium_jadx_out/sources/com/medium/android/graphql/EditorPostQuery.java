package com.medium.android.graphql;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.graphql.adapter.EditorPostQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.EditorPostQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.HighlightData;
import com.medium.android.graphql.fragment.PostClapsData;
import com.medium.android.graphql.selections.EditorPostQuerySelections;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0011\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000b()*+,-./01'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u00062"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery;", "Luqa;", "Lcom/medium/android/graphql/EditorPostQuery$Data;", "", "postId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/EditorPostQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Companion", "Data", "PostResult", "OnPost", "InResponseToPostResult", "OnPost1", "Creator", "InResponseToMediaResource", "MediumQuote", "InResponseToCatalogResult", "OnCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class EditorPostQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "a921612d824a4a5ec67188d7a0289b6c19a41139be8cd30a7b58ac60b2a051c2";
    public static final String OPERATION_NAME = "EditorPostQuery";
    private final String postId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$Creator;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String name;

        public Creator(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.name;
            }
            return creator.copy(str, str2, str3);
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
        public final String getName() {
            return this.name;
        }

        public final Creator copy(String __typename, String id, String name) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("Creator(__typename=", str, ", id=", str2, ", name="), this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/EditorPostQuery$PostResult;", "postResult", "<init>", "(Lcom/medium/android/graphql/EditorPostQuery$PostResult;)V", "component1", "()Lcom/medium/android/graphql/EditorPostQuery$PostResult;", "copy", "(Lcom/medium/android/graphql/EditorPostQuery$PostResult;)Lcom/medium/android/graphql/EditorPostQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/EditorPostQuery$PostResult;", "getPostResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final PostResult postResult;

        public Data(PostResult postResult) {
            this.postResult = postResult;
        }

        public static Data copy$default(Data data, PostResult postResult, int i, Object obj) {
            if ((i & 1) != 0) {
                postResult = data.postResult;
            }
            data.getClass();
            return new Data(postResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PostResult getPostResult() {
            return this.postResult;
        }

        public final Data copy(PostResult postResult) {
            return new Data(postResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.postResult, ((Data) other).postResult);
        }

        public final PostResult getPostResult() {
            return this.postResult;
        }

        public final int hashCode() {
            PostResult postResult = this.postResult;
            if (postResult == null) {
                return 0;
            }
            return postResult.hashCode();
        }

        public final String toString() {
            return "Data(postResult=" + this.postResult + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$InResponseToCatalogResult;", "", "__typename", "", "onCatalog", "Lcom/medium/android/graphql/EditorPostQuery$OnCatalog;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/EditorPostQuery$OnCatalog;)V", "get__typename", "()Ljava/lang/String;", "getOnCatalog", "()Lcom/medium/android/graphql/EditorPostQuery$OnCatalog;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToCatalogResult {
        private final String __typename;
        private final OnCatalog onCatalog;

        public InResponseToCatalogResult(String str, OnCatalog onCatalog) {
            str.getClass();
            this.__typename = str;
            this.onCatalog = onCatalog;
        }

        public static /* synthetic */ InResponseToCatalogResult copy$default(InResponseToCatalogResult inResponseToCatalogResult, String str, OnCatalog onCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToCatalogResult.__typename;
            }
            if ((i & 2) != 0) {
                onCatalog = inResponseToCatalogResult.onCatalog;
            }
            return inResponseToCatalogResult.copy(str, onCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final InResponseToCatalogResult copy(String __typename, OnCatalog onCatalog) {
            __typename.getClass();
            return new InResponseToCatalogResult(__typename, onCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToCatalogResult)) {
                return false;
            }
            InResponseToCatalogResult inResponseToCatalogResult = (InResponseToCatalogResult) other;
            return g76.L(this.__typename, inResponseToCatalogResult.__typename) && g76.L(this.onCatalog, inResponseToCatalogResult.onCatalog);
        }

        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnCatalog onCatalog = this.onCatalog;
            return iHashCode + (onCatalog == null ? 0 : onCatalog.hashCode());
        }

        public final String toString() {
            return "InResponseToCatalogResult(__typename=" + this.__typename + ", onCatalog=" + this.onCatalog + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$InResponseToMediaResource;", "", "__typename", "", "mediumQuote", "Lcom/medium/android/graphql/EditorPostQuery$MediumQuote;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/EditorPostQuery$MediumQuote;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMediumQuote", "()Lcom/medium/android/graphql/EditorPostQuery$MediumQuote;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToMediaResource {
        private final String __typename;
        private final String id;
        private final MediumQuote mediumQuote;

        public InResponseToMediaResource(String str, MediumQuote mediumQuote, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.mediumQuote = mediumQuote;
            this.id = str2;
        }

        public static /* synthetic */ InResponseToMediaResource copy$default(InResponseToMediaResource inResponseToMediaResource, String str, MediumQuote mediumQuote, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToMediaResource.__typename;
            }
            if ((i & 2) != 0) {
                mediumQuote = inResponseToMediaResource.mediumQuote;
            }
            if ((i & 4) != 0) {
                str2 = inResponseToMediaResource.id;
            }
            return inResponseToMediaResource.copy(str, mediumQuote, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MediumQuote getMediumQuote() {
            return this.mediumQuote;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final InResponseToMediaResource copy(String __typename, MediumQuote mediumQuote, String id) {
            __typename.getClass();
            id.getClass();
            return new InResponseToMediaResource(__typename, mediumQuote, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToMediaResource)) {
                return false;
            }
            InResponseToMediaResource inResponseToMediaResource = (InResponseToMediaResource) other;
            return g76.L(this.__typename, inResponseToMediaResource.__typename) && g76.L(this.mediumQuote, inResponseToMediaResource.mediumQuote) && g76.L(this.id, inResponseToMediaResource.id);
        }

        public final String getId() {
            return this.id;
        }

        public final MediumQuote getMediumQuote() {
            return this.mediumQuote;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            MediumQuote mediumQuote = this.mediumQuote;
            return this.id.hashCode() + ((iHashCode + (mediumQuote == null ? 0 : mediumQuote.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            MediumQuote mediumQuote = this.mediumQuote;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("InResponseToMediaResource(__typename=");
            sb.append(str);
            sb.append(", mediumQuote=");
            sb.append(mediumQuote);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$InResponseToPostResult;", "", "__typename", "", "onPost", "Lcom/medium/android/graphql/EditorPostQuery$OnPost1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/EditorPostQuery$OnPost1;)V", "get__typename", "()Ljava/lang/String;", "getOnPost", "()Lcom/medium/android/graphql/EditorPostQuery$OnPost1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToPostResult {
        private final String __typename;
        private final OnPost1 onPost;

        public InResponseToPostResult(String str, OnPost1 onPost1) {
            str.getClass();
            this.__typename = str;
            this.onPost = onPost1;
        }

        public static /* synthetic */ InResponseToPostResult copy$default(InResponseToPostResult inResponseToPostResult, String str, OnPost1 onPost1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToPostResult.__typename;
            }
            if ((i & 2) != 0) {
                onPost1 = inResponseToPostResult.onPost;
            }
            return inResponseToPostResult.copy(str, onPost1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPost1 getOnPost() {
            return this.onPost;
        }

        public final InResponseToPostResult copy(String __typename, OnPost1 onPost) {
            __typename.getClass();
            return new InResponseToPostResult(__typename, onPost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToPostResult)) {
                return false;
            }
            InResponseToPostResult inResponseToPostResult = (InResponseToPostResult) other;
            return g76.L(this.__typename, inResponseToPostResult.__typename) && g76.L(this.onPost, inResponseToPostResult.onPost);
        }

        public final OnPost1 getOnPost() {
            return this.onPost;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPost1 onPost1 = this.onPost;
            return iHashCode + (onPost1 == null ? 0 : onPost1.hashCode());
        }

        public final String toString() {
            return "InResponseToPostResult(__typename=" + this.__typename + ", onPost=" + this.onPost + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$MediumQuote;", "", "__typename", "", "id", "highlightData", "Lcom/medium/android/graphql/fragment/HighlightData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getHighlightData", "()Lcom/medium/android/graphql/fragment/HighlightData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MediumQuote {
        private final String __typename;
        private final HighlightData highlightData;
        private final String id;

        public MediumQuote(String str, String str2, HighlightData highlightData) {
            str.getClass();
            str2.getClass();
            highlightData.getClass();
            this.__typename = str;
            this.id = str2;
            this.highlightData = highlightData;
        }

        public static /* synthetic */ MediumQuote copy$default(MediumQuote mediumQuote, String str, String str2, HighlightData highlightData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mediumQuote.__typename;
            }
            if ((i & 2) != 0) {
                str2 = mediumQuote.id;
            }
            if ((i & 4) != 0) {
                highlightData = mediumQuote.highlightData;
            }
            return mediumQuote.copy(str, str2, highlightData);
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
        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final MediumQuote copy(String __typename, String id, HighlightData highlightData) {
            __typename.getClass();
            id.getClass();
            highlightData.getClass();
            return new MediumQuote(__typename, id, highlightData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MediumQuote)) {
                return false;
            }
            MediumQuote mediumQuote = (MediumQuote) other;
            return g76.L(this.__typename, mediumQuote.__typename) && g76.L(this.id, mediumQuote.id) && g76.L(this.highlightData, mediumQuote.highlightData);
        }

        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.highlightData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            HighlightData highlightData = this.highlightData;
            StringBuilder sbU = y30.u(ziYqbdHrAXvj.XhWplIdXUZxCYqA, str, ", id=", str2, ", highlightData=");
            sbU.append(highlightData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$OnCatalog;", "", "id", "", "catalogPreviewData", "Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData;)V", "getId", "()Ljava/lang/String;", "getCatalogPreviewData", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnCatalog {
        private final CatalogPreviewData catalogPreviewData;
        private final String id;

        public OnCatalog(String str, CatalogPreviewData catalogPreviewData) {
            str.getClass();
            catalogPreviewData.getClass();
            this.id = str;
            this.catalogPreviewData = catalogPreviewData;
        }

        public static /* synthetic */ OnCatalog copy$default(OnCatalog onCatalog, String str, CatalogPreviewData catalogPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onCatalog.id;
            }
            if ((i & 2) != 0) {
                catalogPreviewData = onCatalog.catalogPreviewData;
            }
            return onCatalog.copy(str, catalogPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogPreviewData getCatalogPreviewData() {
            return this.catalogPreviewData;
        }

        public final OnCatalog copy(String id, CatalogPreviewData catalogPreviewData) {
            id.getClass();
            catalogPreviewData.getClass();
            return new OnCatalog(id, catalogPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnCatalog)) {
                return false;
            }
            OnCatalog onCatalog = (OnCatalog) other;
            return g76.L(this.id, onCatalog.id) && g76.L(this.catalogPreviewData, onCatalog.catalogPreviewData);
        }

        public final CatalogPreviewData getCatalogPreviewData() {
            return this.catalogPreviewData;
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.catalogPreviewData.hashCode() + (this.id.hashCode() * 31);
        }

        public final String toString() {
            return "OnCatalog(id=" + this.id + ", catalogPreviewData=" + this.catalogPreviewData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010\u0017\u001a\u00020\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\tHÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$OnPost;", "", "inResponseToPostResult", "Lcom/medium/android/graphql/EditorPostQuery$InResponseToPostResult;", "inResponseToMediaResource", "Lcom/medium/android/graphql/EditorPostQuery$InResponseToMediaResource;", "inResponseToCatalogResult", "Lcom/medium/android/graphql/EditorPostQuery$InResponseToCatalogResult;", "id", "", "<init>", "(Lcom/medium/android/graphql/EditorPostQuery$InResponseToPostResult;Lcom/medium/android/graphql/EditorPostQuery$InResponseToMediaResource;Lcom/medium/android/graphql/EditorPostQuery$InResponseToCatalogResult;Ljava/lang/String;)V", "getInResponseToPostResult", "()Lcom/medium/android/graphql/EditorPostQuery$InResponseToPostResult;", "getInResponseToMediaResource", "()Lcom/medium/android/graphql/EditorPostQuery$InResponseToMediaResource;", "getInResponseToCatalogResult", "()Lcom/medium/android/graphql/EditorPostQuery$InResponseToCatalogResult;", "getId", "()Ljava/lang/String;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPost {
        private final String id;
        private final InResponseToCatalogResult inResponseToCatalogResult;
        private final InResponseToMediaResource inResponseToMediaResource;
        private final InResponseToPostResult inResponseToPostResult;

        public OnPost(InResponseToPostResult inResponseToPostResult, InResponseToMediaResource inResponseToMediaResource, InResponseToCatalogResult inResponseToCatalogResult, String str) {
            str.getClass();
            this.inResponseToPostResult = inResponseToPostResult;
            this.inResponseToMediaResource = inResponseToMediaResource;
            this.inResponseToCatalogResult = inResponseToCatalogResult;
            this.id = str;
        }

        public static /* synthetic */ OnPost copy$default(OnPost onPost, InResponseToPostResult inResponseToPostResult, InResponseToMediaResource inResponseToMediaResource, InResponseToCatalogResult inResponseToCatalogResult, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                inResponseToPostResult = onPost.inResponseToPostResult;
            }
            if ((i & 2) != 0) {
                inResponseToMediaResource = onPost.inResponseToMediaResource;
            }
            if ((i & 4) != 0) {
                inResponseToCatalogResult = onPost.inResponseToCatalogResult;
            }
            if ((i & 8) != 0) {
                str = onPost.id;
            }
            return onPost.copy(inResponseToPostResult, inResponseToMediaResource, inResponseToCatalogResult, str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final InResponseToPostResult getInResponseToPostResult() {
            return this.inResponseToPostResult;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final InResponseToMediaResource getInResponseToMediaResource() {
            return this.inResponseToMediaResource;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final InResponseToCatalogResult getInResponseToCatalogResult() {
            return this.inResponseToCatalogResult;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnPost copy(InResponseToPostResult inResponseToPostResult, InResponseToMediaResource inResponseToMediaResource, InResponseToCatalogResult inResponseToCatalogResult, String id) {
            id.getClass();
            return new OnPost(inResponseToPostResult, inResponseToMediaResource, inResponseToCatalogResult, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPost)) {
                return false;
            }
            OnPost onPost = (OnPost) other;
            return g76.L(this.inResponseToPostResult, onPost.inResponseToPostResult) && g76.L(this.inResponseToMediaResource, onPost.inResponseToMediaResource) && g76.L(this.inResponseToCatalogResult, onPost.inResponseToCatalogResult) && g76.L(this.id, onPost.id);
        }

        public final String getId() {
            return this.id;
        }

        public final InResponseToCatalogResult getInResponseToCatalogResult() {
            return this.inResponseToCatalogResult;
        }

        public final InResponseToMediaResource getInResponseToMediaResource() {
            return this.inResponseToMediaResource;
        }

        public final InResponseToPostResult getInResponseToPostResult() {
            return this.inResponseToPostResult;
        }

        public final int hashCode() {
            InResponseToPostResult inResponseToPostResult = this.inResponseToPostResult;
            int iHashCode = (inResponseToPostResult == null ? 0 : inResponseToPostResult.hashCode()) * 31;
            InResponseToMediaResource inResponseToMediaResource = this.inResponseToMediaResource;
            int iHashCode2 = (iHashCode + (inResponseToMediaResource == null ? 0 : inResponseToMediaResource.hashCode())) * 31;
            InResponseToCatalogResult inResponseToCatalogResult = this.inResponseToCatalogResult;
            return this.id.hashCode() + ((iHashCode2 + (inResponseToCatalogResult != null ? inResponseToCatalogResult.hashCode() : 0)) * 31);
        }

        public final String toString() {
            return "OnPost(inResponseToPostResult=" + this.inResponseToPostResult + ", inResponseToMediaResource=" + this.inResponseToMediaResource + ", inResponseToCatalogResult=" + this.inResponseToCatalogResult + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\u0006\u0010\t\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u0011J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\bHÆ\u0003J\t\u0010\u001b\u001a\u00020\nHÆ\u0003JF\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\t\u001a\u00020\nHÆ\u0001¢\u0006\u0002\u0010\u001dJ\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\u0006HÖ\u0001J\t\u0010\"\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0012\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016¨\u0006#"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$OnPost1;", "", "id", "", "title", "responsesCount", "", "creator", "Lcom/medium/android/graphql/EditorPostQuery$Creator;", "postClapsData", "Lcom/medium/android/graphql/fragment/PostClapsData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lcom/medium/android/graphql/EditorPostQuery$Creator;Lcom/medium/android/graphql/fragment/PostClapsData;)V", "getId", "()Ljava/lang/String;", "getTitle", "getResponsesCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getCreator", "()Lcom/medium/android/graphql/EditorPostQuery$Creator;", "getPostClapsData", "()Lcom/medium/android/graphql/fragment/PostClapsData;", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lcom/medium/android/graphql/EditorPostQuery$Creator;Lcom/medium/android/graphql/fragment/PostClapsData;)Lcom/medium/android/graphql/EditorPostQuery$OnPost1;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPost1 {
        private final Creator creator;
        private final String id;
        private final PostClapsData postClapsData;
        private final Integer responsesCount;
        private final String title;

        public OnPost1(String str, String str2, Integer num, Creator creator, PostClapsData postClapsData) {
            str.getClass();
            postClapsData.getClass();
            this.id = str;
            this.title = str2;
            this.responsesCount = num;
            this.creator = creator;
            this.postClapsData = postClapsData;
        }

        public static /* synthetic */ OnPost1 copy$default(OnPost1 onPost1, String str, String str2, Integer num, Creator creator, PostClapsData postClapsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPost1.id;
            }
            if ((i & 2) != 0) {
                str2 = onPost1.title;
            }
            if ((i & 4) != 0) {
                num = onPost1.responsesCount;
            }
            if ((i & 8) != 0) {
                creator = onPost1.creator;
            }
            if ((i & 16) != 0) {
                postClapsData = onPost1.postClapsData;
            }
            PostClapsData postClapsData2 = postClapsData;
            Integer num2 = num;
            return onPost1.copy(str, str2, num2, creator, postClapsData2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getResponsesCount() {
            return this.responsesCount;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Creator getCreator() {
            return this.creator;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final PostClapsData getPostClapsData() {
            return this.postClapsData;
        }

        public final OnPost1 copy(String id, String title, Integer responsesCount, Creator creator, PostClapsData postClapsData) {
            id.getClass();
            postClapsData.getClass();
            return new OnPost1(id, title, responsesCount, creator, postClapsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPost1)) {
                return false;
            }
            OnPost1 onPost1 = (OnPost1) other;
            return g76.L(this.id, onPost1.id) && g76.L(this.title, onPost1.title) && g76.L(this.responsesCount, onPost1.responsesCount) && g76.L(this.creator, onPost1.creator) && g76.L(this.postClapsData, onPost1.postClapsData);
        }

        public final Creator getCreator() {
            return this.creator;
        }

        public final String getId() {
            return this.id;
        }

        public final PostClapsData getPostClapsData() {
            return this.postClapsData;
        }

        public final Integer getResponsesCount() {
            return this.responsesCount;
        }

        public final String getTitle() {
            return this.title;
        }

        public final int hashCode() {
            int iHashCode = this.id.hashCode() * 31;
            String str = this.title;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            Integer num = this.responsesCount;
            int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
            Creator creator = this.creator;
            return this.postClapsData.hashCode() + ((iHashCode3 + (creator != null ? creator.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.id;
            String str2 = this.title;
            Integer num = this.responsesCount;
            Creator creator = this.creator;
            PostClapsData postClapsData = this.postClapsData;
            StringBuilder sbU = y30.u("OnPost1(id=", str, ", title=", str2, ", responsesCount=");
            sbU.append(num);
            sbU.append(", creator=");
            sbU.append(creator);
            sbU.append(", postClapsData=");
            sbU.append(postClapsData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$PostResult;", "", "__typename", "", "onPost", "Lcom/medium/android/graphql/EditorPostQuery$OnPost;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/EditorPostQuery$OnPost;)V", "get__typename", "()Ljava/lang/String;", "getOnPost", "()Lcom/medium/android/graphql/EditorPostQuery$OnPost;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostResult {
        private final String __typename;
        private final OnPost onPost;

        public PostResult(String str, OnPost onPost) {
            str.getClass();
            this.__typename = str;
            this.onPost = onPost;
        }

        public static /* synthetic */ PostResult copy$default(PostResult postResult, String str, OnPost onPost, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postResult.__typename;
            }
            if ((i & 2) != 0) {
                onPost = postResult.onPost;
            }
            return postResult.copy(str, onPost);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final PostResult copy(String __typename, OnPost onPost) {
            __typename.getClass();
            return new PostResult(__typename, onPost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostResult)) {
                return false;
            }
            PostResult postResult = (PostResult) other;
            return g76.L(this.__typename, postResult.__typename) && g76.L(this.onPost, postResult.onPost);
        }

        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPost onPost = this.onPost;
            return iHashCode + (onPost == null ? 0 : onPost.hashCode());
        }

        public final String toString() {
            return "PostResult(__typename=" + this.__typename + ", onPost=" + this.onPost + ")";
        }
    }

    public EditorPostQuery(String str) {
        str.getClass();
        this.postId = str;
    }

    public static /* synthetic */ EditorPostQuery copy$default(EditorPostQuery editorPostQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = editorPostQuery.postId;
        }
        return editorPostQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(EditorPostQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final EditorPostQuery copy(String postId) {
        postId.getClass();
        return new EditorPostQuery(postId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query EditorPostQuery($postId: ID!) { postResult(id: $postId) { __typename ... on Post { inResponseToPostResult { __typename ... on Post { id title responsesCount ...PostClapsData creator { __typename id name } } } inResponseToMediaResource { __typename mediumQuote { __typename ...HighlightData id } id } inResponseToCatalogResult { __typename ... on Catalog { ...CatalogPreviewData id } } id } } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof EditorPostQuery) && g76.L(this.postId, ((EditorPostQuery) other).postId);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.postId.hashCode();
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
        List<sx1> list = EditorPostQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        EditorPostQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("EditorPostQuery(postId=", this.postId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/EditorPostQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query EditorPostQuery($postId: ID!) { postResult(id: $postId) { __typename ... on Post { inResponseToPostResult { __typename ... on Post { id title responsesCount ...PostClapsData creator { __typename id name } } } inResponseToMediaResource { __typename mediumQuote { __typename ...HighlightData id } id } inResponseToCatalogResult { __typename ... on Catalog { ...CatalogPreviewData id } } id } } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
