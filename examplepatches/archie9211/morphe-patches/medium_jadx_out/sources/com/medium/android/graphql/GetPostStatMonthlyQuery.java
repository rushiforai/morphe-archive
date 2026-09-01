package com.medium.android.graphql;

import com.medium.android.graphql.adapter.GetPostStatMonthlyQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.GetPostStatMonthlyQuery_VariablesAdapter;
import com.medium.android.graphql.selections.GetPostStatMonthlyQuerySelections;
import com.medium.android.graphql.type.PostStatsDailyBundleMembershipType;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0010\b\u0086\b\u0018\u0000 02\b\u0012\u0004\u0012\u00020\u00020\u0001:\u00071234560B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0010\u0010\u001e\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b \u0010\u001fJ.\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010%\u001a\u00020$HÖ\u0001¢\u0006\u0004\b%\u0010&J\u001a\u0010)\u001a\u00020\u00122\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010+\u001a\u0004\b,\u0010\u000bR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010-\u001a\u0004\b.\u0010\u001fR\u0017\u0010\u0007\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010-\u001a\u0004\b/\u0010\u001f¨\u00067"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery;", "Luqa;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Data;", "", "postId", "", "startTime", "endTime", "<init>", "(Ljava/lang/String;JJ)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()J", "component3", "copy", "(Ljava/lang/String;JJ)Lcom/medium/android/graphql/GetPostStatMonthlyQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "J", "getStartTime", "getEndTime", "Companion", "Data", "PostStatsDailyBundle", "Bucket", "Post", "Earnings", "DailyEarning", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class GetPostStatMonthlyQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "a501031b3fca4ed3d9a5b8368997d08eab8f4a5e1fb32d1605a8e6cb45cf984f";
    public static final String OPERATION_NAME = "GetPostStatMonthlyQuery";
    private final long endTime;
    private final String postId;
    private final long startTime;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\"\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BW\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0005\u0012\u0006\u0010\t\u001a\u00020\u0005\u0012\u0006\u0010\n\u001a\u00020\u0005\u0012\u0006\u0010\u000b\u001a\u00020\u0005\u0012\u0006\u0010\f\u001a\u00020\u0005\u0012\u0006\u0010\r\u001a\u00020\u0005\u0012\u0006\u0010\u000e\u001a\u00020\u0005¢\u0006\u0004\b\u000f\u0010\u0010J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0005HÆ\u0003J\t\u0010 \u001a\u00020\u0007HÆ\u0003J\t\u0010!\u001a\u00020\u0005HÆ\u0003J\t\u0010\"\u001a\u00020\u0005HÆ\u0003J\t\u0010#\u001a\u00020\u0005HÆ\u0003J\t\u0010$\u001a\u00020\u0005HÆ\u0003J\t\u0010%\u001a\u00020\u0005HÆ\u0003J\t\u0010&\u001a\u00020\u0005HÆ\u0003J\t\u0010'\u001a\u00020\u0005HÆ\u0003Jm\u0010(\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\u00052\b\b\u0002\u0010\n\u001a\u00020\u00052\b\b\u0002\u0010\u000b\u001a\u00020\u00052\b\b\u0002\u0010\f\u001a\u00020\u00052\b\b\u0002\u0010\r\u001a\u00020\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u0005HÆ\u0001J\u0013\u0010)\u001a\u00020*2\b\u0010+\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010,\u001a\u00020-HÖ\u0001J\t\u0010.\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0014R\u0011\u0010\t\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0014R\u0011\u0010\n\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0014R\u0011\u0010\u000b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0014R\u0011\u0010\f\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0014R\u0011\u0010\r\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0014R\u0011\u0010\u000e\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0014¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Bucket;", "", "__typename", "", "dayStartsAt", "", "membershipType", "Lcom/medium/android/graphql/type/PostStatsDailyBundleMembershipType;", "readersThatClappedCount", "readersThatHighlightedCount", "readersThatInitiallyFollowedAuthorFromThisPostCount", "readersThatRepliedCount", "readersThatRepostedCount", "readersThatViewedCount", "readersThatReadCount", "<init>", "(Ljava/lang/String;JLcom/medium/android/graphql/type/PostStatsDailyBundleMembershipType;JJJJJJJ)V", "get__typename", "()Ljava/lang/String;", "getDayStartsAt", "()J", "getMembershipType", "()Lcom/medium/android/graphql/type/PostStatsDailyBundleMembershipType;", "getReadersThatClappedCount", "getReadersThatHighlightedCount", "getReadersThatInitiallyFollowedAuthorFromThisPostCount", "getReadersThatRepliedCount", "getReadersThatRepostedCount", "getReadersThatViewedCount", "getReadersThatReadCount", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Bucket {
        private final String __typename;
        private final long dayStartsAt;
        private final PostStatsDailyBundleMembershipType membershipType;
        private final long readersThatClappedCount;
        private final long readersThatHighlightedCount;
        private final long readersThatInitiallyFollowedAuthorFromThisPostCount;
        private final long readersThatReadCount;
        private final long readersThatRepliedCount;
        private final long readersThatRepostedCount;
        private final long readersThatViewedCount;

        public Bucket(String str, long j, PostStatsDailyBundleMembershipType postStatsDailyBundleMembershipType, long j2, long j3, long j4, long j5, long j6, long j7, long j8) {
            str.getClass();
            postStatsDailyBundleMembershipType.getClass();
            this.__typename = str;
            this.dayStartsAt = j;
            this.membershipType = postStatsDailyBundleMembershipType;
            this.readersThatClappedCount = j2;
            this.readersThatHighlightedCount = j3;
            this.readersThatInitiallyFollowedAuthorFromThisPostCount = j4;
            this.readersThatRepliedCount = j5;
            this.readersThatRepostedCount = j6;
            this.readersThatViewedCount = j7;
            this.readersThatReadCount = j8;
        }

        public static /* synthetic */ Bucket copy$default(Bucket bucket, String str, long j, PostStatsDailyBundleMembershipType postStatsDailyBundleMembershipType, long j2, long j3, long j4, long j5, long j6, long j7, long j8, int i, Object obj) {
            long j9;
            long j10;
            String str2;
            Bucket bucket2;
            PostStatsDailyBundleMembershipType postStatsDailyBundleMembershipType2;
            long j11;
            long j12;
            long j13;
            long j14;
            long j15;
            long j16;
            String str3 = (i & 1) != 0 ? bucket.__typename : str;
            long j17 = (i & 2) != 0 ? bucket.dayStartsAt : j;
            PostStatsDailyBundleMembershipType postStatsDailyBundleMembershipType3 = (i & 4) != 0 ? bucket.membershipType : postStatsDailyBundleMembershipType;
            long j18 = (i & 8) != 0 ? bucket.readersThatClappedCount : j2;
            long j19 = (i & 16) != 0 ? bucket.readersThatHighlightedCount : j3;
            long j20 = (i & 32) != 0 ? bucket.readersThatInitiallyFollowedAuthorFromThisPostCount : j4;
            long j21 = (i & 64) != 0 ? bucket.readersThatRepliedCount : j5;
            long j22 = (i & 128) != 0 ? bucket.readersThatRepostedCount : j6;
            String str4 = str3;
            long j23 = j17;
            long j24 = (i & 256) != 0 ? bucket.readersThatViewedCount : j7;
            if ((i & 512) != 0) {
                j10 = j24;
                j9 = bucket.readersThatReadCount;
                postStatsDailyBundleMembershipType2 = postStatsDailyBundleMembershipType3;
                j11 = j18;
                j12 = j19;
                j13 = j20;
                j14 = j21;
                j15 = j22;
                j16 = j23;
                str2 = str4;
                bucket2 = bucket;
            } else {
                j9 = j8;
                j10 = j24;
                str2 = str4;
                bucket2 = bucket;
                postStatsDailyBundleMembershipType2 = postStatsDailyBundleMembershipType3;
                j11 = j18;
                j12 = j19;
                j13 = j20;
                j14 = j21;
                j15 = j22;
                j16 = j23;
            }
            return bucket2.copy(str2, j16, postStatsDailyBundleMembershipType2, j11, j12, j13, j14, j15, j10, j9);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component10, reason: from getter */
        public final long getReadersThatReadCount() {
            return this.readersThatReadCount;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final long getDayStartsAt() {
            return this.dayStartsAt;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PostStatsDailyBundleMembershipType getMembershipType() {
            return this.membershipType;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final long getReadersThatClappedCount() {
            return this.readersThatClappedCount;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final long getReadersThatHighlightedCount() {
            return this.readersThatHighlightedCount;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final long getReadersThatInitiallyFollowedAuthorFromThisPostCount() {
            return this.readersThatInitiallyFollowedAuthorFromThisPostCount;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final long getReadersThatRepliedCount() {
            return this.readersThatRepliedCount;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final long getReadersThatRepostedCount() {
            return this.readersThatRepostedCount;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final long getReadersThatViewedCount() {
            return this.readersThatViewedCount;
        }

        public final Bucket copy(String __typename, long dayStartsAt, PostStatsDailyBundleMembershipType membershipType, long readersThatClappedCount, long readersThatHighlightedCount, long readersThatInitiallyFollowedAuthorFromThisPostCount, long readersThatRepliedCount, long readersThatRepostedCount, long readersThatViewedCount, long readersThatReadCount) {
            __typename.getClass();
            membershipType.getClass();
            return new Bucket(__typename, dayStartsAt, membershipType, readersThatClappedCount, readersThatHighlightedCount, readersThatInitiallyFollowedAuthorFromThisPostCount, readersThatRepliedCount, readersThatRepostedCount, readersThatViewedCount, readersThatReadCount);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Bucket)) {
                return false;
            }
            Bucket bucket = (Bucket) other;
            return g76.L(this.__typename, bucket.__typename) && this.dayStartsAt == bucket.dayStartsAt && this.membershipType == bucket.membershipType && this.readersThatClappedCount == bucket.readersThatClappedCount && this.readersThatHighlightedCount == bucket.readersThatHighlightedCount && this.readersThatInitiallyFollowedAuthorFromThisPostCount == bucket.readersThatInitiallyFollowedAuthorFromThisPostCount && this.readersThatRepliedCount == bucket.readersThatRepliedCount && this.readersThatRepostedCount == bucket.readersThatRepostedCount && this.readersThatViewedCount == bucket.readersThatViewedCount && this.readersThatReadCount == bucket.readersThatReadCount;
        }

        public final long getDayStartsAt() {
            return this.dayStartsAt;
        }

        public final PostStatsDailyBundleMembershipType getMembershipType() {
            return this.membershipType;
        }

        public final long getReadersThatClappedCount() {
            return this.readersThatClappedCount;
        }

        public final long getReadersThatHighlightedCount() {
            return this.readersThatHighlightedCount;
        }

        public final long getReadersThatInitiallyFollowedAuthorFromThisPostCount() {
            return this.readersThatInitiallyFollowedAuthorFromThisPostCount;
        }

        public final long getReadersThatReadCount() {
            return this.readersThatReadCount;
        }

        public final long getReadersThatRepliedCount() {
            return this.readersThatRepliedCount;
        }

        public final long getReadersThatRepostedCount() {
            return this.readersThatRepostedCount;
        }

        public final long getReadersThatViewedCount() {
            return this.readersThatViewedCount;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            long j = this.dayStartsAt;
            int iHashCode2 = (this.membershipType.hashCode() + ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31)) * 31;
            long j2 = this.readersThatClappedCount;
            int i = (iHashCode2 + ((int) (j2 ^ (j2 >>> 32)))) * 31;
            long j3 = this.readersThatHighlightedCount;
            int i2 = (i + ((int) (j3 ^ (j3 >>> 32)))) * 31;
            long j4 = this.readersThatInitiallyFollowedAuthorFromThisPostCount;
            int i3 = (i2 + ((int) (j4 ^ (j4 >>> 32)))) * 31;
            long j5 = this.readersThatRepliedCount;
            int i4 = (i3 + ((int) (j5 ^ (j5 >>> 32)))) * 31;
            long j6 = this.readersThatRepostedCount;
            int i5 = (i4 + ((int) (j6 ^ (j6 >>> 32)))) * 31;
            long j7 = this.readersThatViewedCount;
            int i6 = (i5 + ((int) (j7 ^ (j7 >>> 32)))) * 31;
            long j8 = this.readersThatReadCount;
            return i6 + ((int) ((j8 >>> 32) ^ j8));
        }

        public final String toString() {
            String str = this.__typename;
            long j = this.dayStartsAt;
            PostStatsDailyBundleMembershipType postStatsDailyBundleMembershipType = this.membershipType;
            long j2 = this.readersThatClappedCount;
            long j3 = this.readersThatHighlightedCount;
            long j4 = this.readersThatInitiallyFollowedAuthorFromThisPostCount;
            long j5 = this.readersThatRepliedCount;
            long j6 = this.readersThatRepostedCount;
            long j7 = this.readersThatViewedCount;
            long j8 = this.readersThatReadCount;
            StringBuilder sbI = ho2.I(j, "Bucket(__typename=", str, ", dayStartsAt=");
            sbI.append(", membershipType=");
            sbI.append(postStatsDailyBundleMembershipType);
            sbI.append(", readersThatClappedCount=");
            sbI.append(j2);
            wgd.y(sbI, ", readersThatHighlightedCount=", j3, ", readersThatInitiallyFollowedAuthorFromThisPostCount=");
            sbI.append(j4);
            wgd.y(sbI, ", readersThatRepliedCount=", j5, ", readersThatRepostedCount=");
            sbI.append(j6);
            wgd.y(sbI, ", readersThatViewedCount=", j7, ", readersThatReadCount=");
            return ev6.t(j8, ")", sbI);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0010J0\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010\u0016J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0011\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery$DailyEarning;", "", "__typename", "", "amount", "", "periodStartedAt", "", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getAmount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getPeriodStartedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$DailyEarning;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class DailyEarning {
        private final String __typename;
        private final Integer amount;
        private final Long periodStartedAt;

        public DailyEarning(String str, Integer num, Long l) {
            str.getClass();
            this.__typename = str;
            this.amount = num;
            this.periodStartedAt = l;
        }

        public static /* synthetic */ DailyEarning copy$default(DailyEarning dailyEarning, String str, Integer num, Long l, int i, Object obj) {
            if ((i & 1) != 0) {
                str = dailyEarning.__typename;
            }
            if ((i & 2) != 0) {
                num = dailyEarning.amount;
            }
            if ((i & 4) != 0) {
                l = dailyEarning.periodStartedAt;
            }
            return dailyEarning.copy(str, num, l);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getAmount() {
            return this.amount;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Long getPeriodStartedAt() {
            return this.periodStartedAt;
        }

        public final DailyEarning copy(String __typename, Integer amount, Long periodStartedAt) {
            __typename.getClass();
            return new DailyEarning(__typename, amount, periodStartedAt);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof DailyEarning)) {
                return false;
            }
            DailyEarning dailyEarning = (DailyEarning) other;
            return g76.L(this.__typename, dailyEarning.__typename) && g76.L(this.amount, dailyEarning.amount) && g76.L(this.periodStartedAt, dailyEarning.periodStartedAt);
        }

        public final Integer getAmount() {
            return this.amount;
        }

        public final Long getPeriodStartedAt() {
            return this.periodStartedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.amount;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Long l = this.periodStartedAt;
            return iHashCode2 + (l != null ? l.hashCode() : 0);
        }

        public final String toString() {
            return "DailyEarning(__typename=" + this.__typename + ", amount=" + this.amount + ", periodStartedAt=" + this.periodStartedAt + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010\n\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ&\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\tR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;", "postStatsDailyBundle", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;", "post", "<init>", "(Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;)V", "component1", "()Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;", "component2", "()Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;", "copy", "(Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;", "getPostStatsDailyBundle", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;", "getPost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Post post;
        private final PostStatsDailyBundle postStatsDailyBundle;

        public Data(PostStatsDailyBundle postStatsDailyBundle, Post post) {
            postStatsDailyBundle.getClass();
            this.postStatsDailyBundle = postStatsDailyBundle;
            this.post = post;
        }

        public static /* synthetic */ Data copy$default(Data data, PostStatsDailyBundle postStatsDailyBundle, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                postStatsDailyBundle = data.postStatsDailyBundle;
            }
            if ((i & 2) != 0) {
                post = data.post;
            }
            return data.copy(postStatsDailyBundle, post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PostStatsDailyBundle getPostStatsDailyBundle() {
            return this.postStatsDailyBundle;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final Data copy(PostStatsDailyBundle postStatsDailyBundle, Post post) {
            postStatsDailyBundle.getClass();
            return new Data(postStatsDailyBundle, post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.postStatsDailyBundle, data.postStatsDailyBundle) && g76.L(this.post, data.post);
        }

        public final Post getPost() {
            return this.post;
        }

        public final PostStatsDailyBundle getPostStatsDailyBundle() {
            return this.postStatsDailyBundle;
        }

        public final int hashCode() {
            int iHashCode = this.postStatsDailyBundle.hashCode() * 31;
            Post post = this.post;
            return iHashCode + (post == null ? 0 : post.hashCode());
        }

        public final String toString() {
            return "Data(postStatsDailyBundle=" + this.postStatsDailyBundle + ", post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;", "", "__typename", "", "dailyEarnings", "", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$DailyEarning;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getDailyEarnings", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Earnings {
        private final String __typename;
        private final List<DailyEarning> dailyEarnings;

        public Earnings(String str, List<DailyEarning> list) {
            str.getClass();
            this.__typename = str;
            this.dailyEarnings = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Earnings copy$default(Earnings earnings, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = earnings.__typename;
            }
            if ((i & 2) != 0) {
                list = earnings.dailyEarnings;
            }
            return earnings.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<DailyEarning> component2() {
            return this.dailyEarnings;
        }

        public final Earnings copy(String __typename, List<DailyEarning> dailyEarnings) {
            __typename.getClass();
            return new Earnings(__typename, dailyEarnings);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Earnings)) {
                return false;
            }
            Earnings earnings = (Earnings) other;
            return g76.L(this.__typename, earnings.__typename) && g76.L(this.dailyEarnings, earnings.dailyEarnings);
        }

        public final List<DailyEarning> getDailyEarnings() {
            return this.dailyEarnings;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            List<DailyEarning> list = this.dailyEarnings;
            return iHashCode + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            return ka1.s("Earnings(__typename=", this.__typename, ", dailyEarnings=", ")", this.dailyEarnings);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\n\u001a\u00020\u0003¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u0010J\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0012J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\tHÆ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003JF\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\n\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u001dJ\u0013\u0010\u001e\u001a\u00020\u00072\b\u0010\u001f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010 \u001a\u00020!HÖ\u0001J\t\u0010\"\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u0011\u001a\u0004\b\u000f\u0010\u0010R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0013\u001a\u0004\b\u0006\u0010\u0012R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\n\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u000e¨\u0006#"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;", "", "__typename", "", "firstPublishedAt", "", "isLocked", "", "earnings", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getFirstPublishedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getEarnings", "()Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;", "getId", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Earnings;Ljava/lang/String;)Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Post;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final Earnings earnings;
        private final Long firstPublishedAt;
        private final String id;
        private final Boolean isLocked;

        public Post(String str, Long l, Boolean bool, Earnings earnings, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.firstPublishedAt = l;
            this.isLocked = bool;
            this.earnings = earnings;
            this.id = str2;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, Long l, Boolean bool, Earnings earnings, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                l = post.firstPublishedAt;
            }
            if ((i & 4) != 0) {
                bool = post.isLocked;
            }
            if ((i & 8) != 0) {
                earnings = post.earnings;
            }
            if ((i & 16) != 0) {
                str2 = post.id;
            }
            String str3 = str2;
            Boolean bool2 = bool;
            return post.copy(str, l, bool2, earnings, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getFirstPublishedAt() {
            return this.firstPublishedAt;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Boolean getIsLocked() {
            return this.isLocked;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Earnings getEarnings() {
            return this.earnings;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Post copy(String __typename, Long firstPublishedAt, Boolean isLocked, Earnings earnings, String id) {
            __typename.getClass();
            id.getClass();
            return new Post(__typename, firstPublishedAt, isLocked, earnings, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.firstPublishedAt, post.firstPublishedAt) && g76.L(this.isLocked, post.isLocked) && g76.L(this.earnings, post.earnings) && g76.L(this.id, post.id);
        }

        public final Earnings getEarnings() {
            return this.earnings;
        }

        public final Long getFirstPublishedAt() {
            return this.firstPublishedAt;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.firstPublishedAt;
            int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
            Boolean bool = this.isLocked;
            int iHashCode3 = (iHashCode2 + (bool == null ? 0 : bool.hashCode())) * 31;
            Earnings earnings = this.earnings;
            return this.id.hashCode() + ((iHashCode3 + (earnings != null ? earnings.hashCode() : 0)) * 31);
        }

        public final Boolean isLocked() {
            return this.isLocked;
        }

        public final String toString() {
            String str = this.__typename;
            Long l = this.firstPublishedAt;
            Boolean bool = this.isLocked;
            Earnings earnings = this.earnings;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Post(__typename=");
            sb.append(str);
            sb.append(", firstPublishedAt=");
            sb.append(l);
            sb.append(", isLocked=");
            sb.append(bool);
            sb.append(", earnings=");
            sb.append(earnings);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery$PostStatsDailyBundle;", "", "__typename", "", "buckets", "", "Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Bucket;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getBuckets", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostStatsDailyBundle {
        private final String __typename;
        private final List<Bucket> buckets;

        public PostStatsDailyBundle(String str, List<Bucket> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.buckets = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PostStatsDailyBundle copy$default(PostStatsDailyBundle postStatsDailyBundle, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postStatsDailyBundle.__typename;
            }
            if ((i & 2) != 0) {
                list = postStatsDailyBundle.buckets;
            }
            return postStatsDailyBundle.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Bucket> component2() {
            return this.buckets;
        }

        public final PostStatsDailyBundle copy(String __typename, List<Bucket> buckets) {
            __typename.getClass();
            buckets.getClass();
            return new PostStatsDailyBundle(__typename, buckets);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostStatsDailyBundle)) {
                return false;
            }
            PostStatsDailyBundle postStatsDailyBundle = (PostStatsDailyBundle) other;
            return g76.L(this.__typename, postStatsDailyBundle.__typename) && g76.L(this.buckets, postStatsDailyBundle.buckets);
        }

        public final List<Bucket> getBuckets() {
            return this.buckets;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.buckets.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("PostStatsDailyBundle(__typename=", this.__typename, ", buckets=", ")", this.buckets);
        }
    }

    public GetPostStatMonthlyQuery(String str, long j, long j2) {
        str.getClass();
        this.postId = str;
        this.startTime = j;
        this.endTime = j2;
    }

    public static /* synthetic */ GetPostStatMonthlyQuery copy$default(GetPostStatMonthlyQuery getPostStatMonthlyQuery, String str, long j, long j2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = getPostStatMonthlyQuery.postId;
        }
        if ((i & 2) != 0) {
            j = getPostStatMonthlyQuery.startTime;
        }
        if ((i & 4) != 0) {
            j2 = getPostStatMonthlyQuery.endTime;
        }
        return getPostStatMonthlyQuery.copy(str, j, j2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetPostStatMonthlyQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final long getStartTime() {
        return this.startTime;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final long getEndTime() {
        return this.endTime;
    }

    public final GetPostStatMonthlyQuery copy(String postId, long startTime, long endTime) {
        postId.getClass();
        return new GetPostStatMonthlyQuery(postId, startTime, endTime);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetPostStatMonthlyQuery($postId: ID!, $startTime: Long!, $endTime: Long!) { postStatsDailyBundle(postStatsDailyBundleInput: { fromDayStartsAt: $startTime toDayStartsAt: $endTime postId: $postId } ) { __typename buckets { __typename dayStartsAt membershipType readersThatClappedCount readersThatHighlightedCount readersThatInitiallyFollowedAuthorFromThisPostCount readersThatRepliedCount readersThatRepostedCount readersThatViewedCount readersThatReadCount } } post(id: $postId) { __typename firstPublishedAt isLocked earnings { __typename dailyEarnings(startAt: $startTime, endAt: $endTime) { __typename amount periodStartedAt } } id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof GetPostStatMonthlyQuery)) {
            return false;
        }
        GetPostStatMonthlyQuery getPostStatMonthlyQuery = (GetPostStatMonthlyQuery) other;
        return g76.L(this.postId, getPostStatMonthlyQuery.postId) && this.startTime == getPostStatMonthlyQuery.startTime && this.endTime == getPostStatMonthlyQuery.endTime;
    }

    public final long getEndTime() {
        return this.endTime;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final long getStartTime() {
        return this.startTime;
    }

    public final int hashCode() {
        int iHashCode = this.postId.hashCode() * 31;
        long j = this.startTime;
        int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.endTime;
        return i + ((int) (j2 ^ (j2 >>> 32)));
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = GetPostStatMonthlyQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        GetPostStatMonthlyQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.postId;
        long j = this.startTime;
        long j2 = this.endTime;
        StringBuilder sbI = ho2.I(j, "GetPostStatMonthlyQuery(postId=", str, ", startTime=");
        sbI.append(", endTime=");
        sbI.append(j2);
        sbI.append(")");
        return sbI.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetPostStatMonthlyQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetPostStatMonthlyQuery($postId: ID!, $startTime: Long!, $endTime: Long!) { postStatsDailyBundle(postStatsDailyBundleInput: { fromDayStartsAt: $startTime toDayStartsAt: $endTime postId: $postId } ) { __typename buckets { __typename dayStartsAt membershipType readersThatClappedCount readersThatHighlightedCount readersThatInitiallyFollowedAuthorFromThisPostCount readersThatRepliedCount readersThatRepostedCount readersThatViewedCount readersThatReadCount } } post(id: $postId) { __typename firstPublishedAt isLocked earnings { __typename dailyEarnings(startAt: $startTime, endAt: $endTime) { __typename amount periodStartedAt } } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
