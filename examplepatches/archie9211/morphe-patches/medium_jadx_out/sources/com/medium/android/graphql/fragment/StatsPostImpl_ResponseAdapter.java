package com.medium.android.graphql.fragment;

import com.medium.android.graphql.CurrencyAdapter;
import com.medium.android.graphql.fragment.StatsPost;
import com.medium.android.graphql.type.PostVisibilityType;
import com.medium.android.graphql.type.adapter.PostVisibilityType_ResponseAdapter;
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
import defpackage.uob;
import defpackage.xl8;
import defpackage.yl2;
import java.util.Currency;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001:\u0005\u0004\u0005\u0006\u0007\bB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\t"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPostImpl_ResponseAdapter;", "", "<init>", "()V", "StatsPost", "Creator", "Earnings", "Total", "TotalStats", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class StatsPostImpl_ResponseAdapter {
    public static final StatsPostImpl_ResponseAdapter INSTANCE = new StatsPostImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPostImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/StatsPost$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/StatsPost$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/StatsPost$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "imageId");

        private Creator() {
        }

        @Override // defpackage.c8
        public final StatsPost.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
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
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new StatsPost.Creator(strQ, strQ2, str, str2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, StatsPost.Creator value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("imageId");
            xl8Var.toJson(writer, customScalarAdapters, value.getImageId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPostImpl_ResponseAdapter$Earnings;", "Lc8;", "Lcom/medium/android/graphql/fragment/StatsPost$Earnings;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/StatsPost$Earnings;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/StatsPost$Earnings;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Earnings implements c8 {
        public static final Earnings INSTANCE = new Earnings();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "total");

        private Earnings() {
        }

        @Override // defpackage.c8
        public final StatsPost.Earnings fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            StatsPost.Total total = null;
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
                    total = (StatsPost.Total) k8.c(Total.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (total != null) {
                return new StatsPost.Earnings(strQ, total);
            }
            kng.L(reader, "total");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, StatsPost.Earnings value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("total");
            k8.c(Total.INSTANCE, false).toJson(writer, customScalarAdapters, value.getTotal());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPostImpl_ResponseAdapter$StatsPost;", "Lc8;", "Lcom/medium/android/graphql/fragment/StatsPost;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/StatsPost;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/StatsPost;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class StatsPost implements c8 {
        public static final StatsPost INSTANCE = new StatsPost();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "title", "creator", "firstPublishedAt", "firstBoostedAt", "isLocked", "visibility", "earnings", "totalStats", "isFeaturedInPublishedPublication");

        private StatsPost() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.StatsPost fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Object objFromJson;
            Object objFromJson2;
            Object objFromJson3;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String strQ2 = null;
            String str = null;
            StatsPost.Creator creator = null;
            Long lValueOf = null;
            Long lValueOf2 = null;
            Boolean bool2 = null;
            PostVisibilityType postVisibilityTypeFromJson = null;
            StatsPost.Earnings earnings = null;
            StatsPost.TotalStats totalStats = null;
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
                        bool = boolValueOf;
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        bool = boolValueOf;
                        sv0 sv0VarC = k8.c(Creator.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        creator = (StatsPost.Creator) objFromJson;
                        break;
                    case 4:
                        bool = boolValueOf;
                        dq1 dq1Var = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf = null;
                        }
                        break;
                    case 5:
                        bool = boolValueOf;
                        dq1 dq1Var2 = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf2 = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf2 = null;
                        }
                        break;
                    case 6:
                        bool = boolValueOf;
                        bool2 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        break;
                    case 7:
                        bool = boolValueOf;
                        postVisibilityTypeFromJson = PostVisibilityType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        break;
                    case 8:
                        bool = boolValueOf;
                        sv0 sv0VarC2 = k8.c(Earnings.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        earnings = (StatsPost.Earnings) objFromJson2;
                        break;
                    case 9:
                        bool = boolValueOf;
                        sv0 sv0VarC3 = k8.c(TotalStats.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson3 = null;
                        } else {
                            objFromJson3 = sv0VarC3.fromJson(reader, customScalarAdapters);
                        }
                        totalStats = (StatsPost.TotalStats) objFromJson3;
                        break;
                    case 10:
                        fa4 fa4Var3 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    default:
                        Boolean bool3 = boolValueOf;
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (postVisibilityTypeFromJson == null) {
                            kng.L(reader, "visibility");
                            throw null;
                        }
                        if (bool3 != null) {
                            return new com.medium.android.graphql.fragment.StatsPost(strQ, strQ2, str, creator, lValueOf, lValueOf2, bool2, postVisibilityTypeFromJson, earnings, totalStats, bool3.booleanValue());
                        }
                        kng.L(reader, "isFeaturedInPublishedPublication");
                        throw null;
                }
                boolValueOf = bool;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.StatsPost value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("title");
            k8.g.toJson(writer, customScalarAdapters, value.getTitle());
            writer.t0("creator");
            sv0 sv0VarC = k8.c(Creator.INSTANCE, false);
            StatsPost.Creator creator = value.getCreator();
            if (creator == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, creator);
            }
            writer.t0("firstPublishedAt");
            dq1 dq1Var = k8.d;
            Long firstPublishedAt = value.getFirstPublishedAt();
            if (firstPublishedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstPublishedAt);
            }
            writer.t0("firstBoostedAt");
            Long firstBoostedAt = value.getFirstBoostedAt();
            if (firstBoostedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstBoostedAt);
            }
            writer.t0("isLocked");
            k8.j.toJson(writer, customScalarAdapters, value.isLocked());
            writer.t0("visibility");
            PostVisibilityType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getVisibility());
            writer.t0("earnings");
            sv0 sv0VarC2 = k8.c(Earnings.INSTANCE, false);
            StatsPost.Earnings earnings = value.getEarnings();
            if (earnings == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, earnings);
            }
            writer.t0("totalStats");
            sv0 sv0VarC3 = k8.c(TotalStats.INSTANCE, false);
            StatsPost.TotalStats totalStats = value.getTotalStats();
            if (totalStats == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, totalStats);
            }
            writer.t0("isFeaturedInPublishedPublication");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isFeaturedInPublishedPublication()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPostImpl_ResponseAdapter$Total;", "Lc8;", "Lcom/medium/android/graphql/fragment/StatsPost$Total;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/StatsPost$Total;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/StatsPost$Total;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Total implements c8 {
        public static final Total INSTANCE = new Total();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "currency", "nanos", "units");

        private Total() {
        }

        @Override // defpackage.c8
        public final StatsPost.Total fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Currency currencyFromJson = null;
            Integer numValueOf = null;
            Integer numValueOf2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    currencyFromJson = CurrencyAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    fa4 fa4Var2 = k8.a;
                    numValueOf = Integer.valueOf(reader.nextInt());
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    numValueOf2 = Integer.valueOf(reader.nextInt());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (currencyFromJson == null) {
                kng.L(reader, "currency");
                throw null;
            }
            if (numValueOf == null) {
                kng.L(reader, "nanos");
                throw null;
            }
            int iIntValue = numValueOf.intValue();
            if (numValueOf2 != null) {
                return new StatsPost.Total(strQ, currencyFromJson, iIntValue, numValueOf2.intValue());
            }
            kng.L(reader, "units");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, StatsPost.Total value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("currency");
            CurrencyAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getCurrency());
            writer.t0("nanos");
            uob uobVar = k8.b;
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getNanos()));
            writer.t0("units");
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getUnits()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPostImpl_ResponseAdapter$TotalStats;", "Lc8;", "Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class TotalStats implements c8 {
        public static final TotalStats INSTANCE = new TotalStats();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "presentations", "views", "reads");

        private TotalStats() {
        }

        @Override // defpackage.c8
        public final StatsPost.TotalStats fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Integer num = null;
            Integer num2 = null;
            Integer num3 = null;
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
                    num3 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ != null) {
                return new StatsPost.TotalStats(strQ, num, num2, num3);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, StatsPost.TotalStats value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("presentations");
            xl8 xl8Var = k8.i;
            xl8Var.toJson(writer, customScalarAdapters, value.getPresentations());
            writer.t0("views");
            xl8Var.toJson(writer, customScalarAdapters, value.getViews());
            writer.t0("reads");
            xl8Var.toJson(writer, customScalarAdapters, value.getReads());
        }
    }

    private StatsPostImpl_ResponseAdapter() {
    }
}
