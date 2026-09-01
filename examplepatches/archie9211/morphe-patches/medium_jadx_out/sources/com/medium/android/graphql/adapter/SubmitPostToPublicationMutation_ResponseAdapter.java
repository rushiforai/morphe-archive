package com.medium.android.graphql.adapter;

import com.medium.android.graphql.SubmitPostToPublicationMutation;
import com.medium.android.graphql.type.PublicationSubmissionErrorReason;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import com.medium.android.graphql.type.adapter.PublicationSubmissionErrorReason_ResponseAdapter;
import com.medium.android.graphql.type.adapter.PublicationSubmissionStatus_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dm2;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.ygf;
import defpackage.yl2;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\b"}, d2 = {"Lcom/medium/android/graphql/adapter/SubmitPostToPublicationMutation_ResponseAdapter;", "", "<init>", "()V", "Data", "SubmitToPublication", "OnPublicationSubmission", "OnPublicationSubmissionError", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SubmitPostToPublicationMutation_ResponseAdapter {
    public static final SubmitPostToPublicationMutation_ResponseAdapter INSTANCE = new SubmitPostToPublicationMutation_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/SubmitPostToPublicationMutation_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/SubmitPostToPublicationMutation$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/SubmitPostToPublicationMutation$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("submitToPublication");

        private Data() {
        }

        @Override // defpackage.c8
        public final SubmitPostToPublicationMutation.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            SubmitPostToPublicationMutation.SubmitToPublication submitToPublication = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(SubmitToPublication.INSTANCE, true);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                submitToPublication = (SubmitPostToPublicationMutation.SubmitToPublication) objFromJson;
            }
            return new SubmitPostToPublicationMutation.Data(submitToPublication);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, SubmitPostToPublicationMutation.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("submitToPublication");
            sv0 sv0VarC = k8.c(SubmitToPublication.INSTANCE, true);
            SubmitPostToPublicationMutation.SubmitToPublication submitToPublication = value.getSubmitToPublication();
            if (submitToPublication == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, submitToPublication);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/SubmitPostToPublicationMutation_ResponseAdapter$OnPublicationSubmission;", "Lc8;", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmission;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmission;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmission;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnPublicationSubmission implements c8 {
        public static final OnPublicationSubmission INSTANCE = new OnPublicationSubmission();
        private static final List<String> RESPONSE_NAMES = d46.R("id", "status");

        private OnPublicationSubmission() {
        }

        @Override // defpackage.c8
        public final SubmitPostToPublicationMutation.OnPublicationSubmission fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            PublicationSubmissionStatus publicationSubmissionStatusFromJson = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    publicationSubmissionStatusFromJson = PublicationSubmissionStatus_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (publicationSubmissionStatusFromJson != null) {
                return new SubmitPostToPublicationMutation.OnPublicationSubmission(strQ, publicationSubmissionStatusFromJson);
            }
            kng.L(reader, "status");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, SubmitPostToPublicationMutation.OnPublicationSubmission value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("id");
            k8.a.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("status");
            PublicationSubmissionStatus_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getStatus());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/SubmitPostToPublicationMutation_ResponseAdapter$OnPublicationSubmissionError;", "Lc8;", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmissionError;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmissionError;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/SubmitPostToPublicationMutation$OnPublicationSubmissionError;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnPublicationSubmissionError implements c8 {
        public static final OnPublicationSubmissionError INSTANCE = new OnPublicationSubmissionError();
        private static final List<String> RESPONSE_NAMES = d46.Q("reason");

        private OnPublicationSubmissionError() {
        }

        @Override // defpackage.c8
        public final SubmitPostToPublicationMutation.OnPublicationSubmissionError fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            PublicationSubmissionErrorReason publicationSubmissionErrorReasonFromJson = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                publicationSubmissionErrorReasonFromJson = PublicationSubmissionErrorReason_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            if (publicationSubmissionErrorReasonFromJson != null) {
                return new SubmitPostToPublicationMutation.OnPublicationSubmissionError(publicationSubmissionErrorReasonFromJson);
            }
            kng.L(reader, "reason");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, SubmitPostToPublicationMutation.OnPublicationSubmissionError value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("reason");
            PublicationSubmissionErrorReason_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getReason());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/SubmitPostToPublicationMutation_ResponseAdapter$SubmitToPublication;", "Lc8;", "Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/SubmitPostToPublicationMutation$SubmitToPublication;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class SubmitToPublication implements c8 {
        public static final SubmitToPublication INSTANCE = new SubmitToPublication();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private SubmitToPublication() {
        }

        @Override // defpackage.c8
        public final SubmitPostToPublicationMutation.SubmitToPublication fromJson(fd6 reader, yl2 customScalarAdapters) {
            SubmitPostToPublicationMutation.OnPublicationSubmission onPublicationSubmissionFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            SubmitPostToPublicationMutation.OnPublicationSubmissionError onPublicationSubmissionErrorFromJson = null;
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            if (strQ == null) {
                ygf.f("__typename was not found");
                return null;
            }
            if (dm2.B(dm2.Q("PublicationSubmission"), set2, strQ, set)) {
                reader.j();
                onPublicationSubmissionFromJson = OnPublicationSubmission.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onPublicationSubmissionFromJson = null;
            }
            if (dm2.B(dm2.Q("PublicationSubmissionError"), set2, strQ, set)) {
                reader.j();
                onPublicationSubmissionErrorFromJson = OnPublicationSubmissionError.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new SubmitPostToPublicationMutation.SubmitToPublication(strQ, onPublicationSubmissionFromJson, onPublicationSubmissionErrorFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, SubmitPostToPublicationMutation.SubmitToPublication value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnPublicationSubmission() != null) {
                OnPublicationSubmission.INSTANCE.toJson(writer, customScalarAdapters, value.getOnPublicationSubmission());
            }
            if (value.getOnPublicationSubmissionError() != null) {
                OnPublicationSubmissionError.INSTANCE.toJson(writer, customScalarAdapters, value.getOnPublicationSubmissionError());
            }
        }
    }

    private SubmitPostToPublicationMutation_ResponseAdapter() {
    }
}
