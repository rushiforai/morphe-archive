package com.medium.android.graphql.adapter;

import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.medium.android.graphql.GetAudienceStatsQuery;
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
import defpackage.sv0;
import defpackage.xl8;
import defpackage.ygf;
import defpackage.yl2;
import defpackage.zm7;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\bÆ\u0002\u0018\u00002\u00020\u0001:\f\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000fB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "UserResult", "OnUser", "ViewerEdge", "AudienceStats", "Totals", "Timeseries", "OnNotFound", "OnBlocked", "OnGraphqlEmptyId", "OnSuspended", "OnAccountSuspended", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetAudienceStatsQuery_ResponseAdapter {
    public static final GetAudienceStatsQuery_ResponseAdapter INSTANCE = new GetAudienceStatsQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("userResult");

        private Data() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            GetAudienceStatsQuery.UserResult userResult = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(UserResult.INSTANCE, true);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                userResult = (GetAudienceStatsQuery.UserResult) objFromJson;
            }
            return new GetAudienceStatsQuery.Data(userResult);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("userResult");
            sv0 sv0VarC = k8.c(UserResult.INSTANCE, true);
            GetAudienceStatsQuery.UserResult userResult = value.getUserResult();
            if (userResult == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, userResult);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$OnAccountSuspended;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnAccountSuspended;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$OnAccountSuspended;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnAccountSuspended;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnAccountSuspended implements c8 {
        public static final OnAccountSuspended INSTANCE = new OnAccountSuspended();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnAccountSuspended() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.OnAccountSuspended fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetAudienceStatsQuery.OnAccountSuspended(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.OnAccountSuspended value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$OnBlocked;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnBlocked;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$OnBlocked;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnBlocked;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnBlocked implements c8 {
        public static final OnBlocked INSTANCE = new OnBlocked();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnBlocked() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.OnBlocked fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetAudienceStatsQuery.OnBlocked(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.OnBlocked value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$OnGraphqlEmptyId;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnGraphqlEmptyId;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$OnGraphqlEmptyId;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnGraphqlEmptyId;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnGraphqlEmptyId implements c8 {
        public static final OnGraphqlEmptyId INSTANCE = new OnGraphqlEmptyId();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnGraphqlEmptyId() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.OnGraphqlEmptyId fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetAudienceStatsQuery.OnGraphqlEmptyId(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.OnGraphqlEmptyId value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$OnNotFound;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnNotFound;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$OnNotFound;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnNotFound;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnNotFound implements c8 {
        public static final OnNotFound INSTANCE = new OnNotFound();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnNotFound() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.OnNotFound fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetAudienceStatsQuery.OnNotFound(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.OnNotFound value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$OnSuspended;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnSuspended;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$OnSuspended;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnSuspended;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnSuspended implements c8 {
        public static final OnSuspended INSTANCE = new OnSuspended();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnSuspended() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.OnSuspended fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetAudienceStatsQuery.OnSuspended(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.OnSuspended value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$OnUser;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnUser;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$OnUser;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnUser;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUser implements c8 {
        public static final OnUser INSTANCE = new OnUser();
        private static final List<String> RESPONSE_NAMES = d46.R("viewerEdge", "id");

        private OnUser() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.OnUser fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            GetAudienceStatsQuery.ViewerEdge viewerEdge = null;
            String strQ = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    viewerEdge = (GetAudienceStatsQuery.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                }
            }
            if (viewerEdge == null) {
                kng.L(reader, "viewerEdge");
                throw null;
            }
            if (strQ != null) {
                return new GetAudienceStatsQuery.OnUser(viewerEdge, strQ);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.OnUser value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("id");
            k8.a.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$Timeseries;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$Timeseries;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$Timeseries;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$Timeseries;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Timeseries implements c8 {
        public static final Timeseries INSTANCE = new Timeseries();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "followersTotal", "subscribersTotal", "collectedAt");

        private Timeseries() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.Timeseries fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Integer num = null;
            Integer num2 = null;
            Long lValueOf = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    num2 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf = null;
                    } else {
                        lValueOf = Long.valueOf(reader.nextLong());
                    }
                }
            }
            if (strQ != null) {
                return new GetAudienceStatsQuery.Timeseries(strQ, num, num2, lValueOf);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.Timeseries value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("followersTotal");
            xl8 xl8Var = k8.i;
            xl8Var.toJson(writer, customScalarAdapters, value.getFollowersTotal());
            writer.t0("subscribersTotal");
            xl8Var.toJson(writer, customScalarAdapters, value.getSubscribersTotal());
            writer.t0("collectedAt");
            dq1 dq1Var = k8.d;
            Long collectedAt = value.getCollectedAt();
            if (collectedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, collectedAt);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$Totals;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Totals implements c8 {
        public static final Totals INSTANCE = new Totals();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "followers", "subscribers", "followersPreviousMonth", "subscribersPreviousMonth");

        private Totals() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.Totals fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Integer num = null;
            Integer num2 = null;
            Integer num3 = null;
            Integer num4 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    num2 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 3) {
                    num3 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 4) {
                        break;
                    }
                    num4 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ != null) {
                return new GetAudienceStatsQuery.Totals(strQ, num, num2, num3, num4);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.Totals value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("followers");
            xl8 xl8Var = k8.i;
            xl8Var.toJson(writer, customScalarAdapters, value.getFollowers());
            writer.t0("subscribers");
            xl8Var.toJson(writer, customScalarAdapters, value.getSubscribers());
            writer.t0("followersPreviousMonth");
            xl8Var.toJson(writer, customScalarAdapters, value.getFollowersPreviousMonth());
            writer.t0("subscribersPreviousMonth");
            xl8Var.toJson(writer, customScalarAdapters, value.getSubscribersPreviousMonth());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$UserResult;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class UserResult implements c8 {
        public static final UserResult INSTANCE = new UserResult();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private UserResult() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.UserResult fromJson(fd6 reader, yl2 customScalarAdapters) {
            GetAudienceStatsQuery.OnUser onUserFromJson;
            GetAudienceStatsQuery.OnNotFound onNotFoundFromJson;
            GetAudienceStatsQuery.OnBlocked onBlockedFromJson;
            GetAudienceStatsQuery.OnGraphqlEmptyId onGraphqlEmptyIdFromJson;
            GetAudienceStatsQuery.OnSuspended onSuspendedFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            GetAudienceStatsQuery.OnAccountSuspended onAccountSuspendedFromJson = null;
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
            if (dm2.B(dm2.Q("User"), set2, strQ, set)) {
                reader.j();
                onUserFromJson = OnUser.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onUserFromJson = null;
            }
            if (dm2.B(dm2.Q("NotFound"), set2, strQ, set)) {
                reader.j();
                onNotFoundFromJson = OnNotFound.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onNotFoundFromJson = null;
            }
            if (dm2.B(dm2.Q("Blocked"), set2, strQ, set)) {
                reader.j();
                onBlockedFromJson = OnBlocked.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onBlockedFromJson = null;
            }
            if (dm2.B(dm2.Q("GraphqlEmptyId"), set2, strQ, set)) {
                reader.j();
                onGraphqlEmptyIdFromJson = OnGraphqlEmptyId.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onGraphqlEmptyIdFromJson = null;
            }
            if (dm2.B(dm2.Q("Suspended"), set2, strQ, set)) {
                reader.j();
                onSuspendedFromJson = OnSuspended.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onSuspendedFromJson = null;
            }
            if (dm2.B(dm2.Q("AccountSuspended"), set2, strQ, set)) {
                reader.j();
                onAccountSuspendedFromJson = OnAccountSuspended.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new GetAudienceStatsQuery.UserResult(strQ, onUserFromJson, onNotFoundFromJson, onBlockedFromJson, onGraphqlEmptyIdFromJson, onSuspendedFromJson, onAccountSuspendedFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.UserResult value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnUser() != null) {
                OnUser.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUser());
            }
            if (value.getOnNotFound() != null) {
                OnNotFound.INSTANCE.toJson(writer, customScalarAdapters, value.getOnNotFound());
            }
            if (value.getOnBlocked() != null) {
                OnBlocked.INSTANCE.toJson(writer, customScalarAdapters, value.getOnBlocked());
            }
            if (value.getOnGraphqlEmptyId() != null) {
                OnGraphqlEmptyId.INSTANCE.toJson(writer, customScalarAdapters, value.getOnGraphqlEmptyId());
            }
            if (value.getOnSuspended() != null) {
                OnSuspended.INSTANCE.toJson(writer, customScalarAdapters, value.getOnSuspended());
            }
            if (value.getOnAccountSuspended() != null) {
                OnAccountSuspended.INSTANCE.toJson(writer, customScalarAdapters, value.getOnAccountSuspended());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "createdAt", "audienceStats", "id");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Long lValueOf = null;
            GetAudienceStatsQuery.AudienceStats audienceStats = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf = null;
                    } else {
                        lValueOf = Long.valueOf(reader.nextLong());
                    }
                } else if (iN0 == 2) {
                    sv0 sv0VarC = k8.c(AudienceStats.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    audienceStats = (GetAudienceStatsQuery.AudienceStats) objFromJson;
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
            if (strQ2 != null) {
                return new GetAudienceStatsQuery.ViewerEdge(strQ, lValueOf, audienceStats, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("createdAt");
            dq1 dq1Var = k8.d;
            Long createdAt = value.getCreatedAt();
            if (createdAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, createdAt);
            }
            writer.t0("audienceStats");
            sv0 sv0VarC = k8.c(AudienceStats.INSTANCE, false);
            GetAudienceStatsQuery.AudienceStats audienceStats = value.getAudienceStats();
            if (audienceStats == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, audienceStats);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    private GetAudienceStatsQuery_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetAudienceStatsQuery_ResponseAdapter$AudienceStats;", "Lc8;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class AudienceStats implements c8 {
        public static final AudienceStats INSTANCE = new AudienceStats();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "totals", "timeseries");

        private AudienceStats() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetAudienceStatsQuery.AudienceStats value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("totals");
            sv0 sv0VarC = k8.c(Totals.INSTANCE, false);
            GetAudienceStatsQuery.Totals totals = value.getTotals();
            if (totals == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, totals);
            }
            writer.t0("timeseries");
            zm7 zm7Var = new zm7(new xl8(k8.c(Timeseries.INSTANCE, false)));
            List<GetAudienceStatsQuery.Timeseries> timeseries = value.getTimeseries();
            if (timeseries == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, timeseries);
            }
        }

        @Override // defpackage.c8
        public final GetAudienceStatsQuery.AudienceStats fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            Object objFromJson2;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            GetAudienceStatsQuery.Totals totals = null;
            List list = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 != 0) {
                    if (iN0 != 1) {
                        if (iN0 != 2) {
                            break;
                        }
                        zm7 zm7Var = new zm7(new xl8(k8.c(Timeseries.INSTANCE, false)));
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = zm7Var.fromJson(reader, customScalarAdapters);
                        }
                        list = (List) objFromJson;
                    } else {
                        sv0 sv0VarC = k8.c(Totals.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        totals = (GetAudienceStatsQuery.Totals) objFromJson2;
                    }
                } else {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                }
            }
            if (strQ != null) {
                return new GetAudienceStatsQuery.AudienceStats(strQ, totals, list);
            }
            kng.L(reader, uvlZTF.ZldUxlIdJRWrC);
            throw null;
        }
    }
}
