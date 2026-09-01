package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SendAccountAuthEmailByUserIdMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SendAccountAuthEmailByUserIdMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SendAccountAuthEmailByUserIdMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.km4;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0010\b\u0086\b\u0018\u0000 02\b\u0012\u0004\u0012\u00020\u00020\u0001:\u00071234560B3\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0018\u0010 \u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0003¢\u0006\u0004\b \u0010\u001fJ>\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00052\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010%\u001a\u00020$HÖ\u0001¢\u0006\u0004\b%\u0010&J\u001a\u0010)\u001a\u00020\u00122\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010+\u001a\u0004\b,\u0010\u000bR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010-\u001a\u0004\b.\u0010\u001fR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010-\u001a\u0004\b/\u0010\u001f¨\u00067"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation;", "Lv78;", "Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$Data;", "", "userId", "Lzv8;", "redirect", "captchaValue", "<init>", "(Ljava/lang/String;Lzv8;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "component3", "copy", "(Ljava/lang/String;Lzv8;Lzv8;)Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Lzv8;", "getRedirect", "getCaptchaValue", "Companion", "Data", "SendAcctAuthEmailByUserId", "OnSusiMethod", "OnBadRequest", "OnFailedChallenge", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SendAccountAuthEmailByUserIdMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "715291dba120967a2583d3a806e5cf72392c0c53afdbae4eaeb90c39cf70013f";
    public static final String OPERATION_NAME = "SendAccountAuthEmailByUserIdMutation";
    private final zv8 captchaValue;
    private final zv8 redirect;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$SendAcctAuthEmailByUserId;", "sendAcctAuthEmailByUserId", "<init>", "(Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$SendAcctAuthEmailByUserId;)V", "component1", "()Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$SendAcctAuthEmailByUserId;", "copy", "(Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$SendAcctAuthEmailByUserId;)Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$SendAcctAuthEmailByUserId;", "getSendAcctAuthEmailByUserId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SendAcctAuthEmailByUserId sendAcctAuthEmailByUserId;

        public Data(SendAcctAuthEmailByUserId sendAcctAuthEmailByUserId) {
            this.sendAcctAuthEmailByUserId = sendAcctAuthEmailByUserId;
        }

        public static Data copy$default(Data data, SendAcctAuthEmailByUserId sendAcctAuthEmailByUserId, int i, Object obj) {
            if ((i & 1) != 0) {
                sendAcctAuthEmailByUserId = data.sendAcctAuthEmailByUserId;
            }
            data.getClass();
            return new Data(sendAcctAuthEmailByUserId);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SendAcctAuthEmailByUserId getSendAcctAuthEmailByUserId() {
            return this.sendAcctAuthEmailByUserId;
        }

        public final Data copy(SendAcctAuthEmailByUserId sendAcctAuthEmailByUserId) {
            return new Data(sendAcctAuthEmailByUserId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.sendAcctAuthEmailByUserId, ((Data) other).sendAcctAuthEmailByUserId);
        }

        public final SendAcctAuthEmailByUserId getSendAcctAuthEmailByUserId() {
            return this.sendAcctAuthEmailByUserId;
        }

        public final int hashCode() {
            SendAcctAuthEmailByUserId sendAcctAuthEmailByUserId = this.sendAcctAuthEmailByUserId;
            if (sendAcctAuthEmailByUserId == null) {
                return 0;
            }
            return sendAcctAuthEmailByUserId.hashCode();
        }

        public final String toString() {
            return "Data(sendAcctAuthEmailByUserId=" + this.sendAcctAuthEmailByUserId + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnFailedChallenge;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnFailedChallenge {
        private final String message;

        public OnFailedChallenge(String str) {
            this.message = str;
        }

        public static OnFailedChallenge copy$default(OnFailedChallenge onFailedChallenge, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onFailedChallenge.message;
            }
            onFailedChallenge.getClass();
            return new OnFailedChallenge(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnFailedChallenge copy(String message) {
            return new OnFailedChallenge(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnFailedChallenge) && g76.L(this.message, ((OnFailedChallenge) other).message);
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
            return ev6.x("OnFailedChallenge(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnSusiMethod;", "", "value", "", "<init>", "(Ljava/lang/String;)V", "getValue", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnSusiMethod {
        private final String value;

        public OnSusiMethod(String str) {
            this.value = str;
        }

        public static OnSusiMethod copy$default(OnSusiMethod onSusiMethod, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onSusiMethod.value;
            }
            onSusiMethod.getClass();
            return new OnSusiMethod(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getValue() {
            return this.value;
        }

        public final OnSusiMethod copy(String value) {
            return new OnSusiMethod(value);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnSusiMethod) && g76.L(this.value, ((OnSusiMethod) other).value);
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
            return ev6.x("OnSusiMethod(value=", this.value, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u000bHÆ\u0003JC\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$SendAcctAuthEmailByUserId;", "", "__typename", "", "onSusiMethod", "Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnSusiMethod;", "onBadRequest", "Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnBadRequest;", "onFailedChallenge", "Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnFailedChallenge;", "onNotFound", "Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnNotFound;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnSusiMethod;Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnBadRequest;Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnFailedChallenge;Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnNotFound;)V", "get__typename", "()Ljava/lang/String;", "getOnSusiMethod", "()Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnSusiMethod;", "getOnBadRequest", "()Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnBadRequest;", "getOnFailedChallenge", "()Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnFailedChallenge;", "getOnNotFound", "()Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$OnNotFound;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SendAcctAuthEmailByUserId {
        private final String __typename;
        private final OnBadRequest onBadRequest;
        private final OnFailedChallenge onFailedChallenge;
        private final OnNotFound onNotFound;
        private final OnSusiMethod onSusiMethod;

        public SendAcctAuthEmailByUserId(String str, OnSusiMethod onSusiMethod, OnBadRequest onBadRequest, OnFailedChallenge onFailedChallenge, OnNotFound onNotFound) {
            str.getClass();
            this.__typename = str;
            this.onSusiMethod = onSusiMethod;
            this.onBadRequest = onBadRequest;
            this.onFailedChallenge = onFailedChallenge;
            this.onNotFound = onNotFound;
        }

        public static /* synthetic */ SendAcctAuthEmailByUserId copy$default(SendAcctAuthEmailByUserId sendAcctAuthEmailByUserId, String str, OnSusiMethod onSusiMethod, OnBadRequest onBadRequest, OnFailedChallenge onFailedChallenge, OnNotFound onNotFound, int i, Object obj) {
            if ((i & 1) != 0) {
                str = sendAcctAuthEmailByUserId.__typename;
            }
            if ((i & 2) != 0) {
                onSusiMethod = sendAcctAuthEmailByUserId.onSusiMethod;
            }
            if ((i & 4) != 0) {
                onBadRequest = sendAcctAuthEmailByUserId.onBadRequest;
            }
            if ((i & 8) != 0) {
                onFailedChallenge = sendAcctAuthEmailByUserId.onFailedChallenge;
            }
            if ((i & 16) != 0) {
                onNotFound = sendAcctAuthEmailByUserId.onNotFound;
            }
            OnNotFound onNotFound2 = onNotFound;
            OnBadRequest onBadRequest2 = onBadRequest;
            return sendAcctAuthEmailByUserId.copy(str, onSusiMethod, onBadRequest2, onFailedChallenge, onNotFound2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnSusiMethod getOnSusiMethod() {
            return this.onSusiMethod;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnFailedChallenge getOnFailedChallenge() {
            return this.onFailedChallenge;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final SendAcctAuthEmailByUserId copy(String __typename, OnSusiMethod onSusiMethod, OnBadRequest onBadRequest, OnFailedChallenge onFailedChallenge, OnNotFound onNotFound) {
            __typename.getClass();
            return new SendAcctAuthEmailByUserId(__typename, onSusiMethod, onBadRequest, onFailedChallenge, onNotFound);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SendAcctAuthEmailByUserId)) {
                return false;
            }
            SendAcctAuthEmailByUserId sendAcctAuthEmailByUserId = (SendAcctAuthEmailByUserId) other;
            return g76.L(this.__typename, sendAcctAuthEmailByUserId.__typename) && g76.L(this.onSusiMethod, sendAcctAuthEmailByUserId.onSusiMethod) && g76.L(this.onBadRequest, sendAcctAuthEmailByUserId.onBadRequest) && g76.L(this.onFailedChallenge, sendAcctAuthEmailByUserId.onFailedChallenge) && g76.L(this.onNotFound, sendAcctAuthEmailByUserId.onNotFound);
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnFailedChallenge getOnFailedChallenge() {
            return this.onFailedChallenge;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnSusiMethod getOnSusiMethod() {
            return this.onSusiMethod;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnSusiMethod onSusiMethod = this.onSusiMethod;
            int iHashCode2 = (iHashCode + (onSusiMethod == null ? 0 : onSusiMethod.hashCode())) * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode3 = (iHashCode2 + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnFailedChallenge onFailedChallenge = this.onFailedChallenge;
            int iHashCode4 = (iHashCode3 + (onFailedChallenge == null ? 0 : onFailedChallenge.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            return iHashCode4 + (onNotFound != null ? onNotFound.hashCode() : 0);
        }

        public final String toString() {
            return "SendAcctAuthEmailByUserId(__typename=" + this.__typename + ", onSusiMethod=" + this.onSusiMethod + ", onBadRequest=" + this.onBadRequest + ", onFailedChallenge=" + this.onFailedChallenge + ", onNotFound=" + this.onNotFound + ")";
        }
    }

    public SendAccountAuthEmailByUserIdMutation(String str, zv8 zv8Var, zv8 zv8Var2) {
        str.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        this.userId = str;
        this.redirect = zv8Var;
        this.captchaValue = zv8Var2;
    }

    public static /* synthetic */ SendAccountAuthEmailByUserIdMutation copy$default(SendAccountAuthEmailByUserIdMutation sendAccountAuthEmailByUserIdMutation, String str, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = sendAccountAuthEmailByUserIdMutation.userId;
        }
        if ((i & 2) != 0) {
            zv8Var = sendAccountAuthEmailByUserIdMutation.redirect;
        }
        if ((i & 4) != 0) {
            zv8Var2 = sendAccountAuthEmailByUserIdMutation.captchaValue;
        }
        return sendAccountAuthEmailByUserIdMutation.copy(str, zv8Var, zv8Var2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SendAccountAuthEmailByUserIdMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getRedirect() {
        return this.redirect;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getCaptchaValue() {
        return this.captchaValue;
    }

    public final SendAccountAuthEmailByUserIdMutation copy(String userId, zv8 redirect, zv8 captchaValue) {
        userId.getClass();
        redirect.getClass();
        captchaValue.getClass();
        return new SendAccountAuthEmailByUserIdMutation(userId, redirect, captchaValue);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SendAccountAuthEmailByUserIdMutation($userId: String!, $redirect: String, $captchaValue: String) { sendAcctAuthEmailByUserId(userId: $userId, redirect: $redirect, captchaValue: $captchaValue) { __typename ... on SusiMethod { value } ... on BadRequest { message } ... on FailedChallenge { message } ... on NotFound { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SendAccountAuthEmailByUserIdMutation)) {
            return false;
        }
        SendAccountAuthEmailByUserIdMutation sendAccountAuthEmailByUserIdMutation = (SendAccountAuthEmailByUserIdMutation) other;
        return g76.L(this.userId, sendAccountAuthEmailByUserIdMutation.userId) && g76.L(this.redirect, sendAccountAuthEmailByUserIdMutation.redirect) && g76.L(this.captchaValue, sendAccountAuthEmailByUserIdMutation.captchaValue);
    }

    public final zv8 getCaptchaValue() {
        return this.captchaValue;
    }

    public final zv8 getRedirect() {
        return this.redirect;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.captchaValue.hashCode() + lv8.h(this.redirect, this.userId.hashCode() * 31, 31);
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
        List<sx1> list = SendAccountAuthEmailByUserIdMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SendAccountAuthEmailByUserIdMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.userId;
        zv8 zv8Var = this.redirect;
        zv8 zv8Var2 = this.captchaValue;
        StringBuilder sb = new StringBuilder("SendAccountAuthEmailByUserIdMutation(userId=");
        sb.append(str);
        sb.append(", redirect=");
        sb.append(zv8Var);
        sb.append(", captchaValue=");
        return km4.B(sb, zv8Var2, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailByUserIdMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SendAccountAuthEmailByUserIdMutation($userId: String!, $redirect: String, $captchaValue: String) { sendAcctAuthEmailByUserId(userId: $userId, redirect: $redirect, captchaValue: $captchaValue) { __typename ... on SusiMethod { value } ... on BadRequest { message } ... on FailedChallenge { message } ... on NotFound { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SendAccountAuthEmailByUserIdMutation(String str, zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 2;
        xv8 xv8Var = xv8.a;
        this(str, i2 != 0 ? xv8Var : zv8Var, (i & 4) != 0 ? xv8Var : zv8Var2);
    }
}
