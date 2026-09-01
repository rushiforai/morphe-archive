package com.medium.android.graphql;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.medium.android.graphql.adapter.AddItemToPredefinedCatalogMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.AddItemToPredefinedCatalogMutation_VariablesAdapter;
import com.medium.android.graphql.selections.AddItemToPredefinedCatalogMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.PredefinedCatalogAddOperationInput;
import com.medium.android.graphql.type.PredefinedCatalogType;
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
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 /2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007012345/B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\n\u001a\u00020\tH\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\tH\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\tH\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J$\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010%\u001a\u00020$HÖ\u0001¢\u0006\u0004\b%\u0010&J\u001a\u0010)\u001a\u00020\u00122\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010+\u001a\u0004\b,\u0010\u001eR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010-\u001a\u0004\b.\u0010 ¨\u00066"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation;", "Lv78;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$Data;", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "type", "Lcom/medium/android/graphql/type/PredefinedCatalogAddOperationInput;", "operation", "<init>", "(Lcom/medium/android/graphql/type/PredefinedCatalogType;Lcom/medium/android/graphql/type/PredefinedCatalogAddOperationInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "component2", "()Lcom/medium/android/graphql/type/PredefinedCatalogAddOperationInput;", "copy", "(Lcom/medium/android/graphql/type/PredefinedCatalogType;Lcom/medium/android/graphql/type/PredefinedCatalogAddOperationInput;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getType", "Lcom/medium/android/graphql/type/PredefinedCatalogAddOperationInput;", "getOperation", "Companion", "Data", "AddToPredefinedCatalog", "OnAddToPredefinedCatalogSucces", "InsertedItem", "OnBadRequest", "OnUnauthorized", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class AddItemToPredefinedCatalogMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "8cefd41ff6747f507265c975a99a28f23b3625970498e01677d51d9f47e04443";
    public static final String OPERATION_NAME = "AddItemToPredefinedCatalogMutation";
    private final PredefinedCatalogAddOperationInput operation;
    private final PredefinedCatalogType type;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;", "", "__typename", "", "onAddToPredefinedCatalogSucces", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnAddToPredefinedCatalogSucces;", "onBadRequest", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnBadRequest;", "onUnauthorized", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnUnauthorized;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnAddToPredefinedCatalogSucces;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnBadRequest;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnUnauthorized;)V", "get__typename", "()Ljava/lang/String;", "getOnAddToPredefinedCatalogSucces", "()Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnAddToPredefinedCatalogSucces;", "getOnBadRequest", "()Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnBadRequest;", "getOnUnauthorized", "()Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnUnauthorized;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class AddToPredefinedCatalog {
        private final String __typename;
        private final OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSucces;
        private final OnBadRequest onBadRequest;
        private final OnUnauthorized onUnauthorized;

        public AddToPredefinedCatalog(String str, OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSucces, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized) {
            str.getClass();
            this.__typename = str;
            this.onAddToPredefinedCatalogSucces = onAddToPredefinedCatalogSucces;
            this.onBadRequest = onBadRequest;
            this.onUnauthorized = onUnauthorized;
        }

        public static /* synthetic */ AddToPredefinedCatalog copy$default(AddToPredefinedCatalog addToPredefinedCatalog, String str, OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSucces, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized, int i, Object obj) {
            if ((i & 1) != 0) {
                str = addToPredefinedCatalog.__typename;
            }
            if ((i & 2) != 0) {
                onAddToPredefinedCatalogSucces = addToPredefinedCatalog.onAddToPredefinedCatalogSucces;
            }
            if ((i & 4) != 0) {
                onBadRequest = addToPredefinedCatalog.onBadRequest;
            }
            if ((i & 8) != 0) {
                onUnauthorized = addToPredefinedCatalog.onUnauthorized;
            }
            return addToPredefinedCatalog.copy(str, onAddToPredefinedCatalogSucces, onBadRequest, onUnauthorized);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnAddToPredefinedCatalogSucces getOnAddToPredefinedCatalogSucces() {
            return this.onAddToPredefinedCatalogSucces;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final AddToPredefinedCatalog copy(String __typename, OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSucces, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized) {
            __typename.getClass();
            return new AddToPredefinedCatalog(__typename, onAddToPredefinedCatalogSucces, onBadRequest, onUnauthorized);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AddToPredefinedCatalog)) {
                return false;
            }
            AddToPredefinedCatalog addToPredefinedCatalog = (AddToPredefinedCatalog) other;
            return g76.L(this.__typename, addToPredefinedCatalog.__typename) && g76.L(this.onAddToPredefinedCatalogSucces, addToPredefinedCatalog.onAddToPredefinedCatalogSucces) && g76.L(this.onBadRequest, addToPredefinedCatalog.onBadRequest) && g76.L(this.onUnauthorized, addToPredefinedCatalog.onUnauthorized);
        }

        public final OnAddToPredefinedCatalogSucces getOnAddToPredefinedCatalogSucces() {
            return this.onAddToPredefinedCatalogSucces;
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSucces = this.onAddToPredefinedCatalogSucces;
            int iHashCode2 = (iHashCode + (onAddToPredefinedCatalogSucces == null ? 0 : onAddToPredefinedCatalogSucces.hashCode())) * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode3 = (iHashCode2 + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            return iHashCode3 + (onUnauthorized != null ? onUnauthorized.hashCode() : 0);
        }

        public final String toString() {
            return "AddToPredefinedCatalog(__typename=" + this.__typename + ", onAddToPredefinedCatalogSucces=" + this.onAddToPredefinedCatalogSucces + ", onBadRequest=" + this.onBadRequest + ", onUnauthorized=" + this.onUnauthorized + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;", "addToPredefinedCatalog", "<init>", "(Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;)V", "component1", "()Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;", "copy", "(Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;", "getAddToPredefinedCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final AddToPredefinedCatalog addToPredefinedCatalog;

        public Data(AddToPredefinedCatalog addToPredefinedCatalog) {
            addToPredefinedCatalog.getClass();
            this.addToPredefinedCatalog = addToPredefinedCatalog;
        }

        public static /* synthetic */ Data copy$default(Data data, AddToPredefinedCatalog addToPredefinedCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                addToPredefinedCatalog = data.addToPredefinedCatalog;
            }
            return data.copy(addToPredefinedCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final AddToPredefinedCatalog getAddToPredefinedCatalog() {
            return this.addToPredefinedCatalog;
        }

        public final Data copy(AddToPredefinedCatalog addToPredefinedCatalog) {
            addToPredefinedCatalog.getClass();
            return new Data(addToPredefinedCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.addToPredefinedCatalog, ((Data) other).addToPredefinedCatalog);
        }

        public final AddToPredefinedCatalog getAddToPredefinedCatalog() {
            return this.addToPredefinedCatalog;
        }

        public final int hashCode() {
            return this.addToPredefinedCatalog.hashCode();
        }

        public final String toString() {
            return "Data(addToPredefinedCatalog=" + this.addToPredefinedCatalog + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J'\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$InsertedItem;", "", "__typename", "", "catalogId", "catalogItemId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getCatalogId", "getCatalogItemId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InsertedItem {
        private final String __typename;
        private final String catalogId;
        private final String catalogItemId;

        public InsertedItem(String str, String str2, String str3) {
            b09.I(str, str2, str3);
            this.__typename = str;
            this.catalogId = str2;
            this.catalogItemId = str3;
        }

        public static /* synthetic */ InsertedItem copy$default(InsertedItem insertedItem, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = insertedItem.__typename;
            }
            if ((i & 2) != 0) {
                str2 = insertedItem.catalogId;
            }
            if ((i & 4) != 0) {
                str3 = insertedItem.catalogItemId;
            }
            return insertedItem.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getCatalogId() {
            return this.catalogId;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getCatalogItemId() {
            return this.catalogItemId;
        }

        public final InsertedItem copy(String __typename, String catalogId, String catalogItemId) {
            __typename.getClass();
            catalogId.getClass();
            catalogItemId.getClass();
            return new InsertedItem(__typename, catalogId, catalogItemId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InsertedItem)) {
                return false;
            }
            InsertedItem insertedItem = (InsertedItem) other;
            return g76.L(this.__typename, insertedItem.__typename) && g76.L(this.catalogId, insertedItem.catalogId) && g76.L(this.catalogItemId, insertedItem.catalogItemId);
        }

        public final String getCatalogId() {
            return this.catalogId;
        }

        public final String getCatalogItemId() {
            return this.catalogItemId;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.catalogItemId.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.catalogId);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.catalogId;
            return ka1.v(y30.u("InsertedItem(__typename=", str, ", catalogId=", str2, ", catalogItemId="), this.catalogItemId, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnAddToPredefinedCatalogSucces;", "", "version", "", "insertedItem", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$InsertedItem;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$InsertedItem;)V", "getVersion", "()Ljava/lang/String;", "getInsertedItem", "()Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$InsertedItem;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAddToPredefinedCatalogSucces {
        private final InsertedItem insertedItem;
        private final String version;

        public OnAddToPredefinedCatalogSucces(String str, InsertedItem insertedItem) {
            str.getClass();
            insertedItem.getClass();
            this.version = str;
            this.insertedItem = insertedItem;
        }

        public static /* synthetic */ OnAddToPredefinedCatalogSucces copy$default(OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSucces, String str, InsertedItem insertedItem, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onAddToPredefinedCatalogSucces.version;
            }
            if ((i & 2) != 0) {
                insertedItem = onAddToPredefinedCatalogSucces.insertedItem;
            }
            return onAddToPredefinedCatalogSucces.copy(str, insertedItem);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getVersion() {
            return this.version;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final InsertedItem getInsertedItem() {
            return this.insertedItem;
        }

        public final OnAddToPredefinedCatalogSucces copy(String version, InsertedItem insertedItem) {
            version.getClass();
            insertedItem.getClass();
            return new OnAddToPredefinedCatalogSucces(version, insertedItem);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnAddToPredefinedCatalogSucces)) {
                return false;
            }
            OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSucces = (OnAddToPredefinedCatalogSucces) other;
            return g76.L(this.version, onAddToPredefinedCatalogSucces.version) && g76.L(this.insertedItem, onAddToPredefinedCatalogSucces.insertedItem);
        }

        public final InsertedItem getInsertedItem() {
            return this.insertedItem;
        }

        public final String getVersion() {
            return this.version;
        }

        public final int hashCode() {
            return this.insertedItem.hashCode() + (this.version.hashCode() * 31);
        }

        public final String toString() {
            return "OnAddToPredefinedCatalogSucces(version=" + this.version + ", insertedItem=" + this.insertedItem + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBadRequest {
        private final String message;

        public OnBadRequest(String str) {
            this.message = str;
        }

        public static OnBadRequest copy$default(OnBadRequest onBadRequest, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBadRequest.message;
            }
            onBadRequest.getClass();
            return new OnBadRequest(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBadRequest copy(String message) {
            return new OnBadRequest(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBadRequest) && g76.L(this.message, ((OnBadRequest) other).message);
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
            return ev6.x("OnBadRequest(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public AddItemToPredefinedCatalogMutation(PredefinedCatalogType predefinedCatalogType, PredefinedCatalogAddOperationInput predefinedCatalogAddOperationInput) {
        predefinedCatalogType.getClass();
        predefinedCatalogAddOperationInput.getClass();
        this.type = predefinedCatalogType;
        this.operation = predefinedCatalogAddOperationInput;
    }

    public static /* synthetic */ AddItemToPredefinedCatalogMutation copy$default(AddItemToPredefinedCatalogMutation addItemToPredefinedCatalogMutation, PredefinedCatalogType predefinedCatalogType, PredefinedCatalogAddOperationInput predefinedCatalogAddOperationInput, int i, Object obj) {
        if ((i & 1) != 0) {
            predefinedCatalogType = addItemToPredefinedCatalogMutation.type;
        }
        if ((i & 2) != 0) {
            predefinedCatalogAddOperationInput = addItemToPredefinedCatalogMutation.operation;
        }
        return addItemToPredefinedCatalogMutation.copy(predefinedCatalogType, predefinedCatalogAddOperationInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(AddItemToPredefinedCatalogMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final PredefinedCatalogType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final PredefinedCatalogAddOperationInput getOperation() {
        return this.operation;
    }

    public final AddItemToPredefinedCatalogMutation copy(PredefinedCatalogType type, PredefinedCatalogAddOperationInput operation) {
        type.getClass();
        operation.getClass();
        return new AddItemToPredefinedCatalogMutation(type, operation);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation AddItemToPredefinedCatalogMutation($type: PredefinedCatalogType!, $operation: PredefinedCatalogAddOperationInput!) { addToPredefinedCatalog(type: $type, operation: $operation) { __typename ... on AddToPredefinedCatalogSucces { version insertedItem { __typename catalogId catalogItemId } } ... on BadRequest { message } ... on Unauthorized { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AddItemToPredefinedCatalogMutation)) {
            return false;
        }
        AddItemToPredefinedCatalogMutation addItemToPredefinedCatalogMutation = (AddItemToPredefinedCatalogMutation) other;
        return this.type == addItemToPredefinedCatalogMutation.type && g76.L(this.operation, addItemToPredefinedCatalogMutation.operation);
    }

    public final PredefinedCatalogAddOperationInput getOperation() {
        return this.operation;
    }

    public final PredefinedCatalogType getType() {
        return this.type;
    }

    public final int hashCode() {
        return this.operation.hashCode() + (this.type.hashCode() * 31);
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = AddItemToPredefinedCatalogMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        AddItemToPredefinedCatalogMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "AddItemToPredefinedCatalogMutation(type=" + this.type + ", operation=" + this.operation + ")";
    }

    @Override // defpackage.hv8
    public final String name() {
        return aJzfoQ.GTvJ;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation AddItemToPredefinedCatalogMutation($type: PredefinedCatalogType!, $operation: PredefinedCatalogAddOperationInput!) { addToPredefinedCatalog(type: $type, operation: $operation) { __typename ... on AddToPredefinedCatalogSucces { version insertedItem { __typename catalogId catalogItemId } } ... on BadRequest { message } ... on Unauthorized { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
