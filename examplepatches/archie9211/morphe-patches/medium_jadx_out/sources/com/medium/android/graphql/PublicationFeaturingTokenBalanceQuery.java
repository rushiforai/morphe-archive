package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublicationFeaturingTokenBalanceQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationFeaturingTokenBalanceQuery_VariablesAdapter;
import com.medium.android.graphql.selections.PublicationFeaturingTokenBalanceQuerySelections;
import com.medium.android.graphql.type.PublicationFeaturingTokenBalanceInput;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005*+,-)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006."}, d2 = {"Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$Data;", "Lcom/medium/android/graphql/type/PublicationFeaturingTokenBalanceInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/PublicationFeaturingTokenBalanceInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/PublicationFeaturingTokenBalanceInput;", "copy", "(Lcom/medium/android/graphql/type/PublicationFeaturingTokenBalanceInput;)Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/PublicationFeaturingTokenBalanceInput;", "getInput", "Companion", "Data", "PublicationFeaturingTokenBalance", "OnPublicationFeaturingTokenBalance", "OnUnauthorized", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationFeaturingTokenBalanceQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d6bb3866cb302a30363f31574a578a0f740aaee2b54df34c9c463a3a55d0f52b";
    public static final String OPERATION_NAME = "PublicationFeaturingTokenBalanceQuery";
    private final PublicationFeaturingTokenBalanceInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;", "publicationFeaturingTokenBalance", "<init>", "(Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;)V", "component1", "()Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;", "copy", "(Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;)Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;", "getPublicationFeaturingTokenBalance", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final PublicationFeaturingTokenBalance publicationFeaturingTokenBalance;

        public Data(PublicationFeaturingTokenBalance publicationFeaturingTokenBalance) {
            publicationFeaturingTokenBalance.getClass();
            this.publicationFeaturingTokenBalance = publicationFeaturingTokenBalance;
        }

        public static /* synthetic */ Data copy$default(Data data, PublicationFeaturingTokenBalance publicationFeaturingTokenBalance, int i, Object obj) {
            if ((i & 1) != 0) {
                publicationFeaturingTokenBalance = data.publicationFeaturingTokenBalance;
            }
            return data.copy(publicationFeaturingTokenBalance);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PublicationFeaturingTokenBalance getPublicationFeaturingTokenBalance() {
            return this.publicationFeaturingTokenBalance;
        }

        public final Data copy(PublicationFeaturingTokenBalance publicationFeaturingTokenBalance) {
            publicationFeaturingTokenBalance.getClass();
            return new Data(publicationFeaturingTokenBalance);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.publicationFeaturingTokenBalance, ((Data) other).publicationFeaturingTokenBalance);
        }

        public final PublicationFeaturingTokenBalance getPublicationFeaturingTokenBalance() {
            return this.publicationFeaturingTokenBalance;
        }

        public final int hashCode() {
            return this.publicationFeaturingTokenBalance.hashCode();
        }

        public final String toString() {
            return "Data(publicationFeaturingTokenBalance=" + this.publicationFeaturingTokenBalance + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u000eJ\t\u0010\u0015\u001a\u00020\u0006HÆ\u0003J8\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0002\u0010\u0017J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;", "", "availableTokens", "", "tokenCapacity", "nextRefillAt", "", "refillInterval", "<init>", "(IILjava/lang/Long;J)V", "getAvailableTokens", "()I", "getTokenCapacity", "getNextRefillAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getRefillInterval", "()J", "component1", "component2", "component3", "component4", "copy", "(IILjava/lang/Long;J)Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;", "equals", "", "other", "hashCode", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationFeaturingTokenBalance {
        private final int availableTokens;
        private final Long nextRefillAt;
        private final long refillInterval;
        private final int tokenCapacity;

        public OnPublicationFeaturingTokenBalance(int i, int i2, Long l, long j) {
            this.availableTokens = i;
            this.tokenCapacity = i2;
            this.nextRefillAt = l;
            this.refillInterval = j;
        }

        public static OnPublicationFeaturingTokenBalance copy$default(OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalance, int i, int i2, Long l, long j, int i3, Object obj) {
            if ((i3 & 1) != 0) {
                i = onPublicationFeaturingTokenBalance.availableTokens;
            }
            if ((i3 & 2) != 0) {
                i2 = onPublicationFeaturingTokenBalance.tokenCapacity;
            }
            if ((i3 & 4) != 0) {
                l = onPublicationFeaturingTokenBalance.nextRefillAt;
            }
            if ((i3 & 8) != 0) {
                j = onPublicationFeaturingTokenBalance.refillInterval;
            }
            long j2 = j;
            onPublicationFeaturingTokenBalance.getClass();
            Long l2 = l;
            return new OnPublicationFeaturingTokenBalance(i, i2, l2, j2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final int getAvailableTokens() {
            return this.availableTokens;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final int getTokenCapacity() {
            return this.tokenCapacity;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Long getNextRefillAt() {
            return this.nextRefillAt;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final long getRefillInterval() {
            return this.refillInterval;
        }

        public final OnPublicationFeaturingTokenBalance copy(int availableTokens, int tokenCapacity, Long nextRefillAt, long refillInterval) {
            return new OnPublicationFeaturingTokenBalance(availableTokens, tokenCapacity, nextRefillAt, refillInterval);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPublicationFeaturingTokenBalance)) {
                return false;
            }
            OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalance = (OnPublicationFeaturingTokenBalance) other;
            return this.availableTokens == onPublicationFeaturingTokenBalance.availableTokens && this.tokenCapacity == onPublicationFeaturingTokenBalance.tokenCapacity && g76.L(this.nextRefillAt, onPublicationFeaturingTokenBalance.nextRefillAt) && this.refillInterval == onPublicationFeaturingTokenBalance.refillInterval;
        }

        public final int getAvailableTokens() {
            return this.availableTokens;
        }

        public final Long getNextRefillAt() {
            return this.nextRefillAt;
        }

        public final long getRefillInterval() {
            return this.refillInterval;
        }

        public final int getTokenCapacity() {
            return this.tokenCapacity;
        }

        public final int hashCode() {
            int i = ((this.availableTokens * 31) + this.tokenCapacity) * 31;
            Long l = this.nextRefillAt;
            int iHashCode = (i + (l == null ? 0 : l.hashCode())) * 31;
            long j = this.refillInterval;
            return iHashCode + ((int) (j ^ (j >>> 32)));
        }

        public final String toString() {
            int i = this.availableTokens;
            int i2 = this.tokenCapacity;
            Long l = this.nextRefillAt;
            long j = this.refillInterval;
            StringBuilder sbB = ev6.B(i, i2, "OnPublicationFeaturingTokenBalance(availableTokens=", ", tokenCapacity=", ", nextRefillAt=");
            sbB.append(l);
            sbB.append(", refillInterval=");
            sbB.append(j);
            sbB.append(")");
            return sbB.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUnauthorized {
        private final String message;

        public OnUnauthorized(String str) {
            this.message = str;
        }

        public static OnUnauthorized copy$default(OnUnauthorized onUnauthorized, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUnauthorized.message;
            }
            onUnauthorized.getClass();
            return new OnUnauthorized(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnUnauthorized copy(String message) {
            return new OnUnauthorized(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUnauthorized) && g76.L(this.message, ((OnUnauthorized) other).message);
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
            return ev6.x("OnUnauthorized(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance;", "", "__typename", "", "onPublicationFeaturingTokenBalance", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;", "onUnauthorized", "Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnUnauthorized;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnUnauthorized;)V", "get__typename", "()Ljava/lang/String;", "getOnPublicationFeaturingTokenBalance", "()Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance;", "getOnUnauthorized", "()Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$OnUnauthorized;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublicationFeaturingTokenBalance {
        private final String __typename;
        private final OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalance;
        private final OnUnauthorized onUnauthorized;

        public PublicationFeaturingTokenBalance(String str, OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalance, OnUnauthorized onUnauthorized) {
            str.getClass();
            this.__typename = str;
            this.onPublicationFeaturingTokenBalance = onPublicationFeaturingTokenBalance;
            this.onUnauthorized = onUnauthorized;
        }

        public static /* synthetic */ PublicationFeaturingTokenBalance copy$default(PublicationFeaturingTokenBalance publicationFeaturingTokenBalance, String str, OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalance, OnUnauthorized onUnauthorized, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publicationFeaturingTokenBalance.__typename;
            }
            if ((i & 2) != 0) {
                onPublicationFeaturingTokenBalance = publicationFeaturingTokenBalance.onPublicationFeaturingTokenBalance;
            }
            if ((i & 4) != 0) {
                onUnauthorized = publicationFeaturingTokenBalance.onUnauthorized;
            }
            return publicationFeaturingTokenBalance.copy(str, onPublicationFeaturingTokenBalance, onUnauthorized);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPublicationFeaturingTokenBalance getOnPublicationFeaturingTokenBalance() {
            return this.onPublicationFeaturingTokenBalance;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final PublicationFeaturingTokenBalance copy(String __typename, OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalance, OnUnauthorized onUnauthorized) {
            __typename.getClass();
            return new PublicationFeaturingTokenBalance(__typename, onPublicationFeaturingTokenBalance, onUnauthorized);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublicationFeaturingTokenBalance)) {
                return false;
            }
            PublicationFeaturingTokenBalance publicationFeaturingTokenBalance = (PublicationFeaturingTokenBalance) other;
            return g76.L(this.__typename, publicationFeaturingTokenBalance.__typename) && g76.L(this.onPublicationFeaturingTokenBalance, publicationFeaturingTokenBalance.onPublicationFeaturingTokenBalance) && g76.L(this.onUnauthorized, publicationFeaturingTokenBalance.onUnauthorized);
        }

        public final OnPublicationFeaturingTokenBalance getOnPublicationFeaturingTokenBalance() {
            return this.onPublicationFeaturingTokenBalance;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPublicationFeaturingTokenBalance onPublicationFeaturingTokenBalance = this.onPublicationFeaturingTokenBalance;
            int iHashCode2 = (iHashCode + (onPublicationFeaturingTokenBalance == null ? 0 : onPublicationFeaturingTokenBalance.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            return iHashCode2 + (onUnauthorized != null ? onUnauthorized.hashCode() : 0);
        }

        public final String toString() {
            return "PublicationFeaturingTokenBalance(__typename=" + this.__typename + ", onPublicationFeaturingTokenBalance=" + this.onPublicationFeaturingTokenBalance + ", onUnauthorized=" + this.onUnauthorized + ")";
        }
    }

    public PublicationFeaturingTokenBalanceQuery(PublicationFeaturingTokenBalanceInput publicationFeaturingTokenBalanceInput) {
        publicationFeaturingTokenBalanceInput.getClass();
        this.input = publicationFeaturingTokenBalanceInput;
    }

    public static /* synthetic */ PublicationFeaturingTokenBalanceQuery copy$default(PublicationFeaturingTokenBalanceQuery publicationFeaturingTokenBalanceQuery, PublicationFeaturingTokenBalanceInput publicationFeaturingTokenBalanceInput, int i, Object obj) {
        if ((i & 1) != 0) {
            publicationFeaturingTokenBalanceInput = publicationFeaturingTokenBalanceQuery.input;
        }
        return publicationFeaturingTokenBalanceQuery.copy(publicationFeaturingTokenBalanceInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationFeaturingTokenBalanceQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final PublicationFeaturingTokenBalanceInput getInput() {
        return this.input;
    }

    public final PublicationFeaturingTokenBalanceQuery copy(PublicationFeaturingTokenBalanceInput input) {
        input.getClass();
        return new PublicationFeaturingTokenBalanceQuery(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationFeaturingTokenBalanceQuery($input: PublicationFeaturingTokenBalanceInput!) { publicationFeaturingTokenBalance(input: $input) { __typename ... on PublicationFeaturingTokenBalance { availableTokens tokenCapacity nextRefillAt refillInterval } ... on Unauthorized { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof PublicationFeaturingTokenBalanceQuery) && g76.L(this.input, ((PublicationFeaturingTokenBalanceQuery) other).input);
    }

    public final PublicationFeaturingTokenBalanceInput getInput() {
        return this.input;
    }

    public final int hashCode() {
        return this.input.hashCode();
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
        List<sx1> list = PublicationFeaturingTokenBalanceQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationFeaturingTokenBalanceQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "PublicationFeaturingTokenBalanceQuery(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationFeaturingTokenBalanceQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationFeaturingTokenBalanceQuery($input: PublicationFeaturingTokenBalanceInput!) { publicationFeaturingTokenBalance(input: $input) { __typename ... on PublicationFeaturingTokenBalance { availableTokens tokenCapacity nextRefillAt refillInterval } ... on Unauthorized { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
