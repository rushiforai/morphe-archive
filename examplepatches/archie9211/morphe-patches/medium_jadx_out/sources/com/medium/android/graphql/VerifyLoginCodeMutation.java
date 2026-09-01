package com.medium.android.graphql;

import com.medium.android.graphql.adapter.VerifyLoginCodeMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.VerifyLoginCodeMutation_VariablesAdapter;
import com.medium.android.graphql.selections.VerifyLoginCodeMutationSelections;
import com.medium.android.graphql.type.Mutation;
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
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\b()*+,-.'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation;", "Lv78;", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$Data;", "", "loginCode", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/VerifyLoginCodeMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getLoginCode", "Companion", "Data", "VerifyLoginCode", "OnToken", "OnBadRequest", "OnNotFound", "OnTooManyRequests", "OnRateLimited", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class VerifyLoginCodeMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "65fa5631a0151d5396d9ae5f8f0e26bbbd2b1e4b717b3b16327f4e5d0ae8c871";
    public static final String OPERATION_NAME = "VerifyLoginCodeMutation";
    private final String loginCode;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$VerifyLoginCode;", "verifyLoginCode", "<init>", "(Lcom/medium/android/graphql/VerifyLoginCodeMutation$VerifyLoginCode;)V", "component1", "()Lcom/medium/android/graphql/VerifyLoginCodeMutation$VerifyLoginCode;", "copy", "(Lcom/medium/android/graphql/VerifyLoginCodeMutation$VerifyLoginCode;)Lcom/medium/android/graphql/VerifyLoginCodeMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$VerifyLoginCode;", "getVerifyLoginCode", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final VerifyLoginCode verifyLoginCode;

        public Data(VerifyLoginCode verifyLoginCode) {
            this.verifyLoginCode = verifyLoginCode;
        }

        public static Data copy$default(Data data, VerifyLoginCode verifyLoginCode, int i, Object obj) {
            if ((i & 1) != 0) {
                verifyLoginCode = data.verifyLoginCode;
            }
            data.getClass();
            return new Data(verifyLoginCode);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final VerifyLoginCode getVerifyLoginCode() {
            return this.verifyLoginCode;
        }

        public final Data copy(VerifyLoginCode verifyLoginCode) {
            return new Data(verifyLoginCode);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.verifyLoginCode, ((Data) other).verifyLoginCode);
        }

        public final VerifyLoginCode getVerifyLoginCode() {
            return this.verifyLoginCode;
        }

        public final int hashCode() {
            VerifyLoginCode verifyLoginCode = this.verifyLoginCode;
            if (verifyLoginCode == null) {
                return 0;
            }
            return verifyLoginCode.hashCode();
        }

        public final String toString() {
            return "Data(verifyLoginCode=" + this.verifyLoginCode + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBadRequest {
        private final String message;

        public OnBadRequest(String str) {
            this.message = str;
        }

        public static OnBadRequest copy$default(OnBadRequest onBadRequest, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBadRequest.message;
            }
            onBadRequest.getClass();
            return new OnBadRequest(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBadRequest copy(String message) {
            return new OnBadRequest(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBadRequest) && g76.L(this.message, ((OnBadRequest) other).message);
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
            return ev6.x("OnBadRequest(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnRateLimited;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnRateLimited {
        private final String message;

        public OnRateLimited(String str) {
            this.message = str;
        }

        public static OnRateLimited copy$default(OnRateLimited onRateLimited, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onRateLimited.message;
            }
            onRateLimited.getClass();
            return new OnRateLimited(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnRateLimited copy(String message) {
            return new OnRateLimited(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnRateLimited) && g76.L(this.message, ((OnRateLimited) other).message);
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
            return ev6.x("OnRateLimited(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnToken;", "", "value", "", "<init>", "(Ljava/lang/String;)V", "getValue", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnToken {
        private final String value;

        public OnToken(String str) {
            this.value = str;
        }

        public static OnToken copy$default(OnToken onToken, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onToken.value;
            }
            onToken.getClass();
            return new OnToken(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getValue() {
            return this.value;
        }

        public final OnToken copy(String value) {
            return new OnToken(value);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnToken) && g76.L(this.value, ((OnToken) other).value);
        }

        public final String getValue() {
            return this.value;
        }

        public final int hashCode() {
            String str = this.value;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnToken(value=", this.value, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnTooManyRequests;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnTooManyRequests {
        private final String message;

        public OnTooManyRequests(String str) {
            this.message = str;
        }

        public static OnTooManyRequests copy$default(OnTooManyRequests onTooManyRequests, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onTooManyRequests.message;
            }
            onTooManyRequests.getClass();
            return new OnTooManyRequests(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnTooManyRequests copy(String message) {
            return new OnTooManyRequests(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnTooManyRequests) && g76.L(this.message, ((OnTooManyRequests) other).message);
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
            return ev6.x("OnTooManyRequests(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BA\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\rHÆ\u0003JO\u0010\"\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\rHÆ\u0001J\u0013\u0010#\u001a\u00020$2\b\u0010%\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010&\u001a\u00020'HÖ\u0001J\t\u0010(\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001b¨\u0006)"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$VerifyLoginCode;", "", "__typename", "", "onToken", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnToken;", "onBadRequest", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnBadRequest;", "onNotFound", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnNotFound;", "onTooManyRequests", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnTooManyRequests;", "onRateLimited", "Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnRateLimited;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnToken;Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnBadRequest;Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnNotFound;Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnTooManyRequests;Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnRateLimited;)V", "get__typename", "()Ljava/lang/String;", "getOnToken", "()Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnToken;", "getOnBadRequest", "()Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnBadRequest;", "getOnNotFound", "()Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnNotFound;", "getOnTooManyRequests", "()Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnTooManyRequests;", "getOnRateLimited", "()Lcom/medium/android/graphql/VerifyLoginCodeMutation$OnRateLimited;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class VerifyLoginCode {
        private final String __typename;
        private final OnBadRequest onBadRequest;
        private final OnNotFound onNotFound;
        private final OnRateLimited onRateLimited;
        private final OnToken onToken;
        private final OnTooManyRequests onTooManyRequests;

        public VerifyLoginCode(String str, OnToken onToken, OnBadRequest onBadRequest, OnNotFound onNotFound, OnTooManyRequests onTooManyRequests, OnRateLimited onRateLimited) {
            str.getClass();
            this.__typename = str;
            this.onToken = onToken;
            this.onBadRequest = onBadRequest;
            this.onNotFound = onNotFound;
            this.onTooManyRequests = onTooManyRequests;
            this.onRateLimited = onRateLimited;
        }

        public static /* synthetic */ VerifyLoginCode copy$default(VerifyLoginCode verifyLoginCode, String str, OnToken onToken, OnBadRequest onBadRequest, OnNotFound onNotFound, OnTooManyRequests onTooManyRequests, OnRateLimited onRateLimited, int i, Object obj) {
            if ((i & 1) != 0) {
                str = verifyLoginCode.__typename;
            }
            if ((i & 2) != 0) {
                onToken = verifyLoginCode.onToken;
            }
            if ((i & 4) != 0) {
                onBadRequest = verifyLoginCode.onBadRequest;
            }
            if ((i & 8) != 0) {
                onNotFound = verifyLoginCode.onNotFound;
            }
            if ((i & 16) != 0) {
                onTooManyRequests = verifyLoginCode.onTooManyRequests;
            }
            if ((i & 32) != 0) {
                onRateLimited = verifyLoginCode.onRateLimited;
            }
            OnTooManyRequests onTooManyRequests2 = onTooManyRequests;
            OnRateLimited onRateLimited2 = onRateLimited;
            return verifyLoginCode.copy(str, onToken, onBadRequest, onNotFound, onTooManyRequests2, onRateLimited2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnToken getOnToken() {
            return this.onToken;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnTooManyRequests getOnTooManyRequests() {
            return this.onTooManyRequests;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
        }

        public final VerifyLoginCode copy(String __typename, OnToken onToken, OnBadRequest onBadRequest, OnNotFound onNotFound, OnTooManyRequests onTooManyRequests, OnRateLimited onRateLimited) {
            __typename.getClass();
            return new VerifyLoginCode(__typename, onToken, onBadRequest, onNotFound, onTooManyRequests, onRateLimited);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof VerifyLoginCode)) {
                return false;
            }
            VerifyLoginCode verifyLoginCode = (VerifyLoginCode) other;
            return g76.L(this.__typename, verifyLoginCode.__typename) && g76.L(this.onToken, verifyLoginCode.onToken) && g76.L(this.onBadRequest, verifyLoginCode.onBadRequest) && g76.L(this.onNotFound, verifyLoginCode.onNotFound) && g76.L(this.onTooManyRequests, verifyLoginCode.onTooManyRequests) && g76.L(this.onRateLimited, verifyLoginCode.onRateLimited);
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
        }

        public final OnToken getOnToken() {
            return this.onToken;
        }

        public final OnTooManyRequests getOnTooManyRequests() {
            return this.onTooManyRequests;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnToken onToken = this.onToken;
            int iHashCode2 = (iHashCode + (onToken == null ? 0 : onToken.hashCode())) * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode3 = (iHashCode2 + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode4 = (iHashCode3 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            OnTooManyRequests onTooManyRequests = this.onTooManyRequests;
            int iHashCode5 = (iHashCode4 + (onTooManyRequests == null ? 0 : onTooManyRequests.hashCode())) * 31;
            OnRateLimited onRateLimited = this.onRateLimited;
            return iHashCode5 + (onRateLimited != null ? onRateLimited.hashCode() : 0);
        }

        public final String toString() {
            return "VerifyLoginCode(__typename=" + this.__typename + ", onToken=" + this.onToken + ", onBadRequest=" + this.onBadRequest + ", onNotFound=" + this.onNotFound + ", onTooManyRequests=" + this.onTooManyRequests + ", onRateLimited=" + this.onRateLimited + ")";
        }
    }

    public VerifyLoginCodeMutation(String str) {
        str.getClass();
        this.loginCode = str;
    }

    public static /* synthetic */ VerifyLoginCodeMutation copy$default(VerifyLoginCodeMutation verifyLoginCodeMutation, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = verifyLoginCodeMutation.loginCode;
        }
        return verifyLoginCodeMutation.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(VerifyLoginCodeMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getLoginCode() {
        return this.loginCode;
    }

    public final VerifyLoginCodeMutation copy(String loginCode) {
        loginCode.getClass();
        return new VerifyLoginCodeMutation(loginCode);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation VerifyLoginCodeMutation($loginCode: String!) { verifyLoginCode(loginCode: $loginCode) { __typename ... on Token { value } ... on BadRequest { message } ... on NotFound { message } ... on TooManyRequests { message } ... on RateLimited { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof VerifyLoginCodeMutation) && g76.L(this.loginCode, ((VerifyLoginCodeMutation) other).loginCode);
    }

    public final String getLoginCode() {
        return this.loginCode;
    }

    public final int hashCode() {
        return this.loginCode.hashCode();
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
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = VerifyLoginCodeMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        VerifyLoginCodeMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("VerifyLoginCodeMutation(loginCode=", this.loginCode, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/VerifyLoginCodeMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation VerifyLoginCodeMutation($loginCode: String!) { verifyLoginCode(loginCode: $loginCode) { __typename ... on Token { value } ... on BadRequest { message } ... on NotFound { message } ... on TooManyRequests { message } ... on RateLimited { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
