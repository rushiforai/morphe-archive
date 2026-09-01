package com.medium.android.graphql.adapter;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.graphql.MembershipStatusQuery;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.PaymentProvider;
import com.medium.android.graphql.type.adapter.MembershipType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.PaymentProvider_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dq1;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.yl2;
import defpackage.zi5;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001:\u0005\u0004\u0005\u0006\u0007\bB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\t"}, d2 = {"Lcom/medium/android/graphql/adapter/MembershipStatusQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "Viewer", "ViewerEdge", "Membership", "MobilePlan", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MembershipStatusQuery_ResponseAdapter {
    public static final MembershipStatusQuery_ResponseAdapter INSTANCE = new MembershipStatusQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MembershipStatusQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/MembershipStatusQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MembershipStatusQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MembershipStatusQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("viewer");

        private Data() {
        }

        @Override // defpackage.c8
        public final MembershipStatusQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            MembershipStatusQuery.Viewer viewer = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(Viewer.INSTANCE, false);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                viewer = (MembershipStatusQuery.Viewer) objFromJson;
            }
            return new MembershipStatusQuery.Data(viewer);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MembershipStatusQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("viewer");
            sv0 sv0VarC = k8.c(Viewer.INSTANCE, false);
            MembershipStatusQuery.Viewer viewer = value.getViewer();
            if (viewer == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, viewer);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MembershipStatusQuery_ResponseAdapter$Membership;", "Lc8;", "Lcom/medium/android/graphql/MembershipStatusQuery$Membership;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MembershipStatusQuery$Membership;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MembershipStatusQuery$Membership;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Membership implements c8 {
        public static final Membership INSTANCE = new Membership();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isCancelled", "expiresAt", "paymentProvider", "membershipProductType", "membershipId", "startedAt", "membershipPlanId", "isGrantedPremium", "mobilePlan");

        private Membership() {
        }

        /* JADX WARN: Failed to find 'out' block for switch in B:4:0x001b. Please report as an issue. */
        @Override // defpackage.c8
        public final MembershipStatusQuery.Membership fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Long l;
            Boolean bool2;
            Object objFromJson;
            Boolean bool3;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            Long lValueOf = null;
            Long lValueOf2 = null;
            PaymentProvider paymentProviderFromJson = null;
            MembershipType membershipTypeFromJson = null;
            String strQ2 = null;
            Boolean boolValueOf2 = null;
            String str = null;
            MembershipStatusQuery.MobilePlan mobilePlan = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        bool3 = boolValueOf;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        boolValueOf = bool3;
                        break;
                    case 1:
                        fa4 fa4Var2 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        break;
                    case 2:
                        bool = boolValueOf;
                        l = lValueOf;
                        bool2 = boolValueOf2;
                        dq1 dq1Var = k8.d;
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            lValueOf2 = null;
                        } else {
                            lValueOf2 = Long.valueOf(reader.nextLong());
                        }
                        boolValueOf = bool;
                        lValueOf = l;
                        boolValueOf2 = bool2;
                        break;
                    case 3:
                        bool3 = boolValueOf;
                        paymentProviderFromJson = PaymentProvider_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        boolValueOf = bool3;
                        break;
                    case 4:
                        bool3 = boolValueOf;
                        membershipTypeFromJson = MembershipType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        boolValueOf = bool3;
                        break;
                    case 5:
                        bool3 = boolValueOf;
                        fa4 fa4Var3 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        boolValueOf = bool3;
                        break;
                    case 6:
                        bool3 = boolValueOf;
                        fa4 fa4Var4 = k8.a;
                        lValueOf = Long.valueOf(reader.nextLong());
                        boolValueOf = bool3;
                        break;
                    case 7:
                        bool3 = boolValueOf;
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        boolValueOf = bool3;
                        break;
                    case 8:
                        bool3 = boolValueOf;
                        fa4 fa4Var5 = k8.a;
                        boolValueOf2 = Boolean.valueOf(reader.nextBoolean());
                        boolValueOf = bool3;
                        break;
                    case 9:
                        bool = boolValueOf;
                        l = lValueOf;
                        bool2 = boolValueOf2;
                        sv0 sv0VarC = k8.c(MobilePlan.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        mobilePlan = (MembershipStatusQuery.MobilePlan) objFromJson;
                        boolValueOf = bool;
                        lValueOf = l;
                        boolValueOf2 = bool2;
                        break;
                }
                Boolean bool4 = boolValueOf;
                if (strQ == null) {
                    kng.L(reader, "__typename");
                    throw null;
                }
                if (bool4 == null) {
                    kng.L(reader, "isCancelled");
                    throw null;
                }
                Long l2 = lValueOf;
                boolean zBooleanValue = bool4.booleanValue();
                if (paymentProviderFromJson == null) {
                    kng.L(reader, "paymentProvider");
                    throw null;
                }
                if (membershipTypeFromJson == null) {
                    kng.L(reader, "membershipProductType");
                    throw null;
                }
                if (strQ2 == null) {
                    kng.L(reader, "membershipId");
                    throw null;
                }
                if (l2 == null) {
                    kng.L(reader, "startedAt");
                    throw null;
                }
                Boolean bool5 = boolValueOf2;
                long jLongValue = l2.longValue();
                if (bool5 != null) {
                    return new MembershipStatusQuery.Membership(strQ, zBooleanValue, lValueOf2, paymentProviderFromJson, membershipTypeFromJson, strQ2, jLongValue, str, bool5.booleanValue(), mobilePlan);
                }
                kng.L(reader, "isGrantedPremium");
                throw null;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MembershipStatusQuery.Membership value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("isCancelled");
            zi5 zi5Var = k8.e;
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isCancelled()));
            writer.t0("expiresAt");
            dq1 dq1Var = k8.d;
            Long expiresAt = value.getExpiresAt();
            if (expiresAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, expiresAt);
            }
            writer.t0("paymentProvider");
            PaymentProvider_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getPaymentProvider());
            writer.t0("membershipProductType");
            MembershipType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getMembershipProductType());
            writer.t0("membershipId");
            fa4Var.toJson(writer, customScalarAdapters, value.getMembershipId());
            writer.t0("startedAt");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getStartedAt()));
            writer.t0("membershipPlanId");
            k8.g.toJson(writer, customScalarAdapters, value.getMembershipPlanId());
            writer.t0("isGrantedPremium");
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isGrantedPremium()));
            writer.t0("mobilePlan");
            sv0 sv0VarC = k8.c(MobilePlan.INSTANCE, false);
            MembershipStatusQuery.MobilePlan mobilePlan = value.getMobilePlan();
            if (mobilePlan == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, mobilePlan);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MembershipStatusQuery_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/MembershipStatusQuery$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MembershipStatusQuery$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MembershipStatusQuery$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "membership", "id");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final MembershipStatusQuery.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            MembershipStatusQuery.Membership membership = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    sv0 sv0VarC = k8.c(Membership.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    membership = (MembershipStatusQuery.Membership) objFromJson;
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
                return new MembershipStatusQuery.ViewerEdge(strQ, membership, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MembershipStatusQuery.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("membership");
            sv0 sv0VarC = k8.c(Membership.INSTANCE, false);
            MembershipStatusQuery.Membership membership = value.getMembership();
            if (membership == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, membership);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    private MembershipStatusQuery_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MembershipStatusQuery_ResponseAdapter$MobilePlan;", "Lc8;", "Lcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MembershipStatusQuery$MobilePlan;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MobilePlan implements c8 {
        public static final MobilePlan INSTANCE = new MobilePlan();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "productId");

        private MobilePlan() {
        }

        @Override // defpackage.c8
        public final MembershipStatusQuery.MobilePlan fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new MembershipStatusQuery.MobilePlan(strQ, strQ2);
            }
            kng.L(reader, "productId");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MembershipStatusQuery.MobilePlan value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0(HrUBqHumRuLe.SWlwFVH);
            fa4Var.toJson(writer, customScalarAdapters, value.getProductId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MembershipStatusQuery_ResponseAdapter$Viewer;", "Lc8;", "Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MembershipStatusQuery$Viewer;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Viewer implements c8 {
        public static final Viewer INSTANCE = new Viewer();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "viewerEdge", "id");

        private Viewer() {
        }

        @Override // defpackage.c8
        public final MembershipStatusQuery.Viewer fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            MembershipStatusQuery.ViewerEdge viewerEdge = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    viewerEdge = (MembershipStatusQuery.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
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
            if (viewerEdge == null) {
                kng.L(reader, "viewerEdge");
                throw null;
            }
            if (strQ2 != null) {
                return new MembershipStatusQuery.Viewer(strQ, viewerEdge, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MembershipStatusQuery.Viewer value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0(Plbho.AVqm);
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }
}
