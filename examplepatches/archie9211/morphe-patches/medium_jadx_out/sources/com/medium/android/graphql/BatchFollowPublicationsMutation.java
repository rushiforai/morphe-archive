package com.medium.android.graphql;

import com.medium.android.graphql.adapter.BatchFollowPublicationsMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.BatchFollowPublicationsMutation_VariablesAdapter;
import com.medium.android.graphql.selections.BatchFollowPublicationsMutationSelections;
import com.medium.android.graphql.type.BatchFollowPublicationsInput;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.b09;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\n\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004*+,)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006-"}, d2 = {"Lcom/medium/android/graphql/BatchFollowPublicationsMutation;", "Lv78;", "Lcom/medium/android/graphql/BatchFollowPublicationsMutation$Data;", "Lcom/medium/android/graphql/type/BatchFollowPublicationsInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/BatchFollowPublicationsInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/BatchFollowPublicationsInput;", "copy", "(Lcom/medium/android/graphql/type/BatchFollowPublicationsInput;)Lcom/medium/android/graphql/BatchFollowPublicationsMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/BatchFollowPublicationsInput;", "getInput", "Companion", "Data", "BatchFollowPublications", "OnMutationSuccess", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class BatchFollowPublicationsMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "789467ccb572f4c871de71d88caef9e3228bf4e2ec286d49ee12e001c931596f";
    public static final String OPERATION_NAME = "BatchFollowPublicationsMutation";
    private final BatchFollowPublicationsInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/BatchFollowPublicationsMutation$BatchFollowPublications;", "", "__typename", "", "onMutationSuccess", "Lcom/medium/android/graphql/BatchFollowPublicationsMutation$OnMutationSuccess;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/BatchFollowPublicationsMutation$OnMutationSuccess;)V", "get__typename", "()Ljava/lang/String;", "getOnMutationSuccess", "()Lcom/medium/android/graphql/BatchFollowPublicationsMutation$OnMutationSuccess;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BatchFollowPublications {
        private final String __typename;
        private final OnMutationSuccess onMutationSuccess;

        public BatchFollowPublications(String str, OnMutationSuccess onMutationSuccess) {
            str.getClass();
            this.__typename = str;
            this.onMutationSuccess = onMutationSuccess;
        }

        public static /* synthetic */ BatchFollowPublications copy$default(BatchFollowPublications batchFollowPublications, String str, OnMutationSuccess onMutationSuccess, int i, Object obj) {
            if ((i & 1) != 0) {
                str = batchFollowPublications.__typename;
            }
            if ((i & 2) != 0) {
                onMutationSuccess = batchFollowPublications.onMutationSuccess;
            }
            return batchFollowPublications.copy(str, onMutationSuccess);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnMutationSuccess getOnMutationSuccess() {
            return this.onMutationSuccess;
        }

        public final BatchFollowPublications copy(String __typename, OnMutationSuccess onMutationSuccess) {
            __typename.getClass();
            return new BatchFollowPublications(__typename, onMutationSuccess);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BatchFollowPublications)) {
                return false;
            }
            BatchFollowPublications batchFollowPublications = (BatchFollowPublications) other;
            return g76.L(this.__typename, batchFollowPublications.__typename) && g76.L(this.onMutationSuccess, batchFollowPublications.onMutationSuccess);
        }

        public final OnMutationSuccess getOnMutationSuccess() {
            return this.onMutationSuccess;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnMutationSuccess onMutationSuccess = this.onMutationSuccess;
            return iHashCode + (onMutationSuccess == null ? 0 : onMutationSuccess.hashCode());
        }

        public final String toString() {
            return "BatchFollowPublications(__typename=" + this.__typename + ", onMutationSuccess=" + this.onMutationSuccess + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/BatchFollowPublicationsMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/BatchFollowPublicationsMutation$BatchFollowPublications;", "batchFollowPublications", "<init>", "(Lcom/medium/android/graphql/BatchFollowPublicationsMutation$BatchFollowPublications;)V", "component1", "()Lcom/medium/android/graphql/BatchFollowPublicationsMutation$BatchFollowPublications;", "copy", "(Lcom/medium/android/graphql/BatchFollowPublicationsMutation$BatchFollowPublications;)Lcom/medium/android/graphql/BatchFollowPublicationsMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/BatchFollowPublicationsMutation$BatchFollowPublications;", "getBatchFollowPublications", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final BatchFollowPublications batchFollowPublications;

        public Data(BatchFollowPublications batchFollowPublications) {
            batchFollowPublications.getClass();
            this.batchFollowPublications = batchFollowPublications;
        }

        public static /* synthetic */ Data copy$default(Data data, BatchFollowPublications batchFollowPublications, int i, Object obj) {
            if ((i & 1) != 0) {
                batchFollowPublications = data.batchFollowPublications;
            }
            return data.copy(batchFollowPublications);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final BatchFollowPublications getBatchFollowPublications() {
            return this.batchFollowPublications;
        }

        public final Data copy(BatchFollowPublications batchFollowPublications) {
            batchFollowPublications.getClass();
            return new Data(batchFollowPublications);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.batchFollowPublications, ((Data) other).batchFollowPublications);
        }

        public final BatchFollowPublications getBatchFollowPublications() {
            return this.batchFollowPublications;
        }

        public final int hashCode() {
            return this.batchFollowPublications.hashCode();
        }

        public final String toString() {
            return "Data(batchFollowPublications=" + this.batchFollowPublications + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u00032\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/BatchFollowPublicationsMutation$OnMutationSuccess;", "", "success", "", "<init>", "(Z)V", "getSuccess", "()Z", "component1", "copy", "equals", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMutationSuccess {
        private final boolean success;

        public OnMutationSuccess(boolean z) {
            this.success = z;
        }

        public static OnMutationSuccess copy$default(OnMutationSuccess onMutationSuccess, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                z = onMutationSuccess.success;
            }
            onMutationSuccess.getClass();
            return new OnMutationSuccess(z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final boolean getSuccess() {
            return this.success;
        }

        public final OnMutationSuccess copy(boolean success) {
            return new OnMutationSuccess(success);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnMutationSuccess) && this.success == ((OnMutationSuccess) other).success;
        }

        public final boolean getSuccess() {
            return this.success;
        }

        public final int hashCode() {
            return this.success ? 1231 : 1237;
        }

        public final String toString() {
            return b09.z("OnMutationSuccess(success=", ")", this.success);
        }
    }

    public BatchFollowPublicationsMutation(BatchFollowPublicationsInput batchFollowPublicationsInput) {
        batchFollowPublicationsInput.getClass();
        this.input = batchFollowPublicationsInput;
    }

    public static /* synthetic */ BatchFollowPublicationsMutation copy$default(BatchFollowPublicationsMutation batchFollowPublicationsMutation, BatchFollowPublicationsInput batchFollowPublicationsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            batchFollowPublicationsInput = batchFollowPublicationsMutation.input;
        }
        return batchFollowPublicationsMutation.copy(batchFollowPublicationsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(BatchFollowPublicationsMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final BatchFollowPublicationsInput getInput() {
        return this.input;
    }

    public final BatchFollowPublicationsMutation copy(BatchFollowPublicationsInput input) {
        input.getClass();
        return new BatchFollowPublicationsMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation BatchFollowPublicationsMutation($input: BatchFollowPublicationsInput!) { batchFollowPublications(input: $input) { __typename ... on MutationSuccess { success } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof BatchFollowPublicationsMutation) && g76.L(this.input, ((BatchFollowPublicationsMutation) other).input);
    }

    public final BatchFollowPublicationsInput getInput() {
        return this.input;
    }

    public final int hashCode() {
        return this.input.hashCode();
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
        List<sx1> list = BatchFollowPublicationsMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        BatchFollowPublicationsMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "BatchFollowPublicationsMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/BatchFollowPublicationsMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation BatchFollowPublicationsMutation($input: BatchFollowPublicationsInput!) { batchFollowPublications(input: $input) { __typename ... on MutationSuccess { success } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
