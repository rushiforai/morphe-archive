package com.medium.android.graphql;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.graphql.adapter.SubmitPostToPublicationMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SubmitPostToPublicationMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SubmitPostToPublicationMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.PublicationSubmissionErrorReason;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import com.medium.android.graphql.type.SubmitToPublicationInput;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005*+,-)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006."}, d2 = {"Lcom/medium/android/graphql/SubmitPostToPublicationMutation;", "Lv78;", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$Data;", "Lcom/medium/android/graphql/type/SubmitToPublicationInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/SubmitToPublicationInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/SubmitToPublicationInput;", "copy", "(Lcom/medium/android/graphql/type/SubmitToPublicationInput;)Lcom/medium/android/graphql/SubmitPostToPublicationMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/SubmitToPublicationInput;", "getInput", "Companion", "Data", "SubmitToPublication", "OnPublicationSubmission", "OnPublicationSubmissionError", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SubmitPostToPublicationMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "27dac615cf0a96e404846a403a0b8c8324f291cb76d88753994eb07a4bf5a8a8";
    public static final String OPERATION_NAME = "SubmitPostToPublicationMutation";
    private final SubmitToPublicationInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SubmitPostToPublicationMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;", "submitToPublication", "<init>", "(Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;)V", "component1", "()Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;", "copy", "(Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;)Lcom/medium/android/graphql/SubmitPostToPublicationMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;", "getSubmitToPublication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SubmitToPublication submitToPublication;

        public Data(SubmitToPublication submitToPublication) {
            this.submitToPublication = submitToPublication;
        }

        public static Data copy$default(Data data, SubmitToPublication submitToPublication, int i, Object obj) {
            if ((i & 1) != 0) {
                submitToPublication = data.submitToPublication;
            }
            data.getClass();
            return new Data(submitToPublication);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SubmitToPublication getSubmitToPublication() {
            return this.submitToPublication;
        }

        public final Data copy(SubmitToPublication submitToPublication) {
            return new Data(submitToPublication);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.submitToPublication, ((Data) other).submitToPublication);
        }

        public final SubmitToPublication getSubmitToPublication() {
            return this.submitToPublication;
        }

        public final int hashCode() {
            SubmitToPublication submitToPublication = this.submitToPublication;
            if (submitToPublication == null) {
                return 0;
            }
            return submitToPublication.hashCode();
        }

        public final String toString() {
            return "Data(submitToPublication=" + this.submitToPublication + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmission;", "", "id", "", "status", "Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PublicationSubmissionStatus;)V", "getId", "()Ljava/lang/String;", "getStatus", "()Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationSubmission {
        private final String id;
        private final PublicationSubmissionStatus status;

        public OnPublicationSubmission(String str, PublicationSubmissionStatus publicationSubmissionStatus) {
            str.getClass();
            publicationSubmissionStatus.getClass();
            this.id = str;
            this.status = publicationSubmissionStatus;
        }

        public static /* synthetic */ OnPublicationSubmission copy$default(OnPublicationSubmission onPublicationSubmission, String str, PublicationSubmissionStatus publicationSubmissionStatus, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPublicationSubmission.id;
            }
            if ((i & 2) != 0) {
                publicationSubmissionStatus = onPublicationSubmission.status;
            }
            return onPublicationSubmission.copy(str, publicationSubmissionStatus);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationSubmissionStatus getStatus() {
            return this.status;
        }

        public final OnPublicationSubmission copy(String id, PublicationSubmissionStatus status) {
            id.getClass();
            status.getClass();
            return new OnPublicationSubmission(id, status);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPublicationSubmission)) {
                return false;
            }
            OnPublicationSubmission onPublicationSubmission = (OnPublicationSubmission) other;
            return g76.L(this.id, onPublicationSubmission.id) && this.status == onPublicationSubmission.status;
        }

        public final String getId() {
            return this.id;
        }

        public final PublicationSubmissionStatus getStatus() {
            return this.status;
        }

        public final int hashCode() {
            return this.status.hashCode() + (this.id.hashCode() * 31);
        }

        public final String toString() {
            return "OnPublicationSubmission(id=" + this.id + ", status=" + this.status + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmissionError;", "", "reason", "Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason;", "<init>", "(Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason;)V", "getReason", "()Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationSubmissionError {
        private final PublicationSubmissionErrorReason reason;

        public OnPublicationSubmissionError(PublicationSubmissionErrorReason publicationSubmissionErrorReason) {
            publicationSubmissionErrorReason.getClass();
            this.reason = publicationSubmissionErrorReason;
        }

        public static /* synthetic */ OnPublicationSubmissionError copy$default(OnPublicationSubmissionError onPublicationSubmissionError, PublicationSubmissionErrorReason publicationSubmissionErrorReason, int i, Object obj) {
            if ((i & 1) != 0) {
                publicationSubmissionErrorReason = onPublicationSubmissionError.reason;
            }
            return onPublicationSubmissionError.copy(publicationSubmissionErrorReason);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PublicationSubmissionErrorReason getReason() {
            return this.reason;
        }

        public final OnPublicationSubmissionError copy(PublicationSubmissionErrorReason reason) {
            reason.getClass();
            return new OnPublicationSubmissionError(reason);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPublicationSubmissionError) && this.reason == ((OnPublicationSubmissionError) other).reason;
        }

        public final PublicationSubmissionErrorReason getReason() {
            return this.reason;
        }

        public final int hashCode() {
            return this.reason.hashCode();
        }

        public final String toString() {
            return "OnPublicationSubmissionError(reason=" + this.reason + ZVsviyDAr.BBkfHqSzYhRvX;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;", "", "__typename", "", "onPublicationSubmission", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmission;", "onPublicationSubmissionError", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmissionError;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmission;Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmissionError;)V", "get__typename", "()Ljava/lang/String;", "getOnPublicationSubmission", "()Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmission;", "getOnPublicationSubmissionError", "()Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmissionError;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SubmitToPublication {
        private final String __typename;
        private final OnPublicationSubmission onPublicationSubmission;
        private final OnPublicationSubmissionError onPublicationSubmissionError;

        public SubmitToPublication(String str, OnPublicationSubmission onPublicationSubmission, OnPublicationSubmissionError onPublicationSubmissionError) {
            str.getClass();
            this.__typename = str;
            this.onPublicationSubmission = onPublicationSubmission;
            this.onPublicationSubmissionError = onPublicationSubmissionError;
        }

        public static /* synthetic */ SubmitToPublication copy$default(SubmitToPublication submitToPublication, String str, OnPublicationSubmission onPublicationSubmission, OnPublicationSubmissionError onPublicationSubmissionError, int i, Object obj) {
            if ((i & 1) != 0) {
                str = submitToPublication.__typename;
            }
            if ((i & 2) != 0) {
                onPublicationSubmission = submitToPublication.onPublicationSubmission;
            }
            if ((i & 4) != 0) {
                onPublicationSubmissionError = submitToPublication.onPublicationSubmissionError;
            }
            return submitToPublication.copy(str, onPublicationSubmission, onPublicationSubmissionError);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPublicationSubmission getOnPublicationSubmission() {
            return this.onPublicationSubmission;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnPublicationSubmissionError getOnPublicationSubmissionError() {
            return this.onPublicationSubmissionError;
        }

        public final SubmitToPublication copy(String __typename, OnPublicationSubmission onPublicationSubmission, OnPublicationSubmissionError onPublicationSubmissionError) {
            __typename.getClass();
            return new SubmitToPublication(__typename, onPublicationSubmission, onPublicationSubmissionError);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SubmitToPublication)) {
                return false;
            }
            SubmitToPublication submitToPublication = (SubmitToPublication) other;
            return g76.L(this.__typename, submitToPublication.__typename) && g76.L(this.onPublicationSubmission, submitToPublication.onPublicationSubmission) && g76.L(this.onPublicationSubmissionError, submitToPublication.onPublicationSubmissionError);
        }

        public final OnPublicationSubmission getOnPublicationSubmission() {
            return this.onPublicationSubmission;
        }

        public final OnPublicationSubmissionError getOnPublicationSubmissionError() {
            return this.onPublicationSubmissionError;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPublicationSubmission onPublicationSubmission = this.onPublicationSubmission;
            int iHashCode2 = (iHashCode + (onPublicationSubmission == null ? 0 : onPublicationSubmission.hashCode())) * 31;
            OnPublicationSubmissionError onPublicationSubmissionError = this.onPublicationSubmissionError;
            return iHashCode2 + (onPublicationSubmissionError != null ? onPublicationSubmissionError.hashCode() : 0);
        }

        public final String toString() {
            return "SubmitToPublication(__typename=" + this.__typename + ", onPublicationSubmission=" + this.onPublicationSubmission + ", onPublicationSubmissionError=" + this.onPublicationSubmissionError + ")";
        }
    }

    public SubmitPostToPublicationMutation(SubmitToPublicationInput submitToPublicationInput) {
        submitToPublicationInput.getClass();
        this.input = submitToPublicationInput;
    }

    public static /* synthetic */ SubmitPostToPublicationMutation copy$default(SubmitPostToPublicationMutation submitPostToPublicationMutation, SubmitToPublicationInput submitToPublicationInput, int i, Object obj) {
        if ((i & 1) != 0) {
            submitToPublicationInput = submitPostToPublicationMutation.input;
        }
        return submitPostToPublicationMutation.copy(submitToPublicationInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SubmitPostToPublicationMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final SubmitToPublicationInput getInput() {
        return this.input;
    }

    public final SubmitPostToPublicationMutation copy(SubmitToPublicationInput input) {
        input.getClass();
        return new SubmitPostToPublicationMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SubmitPostToPublicationMutation($input: SubmitToPublicationInput!) { submitToPublication(input: $input) { __typename ... on PublicationSubmission { id status } ... on PublicationSubmissionError { reason } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof SubmitPostToPublicationMutation) && g76.L(this.input, ((SubmitPostToPublicationMutation) other).input);
    }

    public final SubmitToPublicationInput getInput() {
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
        List<sx1> list = SubmitPostToPublicationMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SubmitPostToPublicationMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SubmitPostToPublicationMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SubmitPostToPublicationMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SubmitPostToPublicationMutation($input: SubmitToPublicationInput!) { submitToPublication(input: $input) { __typename ... on PublicationSubmission { id status } ... on PublicationSubmissionError { reason } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
