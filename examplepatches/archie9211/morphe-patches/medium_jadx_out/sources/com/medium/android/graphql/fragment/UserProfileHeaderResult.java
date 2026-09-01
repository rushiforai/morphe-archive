package com.medium.android.graphql.fragment;

import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0017\b\u0086\b\u0018\u00002\u00020\u0001:\u00069:;<=>BK\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0019J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJb\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000eHÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\"\u0010\u0013J\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010)\u001a\u00020(2\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b)\u0010*R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010+\u001a\u0004\b,\u0010\u0013R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010-\u001a\u0004\b.\u0010\u0015R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010/\u001a\u0004\b0\u0010\u0017R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u00101\u001a\u0004\b2\u0010\u0019R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u00103\u001a\u0004\b4\u0010\u001bR\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u00105\u001a\u0004\b6\u0010\u001dR\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u00107\u001a\u0004\b8\u0010\u001f¨\u0006?"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderResult;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnUser;", "onUser", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnGraphqlEmptyId;", "onGraphqlEmptyId", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnNotFound;", "onNotFound", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnSuspended;", "onSuspended", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnBlocked;", "onBlocked", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnAccountSuspended;", "onAccountSuspended", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnUser;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnGraphqlEmptyId;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnNotFound;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnSuspended;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnBlocked;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnAccountSuspended;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnUser;", "component3", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnGraphqlEmptyId;", "component4", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnNotFound;", "component5", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnSuspended;", "component6", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnBlocked;", "component7", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnAccountSuspended;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnUser;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnGraphqlEmptyId;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnNotFound;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnSuspended;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnBlocked;Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnAccountSuspended;)Lcom/medium/android/graphql/fragment/UserProfileHeaderResult;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnUser;", "getOnUser", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnGraphqlEmptyId;", "getOnGraphqlEmptyId", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnNotFound;", "getOnNotFound", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnSuspended;", "getOnSuspended", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnBlocked;", "getOnBlocked", "Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnAccountSuspended;", "getOnAccountSuspended", "OnUser", "OnGraphqlEmptyId", "OnNotFound", "OnSuspended", "OnBlocked", "OnAccountSuspended", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserProfileHeaderResult implements g15 {
    private final String __typename;
    private final OnAccountSuspended onAccountSuspended;
    private final OnBlocked onBlocked;
    private final OnGraphqlEmptyId onGraphqlEmptyId;
    private final OnNotFound onNotFound;
    private final OnSuspended onSuspended;
    private final OnUser onUser;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnAccountSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnBlocked;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnGraphqlEmptyId;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderResult$OnUser;", "", "id", "", "userProfileHeaderData", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserProfileHeaderData;)V", "getId", "()Ljava/lang/String;", "getUserProfileHeaderData", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final String id;
        private final UserProfileHeaderData userProfileHeaderData;

        public OnUser(String str, UserProfileHeaderData userProfileHeaderData) {
            str.getClass();
            userProfileHeaderData.getClass();
            this.id = str;
            this.userProfileHeaderData = userProfileHeaderData;
        }

        public static /* synthetic */ OnUser copy$default(OnUser onUser, String str, UserProfileHeaderData userProfileHeaderData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUser.id;
            }
            if ((i & 2) != 0) {
                userProfileHeaderData = onUser.userProfileHeaderData;
            }
            return onUser.copy(str, userProfileHeaderData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final UserProfileHeaderData getUserProfileHeaderData() {
            return this.userProfileHeaderData;
        }

        public final OnUser copy(String id, UserProfileHeaderData userProfileHeaderData) {
            id.getClass();
            userProfileHeaderData.getClass();
            return new OnUser(id, userProfileHeaderData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.id, onUser.id) && g76.L(this.userProfileHeaderData, onUser.userProfileHeaderData);
        }

        public final String getId() {
            return this.id;
        }

        public final UserProfileHeaderData getUserProfileHeaderData() {
            return this.userProfileHeaderData;
        }

        public final int hashCode() {
            return this.userProfileHeaderData.hashCode() + (this.id.hashCode() * 31);
        }

        public final String toString() {
            return "OnUser(id=" + this.id + ", userProfileHeaderData=" + this.userProfileHeaderData + ")";
        }
    }

    public UserProfileHeaderResult(String str, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended) {
        str.getClass();
        this.__typename = str;
        this.onUser = onUser;
        this.onGraphqlEmptyId = onGraphqlEmptyId;
        this.onNotFound = onNotFound;
        this.onSuspended = onSuspended;
        this.onBlocked = onBlocked;
        this.onAccountSuspended = onAccountSuspended;
    }

    public static /* synthetic */ UserProfileHeaderResult copy$default(UserProfileHeaderResult userProfileHeaderResult, String str, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userProfileHeaderResult.__typename;
        }
        if ((i & 2) != 0) {
            onUser = userProfileHeaderResult.onUser;
        }
        if ((i & 4) != 0) {
            onGraphqlEmptyId = userProfileHeaderResult.onGraphqlEmptyId;
        }
        if ((i & 8) != 0) {
            onNotFound = userProfileHeaderResult.onNotFound;
        }
        if ((i & 16) != 0) {
            onSuspended = userProfileHeaderResult.onSuspended;
        }
        if ((i & 32) != 0) {
            onBlocked = userProfileHeaderResult.onBlocked;
        }
        if ((i & 64) != 0) {
            onAccountSuspended = userProfileHeaderResult.onAccountSuspended;
        }
        OnBlocked onBlocked2 = onBlocked;
        OnAccountSuspended onAccountSuspended2 = onAccountSuspended;
        OnSuspended onSuspended2 = onSuspended;
        OnGraphqlEmptyId onGraphqlEmptyId2 = onGraphqlEmptyId;
        return userProfileHeaderResult.copy(str, onUser, onGraphqlEmptyId2, onNotFound, onSuspended2, onBlocked2, onAccountSuspended2);
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
    public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
        return this.onGraphqlEmptyId;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final OnNotFound getOnNotFound() {
        return this.onNotFound;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final OnSuspended getOnSuspended() {
        return this.onSuspended;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final OnBlocked getOnBlocked() {
        return this.onBlocked;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final OnAccountSuspended getOnAccountSuspended() {
        return this.onAccountSuspended;
    }

    public final UserProfileHeaderResult copy(String __typename, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended) {
        __typename.getClass();
        return new UserProfileHeaderResult(__typename, onUser, onGraphqlEmptyId, onNotFound, onSuspended, onBlocked, onAccountSuspended);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserProfileHeaderResult)) {
            return false;
        }
        UserProfileHeaderResult userProfileHeaderResult = (UserProfileHeaderResult) other;
        return g76.L(this.__typename, userProfileHeaderResult.__typename) && g76.L(this.onUser, userProfileHeaderResult.onUser) && g76.L(this.onGraphqlEmptyId, userProfileHeaderResult.onGraphqlEmptyId) && g76.L(this.onNotFound, userProfileHeaderResult.onNotFound) && g76.L(this.onSuspended, userProfileHeaderResult.onSuspended) && g76.L(this.onBlocked, userProfileHeaderResult.onBlocked) && g76.L(this.onAccountSuspended, userProfileHeaderResult.onAccountSuspended);
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
        OnGraphqlEmptyId onGraphqlEmptyId = this.onGraphqlEmptyId;
        int iHashCode3 = (iHashCode2 + (onGraphqlEmptyId == null ? 0 : onGraphqlEmptyId.hashCode())) * 31;
        OnNotFound onNotFound = this.onNotFound;
        int iHashCode4 = (iHashCode3 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
        OnSuspended onSuspended = this.onSuspended;
        int iHashCode5 = (iHashCode4 + (onSuspended == null ? 0 : onSuspended.hashCode())) * 31;
        OnBlocked onBlocked = this.onBlocked;
        int iHashCode6 = (iHashCode5 + (onBlocked == null ? 0 : onBlocked.hashCode())) * 31;
        OnAccountSuspended onAccountSuspended = this.onAccountSuspended;
        return iHashCode6 + (onAccountSuspended != null ? onAccountSuspended.hashCode() : 0);
    }

    public final String toString() {
        return "UserProfileHeaderResult(__typename=" + this.__typename + ", onUser=" + this.onUser + ", onGraphqlEmptyId=" + this.onGraphqlEmptyId + ", onNotFound=" + this.onNotFound + ", onSuspended=" + this.onSuspended + ", onBlocked=" + this.onBlocked + ", onAccountSuspended=" + this.onAccountSuspended + ")";
    }
}
