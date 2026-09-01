package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SendAccountAuthEmailMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SendAccountAuthEmailMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SendAccountAuthEmailMutationSelections;
import com.medium.android.graphql.type.AuthEmailFlowType;
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
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0016\b\u0086\b\u0018\u0000 A2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007BCDEFGABg\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0010\b\u0002\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005\u0012\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005\u0012\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0012\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0011J'\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0018\u001a\u00020\fH\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0015\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010 \u001a\u00020\u001fH\u0016¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\"\u0010\u0011J\u0018\u0010#\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0003¢\u0006\u0004\b#\u0010$J\u0018\u0010%\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0003¢\u0006\u0004\b%\u0010$J\u0010\u0010&\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b&\u0010'J\u0018\u0010(\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0003¢\u0006\u0004\b(\u0010$J\u0018\u0010)\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0003¢\u0006\u0004\b)\u0010$J\u0010\u0010*\u001a\u00020\fHÆ\u0003¢\u0006\u0004\b*\u0010+Jv\u0010,\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00052\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00052\b\b\u0002\u0010\t\u001a\u00020\b2\u0010\b\u0002\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00052\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00052\b\b\u0002\u0010\r\u001a\u00020\fHÆ\u0001¢\u0006\u0004\b,\u0010-J\u0010\u0010.\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b.\u0010\u0011J\u0010\u00100\u001a\u00020/HÖ\u0001¢\u0006\u0004\b0\u00101J\u001a\u00104\u001a\u00020\f2\b\u00103\u001a\u0004\u0018\u000102HÖ\u0003¢\u0006\u0004\b4\u00105R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00106\u001a\u0004\b7\u0010\u0011R\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00108\u001a\u0004\b9\u0010$R\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u00108\u001a\u0004\b:\u0010$R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010;\u001a\u0004\b<\u0010'R\u001f\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00058\u0006¢\u0006\f\n\u0004\b\n\u00108\u001a\u0004\b=\u0010$R\u001f\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00058\u0006¢\u0006\f\n\u0004\b\u000b\u00108\u001a\u0004\b>\u0010$R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010?\u001a\u0004\b@\u0010+¨\u0006H"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation;", "Lv78;", "Lcom/medium/android/graphql/SendAccountAuthEmailMutation$Data;", "", "email", "Lzv8;", "captchaValue", "operation", "Lcom/medium/android/graphql/type/AuthEmailFlowType;", "type", "redirect", "fullName", "", "rememberMe", "<init>", "(Ljava/lang/String;Lzv8;Lzv8;Lcom/medium/android/graphql/type/AuthEmailFlowType;Lzv8;Lzv8;Z)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "component3", "component4", "()Lcom/medium/android/graphql/type/AuthEmailFlowType;", "component5", "component6", "component7", "()Z", "copy", "(Ljava/lang/String;Lzv8;Lzv8;Lcom/medium/android/graphql/type/AuthEmailFlowType;Lzv8;Lzv8;Z)Lcom/medium/android/graphql/SendAccountAuthEmailMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getEmail", "Lzv8;", "getCaptchaValue", "getOperation", "Lcom/medium/android/graphql/type/AuthEmailFlowType;", "getType", "getRedirect", "getFullName", "Z", "getRememberMe", "Companion", "Data", "SendAcctAuthEmail", "OnSusiMethod", "OnBadRequest", "OnFailedChallenge", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SendAccountAuthEmailMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "2a2c3710c67d80948830379b2bd237adf2dcf8b96e0e9ad69b850245e72f0106";
    public static final String OPERATION_NAME = "SendAccountAuthEmailMutation";
    private final zv8 captchaValue;
    private final String email;
    private final zv8 fullName;
    private final zv8 operation;
    private final zv8 redirect;
    private final boolean rememberMe;
    private final AuthEmailFlowType type;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SendAccountAuthEmailMutation$SendAcctAuthEmail;", "sendAcctAuthEmail", "<init>", "(Lcom/medium/android/graphql/SendAccountAuthEmailMutation$SendAcctAuthEmail;)V", "component1", "()Lcom/medium/android/graphql/SendAccountAuthEmailMutation$SendAcctAuthEmail;", "copy", "(Lcom/medium/android/graphql/SendAccountAuthEmailMutation$SendAcctAuthEmail;)Lcom/medium/android/graphql/SendAccountAuthEmailMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SendAccountAuthEmailMutation$SendAcctAuthEmail;", "getSendAcctAuthEmail", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SendAcctAuthEmail sendAcctAuthEmail;

        public Data(SendAcctAuthEmail sendAcctAuthEmail) {
            this.sendAcctAuthEmail = sendAcctAuthEmail;
        }

        public static Data copy$default(Data data, SendAcctAuthEmail sendAcctAuthEmail, int i, Object obj) {
            if ((i & 1) != 0) {
                sendAcctAuthEmail = data.sendAcctAuthEmail;
            }
            data.getClass();
            return new Data(sendAcctAuthEmail);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SendAcctAuthEmail getSendAcctAuthEmail() {
            return this.sendAcctAuthEmail;
        }

        public final Data copy(SendAcctAuthEmail sendAcctAuthEmail) {
            return new Data(sendAcctAuthEmail);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.sendAcctAuthEmail, ((Data) other).sendAcctAuthEmail);
        }

        public final SendAcctAuthEmail getSendAcctAuthEmail() {
            return this.sendAcctAuthEmail;
        }

        public final int hashCode() {
            SendAcctAuthEmail sendAcctAuthEmail = this.sendAcctAuthEmail;
            if (sendAcctAuthEmail == null) {
                return 0;
            }
            return sendAcctAuthEmail.hashCode();
        }

        public final String toString() {
            return "Data(sendAcctAuthEmail=" + this.sendAcctAuthEmail + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnFailedChallenge;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnSusiMethod;", "", "value", "", "<init>", "(Ljava/lang/String;)V", "getValue", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u000bHÆ\u0003JC\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation$SendAcctAuthEmail;", "", "__typename", "", "onSusiMethod", "Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnSusiMethod;", "onBadRequest", "Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnBadRequest;", "onFailedChallenge", "Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnFailedChallenge;", "onNotFound", "Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnNotFound;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnSusiMethod;Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnBadRequest;Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnFailedChallenge;Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnNotFound;)V", "get__typename", "()Ljava/lang/String;", "getOnSusiMethod", "()Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnSusiMethod;", "getOnBadRequest", "()Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnBadRequest;", "getOnFailedChallenge", "()Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnFailedChallenge;", "getOnNotFound", "()Lcom/medium/android/graphql/SendAccountAuthEmailMutation$OnNotFound;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SendAcctAuthEmail {
        private final String __typename;
        private final OnBadRequest onBadRequest;
        private final OnFailedChallenge onFailedChallenge;
        private final OnNotFound onNotFound;
        private final OnSusiMethod onSusiMethod;

        public SendAcctAuthEmail(String str, OnSusiMethod onSusiMethod, OnBadRequest onBadRequest, OnFailedChallenge onFailedChallenge, OnNotFound onNotFound) {
            str.getClass();
            this.__typename = str;
            this.onSusiMethod = onSusiMethod;
            this.onBadRequest = onBadRequest;
            this.onFailedChallenge = onFailedChallenge;
            this.onNotFound = onNotFound;
        }

        public static /* synthetic */ SendAcctAuthEmail copy$default(SendAcctAuthEmail sendAcctAuthEmail, String str, OnSusiMethod onSusiMethod, OnBadRequest onBadRequest, OnFailedChallenge onFailedChallenge, OnNotFound onNotFound, int i, Object obj) {
            if ((i & 1) != 0) {
                str = sendAcctAuthEmail.__typename;
            }
            if ((i & 2) != 0) {
                onSusiMethod = sendAcctAuthEmail.onSusiMethod;
            }
            if ((i & 4) != 0) {
                onBadRequest = sendAcctAuthEmail.onBadRequest;
            }
            if ((i & 8) != 0) {
                onFailedChallenge = sendAcctAuthEmail.onFailedChallenge;
            }
            if ((i & 16) != 0) {
                onNotFound = sendAcctAuthEmail.onNotFound;
            }
            OnNotFound onNotFound2 = onNotFound;
            OnBadRequest onBadRequest2 = onBadRequest;
            return sendAcctAuthEmail.copy(str, onSusiMethod, onBadRequest2, onFailedChallenge, onNotFound2);
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

        public final SendAcctAuthEmail copy(String __typename, OnSusiMethod onSusiMethod, OnBadRequest onBadRequest, OnFailedChallenge onFailedChallenge, OnNotFound onNotFound) {
            __typename.getClass();
            return new SendAcctAuthEmail(__typename, onSusiMethod, onBadRequest, onFailedChallenge, onNotFound);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SendAcctAuthEmail)) {
                return false;
            }
            SendAcctAuthEmail sendAcctAuthEmail = (SendAcctAuthEmail) other;
            return g76.L(this.__typename, sendAcctAuthEmail.__typename) && g76.L(this.onSusiMethod, sendAcctAuthEmail.onSusiMethod) && g76.L(this.onBadRequest, sendAcctAuthEmail.onBadRequest) && g76.L(this.onFailedChallenge, sendAcctAuthEmail.onFailedChallenge) && g76.L(this.onNotFound, sendAcctAuthEmail.onNotFound);
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
            return "SendAcctAuthEmail(__typename=" + this.__typename + ", onSusiMethod=" + this.onSusiMethod + ", onBadRequest=" + this.onBadRequest + ", onFailedChallenge=" + this.onFailedChallenge + ", onNotFound=" + this.onNotFound + ")";
        }
    }

    public SendAccountAuthEmailMutation(String str, zv8 zv8Var, zv8 zv8Var2, AuthEmailFlowType authEmailFlowType, zv8 zv8Var3, zv8 zv8Var4, boolean z) {
        str.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        authEmailFlowType.getClass();
        zv8Var3.getClass();
        zv8Var4.getClass();
        this.email = str;
        this.captchaValue = zv8Var;
        this.operation = zv8Var2;
        this.type = authEmailFlowType;
        this.redirect = zv8Var3;
        this.fullName = zv8Var4;
        this.rememberMe = z;
    }

    public static /* synthetic */ SendAccountAuthEmailMutation copy$default(SendAccountAuthEmailMutation sendAccountAuthEmailMutation, String str, zv8 zv8Var, zv8 zv8Var2, AuthEmailFlowType authEmailFlowType, zv8 zv8Var3, zv8 zv8Var4, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = sendAccountAuthEmailMutation.email;
        }
        if ((i & 2) != 0) {
            zv8Var = sendAccountAuthEmailMutation.captchaValue;
        }
        if ((i & 4) != 0) {
            zv8Var2 = sendAccountAuthEmailMutation.operation;
        }
        if ((i & 8) != 0) {
            authEmailFlowType = sendAccountAuthEmailMutation.type;
        }
        if ((i & 16) != 0) {
            zv8Var3 = sendAccountAuthEmailMutation.redirect;
        }
        if ((i & 32) != 0) {
            zv8Var4 = sendAccountAuthEmailMutation.fullName;
        }
        if ((i & 64) != 0) {
            z = sendAccountAuthEmailMutation.rememberMe;
        }
        zv8 zv8Var5 = zv8Var4;
        boolean z2 = z;
        zv8 zv8Var6 = zv8Var3;
        zv8 zv8Var7 = zv8Var2;
        return sendAccountAuthEmailMutation.copy(str, zv8Var, zv8Var7, authEmailFlowType, zv8Var6, zv8Var5, z2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SendAccountAuthEmailMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getEmail() {
        return this.email;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getCaptchaValue() {
        return this.captchaValue;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getOperation() {
        return this.operation;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final AuthEmailFlowType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final zv8 getRedirect() {
        return this.redirect;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final zv8 getFullName() {
        return this.fullName;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final boolean getRememberMe() {
        return this.rememberMe;
    }

    public final SendAccountAuthEmailMutation copy(String email, zv8 captchaValue, zv8 operation, AuthEmailFlowType type, zv8 redirect, zv8 fullName, boolean rememberMe) {
        email.getClass();
        captchaValue.getClass();
        operation.getClass();
        type.getClass();
        redirect.getClass();
        fullName.getClass();
        return new SendAccountAuthEmailMutation(email, captchaValue, operation, type, redirect, fullName, rememberMe);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SendAccountAuthEmailMutation($email: String!, $captchaValue: String, $operation: String, $type: AuthEmailFlowType!, $redirect: String, $fullName: String, $rememberMe: Boolean!) { sendAcctAuthEmail(email: $email, captchaValue: $captchaValue, operation: $operation, type: $type, redirect: $redirect, fullName: $fullName, rememberMe: $rememberMe) { __typename ... on SusiMethod { value } ... on BadRequest { message } ... on FailedChallenge { message } ... on NotFound { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SendAccountAuthEmailMutation)) {
            return false;
        }
        SendAccountAuthEmailMutation sendAccountAuthEmailMutation = (SendAccountAuthEmailMutation) other;
        return g76.L(this.email, sendAccountAuthEmailMutation.email) && g76.L(this.captchaValue, sendAccountAuthEmailMutation.captchaValue) && g76.L(this.operation, sendAccountAuthEmailMutation.operation) && this.type == sendAccountAuthEmailMutation.type && g76.L(this.redirect, sendAccountAuthEmailMutation.redirect) && g76.L(this.fullName, sendAccountAuthEmailMutation.fullName) && this.rememberMe == sendAccountAuthEmailMutation.rememberMe;
    }

    public final zv8 getCaptchaValue() {
        return this.captchaValue;
    }

    public final String getEmail() {
        return this.email;
    }

    public final zv8 getFullName() {
        return this.fullName;
    }

    public final zv8 getOperation() {
        return this.operation;
    }

    public final zv8 getRedirect() {
        return this.redirect;
    }

    public final boolean getRememberMe() {
        return this.rememberMe;
    }

    public final AuthEmailFlowType getType() {
        return this.type;
    }

    public final int hashCode() {
        return lv8.h(this.fullName, lv8.h(this.redirect, (this.type.hashCode() + lv8.h(this.operation, lv8.h(this.captchaValue, this.email.hashCode() * 31, 31), 31)) * 31, 31), 31) + (this.rememberMe ? 1231 : 1237);
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
        List<sx1> list = SendAccountAuthEmailMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SendAccountAuthEmailMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.email;
        zv8 zv8Var = this.captchaValue;
        zv8 zv8Var2 = this.operation;
        AuthEmailFlowType authEmailFlowType = this.type;
        zv8 zv8Var3 = this.redirect;
        zv8 zv8Var4 = this.fullName;
        boolean z = this.rememberMe;
        StringBuilder sb = new StringBuilder("SendAccountAuthEmailMutation(email=");
        sb.append(str);
        sb.append(", captchaValue=");
        sb.append(zv8Var);
        sb.append(", operation=");
        sb.append(zv8Var2);
        sb.append(", type=");
        sb.append(authEmailFlowType);
        sb.append(", redirect=");
        sb.append(zv8Var3);
        sb.append(", fullName=");
        sb.append(zv8Var4);
        sb.append(", rememberMe=");
        return lv8.t(sb, z, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SendAccountAuthEmailMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SendAccountAuthEmailMutation($email: String!, $captchaValue: String, $operation: String, $type: AuthEmailFlowType!, $redirect: String, $fullName: String, $rememberMe: Boolean!) { sendAcctAuthEmail(email: $email, captchaValue: $captchaValue, operation: $operation, type: $type, redirect: $redirect, fullName: $fullName, rememberMe: $rememberMe) { __typename ... on SusiMethod { value } ... on BadRequest { message } ... on FailedChallenge { message } ... on NotFound { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SendAccountAuthEmailMutation(String str, zv8 zv8Var, zv8 zv8Var2, AuthEmailFlowType authEmailFlowType, zv8 zv8Var3, zv8 zv8Var4, boolean z, int i, gy2 gy2Var) {
        int i2 = i & 2;
        xv8 xv8Var = xv8.a;
        this(str, i2 != 0 ? xv8Var : zv8Var, (i & 4) != 0 ? xv8Var : zv8Var2, authEmailFlowType, (i & 16) != 0 ? xv8Var : zv8Var3, (i & 32) != 0 ? xv8Var : zv8Var4, z);
    }
}
