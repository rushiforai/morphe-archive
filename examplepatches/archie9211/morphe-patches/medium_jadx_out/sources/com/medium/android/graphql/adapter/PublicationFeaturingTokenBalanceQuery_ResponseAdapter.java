package com.medium.android.graphql.adapter;

import com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dm2;
import defpackage.dq1;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.uob;
import defpackage.ygf;
import defpackage.yl2;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\b"}, d2 = {"Lcom/medium/android/graphql/adapter/PublicationFeaturingTokenBalanceQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "PublicationFeaturingTokenBalance", "OnPublicationFeaturingTokenBalance", "OnUnauthorized", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationFeaturingTokenBalanceQuery_ResponseAdapter {
    public static final PublicationFeaturingTokenBalanceQuery_ResponseAdapter INSTANCE = new PublicationFeaturingTokenBalanceQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/PublicationFeaturingTokenBalanceQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("publicationFeaturingTokenBalance");

        private Data() {
        }

        @Override // defpackage.c8
        public final PublicationFeaturingTokenBalanceQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            PublicationFeaturingTokenBalanceQuery.PublicationFeaturingTokenBalance publicationFeaturingTokenBalance = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                publicationFeaturingTokenBalance = (PublicationFeaturingTokenBalanceQuery.PublicationFeaturingTokenBalance) k8.c(PublicationFeaturingTokenBalance.INSTANCE, true).fromJson(reader, customScalarAdapters);
            }
            if (publicationFeaturingTokenBalance != null) {
                return new PublicationFeaturingTokenBalanceQuery.Data(publicationFeaturingTokenBalance);
            }
            kng.L(reader, "publicationFeaturingTokenBalance");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PublicationFeaturingTokenBalanceQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("publicationFeaturingTokenBalance");
            k8.c(PublicationFeaturingTokenBalance.INSTANCE, true).toJson(writer, customScalarAdapters, value.getPublicationFeaturingTokenBalance());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/PublicationFeaturingTokenBalanceQuery_ResponseAdapter$OnPublicationFeaturingTokenBalance;", "Lc8;", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnPublicationFeaturingTokenBalance implements c8 {
        public static final OnPublicationFeaturingTokenBalance INSTANCE = new OnPublicationFeaturingTokenBalance();
        private static final List<String> RESPONSE_NAMES = d46.R("availableTokens", "tokenCapacity", "nextRefillAt", "refillInterval");

        private OnPublicationFeaturingTokenBalance() {
        }

        @Override // defpackage.c8
        public final PublicationFeaturingTokenBalanceQuery.OnPublicationFeaturingTokenBalance fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            Integer numValueOf = null;
            Integer numValueOf2 = null;
            Long lValueOf = null;
            Long lValueOf2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    numValueOf = Integer.valueOf(reader.nextInt());
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    numValueOf2 = Integer.valueOf(reader.nextInt());
                } else if (iN0 == 2) {
                    Long l = lValueOf;
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf2 = null;
                    } else {
                        lValueOf2 = Long.valueOf(reader.nextLong());
                    }
                    lValueOf = l;
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    lValueOf = Long.valueOf(reader.nextLong());
                }
            }
            Long l2 = lValueOf;
            if (numValueOf == null) {
                kng.L(reader, "availableTokens");
                throw null;
            }
            int iIntValue = numValueOf.intValue();
            if (numValueOf2 == null) {
                kng.L(reader, "tokenCapacity");
                throw null;
            }
            int iIntValue2 = numValueOf2.intValue();
            if (l2 != null) {
                return new PublicationFeaturingTokenBalanceQuery.OnPublicationFeaturingTokenBalance(iIntValue, iIntValue2, lValueOf2, l2.longValue());
            }
            kng.L(reader, "refillInterval");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PublicationFeaturingTokenBalanceQuery.OnPublicationFeaturingTokenBalance value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("availableTokens");
            uob uobVar = k8.b;
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getAvailableTokens()));
            writer.t0("tokenCapacity");
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getTokenCapacity()));
            writer.t0("nextRefillAt");
            dq1 dq1Var = k8.d;
            Long nextRefillAt = value.getNextRefillAt();
            if (nextRefillAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, nextRefillAt);
            }
            writer.t0("refillInterval");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getRefillInterval()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/PublicationFeaturingTokenBalanceQuery_ResponseAdapter$OnUnauthorized;", "Lc8;", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnUnauthorized;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnUnauthorized;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnUnauthorized;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUnauthorized implements c8 {
        public static final OnUnauthorized INSTANCE = new OnUnauthorized();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnUnauthorized() {
        }

        @Override // defpackage.c8
        public final PublicationFeaturingTokenBalanceQuery.OnUnauthorized fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new PublicationFeaturingTokenBalanceQuery.OnUnauthorized(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PublicationFeaturingTokenBalanceQuery.OnUnauthorized value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/PublicationFeaturingTokenBalanceQuery_ResponseAdapter$PublicationFeaturingTokenBalance;", "Lc8;", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PublicationFeaturingTokenBalance implements c8 {
        public static final PublicationFeaturingTokenBalance INSTANCE = new PublicationFeaturingTokenBalance();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private PublicationFeaturingTokenBalance() {
        }

        @Override // defpackage.c8
        public final PublicationFeaturingTokenBalanceQuery.PublicationFeaturingTokenBalance fromJson(fd6 reader, yl2 customScalarAdapters) {
            PublicationFeaturingTokenBalanceQuery.OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalanceFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            PublicationFeaturingTokenBalanceQuery.OnUnauthorized onUnauthorizedFromJson = null;
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
            if (dm2.B(dm2.Q("PublicationFeaturingTokenBalance"), set2, strQ, set)) {
                reader.j();
                onPublicationFeaturingTokenBalanceFromJson = OnPublicationFeaturingTokenBalance.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onPublicationFeaturingTokenBalanceFromJson = null;
            }
            if (dm2.B(dm2.Q("Unauthorized"), set2, strQ, set)) {
                reader.j();
                onUnauthorizedFromJson = OnUnauthorized.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new PublicationFeaturingTokenBalanceQuery.PublicationFeaturingTokenBalance(strQ, onPublicationFeaturingTokenBalanceFromJson, onUnauthorizedFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PublicationFeaturingTokenBalanceQuery.PublicationFeaturingTokenBalance value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnPublicationFeaturingTokenBalance() != null) {
                OnPublicationFeaturingTokenBalance.INSTANCE.toJson(writer, customScalarAdapters, value.getOnPublicationFeaturingTokenBalance());
            }
            if (value.getOnUnauthorized() != null) {
                OnUnauthorized.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUnauthorized());
            }
        }
    }

    private PublicationFeaturingTokenBalanceQuery_ResponseAdapter() {
    }
}
