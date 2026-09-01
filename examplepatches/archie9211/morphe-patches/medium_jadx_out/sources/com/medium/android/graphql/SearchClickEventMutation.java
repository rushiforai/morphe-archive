package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SearchClickEventMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SearchClickEventMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SearchClickEventMutationSelections;
import com.medium.android.graphql.type.AlgoliaIndexName;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 62\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000276B3\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\u0007\u0012\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000f\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0010\u0010\u000eJ'\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0015\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b \u0010\u000eJ\u0010\u0010!\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0016\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00030\u0007HÆ\u0003¢\u0006\u0004\b#\u0010$J\u0016\u0010%\u001a\b\u0012\u0004\u0012\u00020\t0\u0007HÆ\u0003¢\u0006\u0004\b%\u0010$JD\u0010&\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\u00072\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\u0007HÆ\u0001¢\u0006\u0004\b&\u0010'J\u0010\u0010(\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b(\u0010\u000eJ\u0010\u0010)\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b)\u0010*J\u001a\u0010-\u001a\u00020\u00152\b\u0010,\u001a\u0004\u0018\u00010+HÖ\u0003¢\u0006\u0004\b-\u0010.R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010/\u001a\u0004\b0\u0010\u000eR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00101\u001a\u0004\b2\u0010\"R\u001d\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\u00078\u0006¢\u0006\f\n\u0004\b\b\u00103\u001a\u0004\b4\u0010$R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\u00078\u0006¢\u0006\f\n\u0004\b\n\u00103\u001a\u0004\b5\u0010$¨\u00068"}, d2 = {"Lcom/medium/android/graphql/SearchClickEventMutation;", "Lv78;", "Lcom/medium/android/graphql/SearchClickEventMutation$Data;", "", "queryId", "Lcom/medium/android/graphql/type/AlgoliaIndexName;", "indexName", "", "objectIds", "", "positions", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/AlgoliaIndexName;Ljava/util/List;Ljava/util/List;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/AlgoliaIndexName;", "component3", "()Ljava/util/List;", "component4", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/AlgoliaIndexName;Ljava/util/List;Ljava/util/List;)Lcom/medium/android/graphql/SearchClickEventMutation;", "toString", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getQueryId", "Lcom/medium/android/graphql/type/AlgoliaIndexName;", "getIndexName", "Ljava/util/List;", "getObjectIds", "getPositions", "Companion", "Data", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SearchClickEventMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "e632a89ab51a258dd1f863efe4f394197c078387d1e1a03282de6e1c9c3b14e2";
    public static final String OPERATION_NAME = "SearchClickEvent";
    private final AlgoliaIndexName indexName;
    private final List<String> objectIds;
    private final List<Integer> positions;
    private final String queryId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0012\u001a\u00020\u00022\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0012\u0010\u0013R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0014\u001a\u0004\b\u0015\u0010\u0007¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/SearchClickEventMutation$Data;", "Lu78;", "", "searchClickEvent", "<init>", "(Ljava/lang/Boolean;)V", "component1", "()Ljava/lang/Boolean;", "copy", "(Ljava/lang/Boolean;)Lcom/medium/android/graphql/SearchClickEventMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/Boolean;", "getSearchClickEvent", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final Boolean searchClickEvent;

        public Data(Boolean bool) {
            this.searchClickEvent = bool;
        }

        public static Data copy$default(Data data, Boolean bool, int i, Object obj) {
            if ((i & 1) != 0) {
                bool = data.searchClickEvent;
            }
            data.getClass();
            return new Data(bool);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Boolean getSearchClickEvent() {
            return this.searchClickEvent;
        }

        public final Data copy(Boolean searchClickEvent) {
            return new Data(searchClickEvent);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.searchClickEvent, ((Data) other).searchClickEvent);
        }

        public final Boolean getSearchClickEvent() {
            return this.searchClickEvent;
        }

        public final int hashCode() {
            Boolean bool = this.searchClickEvent;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "Data(searchClickEvent=" + this.searchClickEvent + ")";
        }
    }

    public SearchClickEventMutation(String str, AlgoliaIndexName algoliaIndexName, List<String> list, List<Integer> list2) {
        str.getClass();
        algoliaIndexName.getClass();
        list.getClass();
        list2.getClass();
        this.queryId = str;
        this.indexName = algoliaIndexName;
        this.objectIds = list;
        this.positions = list2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ SearchClickEventMutation copy$default(SearchClickEventMutation searchClickEventMutation, String str, AlgoliaIndexName algoliaIndexName, List list, List list2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = searchClickEventMutation.queryId;
        }
        if ((i & 2) != 0) {
            algoliaIndexName = searchClickEventMutation.indexName;
        }
        if ((i & 4) != 0) {
            list = searchClickEventMutation.objectIds;
        }
        if ((i & 8) != 0) {
            list2 = searchClickEventMutation.positions;
        }
        return searchClickEventMutation.copy(str, algoliaIndexName, list, list2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SearchClickEventMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getQueryId() {
        return this.queryId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final AlgoliaIndexName getIndexName() {
        return this.indexName;
    }

    public final List<String> component3() {
        return this.objectIds;
    }

    public final List<Integer> component4() {
        return this.positions;
    }

    public final SearchClickEventMutation copy(String queryId, AlgoliaIndexName indexName, List<String> objectIds, List<Integer> positions) {
        queryId.getClass();
        indexName.getClass();
        objectIds.getClass();
        positions.getClass();
        return new SearchClickEventMutation(queryId, indexName, objectIds, positions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SearchClickEvent($queryId: String!, $indexName: AlgoliaIndexName!, $objectIds: [String!]!, $positions: [Int!]!) { searchClickEvent(queryId: $queryId, indexName: $indexName, objectIds: $objectIds, positions: $positions) }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SearchClickEventMutation)) {
            return false;
        }
        SearchClickEventMutation searchClickEventMutation = (SearchClickEventMutation) other;
        return g76.L(this.queryId, searchClickEventMutation.queryId) && this.indexName == searchClickEventMutation.indexName && g76.L(this.objectIds, searchClickEventMutation.objectIds) && g76.L(this.positions, searchClickEventMutation.positions);
    }

    public final AlgoliaIndexName getIndexName() {
        return this.indexName;
    }

    public final List<String> getObjectIds() {
        return this.objectIds;
    }

    public final List<Integer> getPositions() {
        return this.positions;
    }

    public final String getQueryId() {
        return this.queryId;
    }

    public final int hashCode() {
        return this.positions.hashCode() + wgd.p((this.indexName.hashCode() + (this.queryId.hashCode() * 31)) * 31, 31, this.objectIds);
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
        List<sx1> list = SearchClickEventMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SearchClickEventMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SearchClickEventMutation(queryId=" + this.queryId + ", indexName=" + this.indexName + ", objectIds=" + this.objectIds + ", positions=" + this.positions + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SearchClickEventMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SearchClickEvent($queryId: String!, $indexName: AlgoliaIndexName!, $objectIds: [String!]!, $positions: [Int!]!) { searchClickEvent(queryId: $queryId, indexName: $indexName, objectIds: $objectIds, positions: $positions) }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
