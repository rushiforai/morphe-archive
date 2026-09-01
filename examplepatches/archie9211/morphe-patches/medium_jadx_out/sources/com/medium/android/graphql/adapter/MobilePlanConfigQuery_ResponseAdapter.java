package com.medium.android.graphql.adapter;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.graphql.MobilePlanConfigQuery;
import com.medium.android.graphql.type.MembershipFrequency;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.OfferColorScheme;
import com.medium.android.graphql.type.adapter.MembershipFrequency_ResponseAdapter;
import com.medium.android.graphql.type.adapter.MembershipType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.OfferColorScheme_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dm2;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.xl8;
import defpackage.ygf;
import defpackage.yl2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@kotlin.Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001:\n\u0004\u0005\u0006\u0007\b\t\n\u000b\f\rB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "MobilePlanConfig", "OnMobilePlanConfig", "Offer", "Metadata", "Plan", "CrossoutPlan", "ReferencePlan", "OnBadRequest", "OnUnauthorized", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MobilePlanConfigQuery_ResponseAdapter {
    public static final MobilePlanConfigQuery_ResponseAdapter INSTANCE = new MobilePlanConfigQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$CrossoutPlan;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$CrossoutPlan;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$CrossoutPlan;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$CrossoutPlan;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CrossoutPlan implements c8 {
        public static final CrossoutPlan INSTANCE = new CrossoutPlan();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "referencePlan", "units");

        private CrossoutPlan() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.CrossoutPlan fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            MobilePlanConfigQuery.ReferencePlan referencePlan = null;
            Integer numValueOf = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    referencePlan = (MobilePlanConfigQuery.ReferencePlan) k8.c(ReferencePlan.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    numValueOf = Integer.valueOf(reader.nextInt());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (referencePlan == null) {
                kng.L(reader, "referencePlan");
                throw null;
            }
            if (numValueOf != null) {
                return new MobilePlanConfigQuery.CrossoutPlan(strQ, referencePlan, numValueOf.intValue());
            }
            kng.L(reader, "units");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.CrossoutPlan value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("referencePlan");
            k8.c(ReferencePlan.INSTANCE, false).toJson(writer, customScalarAdapters, value.getReferencePlan());
            writer.t0("units");
            k8.b.toJson(writer, customScalarAdapters, Integer.valueOf(value.getUnits()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("mobilePlanConfig");

        private Data() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            MobilePlanConfigQuery.MobilePlanConfig mobilePlanConfig = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                mobilePlanConfig = (MobilePlanConfigQuery.MobilePlanConfig) k8.c(MobilePlanConfig.INSTANCE, true).fromJson(reader, customScalarAdapters);
            }
            if (mobilePlanConfig != null) {
                return new MobilePlanConfigQuery.Data(mobilePlanConfig);
            }
            kng.L(reader, "mobilePlanConfig");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("mobilePlanConfig");
            k8.c(MobilePlanConfig.INSTANCE, true).toJson(writer, customScalarAdapters, value.getMobilePlanConfig());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$Metadata;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$Metadata;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$Metadata;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$Metadata;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Metadata implements c8 {
        public static final Metadata INSTANCE = new Metadata();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "pill", "colorScheme", "cta", "plansPageTagline", "tagline", "valueProposition");

        private Metadata() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.Metadata fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String str = null;
            OfferColorScheme offerColorSchemeFromJson = null;
            String strQ2 = null;
            String strQ3 = null;
            String strQ4 = null;
            String strQ5 = null;
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
                        offerColorSchemeFromJson = OfferColorScheme_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    case 4:
                        fa4 fa4Var3 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        break;
                    case 5:
                        fa4 fa4Var4 = k8.a;
                        strQ4 = reader.q();
                        strQ4.getClass();
                        break;
                    case 6:
                        fa4 fa4Var5 = k8.a;
                        strQ5 = reader.q();
                        strQ5.getClass();
                        break;
                    default:
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (offerColorSchemeFromJson == null) {
                            kng.L(reader, "colorScheme");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "cta");
                            throw null;
                        }
                        if (strQ3 == null) {
                            kng.L(reader, "plansPageTagline");
                            throw null;
                        }
                        if (strQ4 == null) {
                            kng.L(reader, "tagline");
                            throw null;
                        }
                        if (strQ5 != null) {
                            return new MobilePlanConfigQuery.Metadata(strQ, str, offerColorSchemeFromJson, strQ2, strQ3, strQ4, strQ5);
                        }
                        kng.L(reader, "valueProposition");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.Metadata value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("pill");
            k8.g.toJson(writer, customScalarAdapters, value.getPill());
            writer.t0("colorScheme");
            OfferColorScheme_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getColorScheme());
            writer.t0("cta");
            fa4Var.toJson(writer, customScalarAdapters, value.getCta());
            writer.t0("plansPageTagline");
            fa4Var.toJson(writer, customScalarAdapters, value.getPlansPageTagline());
            writer.t0("tagline");
            fa4Var.toJson(writer, customScalarAdapters, value.getTagline());
            writer.t0("valueProposition");
            fa4Var.toJson(writer, customScalarAdapters, value.getValueProposition());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$MobilePlanConfig;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$MobilePlanConfig;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$MobilePlanConfig;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$MobilePlanConfig;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MobilePlanConfig implements c8 {
        public static final MobilePlanConfig INSTANCE = new MobilePlanConfig();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private MobilePlanConfig() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.MobilePlanConfig fromJson(fd6 reader, yl2 customScalarAdapters) {
            MobilePlanConfigQuery.OnMobilePlanConfig onMobilePlanConfigFromJson;
            MobilePlanConfigQuery.OnBadRequest onBadRequestFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            MobilePlanConfigQuery.OnUnauthorized onUnauthorizedFromJson = null;
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
            if (dm2.B(dm2.Q("MobilePlanConfig"), set2, strQ, set)) {
                reader.j();
                onMobilePlanConfigFromJson = OnMobilePlanConfig.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onMobilePlanConfigFromJson = null;
            }
            if (dm2.B(dm2.Q("BadRequest"), set2, strQ, set)) {
                reader.j();
                onBadRequestFromJson = OnBadRequest.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onBadRequestFromJson = null;
            }
            if (dm2.B(dm2.Q("Unauthorized"), set2, strQ, set)) {
                reader.j();
                onUnauthorizedFromJson = OnUnauthorized.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new MobilePlanConfigQuery.MobilePlanConfig(strQ, onMobilePlanConfigFromJson, onBadRequestFromJson, onUnauthorizedFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.MobilePlanConfig value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnMobilePlanConfig() != null) {
                OnMobilePlanConfig.INSTANCE.toJson(writer, customScalarAdapters, value.getOnMobilePlanConfig());
            }
            if (value.getOnBadRequest() != null) {
                OnBadRequest.INSTANCE.toJson(writer, customScalarAdapters, value.getOnBadRequest());
            }
            if (value.getOnUnauthorized() != null) {
                OnUnauthorized.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUnauthorized());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$Offer;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$Offer;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$Offer;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$Offer;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Offer implements c8 {
        public static final Offer INSTANCE = new Offer();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "couponCode", "metadata");

        private Offer() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.Offer fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            MobilePlanConfigQuery.Metadata metadata = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else if (iN0 == 2) {
                    fa4 fa4Var3 = k8.a;
                    strQ3 = reader.q();
                    strQ3.getClass();
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Metadata.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    metadata = (MobilePlanConfigQuery.Metadata) objFromJson;
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (strQ3 != null) {
                return new MobilePlanConfigQuery.Offer(strQ, strQ2, strQ3, metadata);
            }
            kng.L(reader, "couponCode");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.Offer value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("couponCode");
            fa4Var.toJson(writer, customScalarAdapters, value.getCouponCode());
            writer.t0("metadata");
            sv0 sv0VarC = k8.c(Metadata.INSTANCE, false);
            MobilePlanConfigQuery.Metadata metadata = value.getMetadata();
            if (metadata == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, metadata);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$OnBadRequest;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$OnBadRequest;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$OnBadRequest;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$OnBadRequest;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnBadRequest implements c8 {
        public static final OnBadRequest INSTANCE = new OnBadRequest();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnBadRequest() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.OnBadRequest fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new MobilePlanConfigQuery.OnBadRequest(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.OnBadRequest value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$OnMobilePlanConfig;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$OnMobilePlanConfig;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$OnMobilePlanConfig;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$OnMobilePlanConfig;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnMobilePlanConfig implements c8 {
        public static final OnMobilePlanConfig INSTANCE = new OnMobilePlanConfig();
        private static final List<String> RESPONSE_NAMES = d46.R("defaultFrequency", "offer", "plans");

        private OnMobilePlanConfig() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.OnMobilePlanConfig fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            MembershipFrequency membershipFrequencyFromJson = null;
            MobilePlanConfigQuery.Offer offer = null;
            ArrayList arrayList = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    membershipFrequencyFromJson = MembershipFrequency_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 1) {
                    sv0 sv0VarC = k8.c(Offer.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    offer = (MobilePlanConfigQuery.Offer) objFromJson;
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    sv0 sv0VarC2 = k8.c(Plan.INSTANCE, false);
                    ArrayList arrayListE = ev6.E(reader);
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
                    }
                    reader.k();
                    arrayList = arrayListE;
                }
            }
            if (membershipFrequencyFromJson == null) {
                kng.L(reader, "defaultFrequency");
                throw null;
            }
            if (arrayList != null) {
                return new MobilePlanConfigQuery.OnMobilePlanConfig(membershipFrequencyFromJson, offer, arrayList);
            }
            kng.L(reader, "plans");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.OnMobilePlanConfig value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("defaultFrequency");
            MembershipFrequency_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getDefaultFrequency());
            writer.t0("offer");
            sv0 sv0VarC = k8.c(Offer.INSTANCE, false);
            MobilePlanConfigQuery.Offer offer = value.getOffer();
            if (offer == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, offer);
            }
            writer.t0("plans");
            sv0 sv0VarC2 = k8.c(Plan.INSTANCE, false);
            List<MobilePlanConfigQuery.Plan> plans = value.getPlans();
            plans.getClass();
            writer.n();
            Iterator<T> it2 = plans.iterator();
            while (it2.hasNext()) {
                sv0VarC2.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$OnUnauthorized;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$OnUnauthorized;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$OnUnauthorized;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$OnUnauthorized;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUnauthorized implements c8 {
        public static final OnUnauthorized INSTANCE = new OnUnauthorized();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnUnauthorized() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.OnUnauthorized fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new MobilePlanConfigQuery.OnUnauthorized(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.OnUnauthorized value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$Plan;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$Plan;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$Plan;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$Plan;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Plan implements c8 {
        public static final Plan INSTANCE = new Plan();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "basePlanId", "productId", "membershipType", "membershipPlanId", "promoOfferId", "crossoutPlan");

        private Plan() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.Plan fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String str = null;
            String strQ2 = null;
            MembershipType membershipTypeFromJson = null;
            String strQ3 = null;
            String str2 = null;
            MobilePlanConfigQuery.CrossoutPlan crossoutPlan = null;
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
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    case 3:
                        membershipTypeFromJson = MembershipType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        fa4 fa4Var3 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        break;
                    case 5:
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        sv0 sv0VarC = k8.c(CrossoutPlan.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        crossoutPlan = (MobilePlanConfigQuery.CrossoutPlan) objFromJson;
                        break;
                    default:
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "productId");
                            throw null;
                        }
                        if (membershipTypeFromJson == null) {
                            kng.L(reader, "membershipType");
                            throw null;
                        }
                        if (strQ3 != null) {
                            return new MobilePlanConfigQuery.Plan(strQ, str, strQ2, membershipTypeFromJson, strQ3, str2, crossoutPlan);
                        }
                        kng.L(reader, "membershipPlanId");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.Plan value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("basePlanId");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getBasePlanId());
            writer.t0("productId");
            fa4Var.toJson(writer, customScalarAdapters, value.getProductId());
            writer.t0("membershipType");
            MembershipType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getMembershipType());
            writer.t0("membershipPlanId");
            fa4Var.toJson(writer, customScalarAdapters, value.getMembershipPlanId());
            writer.t0("promoOfferId");
            xl8Var.toJson(writer, customScalarAdapters, value.getPromoOfferId());
            writer.t0("crossoutPlan");
            sv0 sv0VarC = k8.c(CrossoutPlan.INSTANCE, false);
            MobilePlanConfigQuery.CrossoutPlan crossoutPlan = value.getCrossoutPlan();
            if (crossoutPlan == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, crossoutPlan);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MobilePlanConfigQuery_ResponseAdapter$ReferencePlan;", "Lc8;", "Lcom/medium/android/graphql/MobilePlanConfigQuery$ReferencePlan;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MobilePlanConfigQuery$ReferencePlan;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MobilePlanConfigQuery$ReferencePlan;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ReferencePlan implements c8 {
        public static final ReferencePlan INSTANCE = new ReferencePlan();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "membershipPlanId");

        private ReferencePlan() {
        }

        @Override // defpackage.c8
        public final MobilePlanConfigQuery.ReferencePlan fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new MobilePlanConfigQuery.ReferencePlan(strQ, strQ2);
            }
            kng.L(reader, "membershipPlanId");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MobilePlanConfigQuery.ReferencePlan value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("membershipPlanId");
            fa4Var.toJson(writer, customScalarAdapters, value.getMembershipPlanId());
        }
    }

    private MobilePlanConfigQuery_ResponseAdapter() {
    }
}
