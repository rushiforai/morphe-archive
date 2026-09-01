package com.medium.android.graphql.adapter;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.graphql.GetPostPublishingDataQuery;
import com.medium.android.graphql.fragment.DraftDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.fragment.ImageMetadataDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PublishingFlowPublication;
import com.medium.android.graphql.fragment.PublishingFlowPublicationImpl_ResponseAdapter;
import com.medium.android.graphql.type.PostVisibilityType;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import com.medium.android.graphql.type.adapter.PostVisibilityType_ResponseAdapter;
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
import defpackage.xl8;
import defpackage.ygf;
import defpackage.yl2;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\bÆ\u0002\u0018\u00002\u00020\u0001:\u000b\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000eB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "DraftResult", "OnDraft", "OnUnauthorized", "OnNotFound", "Post", "PreviewContent", "PreviewImage", "ViewerEdge", "MostRecentSubmission", "Publication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetPostPublishingDataQuery_ResponseAdapter {
    public static final GetPostPublishingDataQuery_ResponseAdapter INSTANCE = new GetPostPublishingDataQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.R("draftResult", "post");

        private Data() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            GetPostPublishingDataQuery.DraftResult draftResult = null;
            GetPostPublishingDataQuery.Post post = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    draftResult = (GetPostPublishingDataQuery.DraftResult) k8.c(DraftResult.INSTANCE, true).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Post.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    post = (GetPostPublishingDataQuery.Post) objFromJson;
                }
            }
            if (draftResult != null) {
                return new GetPostPublishingDataQuery.Data(draftResult, post);
            }
            kng.L(reader, "draftResult");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("draftResult");
            k8.c(DraftResult.INSTANCE, true).toJson(writer, customScalarAdapters, value.getDraftResult());
            writer.t0("post");
            sv0 sv0VarC = k8.c(Post.INSTANCE, false);
            GetPostPublishingDataQuery.Post post = value.getPost();
            if (post == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, post);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$MostRecentSubmission;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$MostRecentSubmission;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$MostRecentSubmission;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$MostRecentSubmission;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MostRecentSubmission implements c8 {
        public static final MostRecentSubmission INSTANCE = new MostRecentSubmission();
        private static final List<String> RESPONSE_NAMES = d46.R(ziYqbdHrAXvj.SFRvlyUBioEZC, "status", "publication", "id");

        private MostRecentSubmission() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.MostRecentSubmission fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            PublicationSubmissionStatus publicationSubmissionStatusFromJson = null;
            GetPostPublishingDataQuery.Publication publication = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    publicationSubmissionStatusFromJson = PublicationSubmissionStatus_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    publication = (GetPostPublishingDataQuery.Publication) k8.c(Publication.INSTANCE, true).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (publicationSubmissionStatusFromJson == null) {
                kng.L(reader, "status");
                throw null;
            }
            if (publication == null) {
                kng.L(reader, "publication");
                throw null;
            }
            if (strQ2 != null) {
                return new GetPostPublishingDataQuery.MostRecentSubmission(strQ, publicationSubmissionStatusFromJson, publication, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.MostRecentSubmission value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("status");
            PublicationSubmissionStatus_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getStatus());
            writer.t0("publication");
            k8.c(Publication.INSTANCE, true).toJson(writer, customScalarAdapters, value.getPublication());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$OnDraft;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnDraft;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnDraft;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnDraft;)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnDraft implements c8 {
        public static final OnDraft INSTANCE = new OnDraft();

        private OnDraft() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.OnDraft fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            reader.j();
            return new GetPostPublishingDataQuery.OnDraft(DraftDataImpl_ResponseAdapter.DraftData.INSTANCE.fromJson(reader, customScalarAdapters));
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.OnDraft value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            DraftDataImpl_ResponseAdapter.DraftData.INSTANCE.toJson(writer, customScalarAdapters, value.getDraftData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$OnNotFound;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnNotFound;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnNotFound;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnNotFound;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnNotFound implements c8 {
        public static final OnNotFound INSTANCE = new OnNotFound();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnNotFound() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.OnNotFound fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostPublishingDataQuery.OnNotFound(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.OnNotFound value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$OnUnauthorized;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnUnauthorized;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnUnauthorized;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$OnUnauthorized;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUnauthorized implements c8 {
        public static final OnUnauthorized INSTANCE = new OnUnauthorized();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnUnauthorized() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.OnUnauthorized fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostPublishingDataQuery.OnUnauthorized(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.OnUnauthorized value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$Post;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$Post;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Post implements c8 {
        public static final Post INSTANCE = new Post();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "title", "previewContent", "previewImage", "isPublished", "isPublishToEmail", "visibility", "viewerEdge", "id");

        private Post() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.Post fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            Object objFromJson2;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String str = null;
            GetPostPublishingDataQuery.PreviewContent previewContent = null;
            GetPostPublishingDataQuery.PreviewImage previewImage = null;
            Boolean bool = null;
            Boolean bool2 = null;
            PostVisibilityType postVisibilityTypeFromJson = null;
            GetPostPublishingDataQuery.ViewerEdge viewerEdge = null;
            String strQ2 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 2:
                        sv0 sv0VarC = k8.c(PreviewContent.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        previewContent = (GetPostPublishingDataQuery.PreviewContent) objFromJson;
                        break;
                    case 3:
                        sv0 sv0VarC2 = k8.c(PreviewImage.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        previewImage = (GetPostPublishingDataQuery.PreviewImage) objFromJson2;
                        break;
                    case 4:
                        bool = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        break;
                    case 5:
                        bool2 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        postVisibilityTypeFromJson = PostVisibilityType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        break;
                    case 7:
                        viewerEdge = (GetPostPublishingDataQuery.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        break;
                    case 8:
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    default:
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (postVisibilityTypeFromJson == null) {
                            kng.L(reader, "visibility");
                            throw null;
                        }
                        if (viewerEdge == null) {
                            kng.L(reader, "viewerEdge");
                            throw null;
                        }
                        if (strQ2 != null) {
                            return new GetPostPublishingDataQuery.Post(strQ, str, previewContent, previewImage, bool, bool2, postVisibilityTypeFromJson, viewerEdge, strQ2);
                        }
                        kng.L(reader, "id");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.Post value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("title");
            k8.g.toJson(writer, customScalarAdapters, value.getTitle());
            writer.t0("previewContent");
            sv0 sv0VarC = k8.c(PreviewContent.INSTANCE, false);
            GetPostPublishingDataQuery.PreviewContent previewContent = value.getPreviewContent();
            if (previewContent == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, previewContent);
            }
            writer.t0("previewImage");
            sv0 sv0VarC2 = k8.c(PreviewImage.INSTANCE, true);
            GetPostPublishingDataQuery.PreviewImage previewImage = value.getPreviewImage();
            if (previewImage == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, previewImage);
            }
            writer.t0("isPublished");
            xl8 xl8Var = k8.j;
            xl8Var.toJson(writer, customScalarAdapters, value.isPublished());
            writer.t0("isPublishToEmail");
            xl8Var.toJson(writer, customScalarAdapters, value.isPublishToEmail());
            writer.t0("visibility");
            PostVisibilityType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getVisibility());
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$PreviewContent;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewContent;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PreviewContent implements c8 {
        public static final PreviewContent INSTANCE = new PreviewContent();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "subtitle");

        private PreviewContent() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.PreviewContent fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String str = null;
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
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ != null) {
                return new GetPostPublishingDataQuery.PreviewContent(strQ, str);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.PreviewContent value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("subtitle");
            k8.g.toJson(writer, customScalarAdapters, value.getSubtitle());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$PreviewImage;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$PreviewImage;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PreviewImage implements c8 {
        public static final PreviewImage INSTANCE = new PreviewImage();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private PreviewImage() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.PreviewImage fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
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
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            reader.j();
            ImageMetadataData imageMetadataDataFromJson = ImageMetadataDataImpl_ResponseAdapter.ImageMetadataData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new GetPostPublishingDataQuery.PreviewImage(strQ, strQ2, imageMetadataDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.PreviewImage value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            ImageMetadataDataImpl_ResponseAdapter.ImageMetadataData.INSTANCE.toJson(writer, customScalarAdapters, value.getImageMetadataData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$Publication;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$Publication;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$Publication;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$Publication;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Publication implements c8 {
        public static final Publication INSTANCE = new Publication();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private Publication() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.Publication fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
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
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            reader.j();
            PublishingFlowPublication publishingFlowPublicationFromJson = PublishingFlowPublicationImpl_ResponseAdapter.PublishingFlowPublication.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new GetPostPublishingDataQuery.Publication(strQ, strQ2, publishingFlowPublicationFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.Publication value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            PublishingFlowPublicationImpl_ResponseAdapter.PublishingFlowPublication.INSTANCE.toJson(writer, customScalarAdapters, value.getPublishingFlowPublication());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "mostRecentSubmission", "id");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            GetPostPublishingDataQuery.MostRecentSubmission mostRecentSubmission = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    sv0 sv0VarC = k8.c(MostRecentSubmission.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    mostRecentSubmission = (GetPostPublishingDataQuery.MostRecentSubmission) objFromJson;
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new GetPostPublishingDataQuery.ViewerEdge(strQ, mostRecentSubmission, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("mostRecentSubmission");
            sv0 sv0VarC = k8.c(MostRecentSubmission.INSTANCE, false);
            GetPostPublishingDataQuery.MostRecentSubmission mostRecentSubmission = value.getMostRecentSubmission();
            if (mostRecentSubmission == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, mostRecentSubmission);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    private GetPostPublishingDataQuery_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostPublishingDataQuery_ResponseAdapter$DraftResult;", "Lc8;", "Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostPublishingDataQuery$DraftResult;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class DraftResult implements c8 {
        public static final DraftResult INSTANCE = new DraftResult();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private DraftResult() {
        }

        @Override // defpackage.c8
        public final GetPostPublishingDataQuery.DraftResult fromJson(fd6 reader, yl2 customScalarAdapters) {
            GetPostPublishingDataQuery.OnDraft onDraftFromJson;
            GetPostPublishingDataQuery.OnUnauthorized onUnauthorizedFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            GetPostPublishingDataQuery.OnNotFound onNotFoundFromJson = null;
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
            if (dm2.B(dm2.Q("Draft"), set2, strQ, set)) {
                reader.j();
                onDraftFromJson = OnDraft.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onDraftFromJson = null;
            }
            if (dm2.B(dm2.Q("Unauthorized"), set2, strQ, set)) {
                reader.j();
                onUnauthorizedFromJson = OnUnauthorized.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onUnauthorizedFromJson = null;
            }
            if (dm2.B(dm2.Q("NotFound"), set2, strQ, set)) {
                reader.j();
                onNotFoundFromJson = OnNotFound.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new GetPostPublishingDataQuery.DraftResult(strQ, onDraftFromJson, onUnauthorizedFromJson, onNotFoundFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostPublishingDataQuery.DraftResult value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0(peNPu.eeFaJTs);
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnDraft() != null) {
                OnDraft.INSTANCE.toJson(writer, customScalarAdapters, value.getOnDraft());
            }
            if (value.getOnUnauthorized() != null) {
                OnUnauthorized.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUnauthorized());
            }
            if (value.getOnNotFound() != null) {
                OnNotFound.INSTANCE.toJson(writer, customScalarAdapters, value.getOnNotFound());
            }
        }
    }
}
