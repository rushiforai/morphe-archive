package com.medium.android.graphql.adapter;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.graphql.GetPostStatMonthlyQuery;
import com.medium.android.graphql.type.PostStatsDailyBundleMembershipType;
import com.medium.android.graphql.type.adapter.PostStatsDailyBundleMembershipType_ResponseAdapter;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dq1;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.yl2;
import defpackage.zm7;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001:\u0006\u0004\u0005\u0006\u0007\b\tB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatMonthlyQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "PostStatsDailyBundle", "Bucket", "Post", "Earnings", "DailyEarning", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetPostStatMonthlyQuery_ResponseAdapter {
    public static final GetPostStatMonthlyQuery_ResponseAdapter INSTANCE = new GetPostStatMonthlyQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatMonthlyQuery_ResponseAdapter$Bucket;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Bucket;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Bucket;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Bucket;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Bucket implements c8 {
        public static final Bucket INSTANCE = new Bucket();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "dayStartsAt", "membershipType", "readersThatClappedCount", "readersThatHighlightedCount", "readersThatInitiallyFollowedAuthorFromThisPostCount", "readersThatRepliedCount", "readersThatRepostedCount", "readersThatViewedCount", "readersThatReadCount");

        private Bucket() {
        }

        /* JADX WARN: Failed to find 'out' block for switch in B:4:0x0019. Please report as an issue. */
        @Override // defpackage.c8
        public final GetPostStatMonthlyQuery.Bucket fromJson(fd6 reader, yl2 customScalarAdapters) {
            Long l;
            Long l2;
            Long l3;
            Long l4;
            Long l5;
            reader.getClass();
            customScalarAdapters.getClass();
            Long lValueOf = null;
            String strQ = null;
            Long lValueOf2 = null;
            Long lValueOf3 = null;
            PostStatsDailyBundleMembershipType postStatsDailyBundleMembershipTypeFromJson = null;
            Long lValueOf4 = null;
            Long lValueOf5 = null;
            Long lValueOf6 = null;
            Long lValueOf7 = null;
            Long lValueOf8 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        l4 = lValueOf;
                        l5 = lValueOf2;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        lValueOf = l4;
                        lValueOf2 = l5;
                        break;
                    case 1:
                        fa4 fa4Var2 = k8.a;
                        lValueOf = Long.valueOf(reader.nextLong());
                        lValueOf2 = lValueOf2;
                        lValueOf4 = lValueOf4;
                        lValueOf5 = lValueOf5;
                        break;
                    case 2:
                        l4 = lValueOf;
                        l5 = lValueOf2;
                        postStatsDailyBundleMembershipTypeFromJson = PostStatsDailyBundleMembershipType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        lValueOf = l4;
                        lValueOf2 = l5;
                        break;
                    case 3:
                        Long l6 = lValueOf;
                        l = lValueOf3;
                        fa4 fa4Var3 = k8.a;
                        lValueOf2 = Long.valueOf(reader.nextLong());
                        lValueOf = l6;
                        lValueOf3 = l;
                        break;
                    case 4:
                        l4 = lValueOf;
                        l5 = lValueOf2;
                        fa4 fa4Var4 = k8.a;
                        lValueOf3 = Long.valueOf(reader.nextLong());
                        lValueOf = l4;
                        lValueOf2 = l5;
                        break;
                    case 5:
                        l2 = lValueOf;
                        l3 = lValueOf2;
                        l = lValueOf3;
                        fa4 fa4Var5 = k8.a;
                        lValueOf4 = Long.valueOf(reader.nextLong());
                        lValueOf = l2;
                        lValueOf2 = l3;
                        lValueOf3 = l;
                        break;
                    case 6:
                        l2 = lValueOf;
                        l3 = lValueOf2;
                        l = lValueOf3;
                        fa4 fa4Var6 = k8.a;
                        lValueOf5 = Long.valueOf(reader.nextLong());
                        lValueOf = l2;
                        lValueOf2 = l3;
                        lValueOf3 = l;
                        break;
                    case 7:
                        l2 = lValueOf;
                        l3 = lValueOf2;
                        l = lValueOf3;
                        fa4 fa4Var7 = k8.a;
                        lValueOf6 = Long.valueOf(reader.nextLong());
                        lValueOf = l2;
                        lValueOf2 = l3;
                        lValueOf3 = l;
                        break;
                    case 8:
                        l2 = lValueOf;
                        l3 = lValueOf2;
                        l = lValueOf3;
                        fa4 fa4Var8 = k8.a;
                        lValueOf7 = Long.valueOf(reader.nextLong());
                        lValueOf = l2;
                        lValueOf2 = l3;
                        lValueOf3 = l;
                        break;
                    case 9:
                        l2 = lValueOf;
                        l3 = lValueOf2;
                        l = lValueOf3;
                        fa4 fa4Var9 = k8.a;
                        lValueOf8 = Long.valueOf(reader.nextLong());
                        lValueOf = l2;
                        lValueOf2 = l3;
                        lValueOf3 = l;
                        break;
                }
                Long l7 = lValueOf;
                if (strQ == null) {
                    kng.L(reader, "__typename");
                    throw null;
                }
                if (l7 == null) {
                    kng.L(reader, "dayStartsAt");
                    throw null;
                }
                Long l8 = lValueOf2;
                Long l9 = lValueOf3;
                long jLongValue = l7.longValue();
                if (postStatsDailyBundleMembershipTypeFromJson == null) {
                    kng.L(reader, "membershipType");
                    throw null;
                }
                if (l8 == null) {
                    kng.L(reader, "readersThatClappedCount");
                    throw null;
                }
                Long l10 = lValueOf4;
                Long l11 = lValueOf5;
                long jLongValue2 = l8.longValue();
                if (l9 == null) {
                    kng.L(reader, "readersThatHighlightedCount");
                    throw null;
                }
                Long l12 = lValueOf6;
                Long l13 = lValueOf7;
                long jLongValue3 = l9.longValue();
                if (l10 == null) {
                    kng.L(reader, "readersThatInitiallyFollowedAuthorFromThisPostCount");
                    throw null;
                }
                Long l14 = lValueOf8;
                long jLongValue4 = l10.longValue();
                if (l11 == null) {
                    kng.L(reader, "readersThatRepliedCount");
                    throw null;
                }
                long jLongValue5 = l11.longValue();
                if (l12 == null) {
                    kng.L(reader, "readersThatRepostedCount");
                    throw null;
                }
                long jLongValue6 = l12.longValue();
                if (l13 == null) {
                    kng.L(reader, "readersThatViewedCount");
                    throw null;
                }
                long jLongValue7 = l13.longValue();
                if (l14 != null) {
                    return new GetPostStatMonthlyQuery.Bucket(strQ, jLongValue, postStatsDailyBundleMembershipTypeFromJson, jLongValue2, jLongValue3, jLongValue4, jLongValue5, jLongValue6, jLongValue7, l14.longValue());
                }
                kng.L(reader, "readersThatReadCount");
                throw null;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatMonthlyQuery.Bucket value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("dayStartsAt");
            dq1 dq1Var = k8.d;
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getDayStartsAt()));
            writer.t0("membershipType");
            PostStatsDailyBundleMembershipType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getMembershipType());
            writer.t0("readersThatClappedCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadersThatClappedCount()));
            writer.t0("readersThatHighlightedCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadersThatHighlightedCount()));
            writer.t0("readersThatInitiallyFollowedAuthorFromThisPostCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadersThatInitiallyFollowedAuthorFromThisPostCount()));
            writer.t0("readersThatRepliedCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadersThatRepliedCount()));
            writer.t0("readersThatRepostedCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadersThatRepostedCount()));
            writer.t0("readersThatViewedCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadersThatViewedCount()));
            writer.t0("readersThatReadCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadersThatReadCount()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatMonthlyQuery_ResponseAdapter$DailyEarning;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$DailyEarning;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$DailyEarning;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$DailyEarning;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class DailyEarning implements c8 {
        public static final DailyEarning INSTANCE = new DailyEarning();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "amount", "periodStartedAt");

        private DailyEarning() {
        }

        @Override // defpackage.c8
        public final GetPostStatMonthlyQuery.DailyEarning fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Integer num = null;
            Long lValueOf = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 2) {
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
                return new GetPostStatMonthlyQuery.DailyEarning(strQ, num, lValueOf);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatMonthlyQuery.DailyEarning value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("amount");
            k8.i.toJson(writer, customScalarAdapters, value.getAmount());
            writer.t0("periodStartedAt");
            dq1 dq1Var = k8.d;
            Long periodStartedAt = value.getPeriodStartedAt();
            if (periodStartedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, periodStartedAt);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatMonthlyQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.R(ezwlgQm.InmJjo, "post");

        private Data() {
        }

        @Override // defpackage.c8
        public final GetPostStatMonthlyQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            GetPostStatMonthlyQuery.PostStatsDailyBundle postStatsDailyBundle = null;
            GetPostStatMonthlyQuery.Post post = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    postStatsDailyBundle = (GetPostStatMonthlyQuery.PostStatsDailyBundle) k8.c(PostStatsDailyBundle.INSTANCE, false).fromJson(reader, customScalarAdapters);
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
                    post = (GetPostStatMonthlyQuery.Post) objFromJson;
                }
            }
            if (postStatsDailyBundle != null) {
                return new GetPostStatMonthlyQuery.Data(postStatsDailyBundle, post);
            }
            kng.L(reader, "postStatsDailyBundle");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatMonthlyQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("postStatsDailyBundle");
            k8.c(PostStatsDailyBundle.INSTANCE, false).toJson(writer, customScalarAdapters, value.getPostStatsDailyBundle());
            writer.t0("post");
            sv0 sv0VarC = k8.c(Post.INSTANCE, false);
            GetPostStatMonthlyQuery.Post post = value.getPost();
            if (post == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, post);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatMonthlyQuery_ResponseAdapter$Earnings;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Earnings implements c8 {
        public static final Earnings INSTANCE = new Earnings();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "dailyEarnings");

        private Earnings() {
        }

        @Override // defpackage.c8
        public final GetPostStatMonthlyQuery.Earnings fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            List list = null;
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
                    zm7 zm7Var = new zm7(k8.c(DailyEarning.INSTANCE, false));
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = zm7Var.fromJson(reader, customScalarAdapters);
                    }
                    list = (List) objFromJson;
                }
            }
            if (strQ != null) {
                return new GetPostStatMonthlyQuery.Earnings(strQ, list);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatMonthlyQuery.Earnings value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("dailyEarnings");
            zm7 zm7Var = new zm7(k8.c(DailyEarning.INSTANCE, false));
            List<GetPostStatMonthlyQuery.DailyEarning> dailyEarnings = value.getDailyEarnings();
            if (dailyEarnings == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, dailyEarnings);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatMonthlyQuery_ResponseAdapter$Post;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Post implements c8 {
        public static final Post INSTANCE = new Post();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "firstPublishedAt", "isLocked", "earnings", "id");

        private Post() {
        }

        @Override // defpackage.c8
        public final GetPostStatMonthlyQuery.Post fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Long lValueOf = null;
            Boolean bool = null;
            GetPostStatMonthlyQuery.Earnings earnings = null;
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
                    bool = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 3) {
                    sv0 sv0VarC = k8.c(Earnings.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    earnings = (GetPostStatMonthlyQuery.Earnings) objFromJson;
                } else {
                    if (iN0 != 4) {
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
                return new GetPostStatMonthlyQuery.Post(strQ, lValueOf, bool, earnings, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatMonthlyQuery.Post value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("firstPublishedAt");
            dq1 dq1Var = k8.d;
            Long firstPublishedAt = value.getFirstPublishedAt();
            if (firstPublishedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstPublishedAt);
            }
            writer.t0("isLocked");
            k8.j.toJson(writer, customScalarAdapters, value.isLocked());
            writer.t0("earnings");
            sv0 sv0VarC = k8.c(Earnings.INSTANCE, false);
            GetPostStatMonthlyQuery.Earnings earnings = value.getEarnings();
            if (earnings == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, earnings);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatMonthlyQuery_ResponseAdapter$PostStatsDailyBundle;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostStatsDailyBundle implements c8 {
        public static final PostStatsDailyBundle INSTANCE = new PostStatsDailyBundle();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "buckets");

        private PostStatsDailyBundle() {
        }

        @Override // defpackage.c8
        public final GetPostStatMonthlyQuery.PostStatsDailyBundle fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            ArrayList arrayList = null;
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
                    sv0 sv0VarC = k8.c(Bucket.INSTANCE, false);
                    ArrayList arrayListE = ev6.E(reader);
                    while (reader.hasNext()) {
                        try {
                            arrayListE.add(sv0VarC.fromJson(reader, customScalarAdapters));
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
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (arrayList != null) {
                return new GetPostStatMonthlyQuery.PostStatsDailyBundle(strQ, arrayList);
            }
            kng.L(reader, "buckets");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatMonthlyQuery.PostStatsDailyBundle value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("buckets");
            sv0 sv0VarC = k8.c(Bucket.INSTANCE, false);
            List<GetPostStatMonthlyQuery.Bucket> buckets = value.getBuckets();
            buckets.getClass();
            writer.n();
            Iterator<T> it2 = buckets.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    private GetPostStatMonthlyQuery_ResponseAdapter() {
    }
}
