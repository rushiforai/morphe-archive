package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UploadContactsMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UploadContactsMutation_VariablesAdapter;
import com.medium.android.graphql.selections.UploadContactsMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UploadContactsInput;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\f\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006*+,-.)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/UploadContactsMutation;", "Lv78;", "Lcom/medium/android/graphql/UploadContactsMutation$Data;", "Lcom/medium/android/graphql/type/UploadContactsInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/UploadContactsInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/UploadContactsInput;", "copy", "(Lcom/medium/android/graphql/type/UploadContactsInput;)Lcom/medium/android/graphql/UploadContactsMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/UploadContactsInput;", "getInput", "Companion", "Data", "UploadContacts", "OnUploadContactsSuccess", "OnUnauthorized", "OnBadRequest", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UploadContactsMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "c958c0e70d7ed0efc8976cdf614ec3b4b1b41bd6c00f52541b1e010bd9d934e9";
    public static final String OPERATION_NAME = "UploadContactsMutation";
    private final UploadContactsInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UploadContactsMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UploadContactsMutation$UploadContacts;", "uploadContacts", "<init>", "(Lcom/medium/android/graphql/UploadContactsMutation$UploadContacts;)V", "component1", "()Lcom/medium/android/graphql/UploadContactsMutation$UploadContacts;", "copy", "(Lcom/medium/android/graphql/UploadContactsMutation$UploadContacts;)Lcom/medium/android/graphql/UploadContactsMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UploadContactsMutation$UploadContacts;", "getUploadContacts", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UploadContacts uploadContacts;

        public Data(UploadContacts uploadContacts) {
            uploadContacts.getClass();
            this.uploadContacts = uploadContacts;
        }

        public static /* synthetic */ Data copy$default(Data data, UploadContacts uploadContacts, int i, Object obj) {
            if ((i & 1) != 0) {
                uploadContacts = data.uploadContacts;
            }
            return data.copy(uploadContacts);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UploadContacts getUploadContacts() {
            return this.uploadContacts;
        }

        public final Data copy(UploadContacts uploadContacts) {
            uploadContacts.getClass();
            return new Data(uploadContacts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.uploadContacts, ((Data) other).uploadContacts);
        }

        public final UploadContacts getUploadContacts() {
            return this.uploadContacts;
        }

        public final int hashCode() {
            return this.uploadContacts.hashCode();
        }

        public final String toString() {
            return "Data(uploadContacts=" + this.uploadContacts + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UploadContactsMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UploadContactsMutation$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u0003HÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UploadContactsMutation$OnUploadContactsSuccess;", "", "contactsUploaded", "", "<init>", "(I)V", "getContactsUploaded", "()I", "component1", "copy", "equals", "", "other", "hashCode", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUploadContactsSuccess {
        private final int contactsUploaded;

        public OnUploadContactsSuccess(int i) {
            this.contactsUploaded = i;
        }

        public static OnUploadContactsSuccess copy$default(OnUploadContactsSuccess onUploadContactsSuccess, int i, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                i = onUploadContactsSuccess.contactsUploaded;
            }
            onUploadContactsSuccess.getClass();
            return new OnUploadContactsSuccess(i);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final int getContactsUploaded() {
            return this.contactsUploaded;
        }

        public final OnUploadContactsSuccess copy(int contactsUploaded) {
            return new OnUploadContactsSuccess(contactsUploaded);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUploadContactsSuccess) && this.contactsUploaded == ((OnUploadContactsSuccess) other).contactsUploaded;
        }

        public final int getContactsUploaded() {
            return this.contactsUploaded;
        }

        public final int hashCode() {
            return this.contactsUploaded;
        }

        public final String toString() {
            return ev6.w("OnUploadContactsSuccess(contactsUploaded=", this.contactsUploaded, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/UploadContactsMutation$UploadContacts;", "", "__typename", "", "onUploadContactsSuccess", "Lcom/medium/android/graphql/UploadContactsMutation$OnUploadContactsSuccess;", "onUnauthorized", "Lcom/medium/android/graphql/UploadContactsMutation$OnUnauthorized;", "onBadRequest", "Lcom/medium/android/graphql/UploadContactsMutation$OnBadRequest;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UploadContactsMutation$OnUploadContactsSuccess;Lcom/medium/android/graphql/UploadContactsMutation$OnUnauthorized;Lcom/medium/android/graphql/UploadContactsMutation$OnBadRequest;)V", "get__typename", "()Ljava/lang/String;", "getOnUploadContactsSuccess", "()Lcom/medium/android/graphql/UploadContactsMutation$OnUploadContactsSuccess;", "getOnUnauthorized", "()Lcom/medium/android/graphql/UploadContactsMutation$OnUnauthorized;", "getOnBadRequest", "()Lcom/medium/android/graphql/UploadContactsMutation$OnBadRequest;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UploadContacts {
        private final String __typename;
        private final OnBadRequest onBadRequest;
        private final OnUnauthorized onUnauthorized;
        private final OnUploadContactsSuccess onUploadContactsSuccess;

        public UploadContacts(String str, OnUploadContactsSuccess onUploadContactsSuccess, OnUnauthorized onUnauthorized, OnBadRequest onBadRequest) {
            str.getClass();
            this.__typename = str;
            this.onUploadContactsSuccess = onUploadContactsSuccess;
            this.onUnauthorized = onUnauthorized;
            this.onBadRequest = onBadRequest;
        }

        public static /* synthetic */ UploadContacts copy$default(UploadContacts uploadContacts, String str, OnUploadContactsSuccess onUploadContactsSuccess, OnUnauthorized onUnauthorized, OnBadRequest onBadRequest, int i, Object obj) {
            if ((i & 1) != 0) {
                str = uploadContacts.__typename;
            }
            if ((i & 2) != 0) {
                onUploadContactsSuccess = uploadContacts.onUploadContactsSuccess;
            }
            if ((i & 4) != 0) {
                onUnauthorized = uploadContacts.onUnauthorized;
            }
            if ((i & 8) != 0) {
                onBadRequest = uploadContacts.onBadRequest;
            }
            return uploadContacts.copy(str, onUploadContactsSuccess, onUnauthorized, onBadRequest);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUploadContactsSuccess getOnUploadContactsSuccess() {
            return this.onUploadContactsSuccess;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final UploadContacts copy(String __typename, OnUploadContactsSuccess onUploadContactsSuccess, OnUnauthorized onUnauthorized, OnBadRequest onBadRequest) {
            __typename.getClass();
            return new UploadContacts(__typename, onUploadContactsSuccess, onUnauthorized, onBadRequest);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UploadContacts)) {
                return false;
            }
            UploadContacts uploadContacts = (UploadContacts) other;
            return g76.L(this.__typename, uploadContacts.__typename) && g76.L(this.onUploadContactsSuccess, uploadContacts.onUploadContactsSuccess) && g76.L(this.onUnauthorized, uploadContacts.onUnauthorized) && g76.L(this.onBadRequest, uploadContacts.onBadRequest);
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final OnUploadContactsSuccess getOnUploadContactsSuccess() {
            return this.onUploadContactsSuccess;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnUploadContactsSuccess onUploadContactsSuccess = this.onUploadContactsSuccess;
            int iHashCode2 = (iHashCode + (onUploadContactsSuccess == null ? 0 : onUploadContactsSuccess.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            int iHashCode3 = (iHashCode2 + (onUnauthorized == null ? 0 : onUnauthorized.hashCode())) * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            return iHashCode3 + (onBadRequest != null ? onBadRequest.hashCode() : 0);
        }

        public final String toString() {
            return "UploadContacts(__typename=" + this.__typename + ", onUploadContactsSuccess=" + this.onUploadContactsSuccess + ", onUnauthorized=" + this.onUnauthorized + ", onBadRequest=" + this.onBadRequest + ")";
        }
    }

    public UploadContactsMutation(UploadContactsInput uploadContactsInput) {
        uploadContactsInput.getClass();
        this.input = uploadContactsInput;
    }

    public static /* synthetic */ UploadContactsMutation copy$default(UploadContactsMutation uploadContactsMutation, UploadContactsInput uploadContactsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            uploadContactsInput = uploadContactsMutation.input;
        }
        return uploadContactsMutation.copy(uploadContactsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UploadContactsMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final UploadContactsInput getInput() {
        return this.input;
    }

    public final UploadContactsMutation copy(UploadContactsInput input) {
        input.getClass();
        return new UploadContactsMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UploadContactsMutation($input: UploadContactsInput!) { uploadContacts(input: $input) { __typename ... on UploadContactsSuccess { contactsUploaded } ... on Unauthorized { message } ... on BadRequest { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UploadContactsMutation) && g76.L(this.input, ((UploadContactsMutation) other).input);
    }

    public final UploadContactsInput getInput() {
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
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = UploadContactsMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UploadContactsMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "UploadContactsMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UploadContactsMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UploadContactsMutation($input: UploadContactsInput!) { uploadContacts(input: $input) { __typename ... on UploadContactsSuccess { contactsUploaded } ... on Unauthorized { message } ... on BadRequest { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
