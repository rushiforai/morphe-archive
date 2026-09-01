package com.medium.android.graphql.adapter;

import com.medium.android.graphql.CreateAndSubscribeToNewsletterV3Mutation;
import com.medium.android.graphql.fragment.NewsletterData;
import com.medium.android.graphql.fragment.NewsletterDataImpl_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lcom/medium/android/graphql/adapter/CreateAndSubscribeToNewsletterV3Mutation_ResponseAdapter;", "", "<init>", "()V", "Data", "FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreateAndSubscribeToNewsletterV3Mutation_ResponseAdapter {
    public static final CreateAndSubscribeToNewsletterV3Mutation_ResponseAdapter INSTANCE = new CreateAndSubscribeToNewsletterV3Mutation_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CreateAndSubscribeToNewsletterV3Mutation_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/CreateAndSubscribeToNewsletterV3Mutation$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CreateAndSubscribeToNewsletterV3Mutation$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CreateAndSubscribeToNewsletterV3Mutation$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe");

        private Data() {
        }

        @Override // defpackage.c8
        public final CreateAndSubscribeToNewsletterV3Mutation.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            CreateAndSubscribeToNewsletterV3Mutation.FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe.INSTANCE, true);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe = (CreateAndSubscribeToNewsletterV3Mutation.FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe) objFromJson;
            }
            return new CreateAndSubscribeToNewsletterV3Mutation.Data(fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CreateAndSubscribeToNewsletterV3Mutation.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe");
            sv0 sv0VarC = k8.c(FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe.INSTANCE, true);
            CreateAndSubscribeToNewsletterV3Mutation.FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe = value.getFetchOrLazilyCreateNewsletterV3AndMaybeSubscribe();
            if (fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CreateAndSubscribeToNewsletterV3Mutation_ResponseAdapter$FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe;", "Lc8;", "Lcom/medium/android/graphql/CreateAndSubscribeToNewsletterV3Mutation$FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CreateAndSubscribeToNewsletterV3Mutation$FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CreateAndSubscribeToNewsletterV3Mutation$FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe implements c8 {
        public static final FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe INSTANCE = new FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe() {
        }

        @Override // defpackage.c8
        public final CreateAndSubscribeToNewsletterV3Mutation.FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            NewsletterData newsletterDataFromJson = NewsletterDataImpl_ResponseAdapter.NewsletterData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new CreateAndSubscribeToNewsletterV3Mutation.FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe(strQ, strQ2, newsletterDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CreateAndSubscribeToNewsletterV3Mutation.FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            NewsletterDataImpl_ResponseAdapter.NewsletterData.INSTANCE.toJson(writer, customScalarAdapters, value.getNewsletterData());
        }
    }

    private CreateAndSubscribeToNewsletterV3Mutation_ResponseAdapter() {
    }
}
