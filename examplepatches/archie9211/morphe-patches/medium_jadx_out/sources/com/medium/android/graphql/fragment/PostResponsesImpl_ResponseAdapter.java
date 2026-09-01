package com.medium.android.graphql.fragment;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.graphql.fragment.HighlightDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostResponses;
import com.medium.android.graphql.fragment.ResponseItemDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ResponsePostThreadDataImpl_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.yl2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\bÆ\u0002\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007"}, d2 = {"Lcom/medium/android/graphql/fragment/PostResponsesImpl_ResponseAdapter;", "", "<init>", "()V", "PostResponses", "ThreadedPostResponses", "Highlight", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostResponsesImpl_ResponseAdapter {
    public static final PostResponsesImpl_ResponseAdapter INSTANCE = new PostResponsesImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostResponsesImpl_ResponseAdapter$Highlight;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostResponses$Highlight;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostResponses$Highlight;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostResponses$Highlight;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Highlight implements c8 {
        public static final Highlight INSTANCE = new Highlight();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private Highlight() {
        }

        @Override // defpackage.c8
        public final PostResponses.Highlight fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            HighlightData highlightDataFromJson = HighlightDataImpl_ResponseAdapter.HighlightData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new PostResponses.Highlight(strQ, strQ2, highlightDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostResponses.Highlight value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            HighlightDataImpl_ResponseAdapter.HighlightData.INSTANCE.toJson(writer, customScalarAdapters, value.getHighlightData());
        }
    }

    private PostResponsesImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostResponsesImpl_ResponseAdapter$PostResponses;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostResponses;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostResponses;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostResponses;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostResponses implements c8 {
        public static final PostResponses INSTANCE = new PostResponses();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "latestPublishedVersion", "responsesLocked", "allowResponses", "threadedPostResponses", "highlights", "id");

        private PostResponses() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.PostResponses value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("latestPublishedVersion");
            fa4Var.toJson(writer, customScalarAdapters, value.getLatestPublishedVersion());
            writer.t0("responsesLocked");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getResponsesLocked()));
            writer.t0("allowResponses");
            k8.j.toJson(writer, customScalarAdapters, value.getAllowResponses());
            writer.t0("threadedPostResponses");
            sv0 sv0VarC = k8.c(ThreadedPostResponses.INSTANCE, true);
            PostResponses.ThreadedPostResponses threadedPostResponses = value.getThreadedPostResponses();
            if (threadedPostResponses == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, threadedPostResponses);
            }
            writer.t0("highlights");
            sv0 sv0VarC2 = k8.c(Highlight.INSTANCE, true);
            List<PostResponses.Highlight> highlights = value.getHighlights();
            highlights.getClass();
            writer.n();
            Iterator<T> it2 = highlights.iterator();
            while (it2.hasNext()) {
                sv0VarC2.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            ResponseItemDataImpl_ResponseAdapter.ResponseItemData.INSTANCE.toJson(writer, customScalarAdapters, value.getResponseItemData());
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.PostResponses fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String strQ2 = null;
            Boolean bool2 = null;
            PostResponses.ThreadedPostResponses threadedPostResponses = null;
            ArrayList arrayListE = null;
            String strQ3 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        bool = boolValueOf;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        bool = boolValueOf;
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    case 2:
                        fa4 fa4Var3 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 3:
                        bool = boolValueOf;
                        bool2 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        bool = boolValueOf;
                        sv0 sv0VarC = k8.c(ThreadedPostResponses.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        threadedPostResponses = (PostResponses.ThreadedPostResponses) objFromJson;
                        break;
                    case 5:
                        bool = boolValueOf;
                        sv0 sv0VarC2 = k8.c(Highlight.INSTANCE, true);
                        arrayListE = ev6.E(reader);
                        while (reader.hasNext()) {
                            try {
                                arrayListE.add(sv0VarC2.fromJson(reader, customScalarAdapters));
                            } catch (ApolloGraphQLException e) {
                                while (reader.hasNext()) {
                                    reader.v();
                                }
                                reader.k();
                                throw e;
                            }
                            break;
                        }
                        reader.k();
                        break;
                    case 6:
                        bool = boolValueOf;
                        fa4 fa4Var4 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        break;
                    default:
                        reader.j();
                        ResponseItemData responseItemDataFromJson = ResponseItemDataImpl_ResponseAdapter.ResponseItemData.INSTANCE.fromJson(reader, customScalarAdapters);
                        Boolean bool3 = boolValueOf;
                        if (strQ != null) {
                            if (strQ2 != null) {
                                if (bool3 != null) {
                                    boolean zBooleanValue = bool3.booleanValue();
                                    if (arrayListE != null) {
                                        if (strQ3 != null) {
                                            return new com.medium.android.graphql.fragment.PostResponses(strQ, strQ2, zBooleanValue, bool2, threadedPostResponses, arrayListE, strQ3, responseItemDataFromJson);
                                        }
                                        kng.L(reader, "id");
                                        throw null;
                                    }
                                    kng.L(reader, "highlights");
                                    throw null;
                                }
                                kng.L(reader, PqkdNGCEoxOKZk.IovAFvim);
                                throw null;
                            }
                            kng.L(reader, "latestPublishedVersion");
                            throw null;
                        }
                        kng.L(reader, "__typename");
                        throw null;
                }
                boolValueOf = bool;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostResponsesImpl_ResponseAdapter$ThreadedPostResponses;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostResponses$ThreadedPostResponses;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostResponses$ThreadedPostResponses;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostResponses$ThreadedPostResponses;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ThreadedPostResponses implements c8 {
        public static final ThreadedPostResponses INSTANCE = new ThreadedPostResponses();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private ThreadedPostResponses() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostResponses.ThreadedPostResponses value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            ResponsePostThreadDataImpl_ResponseAdapter.ResponsePostThreadData.INSTANCE.toJson(writer, customScalarAdapters, value.getResponsePostThreadData());
        }

        @Override // defpackage.c8
        public final PostResponses.ThreadedPostResponses fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            ResponsePostThreadData responsePostThreadDataFromJson = ResponsePostThreadDataImpl_ResponseAdapter.ResponsePostThreadData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new PostResponses.ThreadedPostResponses(strQ, responsePostThreadDataFromJson);
            }
            kng.L(reader, KLTXZbnQvj.gbySmJQaUwB);
            throw null;
        }
    }
}
