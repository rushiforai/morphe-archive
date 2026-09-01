package com.medium.android.graphql;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.graphql.adapter.RememberMeAccountHintQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.RememberMeAccountHintQuery_VariablesAdapter;
import com.medium.android.graphql.selections.RememberMeAccountHintQuerySelections;
import com.medium.android.graphql.type.LoginMethod;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005()*+'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/RememberMeAccountHintQuery;", "Luqa;", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$Data;", "", "rememberMeToken", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/RememberMeAccountHintQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getRememberMeToken", "Companion", "Data", "RememberMeAccountHint", "OnRememberMeAccountHint", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class RememberMeAccountHintQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "f059fa5ea72b9367e581eea41000b3b59d80769b47aef859588b8be1f60daedd";
    public static final String OPERATION_NAME = "RememberMeAccountHintQuery";
    private final String rememberMeToken;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/RememberMeAccountHintQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;", "rememberMeAccountHint", "<init>", "(Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;)V", "component1", "()Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;", "copy", "(Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;)Lcom/medium/android/graphql/RememberMeAccountHintQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;", "getRememberMeAccountHint", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final RememberMeAccountHint rememberMeAccountHint;

        public Data(RememberMeAccountHint rememberMeAccountHint) {
            this.rememberMeAccountHint = rememberMeAccountHint;
        }

        public static Data copy$default(Data data, RememberMeAccountHint rememberMeAccountHint, int i, Object obj) {
            if ((i & 1) != 0) {
                rememberMeAccountHint = data.rememberMeAccountHint;
            }
            data.getClass();
            return new Data(rememberMeAccountHint);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final RememberMeAccountHint getRememberMeAccountHint() {
            return this.rememberMeAccountHint;
        }

        public final Data copy(RememberMeAccountHint rememberMeAccountHint) {
            return new Data(rememberMeAccountHint);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.rememberMeAccountHint, ((Data) other).rememberMeAccountHint);
        }

        public final RememberMeAccountHint getRememberMeAccountHint() {
            return this.rememberMeAccountHint;
        }

        public final int hashCode() {
            RememberMeAccountHint rememberMeAccountHint = this.rememberMeAccountHint;
            if (rememberMeAccountHint == null) {
                return 0;
            }
            return rememberMeAccountHint.hashCode();
        }

        public final String toString() {
            return "Data(rememberMeAccountHint=" + this.rememberMeAccountHint + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B1\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\u0003¢\u0006\u0004\b\t\u0010\nJ\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J=\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\fR\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\f¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnRememberMeAccountHint;", "", "imageId", "", "loginMethod", "Lcom/medium/android/graphql/type/LoginMethod;", "name", "obfuscatedEmail", "userId", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/LoginMethod;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getImageId", "()Ljava/lang/String;", "getLoginMethod", "()Lcom/medium/android/graphql/type/LoginMethod;", "getName", "getObfuscatedEmail", "getUserId", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnRememberMeAccountHint {
        private final String imageId;
        private final LoginMethod loginMethod;
        private final String name;
        private final String obfuscatedEmail;
        private final String userId;

        public OnRememberMeAccountHint(String str, LoginMethod loginMethod, String str2, String str3, String str4) {
            loginMethod.getClass();
            str2.getClass();
            str3.getClass();
            str4.getClass();
            this.imageId = str;
            this.loginMethod = loginMethod;
            this.name = str2;
            this.obfuscatedEmail = str3;
            this.userId = str4;
        }

        public static /* synthetic */ OnRememberMeAccountHint copy$default(OnRememberMeAccountHint onRememberMeAccountHint, String str, LoginMethod loginMethod, String str2, String str3, String str4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onRememberMeAccountHint.imageId;
            }
            if ((i & 2) != 0) {
                loginMethod = onRememberMeAccountHint.loginMethod;
            }
            if ((i & 4) != 0) {
                str2 = onRememberMeAccountHint.name;
            }
            if ((i & 8) != 0) {
                str3 = onRememberMeAccountHint.obfuscatedEmail;
            }
            if ((i & 16) != 0) {
                str4 = onRememberMeAccountHint.userId;
            }
            String str5 = str4;
            String str6 = str2;
            return onRememberMeAccountHint.copy(str, loginMethod, str6, str3, str5);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final LoginMethod getLoginMethod() {
            return this.loginMethod;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getObfuscatedEmail() {
            return this.obfuscatedEmail;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getUserId() {
            return this.userId;
        }

        public final OnRememberMeAccountHint copy(String imageId, LoginMethod loginMethod, String name, String obfuscatedEmail, String userId) {
            loginMethod.getClass();
            name.getClass();
            obfuscatedEmail.getClass();
            userId.getClass();
            return new OnRememberMeAccountHint(imageId, loginMethod, name, obfuscatedEmail, userId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnRememberMeAccountHint)) {
                return false;
            }
            OnRememberMeAccountHint onRememberMeAccountHint = (OnRememberMeAccountHint) other;
            return g76.L(this.imageId, onRememberMeAccountHint.imageId) && this.loginMethod == onRememberMeAccountHint.loginMethod && g76.L(this.name, onRememberMeAccountHint.name) && g76.L(this.obfuscatedEmail, onRememberMeAccountHint.obfuscatedEmail) && g76.L(this.userId, onRememberMeAccountHint.userId);
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final LoginMethod getLoginMethod() {
            return this.loginMethod;
        }

        public final String getName() {
            return this.name;
        }

        public final String getObfuscatedEmail() {
            return this.obfuscatedEmail;
        }

        public final String getUserId() {
            return this.userId;
        }

        public final int hashCode() {
            String str = this.imageId;
            return this.userId.hashCode() + wgd.o(wgd.o((this.loginMethod.hashCode() + ((str == null ? 0 : str.hashCode()) * 31)) * 31, 31, this.name), 31, this.obfuscatedEmail);
        }

        public final String toString() {
            String str = this.imageId;
            LoginMethod loginMethod = this.loginMethod;
            String str2 = this.name;
            String str3 = this.obfuscatedEmail;
            String str4 = this.userId;
            StringBuilder sb = new StringBuilder("OnRememberMeAccountHint(imageId=");
            sb.append(str);
            sb.append(", loginMethod=");
            sb.append(loginMethod);
            sb.append(", name=");
            ka1.C(sb, str2, ", obfuscatedEmail=", str3, ", userId=");
            return ka1.v(sb, str4, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;", "", "__typename", "", "onRememberMeAccountHint", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnRememberMeAccountHint;", "onNotFound", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnNotFound;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnRememberMeAccountHint;Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnNotFound;)V", "get__typename", "()Ljava/lang/String;", "getOnRememberMeAccountHint", "()Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnRememberMeAccountHint;", "getOnNotFound", "()Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnNotFound;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RememberMeAccountHint {
        private final String __typename;
        private final OnNotFound onNotFound;
        private final OnRememberMeAccountHint onRememberMeAccountHint;

        public RememberMeAccountHint(String str, OnRememberMeAccountHint onRememberMeAccountHint, OnNotFound onNotFound) {
            str.getClass();
            this.__typename = str;
            this.onRememberMeAccountHint = onRememberMeAccountHint;
            this.onNotFound = onNotFound;
        }

        public static /* synthetic */ RememberMeAccountHint copy$default(RememberMeAccountHint rememberMeAccountHint, String str, OnRememberMeAccountHint onRememberMeAccountHint, OnNotFound onNotFound, int i, Object obj) {
            if ((i & 1) != 0) {
                str = rememberMeAccountHint.__typename;
            }
            if ((i & 2) != 0) {
                onRememberMeAccountHint = rememberMeAccountHint.onRememberMeAccountHint;
            }
            if ((i & 4) != 0) {
                onNotFound = rememberMeAccountHint.onNotFound;
            }
            return rememberMeAccountHint.copy(str, onRememberMeAccountHint, onNotFound);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnRememberMeAccountHint getOnRememberMeAccountHint() {
            return this.onRememberMeAccountHint;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final RememberMeAccountHint copy(String __typename, OnRememberMeAccountHint onRememberMeAccountHint, OnNotFound onNotFound) {
            __typename.getClass();
            return new RememberMeAccountHint(__typename, onRememberMeAccountHint, onNotFound);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RememberMeAccountHint)) {
                return false;
            }
            RememberMeAccountHint rememberMeAccountHint = (RememberMeAccountHint) other;
            return g76.L(this.__typename, rememberMeAccountHint.__typename) && g76.L(this.onRememberMeAccountHint, rememberMeAccountHint.onRememberMeAccountHint) && g76.L(this.onNotFound, rememberMeAccountHint.onNotFound);
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnRememberMeAccountHint getOnRememberMeAccountHint() {
            return this.onRememberMeAccountHint;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnRememberMeAccountHint onRememberMeAccountHint = this.onRememberMeAccountHint;
            int iHashCode2 = (iHashCode + (onRememberMeAccountHint == null ? 0 : onRememberMeAccountHint.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            return iHashCode2 + (onNotFound != null ? onNotFound.hashCode() : 0);
        }

        public final String toString() {
            return "RememberMeAccountHint(__typename=" + this.__typename + ", onRememberMeAccountHint=" + this.onRememberMeAccountHint + ", onNotFound=" + this.onNotFound + ZVsviyDAr.IvImOQem;
        }
    }

    public RememberMeAccountHintQuery(String str) {
        str.getClass();
        this.rememberMeToken = str;
    }

    public static /* synthetic */ RememberMeAccountHintQuery copy$default(RememberMeAccountHintQuery rememberMeAccountHintQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = rememberMeAccountHintQuery.rememberMeToken;
        }
        return rememberMeAccountHintQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(RememberMeAccountHintQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getRememberMeToken() {
        return this.rememberMeToken;
    }

    public final RememberMeAccountHintQuery copy(String rememberMeToken) {
        rememberMeToken.getClass();
        return new RememberMeAccountHintQuery(rememberMeToken);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query RememberMeAccountHintQuery($rememberMeToken: String!) { rememberMeAccountHint(input: { rememberMeToken: $rememberMeToken } ) { __typename ... on RememberMeAccountHint { imageId loginMethod name obfuscatedEmail userId } ... on NotFound { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof RememberMeAccountHintQuery) && g76.L(this.rememberMeToken, ((RememberMeAccountHintQuery) other).rememberMeToken);
    }

    public final String getRememberMeToken() {
        return this.rememberMeToken;
    }

    public final int hashCode() {
        return this.rememberMeToken.hashCode();
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
        List<sx1> list = RememberMeAccountHintQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        RememberMeAccountHintQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("RememberMeAccountHintQuery(rememberMeToken=", this.rememberMeToken, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/RememberMeAccountHintQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query RememberMeAccountHintQuery($rememberMeToken: String!) { rememberMeAccountHint(input: { rememberMeToken: $rememberMeToken } ) { __typename ... on RememberMeAccountHint { imageId loginMethod name obfuscatedEmail userId } ... on NotFound { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
