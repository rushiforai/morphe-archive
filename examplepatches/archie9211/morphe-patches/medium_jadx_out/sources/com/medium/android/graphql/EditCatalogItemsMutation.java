package com.medium.android.graphql;

import com.medium.android.graphql.adapter.EditCatalogItemsMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.EditCatalogItemsMutation_VariablesAdapter;
import com.medium.android.graphql.selections.EditCatalogItemsMutationSelections;
import com.medium.android.graphql.type.CatalogItemMutateOperationInput;
import com.medium.android.graphql.type.Mutation;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0010\b\u0086\b\u0018\u0000 12\b\u0012\u0004\u0012\u00020\u00020\u0001:\u00072345671B%\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\b\u001a\u00020\u0003¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\fJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\fJ'\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\fJ\u0016\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b!\u0010\fJ4\u0010\"\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\b\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b$\u0010\fJ\u0010\u0010&\u001a\u00020%HÖ\u0001¢\u0006\u0004\b&\u0010'J\u001a\u0010*\u001a\u00020\u00132\b\u0010)\u001a\u0004\u0018\u00010(HÖ\u0003¢\u0006\u0004\b*\u0010+R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010,\u001a\u0004\b-\u0010\fR\u001d\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010.\u001a\u0004\b/\u0010 R\u0017\u0010\b\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\b\u0010,\u001a\u0004\b0\u0010\f¨\u00068"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation;", "Lv78;", "Lcom/medium/android/graphql/EditCatalogItemsMutation$Data;", "", "catalogId", "", "Lcom/medium/android/graphql/type/CatalogItemMutateOperationInput;", "operations", "version", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Ljava/util/List;", "component3", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Lcom/medium/android/graphql/EditCatalogItemsMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Ljava/util/List;", "getOperations", "getVersion", "Companion", "Data", "EditCatalogItems", "OnEditCatalogItemsSuccess", "OnNotFound", "OnBadRequest", "OnForbidden", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class EditCatalogItemsMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "19dced0341741ce0a686939e3ee64ff4d5904758cf8978fd0374bb2b6c00c49f";
    public static final String OPERATION_NAME = "EditCatalogItemsMutation";
    private final String catalogId;
    private final List<CatalogItemMutateOperationInput> operations;
    private final String version;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/EditCatalogItemsMutation$EditCatalogItems;", "editCatalogItems", "<init>", "(Lcom/medium/android/graphql/EditCatalogItemsMutation$EditCatalogItems;)V", "component1", "()Lcom/medium/android/graphql/EditCatalogItemsMutation$EditCatalogItems;", "copy", "(Lcom/medium/android/graphql/EditCatalogItemsMutation$EditCatalogItems;)Lcom/medium/android/graphql/EditCatalogItemsMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/EditCatalogItemsMutation$EditCatalogItems;", "getEditCatalogItems", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final EditCatalogItems editCatalogItems;

        public Data(EditCatalogItems editCatalogItems) {
            editCatalogItems.getClass();
            this.editCatalogItems = editCatalogItems;
        }

        public static /* synthetic */ Data copy$default(Data data, EditCatalogItems editCatalogItems, int i, Object obj) {
            if ((i & 1) != 0) {
                editCatalogItems = data.editCatalogItems;
            }
            return data.copy(editCatalogItems);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final EditCatalogItems getEditCatalogItems() {
            return this.editCatalogItems;
        }

        public final Data copy(EditCatalogItems editCatalogItems) {
            editCatalogItems.getClass();
            return new Data(editCatalogItems);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.editCatalogItems, ((Data) other).editCatalogItems);
        }

        public final EditCatalogItems getEditCatalogItems() {
            return this.editCatalogItems;
        }

        public final int hashCode() {
            return this.editCatalogItems.hashCode();
        }

        public final String toString() {
            return "Data(editCatalogItems=" + this.editCatalogItems + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u000bHÆ\u0003JC\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation$EditCatalogItems;", "", "__typename", "", "onEditCatalogItemsSuccess", "Lcom/medium/android/graphql/EditCatalogItemsMutation$OnEditCatalogItemsSuccess;", "onNotFound", "Lcom/medium/android/graphql/EditCatalogItemsMutation$OnNotFound;", "onBadRequest", "Lcom/medium/android/graphql/EditCatalogItemsMutation$OnBadRequest;", "onForbidden", "Lcom/medium/android/graphql/EditCatalogItemsMutation$OnForbidden;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/EditCatalogItemsMutation$OnEditCatalogItemsSuccess;Lcom/medium/android/graphql/EditCatalogItemsMutation$OnNotFound;Lcom/medium/android/graphql/EditCatalogItemsMutation$OnBadRequest;Lcom/medium/android/graphql/EditCatalogItemsMutation$OnForbidden;)V", "get__typename", "()Ljava/lang/String;", "getOnEditCatalogItemsSuccess", "()Lcom/medium/android/graphql/EditCatalogItemsMutation$OnEditCatalogItemsSuccess;", "getOnNotFound", "()Lcom/medium/android/graphql/EditCatalogItemsMutation$OnNotFound;", "getOnBadRequest", "()Lcom/medium/android/graphql/EditCatalogItemsMutation$OnBadRequest;", "getOnForbidden", "()Lcom/medium/android/graphql/EditCatalogItemsMutation$OnForbidden;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class EditCatalogItems {
        private final String __typename;
        private final OnBadRequest onBadRequest;
        private final OnEditCatalogItemsSuccess onEditCatalogItemsSuccess;
        private final OnForbidden onForbidden;
        private final OnNotFound onNotFound;

        public EditCatalogItems(String str, OnEditCatalogItemsSuccess onEditCatalogItemsSuccess, OnNotFound onNotFound, OnBadRequest onBadRequest, OnForbidden onForbidden) {
            str.getClass();
            this.__typename = str;
            this.onEditCatalogItemsSuccess = onEditCatalogItemsSuccess;
            this.onNotFound = onNotFound;
            this.onBadRequest = onBadRequest;
            this.onForbidden = onForbidden;
        }

        public static /* synthetic */ EditCatalogItems copy$default(EditCatalogItems editCatalogItems, String str, OnEditCatalogItemsSuccess onEditCatalogItemsSuccess, OnNotFound onNotFound, OnBadRequest onBadRequest, OnForbidden onForbidden, int i, Object obj) {
            if ((i & 1) != 0) {
                str = editCatalogItems.__typename;
            }
            if ((i & 2) != 0) {
                onEditCatalogItemsSuccess = editCatalogItems.onEditCatalogItemsSuccess;
            }
            if ((i & 4) != 0) {
                onNotFound = editCatalogItems.onNotFound;
            }
            if ((i & 8) != 0) {
                onBadRequest = editCatalogItems.onBadRequest;
            }
            if ((i & 16) != 0) {
                onForbidden = editCatalogItems.onForbidden;
            }
            OnForbidden onForbidden2 = onForbidden;
            OnNotFound onNotFound2 = onNotFound;
            return editCatalogItems.copy(str, onEditCatalogItemsSuccess, onNotFound2, onBadRequest, onForbidden2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnEditCatalogItemsSuccess getOnEditCatalogItemsSuccess() {
            return this.onEditCatalogItemsSuccess;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        public final EditCatalogItems copy(String __typename, OnEditCatalogItemsSuccess onEditCatalogItemsSuccess, OnNotFound onNotFound, OnBadRequest onBadRequest, OnForbidden onForbidden) {
            __typename.getClass();
            return new EditCatalogItems(__typename, onEditCatalogItemsSuccess, onNotFound, onBadRequest, onForbidden);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof EditCatalogItems)) {
                return false;
            }
            EditCatalogItems editCatalogItems = (EditCatalogItems) other;
            return g76.L(this.__typename, editCatalogItems.__typename) && g76.L(this.onEditCatalogItemsSuccess, editCatalogItems.onEditCatalogItemsSuccess) && g76.L(this.onNotFound, editCatalogItems.onNotFound) && g76.L(this.onBadRequest, editCatalogItems.onBadRequest) && g76.L(this.onForbidden, editCatalogItems.onForbidden);
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnEditCatalogItemsSuccess getOnEditCatalogItemsSuccess() {
            return this.onEditCatalogItemsSuccess;
        }

        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnEditCatalogItemsSuccess onEditCatalogItemsSuccess = this.onEditCatalogItemsSuccess;
            int iHashCode2 = (iHashCode + (onEditCatalogItemsSuccess == null ? 0 : onEditCatalogItemsSuccess.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode3 = (iHashCode2 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode4 = (iHashCode3 + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnForbidden onForbidden = this.onForbidden;
            return iHashCode4 + (onForbidden != null ? onForbidden.hashCode() : 0);
        }

        public final String toString() {
            return "EditCatalogItems(__typename=" + this.__typename + ", onEditCatalogItemsSuccess=" + this.onEditCatalogItemsSuccess + ", onNotFound=" + this.onNotFound + ", onBadRequest=" + this.onBadRequest + ", onForbidden=" + this.onForbidden + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation$OnEditCatalogItemsSuccess;", "", "version", "", "<init>", "(Ljava/lang/String;)V", "getVersion", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnEditCatalogItemsSuccess {
        private final String version;

        public OnEditCatalogItemsSuccess(String str) {
            str.getClass();
            this.version = str;
        }

        public static /* synthetic */ OnEditCatalogItemsSuccess copy$default(OnEditCatalogItemsSuccess onEditCatalogItemsSuccess, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onEditCatalogItemsSuccess.version;
            }
            return onEditCatalogItemsSuccess.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getVersion() {
            return this.version;
        }

        public final OnEditCatalogItemsSuccess copy(String version) {
            version.getClass();
            return new OnEditCatalogItemsSuccess(version);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnEditCatalogItemsSuccess) && g76.L(this.version, ((OnEditCatalogItemsSuccess) other).version);
        }

        public final String getVersion() {
            return this.version;
        }

        public final int hashCode() {
            return this.version.hashCode();
        }

        public final String toString() {
            return ev6.x("OnEditCatalogItemsSuccess(version=", this.version, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation$OnForbidden;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnForbidden {
        private final String message;

        public OnForbidden(String str) {
            this.message = str;
        }

        public static OnForbidden copy$default(OnForbidden onForbidden, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onForbidden.message;
            }
            onForbidden.getClass();
            return new OnForbidden(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnForbidden copy(String message) {
            return new OnForbidden(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnForbidden) && g76.L(this.message, ((OnForbidden) other).message);
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
            return ev6.x("OnForbidden(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public EditCatalogItemsMutation(String str, List<CatalogItemMutateOperationInput> list, String str2) {
        str.getClass();
        list.getClass();
        str2.getClass();
        this.catalogId = str;
        this.operations = list;
        this.version = str2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ EditCatalogItemsMutation copy$default(EditCatalogItemsMutation editCatalogItemsMutation, String str, List list, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = editCatalogItemsMutation.catalogId;
        }
        if ((i & 2) != 0) {
            list = editCatalogItemsMutation.operations;
        }
        if ((i & 4) != 0) {
            str2 = editCatalogItemsMutation.version;
        }
        return editCatalogItemsMutation.copy(str, list, str2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(EditCatalogItemsMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    public final List<CatalogItemMutateOperationInput> component2() {
        return this.operations;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getVersion() {
        return this.version;
    }

    public final EditCatalogItemsMutation copy(String catalogId, List<CatalogItemMutateOperationInput> operations, String version) {
        catalogId.getClass();
        operations.getClass();
        version.getClass();
        return new EditCatalogItemsMutation(catalogId, operations, version);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation EditCatalogItemsMutation($catalogId: String!, $operations: [CatalogItemMutateOperationInput!]!, $version: String!) { editCatalogItems(catalogId: $catalogId, operations: $operations, version: $version) { __typename ... on EditCatalogItemsSuccess { version } ... on NotFound { message } ... on BadRequest { message } ... on Forbidden { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EditCatalogItemsMutation)) {
            return false;
        }
        EditCatalogItemsMutation editCatalogItemsMutation = (EditCatalogItemsMutation) other;
        return g76.L(this.catalogId, editCatalogItemsMutation.catalogId) && g76.L(this.operations, editCatalogItemsMutation.operations) && g76.L(this.version, editCatalogItemsMutation.version);
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final List<CatalogItemMutateOperationInput> getOperations() {
        return this.operations;
    }

    public final String getVersion() {
        return this.version;
    }

    public final int hashCode() {
        return this.version.hashCode() + wgd.p(this.catalogId.hashCode() * 31, 31, this.operations);
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
        List<sx1> list = EditCatalogItemsMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        EditCatalogItemsMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.catalogId;
        List<CatalogItemMutateOperationInput> list = this.operations;
        return ka1.v(b09.E("EditCatalogItemsMutation(catalogId=", str, ", operations=", ", version=", list), this.version, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemsMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation EditCatalogItemsMutation($catalogId: String!, $operations: [CatalogItemMutateOperationInput!]!, $version: String!) { editCatalogItems(catalogId: $catalogId, operations: $operations, version: $version) { __typename ... on EditCatalogItemsSuccess { version } ... on NotFound { message } ... on BadRequest { message } ... on Forbidden { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
