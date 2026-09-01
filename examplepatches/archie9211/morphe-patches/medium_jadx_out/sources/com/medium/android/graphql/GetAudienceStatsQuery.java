package com.medium.android.graphql;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.medium.android.graphql.adapter.GetAudienceStatsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.GetAudienceStatsQuery_VariablesAdapter;
import com.medium.android.graphql.selections.GetAudienceStatsQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0013\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\r()*+,-./0123'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u00064"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery;", "Luqa;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$Data;", "", "userId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/GetAudienceStatsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Companion", "Data", "UserResult", "OnUser", "ViewerEdge", "AudienceStats", "Totals", "Timeseries", "OnNotFound", "OnBlocked", "OnGraphqlEmptyId", "OnSuspended", "OnAccountSuspended", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class GetAudienceStatsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "59c4bd429d1df5df3e50ef2d2b3dcaa9806aef4593282f706058d87b1d838c31";
    public static final String OPERATION_NAME = "GetAudienceStatsQuery";
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0010\u0010\u0006\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\b\u0018\u00010\u0007¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0013\u0010\u0013\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\b\u0018\u00010\u0007HÆ\u0003J3\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0012\b\u0002\u0010\u0006\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\b\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u001b\u0010\u0006\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\b\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;", "", "__typename", "", "totals", "Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;", "timeseries", "", "Lcom/medium/android/graphql/GetAudienceStatsQuery$Timeseries;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getTotals", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;", "getTimeseries", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class AudienceStats {
        private final String __typename;
        private final List<Timeseries> timeseries;
        private final Totals totals;

        public AudienceStats(String str, Totals totals, List<Timeseries> list) {
            str.getClass();
            this.__typename = str;
            this.totals = totals;
            this.timeseries = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ AudienceStats copy$default(AudienceStats audienceStats, String str, Totals totals, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = audienceStats.__typename;
            }
            if ((i & 2) != 0) {
                totals = audienceStats.totals;
            }
            if ((i & 4) != 0) {
                list = audienceStats.timeseries;
            }
            return audienceStats.copy(str, totals, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Totals getTotals() {
            return this.totals;
        }

        public final List<Timeseries> component3() {
            return this.timeseries;
        }

        public final AudienceStats copy(String __typename, Totals totals, List<Timeseries> timeseries) {
            __typename.getClass();
            return new AudienceStats(__typename, totals, timeseries);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AudienceStats)) {
                return false;
            }
            AudienceStats audienceStats = (AudienceStats) other;
            return g76.L(this.__typename, audienceStats.__typename) && g76.L(this.totals, audienceStats.totals) && g76.L(this.timeseries, audienceStats.timeseries);
        }

        public final List<Timeseries> getTimeseries() {
            return this.timeseries;
        }

        public final Totals getTotals() {
            return this.totals;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Totals totals = this.totals;
            int iHashCode2 = (iHashCode + (totals == null ? 0 : totals.hashCode())) * 31;
            List<Timeseries> list = this.timeseries;
            return iHashCode2 + (list != null ? list.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            Totals totals = this.totals;
            List<Timeseries> list = this.timeseries;
            StringBuilder sb = new StringBuilder("AudienceStats(__typename=");
            sb.append(str);
            sb.append(", totals=");
            sb.append(totals);
            sb.append(", timeseries=");
            return b09.B(sb, list, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;", "userResult", "<init>", "(Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;)V", "component1", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;", "copy", "(Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;)Lcom/medium/android/graphql/GetAudienceStatsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;", "getUserResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final UserResult userResult;

        public Data(UserResult userResult) {
            this.userResult = userResult;
        }

        public static Data copy$default(Data data, UserResult userResult, int i, Object obj) {
            if ((i & 1) != 0) {
                userResult = data.userResult;
            }
            data.getClass();
            return new Data(userResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UserResult getUserResult() {
            return this.userResult;
        }

        public final Data copy(UserResult userResult) {
            return new Data(userResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.userResult, ((Data) other).userResult);
        }

        public final UserResult getUserResult() {
            return this.userResult;
        }

        public final int hashCode() {
            UserResult userResult = this.userResult;
            if (userResult == null) {
                return 0;
            }
            return userResult.hashCode();
        }

        public final String toString() {
            return "Data(userResult=" + this.userResult + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$OnAccountSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAccountSuspended {
        private final String message;

        public OnAccountSuspended(String str) {
            this.message = str;
        }

        public static OnAccountSuspended copy$default(OnAccountSuspended onAccountSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onAccountSuspended.message;
            }
            onAccountSuspended.getClass();
            return new OnAccountSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnAccountSuspended copy(String message) {
            return new OnAccountSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnAccountSuspended) && g76.L(this.message, ((OnAccountSuspended) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnAccountSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$OnBlocked;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBlocked {
        private final String message;

        public OnBlocked(String str) {
            this.message = str;
        }

        public static OnBlocked copy$default(OnBlocked onBlocked, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBlocked.message;
            }
            onBlocked.getClass();
            return new OnBlocked(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBlocked copy(String message) {
            return new OnBlocked(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBlocked) && g76.L(this.message, ((OnBlocked) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnBlocked(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$OnGraphqlEmptyId;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnGraphqlEmptyId {
        private final String message;

        public OnGraphqlEmptyId(String str) {
            this.message = str;
        }

        public static OnGraphqlEmptyId copy$default(OnGraphqlEmptyId onGraphqlEmptyId, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onGraphqlEmptyId.message;
            }
            onGraphqlEmptyId.getClass();
            return new OnGraphqlEmptyId(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnGraphqlEmptyId copy(String message) {
            return new OnGraphqlEmptyId(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnGraphqlEmptyId) && g76.L(this.message, ((OnGraphqlEmptyId) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnGraphqlEmptyId(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnNotFound {
        private final String message;

        public OnNotFound(String str) {
            this.message = str;
        }

        public static OnNotFound copy$default(OnNotFound onNotFound, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onNotFound.message;
            }
            onNotFound.getClass();
            return new OnNotFound(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnNotFound copy(String message) {
            return new OnNotFound(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnNotFound) && g76.L(this.message, ((OnNotFound) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnNotFound(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$OnSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnSuspended {
        private final String message;

        public OnSuspended(String str) {
            this.message = str;
        }

        public static OnSuspended copy$default(OnSuspended onSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onSuspended.message;
            }
            onSuspended.getClass();
            return new OnSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnSuspended copy(String message) {
            return new OnSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnSuspended) && g76.L(this.message, ((OnSuspended) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$OnUser;", "", "viewerEdge", "Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;", "id", "", "<init>", "(Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;Ljava/lang/String;)V", "getViewerEdge", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;", "getId", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final String id;
        private final ViewerEdge viewerEdge;

        public OnUser(ViewerEdge viewerEdge, String str) {
            viewerEdge.getClass();
            str.getClass();
            this.viewerEdge = viewerEdge;
            this.id = str;
        }

        public static /* synthetic */ OnUser copy$default(OnUser onUser, ViewerEdge viewerEdge, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                viewerEdge = onUser.viewerEdge;
            }
            if ((i & 2) != 0) {
                str = onUser.id;
            }
            return onUser.copy(viewerEdge, str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnUser copy(ViewerEdge viewerEdge, String id) {
            viewerEdge.getClass();
            id.getClass();
            return new OnUser(viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.viewerEdge, onUser.viewerEdge) && g76.L(this.id, onUser.id);
        }

        public final String getId() {
            return this.id;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.viewerEdge.hashCode() * 31);
        }

        public final String toString() {
            return "OnUser(viewerEdge=" + this.viewerEdge + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u0017\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0002\u0010\u0012J<\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001¢\u0006\u0002\u0010\u0019J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0010\u0010\u000eR\u0015\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\n\n\u0002\u0010\u0013\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$Timeseries;", "", "__typename", "", "followersTotal", "", "subscribersTotal", "collectedAt", "", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getFollowersTotal", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getSubscribersTotal", "getCollectedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;)Lcom/medium/android/graphql/GetAudienceStatsQuery$Timeseries;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Timeseries {
        private final String __typename;
        private final Long collectedAt;
        private final Integer followersTotal;
        private final Integer subscribersTotal;

        public Timeseries(String str, Integer num, Integer num2, Long l) {
            str.getClass();
            this.__typename = str;
            this.followersTotal = num;
            this.subscribersTotal = num2;
            this.collectedAt = l;
        }

        public static /* synthetic */ Timeseries copy$default(Timeseries timeseries, String str, Integer num, Integer num2, Long l, int i, Object obj) {
            if ((i & 1) != 0) {
                str = timeseries.__typename;
            }
            if ((i & 2) != 0) {
                num = timeseries.followersTotal;
            }
            if ((i & 4) != 0) {
                num2 = timeseries.subscribersTotal;
            }
            if ((i & 8) != 0) {
                l = timeseries.collectedAt;
            }
            return timeseries.copy(str, num, num2, l);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getFollowersTotal() {
            return this.followersTotal;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getSubscribersTotal() {
            return this.subscribersTotal;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Long getCollectedAt() {
            return this.collectedAt;
        }

        public final Timeseries copy(String __typename, Integer followersTotal, Integer subscribersTotal, Long collectedAt) {
            __typename.getClass();
            return new Timeseries(__typename, followersTotal, subscribersTotal, collectedAt);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Timeseries)) {
                return false;
            }
            Timeseries timeseries = (Timeseries) other;
            return g76.L(this.__typename, timeseries.__typename) && g76.L(this.followersTotal, timeseries.followersTotal) && g76.L(this.subscribersTotal, timeseries.subscribersTotal) && g76.L(this.collectedAt, timeseries.collectedAt);
        }

        public final Long getCollectedAt() {
            return this.collectedAt;
        }

        public final Integer getFollowersTotal() {
            return this.followersTotal;
        }

        public final Integer getSubscribersTotal() {
            return this.subscribersTotal;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.followersTotal;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.subscribersTotal;
            int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
            Long l = this.collectedAt;
            return iHashCode3 + (l != null ? l.hashCode() : 0);
        }

        public final String toString() {
            return "Timeseries(__typename=" + this.__typename + ", followersTotal=" + this.followersTotal + ", subscribersTotal=" + this.subscribersTotal + ", collectedAt=" + this.collectedAt + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJH\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0019J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0010\u0010\u000eR\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0011\u0010\u000eR\u0015\u0010\b\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0012\u0010\u000e¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;", "", "__typename", "", "followers", "", "subscribers", "followersPreviousMonth", "subscribersPreviousMonth", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getFollowers", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getSubscribers", "getFollowersPreviousMonth", "getSubscribersPreviousMonth", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/medium/android/graphql/GetAudienceStatsQuery$Totals;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Totals {
        private final String __typename;
        private final Integer followers;
        private final Integer followersPreviousMonth;
        private final Integer subscribers;
        private final Integer subscribersPreviousMonth;

        public Totals(String str, Integer num, Integer num2, Integer num3, Integer num4) {
            str.getClass();
            this.__typename = str;
            this.followers = num;
            this.subscribers = num2;
            this.followersPreviousMonth = num3;
            this.subscribersPreviousMonth = num4;
        }

        public static /* synthetic */ Totals copy$default(Totals totals, String str, Integer num, Integer num2, Integer num3, Integer num4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = totals.__typename;
            }
            if ((i & 2) != 0) {
                num = totals.followers;
            }
            if ((i & 4) != 0) {
                num2 = totals.subscribers;
            }
            if ((i & 8) != 0) {
                num3 = totals.followersPreviousMonth;
            }
            if ((i & 16) != 0) {
                num4 = totals.subscribersPreviousMonth;
            }
            Integer num5 = num4;
            Integer num6 = num2;
            return totals.copy(str, num, num6, num3, num5);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getFollowers() {
            return this.followers;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getSubscribers() {
            return this.subscribers;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Integer getFollowersPreviousMonth() {
            return this.followersPreviousMonth;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Integer getSubscribersPreviousMonth() {
            return this.subscribersPreviousMonth;
        }

        public final Totals copy(String __typename, Integer followers, Integer subscribers, Integer followersPreviousMonth, Integer subscribersPreviousMonth) {
            __typename.getClass();
            return new Totals(__typename, followers, subscribers, followersPreviousMonth, subscribersPreviousMonth);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Totals)) {
                return false;
            }
            Totals totals = (Totals) other;
            return g76.L(this.__typename, totals.__typename) && g76.L(this.followers, totals.followers) && g76.L(this.subscribers, totals.subscribers) && g76.L(this.followersPreviousMonth, totals.followersPreviousMonth) && g76.L(this.subscribersPreviousMonth, totals.subscribersPreviousMonth);
        }

        public final Integer getFollowers() {
            return this.followers;
        }

        public final Integer getFollowersPreviousMonth() {
            return this.followersPreviousMonth;
        }

        public final Integer getSubscribers() {
            return this.subscribers;
        }

        public final Integer getSubscribersPreviousMonth() {
            return this.subscribersPreviousMonth;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.followers;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.subscribers;
            int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
            Integer num3 = this.followersPreviousMonth;
            int iHashCode4 = (iHashCode3 + (num3 == null ? 0 : num3.hashCode())) * 31;
            Integer num4 = this.subscribersPreviousMonth;
            return iHashCode4 + (num4 != null ? num4.hashCode() : 0);
        }

        public final String toString() {
            return "Totals(__typename=" + this.__typename + ", followers=" + this.followers + ", subscribers=" + this.subscribers + ", followersPreviousMonth=" + this.followersPreviousMonth + ", subscribersPreviousMonth=" + this.subscribersPreviousMonth + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u000fHÆ\u0003J[\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÆ\u0001J\u0013\u0010(\u001a\u00020)2\b\u0010*\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010+\u001a\u00020,HÖ\u0001J\t\u0010-\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001f¨\u0006."}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$UserResult;", "", "__typename", "", "onUser", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnUser;", "onNotFound", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnNotFound;", "onBlocked", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnBlocked;", "onGraphqlEmptyId", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnGraphqlEmptyId;", "onSuspended", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnSuspended;", "onAccountSuspended", "Lcom/medium/android/graphql/GetAudienceStatsQuery$OnAccountSuspended;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnUser;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnNotFound;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnBlocked;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnGraphqlEmptyId;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnSuspended;Lcom/medium/android/graphql/GetAudienceStatsQuery$OnAccountSuspended;)V", "get__typename", "()Ljava/lang/String;", "getOnUser", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$OnUser;", "getOnNotFound", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$OnNotFound;", "getOnBlocked", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$OnBlocked;", "getOnGraphqlEmptyId", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$OnGraphqlEmptyId;", "getOnSuspended", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$OnSuspended;", "getOnAccountSuspended", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$OnAccountSuspended;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UserResult {
        private final String __typename;
        private final OnAccountSuspended onAccountSuspended;
        private final OnBlocked onBlocked;
        private final OnGraphqlEmptyId onGraphqlEmptyId;
        private final OnNotFound onNotFound;
        private final OnSuspended onSuspended;
        private final OnUser onUser;

        public UserResult(String str, OnUser onUser, OnNotFound onNotFound, OnBlocked onBlocked, OnGraphqlEmptyId onGraphqlEmptyId, OnSuspended onSuspended, OnAccountSuspended onAccountSuspended) {
            str.getClass();
            this.__typename = str;
            this.onUser = onUser;
            this.onNotFound = onNotFound;
            this.onBlocked = onBlocked;
            this.onGraphqlEmptyId = onGraphqlEmptyId;
            this.onSuspended = onSuspended;
            this.onAccountSuspended = onAccountSuspended;
        }

        public static /* synthetic */ UserResult copy$default(UserResult userResult, String str, OnUser onUser, OnNotFound onNotFound, OnBlocked onBlocked, OnGraphqlEmptyId onGraphqlEmptyId, OnSuspended onSuspended, OnAccountSuspended onAccountSuspended, int i, Object obj) {
            if ((i & 1) != 0) {
                str = userResult.__typename;
            }
            if ((i & 2) != 0) {
                onUser = userResult.onUser;
            }
            if ((i & 4) != 0) {
                onNotFound = userResult.onNotFound;
            }
            if ((i & 8) != 0) {
                onBlocked = userResult.onBlocked;
            }
            if ((i & 16) != 0) {
                onGraphqlEmptyId = userResult.onGraphqlEmptyId;
            }
            if ((i & 32) != 0) {
                onSuspended = userResult.onSuspended;
            }
            if ((i & 64) != 0) {
                onAccountSuspended = userResult.onAccountSuspended;
            }
            OnSuspended onSuspended2 = onSuspended;
            OnAccountSuspended onAccountSuspended2 = onAccountSuspended;
            OnGraphqlEmptyId onGraphqlEmptyId2 = onGraphqlEmptyId;
            OnNotFound onNotFound2 = onNotFound;
            return userResult.copy(str, onUser, onNotFound2, onBlocked, onGraphqlEmptyId2, onSuspended2, onAccountSuspended2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUser getOnUser() {
            return this.onUser;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnSuspended getOnSuspended() {
            return this.onSuspended;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final UserResult copy(String __typename, OnUser onUser, OnNotFound onNotFound, OnBlocked onBlocked, OnGraphqlEmptyId onGraphqlEmptyId, OnSuspended onSuspended, OnAccountSuspended onAccountSuspended) {
            __typename.getClass();
            return new UserResult(__typename, onUser, onNotFound, onBlocked, onGraphqlEmptyId, onSuspended, onAccountSuspended);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UserResult)) {
                return false;
            }
            UserResult userResult = (UserResult) other;
            return g76.L(this.__typename, userResult.__typename) && g76.L(this.onUser, userResult.onUser) && g76.L(this.onNotFound, userResult.onNotFound) && g76.L(this.onBlocked, userResult.onBlocked) && g76.L(this.onGraphqlEmptyId, userResult.onGraphqlEmptyId) && g76.L(this.onSuspended, userResult.onSuspended) && g76.L(this.onAccountSuspended, userResult.onAccountSuspended);
        }

        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnSuspended getOnSuspended() {
            return this.onSuspended;
        }

        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnUser onUser = this.onUser;
            int iHashCode2 = (iHashCode + (onUser == null ? 0 : onUser.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode3 = (iHashCode2 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            OnBlocked onBlocked = this.onBlocked;
            int iHashCode4 = (iHashCode3 + (onBlocked == null ? 0 : onBlocked.hashCode())) * 31;
            OnGraphqlEmptyId onGraphqlEmptyId = this.onGraphqlEmptyId;
            int iHashCode5 = (iHashCode4 + (onGraphqlEmptyId == null ? 0 : onGraphqlEmptyId.hashCode())) * 31;
            OnSuspended onSuspended = this.onSuspended;
            int iHashCode6 = (iHashCode5 + (onSuspended == null ? 0 : onSuspended.hashCode())) * 31;
            OnAccountSuspended onAccountSuspended = this.onAccountSuspended;
            return iHashCode6 + (onAccountSuspended != null ? onAccountSuspended.hashCode() : 0);
        }

        public final String toString() {
            return "UserResult(__typename=" + this.__typename + ", onUser=" + this.onUser + ", onNotFound=" + this.onNotFound + ", onBlocked=" + this.onBlocked + ", onGraphqlEmptyId=" + this.onGraphqlEmptyId + ", onSuspended=" + this.onSuspended + aJzfoQ.qJLEZlCgIT + this.onAccountSuspended + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J:\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0018J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\f¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;", "", "__typename", "", "createdAt", "", "audienceStats", "Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getCreatedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getAudienceStats", "()Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;", "getId", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/Long;Lcom/medium/android/graphql/GetAudienceStatsQuery$AudienceStats;Ljava/lang/String;)Lcom/medium/android/graphql/GetAudienceStatsQuery$ViewerEdge;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final AudienceStats audienceStats;
        private final Long createdAt;
        private final String id;

        public ViewerEdge(String str, Long l, AudienceStats audienceStats, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.createdAt = l;
            this.audienceStats = audienceStats;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, Long l, AudienceStats audienceStats, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                l = viewerEdge.createdAt;
            }
            if ((i & 4) != 0) {
                audienceStats = viewerEdge.audienceStats;
            }
            if ((i & 8) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, l, audienceStats, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getCreatedAt() {
            return this.createdAt;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final AudienceStats getAudienceStats() {
            return this.audienceStats;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, Long createdAt, AudienceStats audienceStats, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, createdAt, audienceStats, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.createdAt, viewerEdge.createdAt) && g76.L(this.audienceStats, viewerEdge.audienceStats) && g76.L(this.id, viewerEdge.id);
        }

        public final AudienceStats getAudienceStats() {
            return this.audienceStats;
        }

        public final Long getCreatedAt() {
            return this.createdAt;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.createdAt;
            int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
            AudienceStats audienceStats = this.audienceStats;
            return this.id.hashCode() + ((iHashCode2 + (audienceStats != null ? audienceStats.hashCode() : 0)) * 31);
        }

        public final String toString() {
            return "ViewerEdge(__typename=" + this.__typename + ", createdAt=" + this.createdAt + ", audienceStats=" + this.audienceStats + ", id=" + this.id + ")";
        }
    }

    public GetAudienceStatsQuery(String str) {
        str.getClass();
        this.userId = str;
    }

    public static /* synthetic */ GetAudienceStatsQuery copy$default(GetAudienceStatsQuery getAudienceStatsQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = getAudienceStatsQuery.userId;
        }
        return getAudienceStatsQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetAudienceStatsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final GetAudienceStatsQuery copy(String userId) {
        userId.getClass();
        return new GetAudienceStatsQuery(userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetAudienceStatsQuery($userId: ID!) { userResult(id: $userId) { __typename ... on User { viewerEdge { __typename createdAt audienceStats { __typename totals { __typename followers subscribers followersPreviousMonth subscribersPreviousMonth } timeseries(granularity: AUDIENCE_STATS_MONTHLY) { __typename followersTotal subscribersTotal collectedAt } } id } id } ... on NotFound { message } ... on Blocked { message } ... on GraphqlEmptyId { message } ... on Suspended { message } ... on GraphqlEmptyId { message } ... on AccountSuspended { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof GetAudienceStatsQuery) && g76.L(this.userId, ((GetAudienceStatsQuery) other).userId);
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode();
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
        List<sx1> list = GetAudienceStatsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        GetAudienceStatsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("GetAudienceStatsQuery(userId=", this.userId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetAudienceStatsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetAudienceStatsQuery($userId: ID!) { userResult(id: $userId) { __typename ... on User { viewerEdge { __typename createdAt audienceStats { __typename totals { __typename followers subscribers followersPreviousMonth subscribersPreviousMonth } timeseries(granularity: AUDIENCE_STATS_MONTHLY) { __typename followersTotal subscribersTotal collectedAt } } id } id } ... on NotFound { message } ... on Blocked { message } ... on GraphqlEmptyId { message } ... on Suspended { message } ... on GraphqlEmptyId { message } ... on AccountSuspended { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
