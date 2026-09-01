package com.medium.android.graphql;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import com.medium.android.graphql.adapter.EditCatalogItemAnnotationMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.EditCatalogItemAnnotationMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogItemData;
import com.medium.android.graphql.selections.EditCatalogItemAnnotationMutationSelections;
import com.medium.android.graphql.type.CatalogItemAnnotationInput;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 02\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006123450B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u000bJ\u0010\u0010\u001f\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J.\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010%\u001a\u00020$HÖ\u0001¢\u0006\u0004\b%\u0010&J\u001a\u0010)\u001a\u00020\u00122\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010+\u001a\u0004\b,\u0010\u000bR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010+\u001a\u0004\b-\u0010\u000bR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010.\u001a\u0004\b/\u0010 ¨\u00066"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation;", "Lv78;", "Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$Data;", "", "catalogId", "catalogItemId", "Lcom/medium/android/graphql/type/CatalogItemAnnotationInput;", "annotation", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogItemAnnotationInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "()Lcom/medium/android/graphql/type/CatalogItemAnnotationInput;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogItemAnnotationInput;)Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "getCatalogItemId", "Lcom/medium/android/graphql/type/CatalogItemAnnotationInput;", "getAnnotation", "Companion", "Data", EditCatalogItemAnnotationMutation.OPERATION_NAME, "OnBadRequest", "OnForbidden", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class EditCatalogItemAnnotationMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "4f0d10d118b922efa1eebb8e4dc9ae3f45fb511d09600ea9b924776206a7e91a";
    public static final String OPERATION_NAME = "EditCatalogItemAnnotation";
    private final CatalogItemAnnotationInput annotation;
    private final String catalogId;
    private final String catalogItemId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$EditCatalogItemAnnotation;", "editCatalogItemAnnotation", "<init>", "(Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$EditCatalogItemAnnotation;)V", "component1", "()Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$EditCatalogItemAnnotation;", "copy", "(Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$EditCatalogItemAnnotation;)Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$EditCatalogItemAnnotation;", "getEditCatalogItemAnnotation", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final EditCatalogItemAnnotation editCatalogItemAnnotation;

        public Data(EditCatalogItemAnnotation editCatalogItemAnnotation) {
            editCatalogItemAnnotation.getClass();
            this.editCatalogItemAnnotation = editCatalogItemAnnotation;
        }

        public static /* synthetic */ Data copy$default(Data data, EditCatalogItemAnnotation editCatalogItemAnnotation, int i, Object obj) {
            if ((i & 1) != 0) {
                editCatalogItemAnnotation = data.editCatalogItemAnnotation;
            }
            return data.copy(editCatalogItemAnnotation);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final EditCatalogItemAnnotation getEditCatalogItemAnnotation() {
            return this.editCatalogItemAnnotation;
        }

        public final Data copy(EditCatalogItemAnnotation editCatalogItemAnnotation) {
            editCatalogItemAnnotation.getClass();
            return new Data(editCatalogItemAnnotation);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.editCatalogItemAnnotation, ((Data) other).editCatalogItemAnnotation);
        }

        public final EditCatalogItemAnnotation getEditCatalogItemAnnotation() {
            return this.editCatalogItemAnnotation;
        }

        public final int hashCode() {
            return this.editCatalogItemAnnotation.hashCode();
        }

        public final String toString() {
            return "Data(editCatalogItemAnnotation=" + this.editCatalogItemAnnotation + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u000bHÆ\u0003JC\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$EditCatalogItemAnnotation;", "", "__typename", "", "onBadRequest", "Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnBadRequest;", "onForbidden", "Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnForbidden;", "onNotFound", "Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnNotFound;", "catalogItemData", "Lcom/medium/android/graphql/fragment/CatalogItemData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnBadRequest;Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnForbidden;Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnNotFound;Lcom/medium/android/graphql/fragment/CatalogItemData;)V", "get__typename", "()Ljava/lang/String;", "getOnBadRequest", "()Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnBadRequest;", "getOnForbidden", "()Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnForbidden;", "getOnNotFound", "()Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnNotFound;", "getCatalogItemData", "()Lcom/medium/android/graphql/fragment/CatalogItemData;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class EditCatalogItemAnnotation {
        private final String __typename;
        private final CatalogItemData catalogItemData;
        private final OnBadRequest onBadRequest;
        private final OnForbidden onForbidden;
        private final OnNotFound onNotFound;

        public EditCatalogItemAnnotation(String str, OnBadRequest onBadRequest, OnForbidden onForbidden, OnNotFound onNotFound, CatalogItemData catalogItemData) {
            str.getClass();
            this.__typename = str;
            this.onBadRequest = onBadRequest;
            this.onForbidden = onForbidden;
            this.onNotFound = onNotFound;
            this.catalogItemData = catalogItemData;
        }

        public static /* synthetic */ EditCatalogItemAnnotation copy$default(EditCatalogItemAnnotation editCatalogItemAnnotation, String str, OnBadRequest onBadRequest, OnForbidden onForbidden, OnNotFound onNotFound, CatalogItemData catalogItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = editCatalogItemAnnotation.__typename;
            }
            if ((i & 2) != 0) {
                onBadRequest = editCatalogItemAnnotation.onBadRequest;
            }
            if ((i & 4) != 0) {
                onForbidden = editCatalogItemAnnotation.onForbidden;
            }
            if ((i & 8) != 0) {
                onNotFound = editCatalogItemAnnotation.onNotFound;
            }
            if ((i & 16) != 0) {
                catalogItemData = editCatalogItemAnnotation.catalogItemData;
            }
            CatalogItemData catalogItemData2 = catalogItemData;
            OnForbidden onForbidden2 = onForbidden;
            return editCatalogItemAnnotation.copy(str, onBadRequest, onForbidden2, onNotFound, catalogItemData2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final CatalogItemData getCatalogItemData() {
            return this.catalogItemData;
        }

        public final EditCatalogItemAnnotation copy(String __typename, OnBadRequest onBadRequest, OnForbidden onForbidden, OnNotFound onNotFound, CatalogItemData catalogItemData) {
            __typename.getClass();
            return new EditCatalogItemAnnotation(__typename, onBadRequest, onForbidden, onNotFound, catalogItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof EditCatalogItemAnnotation)) {
                return false;
            }
            EditCatalogItemAnnotation editCatalogItemAnnotation = (EditCatalogItemAnnotation) other;
            return g76.L(this.__typename, editCatalogItemAnnotation.__typename) && g76.L(this.onBadRequest, editCatalogItemAnnotation.onBadRequest) && g76.L(this.onForbidden, editCatalogItemAnnotation.onForbidden) && g76.L(this.onNotFound, editCatalogItemAnnotation.onNotFound) && g76.L(this.catalogItemData, editCatalogItemAnnotation.catalogItemData);
        }

        public final CatalogItemData getCatalogItemData() {
            return this.catalogItemData;
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
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
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode2 = (iHashCode + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnForbidden onForbidden = this.onForbidden;
            int iHashCode3 = (iHashCode2 + (onForbidden == null ? 0 : onForbidden.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode4 = (iHashCode3 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            CatalogItemData catalogItemData = this.catalogItemData;
            return iHashCode4 + (catalogItemData != null ? catalogItemData.hashCode() : 0);
        }

        public final String toString() {
            return "EditCatalogItemAnnotation(__typename=" + this.__typename + PdtluglzAX.KSiL + this.onBadRequest + ", onForbidden=" + this.onForbidden + ", onNotFound=" + this.onNotFound + ", catalogItemData=" + this.catalogItemData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnForbidden;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public EditCatalogItemAnnotationMutation(String str, String str2, CatalogItemAnnotationInput catalogItemAnnotationInput) {
        str.getClass();
        str2.getClass();
        catalogItemAnnotationInput.getClass();
        this.catalogId = str;
        this.catalogItemId = str2;
        this.annotation = catalogItemAnnotationInput;
    }

    public static /* synthetic */ EditCatalogItemAnnotationMutation copy$default(EditCatalogItemAnnotationMutation editCatalogItemAnnotationMutation, String str, String str2, CatalogItemAnnotationInput catalogItemAnnotationInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = editCatalogItemAnnotationMutation.catalogId;
        }
        if ((i & 2) != 0) {
            str2 = editCatalogItemAnnotationMutation.catalogItemId;
        }
        if ((i & 4) != 0) {
            catalogItemAnnotationInput = editCatalogItemAnnotationMutation.annotation;
        }
        return editCatalogItemAnnotationMutation.copy(str, str2, catalogItemAnnotationInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(EditCatalogItemAnnotationMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getCatalogItemId() {
        return this.catalogItemId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final CatalogItemAnnotationInput getAnnotation() {
        return this.annotation;
    }

    public final EditCatalogItemAnnotationMutation copy(String catalogId, String catalogItemId, CatalogItemAnnotationInput annotation) {
        catalogId.getClass();
        catalogItemId.getClass();
        annotation.getClass();
        return new EditCatalogItemAnnotationMutation(catalogId, catalogItemId, annotation);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation EditCatalogItemAnnotation($catalogId: String!, $catalogItemId: String!, $annotation: CatalogItemAnnotationInput!) { editCatalogItemAnnotation(catalogId: $catalogId, catalogItemId: $catalogItemId, annotation: $annotation) { __typename ...CatalogItemData ... on BadRequest { message } ... on Forbidden { message } ... on NotFound { message } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EditCatalogItemAnnotationMutation)) {
            return false;
        }
        EditCatalogItemAnnotationMutation editCatalogItemAnnotationMutation = (EditCatalogItemAnnotationMutation) other;
        return g76.L(this.catalogId, editCatalogItemAnnotationMutation.catalogId) && g76.L(this.catalogItemId, editCatalogItemAnnotationMutation.catalogItemId) && g76.L(this.annotation, editCatalogItemAnnotationMutation.annotation);
    }

    public final CatalogItemAnnotationInput getAnnotation() {
        return this.annotation;
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final String getCatalogItemId() {
        return this.catalogItemId;
    }

    public final int hashCode() {
        return this.annotation.hashCode() + wgd.o(this.catalogId.hashCode() * 31, 31, this.catalogItemId);
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
        List<sx1> list = EditCatalogItemAnnotationMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        EditCatalogItemAnnotationMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.catalogId;
        String str2 = this.catalogItemId;
        CatalogItemAnnotationInput catalogItemAnnotationInput = this.annotation;
        StringBuilder sbU = y30.u(JWcjNoweKCnTr.CSyzLNnlc, str, ", catalogItemId=", str2, ", annotation=");
        sbU.append(catalogItemAnnotationInput);
        sbU.append(")");
        return sbU.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/EditCatalogItemAnnotationMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation EditCatalogItemAnnotation($catalogId: String!, $catalogItemId: String!, $annotation: CatalogItemAnnotationInput!) { editCatalogItemAnnotation(catalogId: $catalogId, catalogItemId: $catalogItemId, annotation: $annotation) { __typename ...CatalogItemData ... on BadRequest { message } ... on Forbidden { message } ... on NotFound { message } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
