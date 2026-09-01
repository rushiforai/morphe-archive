package com.medium.android.graphql;

import com.medium.android.graphql.adapter.GetWriterAndAdminCollectionsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.GetWriterAndAdminCollectionsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.PublishingFlowCollection;
import com.medium.android.graphql.selections.GetWriterAndAdminCollectionsQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\n\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004()*'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006+"}, d2 = {"Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery;", "Luqa;", "Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Data;", "", "userId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Companion", "Data", "Viewer", "WriterAndAdminCollection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class GetWriterAndAdminCollectionsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "cbc4cc727c29ecb60a7c3423a9dbf2607e8647c22456cd78f93aec60b2d91a99";
    public static final String OPERATION_NAME = "GetWriterAndAdminCollectionsQuery";
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Viewer;", "viewer", "<init>", "(Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Viewer;)V", "component1", "()Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Viewer;", "copy", "(Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Viewer;)Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Viewer;", "getViewer", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Viewer viewer;

        public Data(Viewer viewer) {
            this.viewer = viewer;
        }

        public static Data copy$default(Data data, Viewer viewer, int i, Object obj) {
            if ((i & 1) != 0) {
                viewer = data.viewer;
            }
            data.getClass();
            return new Data(viewer);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Viewer getViewer() {
            return this.viewer;
        }

        public final Data copy(Viewer viewer) {
            return new Data(viewer);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.viewer, ((Data) other).viewer);
        }

        public final Viewer getViewer() {
            return this.viewer;
        }

        public final int hashCode() {
            Viewer viewer = this.viewer;
            if (viewer == null) {
                return 0;
            }
            return viewer.hashCode();
        }

        public final String toString() {
            return "Data(viewer=" + this.viewer + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J-\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000b¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Viewer;", "", "__typename", "", "writerAndAdminCollections", "", "Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$WriterAndAdminCollection;", "id", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getWriterAndAdminCollections", "()Ljava/util/List;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Viewer {
        private final String __typename;
        private final String id;
        private final List<WriterAndAdminCollection> writerAndAdminCollections;

        public Viewer(String str, List<WriterAndAdminCollection> list, String str2) {
            str.getClass();
            list.getClass();
            str2.getClass();
            this.__typename = str;
            this.writerAndAdminCollections = list;
            this.id = str2;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Viewer copy$default(Viewer viewer, String str, List list, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewer.__typename;
            }
            if ((i & 2) != 0) {
                list = viewer.writerAndAdminCollections;
            }
            if ((i & 4) != 0) {
                str2 = viewer.id;
            }
            return viewer.copy(str, list, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<WriterAndAdminCollection> component2() {
            return this.writerAndAdminCollections;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Viewer copy(String __typename, List<WriterAndAdminCollection> writerAndAdminCollections, String id) {
            __typename.getClass();
            writerAndAdminCollections.getClass();
            id.getClass();
            return new Viewer(__typename, writerAndAdminCollections, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Viewer)) {
                return false;
            }
            Viewer viewer = (Viewer) other;
            return g76.L(this.__typename, viewer.__typename) && g76.L(this.writerAndAdminCollections, viewer.writerAndAdminCollections) && g76.L(this.id, viewer.id);
        }

        public final String getId() {
            return this.id;
        }

        public final List<WriterAndAdminCollection> getWriterAndAdminCollections() {
            return this.writerAndAdminCollections;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.writerAndAdminCollections);
        }

        public final String toString() {
            String str = this.__typename;
            List<WriterAndAdminCollection> list = this.writerAndAdminCollections;
            return ka1.v(b09.E("Viewer(__typename=", str, ", writerAndAdminCollections=", ", id=", list), this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$WriterAndAdminCollection;", "", "__typename", "", "id", "publishingFlowCollection", "Lcom/medium/android/graphql/fragment/PublishingFlowCollection;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublishingFlowCollection;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPublishingFlowCollection", "()Lcom/medium/android/graphql/fragment/PublishingFlowCollection;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class WriterAndAdminCollection {
        private final String __typename;
        private final String id;
        private final PublishingFlowCollection publishingFlowCollection;

        public WriterAndAdminCollection(String str, String str2, PublishingFlowCollection publishingFlowCollection) {
            str.getClass();
            str2.getClass();
            publishingFlowCollection.getClass();
            this.__typename = str;
            this.id = str2;
            this.publishingFlowCollection = publishingFlowCollection;
        }

        public static /* synthetic */ WriterAndAdminCollection copy$default(WriterAndAdminCollection writerAndAdminCollection, String str, String str2, PublishingFlowCollection publishingFlowCollection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = writerAndAdminCollection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = writerAndAdminCollection.id;
            }
            if ((i & 4) != 0) {
                publishingFlowCollection = writerAndAdminCollection.publishingFlowCollection;
            }
            return writerAndAdminCollection.copy(str, str2, publishingFlowCollection);
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
        public final PublishingFlowCollection getPublishingFlowCollection() {
            return this.publishingFlowCollection;
        }

        public final WriterAndAdminCollection copy(String __typename, String id, PublishingFlowCollection publishingFlowCollection) {
            __typename.getClass();
            id.getClass();
            publishingFlowCollection.getClass();
            return new WriterAndAdminCollection(__typename, id, publishingFlowCollection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof WriterAndAdminCollection)) {
                return false;
            }
            WriterAndAdminCollection writerAndAdminCollection = (WriterAndAdminCollection) other;
            return g76.L(this.__typename, writerAndAdminCollection.__typename) && g76.L(this.id, writerAndAdminCollection.id) && g76.L(this.publishingFlowCollection, writerAndAdminCollection.publishingFlowCollection);
        }

        public final String getId() {
            return this.id;
        }

        public final PublishingFlowCollection getPublishingFlowCollection() {
            return this.publishingFlowCollection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.publishingFlowCollection.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            PublishingFlowCollection publishingFlowCollection = this.publishingFlowCollection;
            StringBuilder sbU = y30.u("WriterAndAdminCollection(__typename=", str, ", id=", str2, ", publishingFlowCollection=");
            sbU.append(publishingFlowCollection);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public GetWriterAndAdminCollectionsQuery(String str) {
        str.getClass();
        this.userId = str;
    }

    public static /* synthetic */ GetWriterAndAdminCollectionsQuery copy$default(GetWriterAndAdminCollectionsQuery getWriterAndAdminCollectionsQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = getWriterAndAdminCollectionsQuery.userId;
        }
        return getWriterAndAdminCollectionsQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetWriterAndAdminCollectionsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final GetWriterAndAdminCollectionsQuery copy(String userId) {
        userId.getClass();
        return new GetWriterAndAdminCollectionsQuery(userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetWriterAndAdminCollectionsQuery($userId: String!) { viewer { __typename writerAndAdminCollections { __typename ...PublishingFlowCollection id } id } }  fragment PublishingFlowCollection on Collection { __typename id name slug avatar { __typename id } viewerEdge { __typename isEditor isWriter id } compatV3 { __typename userEdge(userId: $userId) { __typename canSubmit } preferences { __typename name value { __typename ... on EnumPreferenceValue { value } } } id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof GetWriterAndAdminCollectionsQuery) && g76.L(this.userId, ((GetWriterAndAdminCollectionsQuery) other).userId);
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode();
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
        List<sx1> list = GetWriterAndAdminCollectionsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        GetWriterAndAdminCollectionsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("GetWriterAndAdminCollectionsQuery(userId=", this.userId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetWriterAndAdminCollectionsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetWriterAndAdminCollectionsQuery($userId: String!) { viewer { __typename writerAndAdminCollections { __typename ...PublishingFlowCollection id } id } }  fragment PublishingFlowCollection on Collection { __typename id name slug avatar { __typename id } viewerEdge { __typename isEditor isWriter id } compatV3 { __typename userEdge(userId: $userId) { __typename canSubmit } preferences { __typename name value { __typename ... on EnumPreferenceValue { value } } } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
