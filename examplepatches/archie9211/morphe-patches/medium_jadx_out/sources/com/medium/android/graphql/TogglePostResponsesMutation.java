package com.medium.android.graphql;

import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.graphql.adapter.TogglePostResponsesMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.TogglePostResponsesMutation_VariablesAdapter;
import com.medium.android.graphql.selections.TogglePostResponsesMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.km4;
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
@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 ,2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003-.,B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\nJ\u0010\u0010\u001c\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ$\u0010\u001e\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b \u0010\nJ\u0010\u0010\"\u001a\u00020!HÖ\u0001¢\u0006\u0004\b\"\u0010#J\u001a\u0010&\u001a\u00020\u00052\b\u0010%\u001a\u0004\u0018\u00010$HÖ\u0003¢\u0006\u0004\b&\u0010'R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010(\u001a\u0004\b)\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010*\u001a\u0004\b+\u0010\u001d¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/TogglePostResponsesMutation;", "Lv78;", "Lcom/medium/android/graphql/TogglePostResponsesMutation$Data;", "", "postId", "", "allow", "<init>", "(Ljava/lang/String;Z)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Z", "copy", "(Ljava/lang/String;Z)Lcom/medium/android/graphql/TogglePostResponsesMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Z", "getAllow", "Companion", "Data", "SetPostAllowResponses", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TogglePostResponsesMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "875c44fc34e3e06ad846fc86ae3eef917de088c42ef593c58ecab49ae914f42e";
    public static final String OPERATION_NAME = "TogglePostResponsesMutation";
    private final boolean allow;
    private final String postId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/TogglePostResponsesMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/TogglePostResponsesMutation$SetPostAllowResponses;", "setPostAllowResponses", "<init>", "(Lcom/medium/android/graphql/TogglePostResponsesMutation$SetPostAllowResponses;)V", "component1", "()Lcom/medium/android/graphql/TogglePostResponsesMutation$SetPostAllowResponses;", "copy", "(Lcom/medium/android/graphql/TogglePostResponsesMutation$SetPostAllowResponses;)Lcom/medium/android/graphql/TogglePostResponsesMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/TogglePostResponsesMutation$SetPostAllowResponses;", "getSetPostAllowResponses", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetPostAllowResponses setPostAllowResponses;

        public Data(SetPostAllowResponses setPostAllowResponses) {
            this.setPostAllowResponses = setPostAllowResponses;
        }

        public static Data copy$default(Data data, SetPostAllowResponses setPostAllowResponses, int i, Object obj) {
            if ((i & 1) != 0) {
                setPostAllowResponses = data.setPostAllowResponses;
            }
            data.getClass();
            return new Data(setPostAllowResponses);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetPostAllowResponses getSetPostAllowResponses() {
            return this.setPostAllowResponses;
        }

        public final Data copy(SetPostAllowResponses setPostAllowResponses) {
            return new Data(setPostAllowResponses);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setPostAllowResponses, ((Data) other).setPostAllowResponses);
        }

        public final SetPostAllowResponses getSetPostAllowResponses() {
            return this.setPostAllowResponses;
        }

        public final int hashCode() {
            SetPostAllowResponses setPostAllowResponses = this.setPostAllowResponses;
            if (setPostAllowResponses == null) {
                return 0;
            }
            return setPostAllowResponses.hashCode();
        }

        public final String toString() {
            return KLTXZbnQvj.koIxFXOgoiTKg + this.setPostAllowResponses + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0011\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00052\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/TogglePostResponsesMutation$SetPostAllowResponses;", "", "__typename", "", "allowResponses", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getAllowResponses", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getId", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/medium/android/graphql/TogglePostResponsesMutation$SetPostAllowResponses;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetPostAllowResponses {
        private final String __typename;
        private final Boolean allowResponses;
        private final String id;

        public SetPostAllowResponses(String str, Boolean bool, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.allowResponses = bool;
            this.id = str2;
        }

        public static /* synthetic */ SetPostAllowResponses copy$default(SetPostAllowResponses setPostAllowResponses, String str, Boolean bool, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setPostAllowResponses.__typename;
            }
            if ((i & 2) != 0) {
                bool = setPostAllowResponses.allowResponses;
            }
            if ((i & 4) != 0) {
                str2 = setPostAllowResponses.id;
            }
            return setPostAllowResponses.copy(str, bool, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Boolean getAllowResponses() {
            return this.allowResponses;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final SetPostAllowResponses copy(String __typename, Boolean allowResponses, String id) {
            __typename.getClass();
            id.getClass();
            return new SetPostAllowResponses(__typename, allowResponses, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetPostAllowResponses)) {
                return false;
            }
            SetPostAllowResponses setPostAllowResponses = (SetPostAllowResponses) other;
            return g76.L(this.__typename, setPostAllowResponses.__typename) && g76.L(this.allowResponses, setPostAllowResponses.allowResponses) && g76.L(this.id, setPostAllowResponses.id);
        }

        public final Boolean getAllowResponses() {
            return this.allowResponses;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Boolean bool = this.allowResponses;
            return this.id.hashCode() + ((iHashCode + (bool == null ? 0 : bool.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Boolean bool = this.allowResponses;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("SetPostAllowResponses(__typename=");
            sb.append(str);
            sb.append(", allowResponses=");
            sb.append(bool);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public TogglePostResponsesMutation(String str, boolean z) {
        str.getClass();
        this.postId = str;
        this.allow = z;
    }

    public static /* synthetic */ TogglePostResponsesMutation copy$default(TogglePostResponsesMutation togglePostResponsesMutation, String str, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = togglePostResponsesMutation.postId;
        }
        if ((i & 2) != 0) {
            z = togglePostResponsesMutation.allow;
        }
        return togglePostResponsesMutation.copy(str, z);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(TogglePostResponsesMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final boolean getAllow() {
        return this.allow;
    }

    public final TogglePostResponsesMutation copy(String postId, boolean allow) {
        postId.getClass();
        return new TogglePostResponsesMutation(postId, allow);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation TogglePostResponsesMutation($postId: ID!, $allow: Boolean!) { setPostAllowResponses(allowResponses: $allow, targetPostId: $postId) { __typename allowResponses id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TogglePostResponsesMutation)) {
            return false;
        }
        TogglePostResponsesMutation togglePostResponsesMutation = (TogglePostResponsesMutation) other;
        return g76.L(this.postId, togglePostResponsesMutation.postId) && this.allow == togglePostResponsesMutation.allow;
    }

    public final boolean getAllow() {
        return this.allow;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return (this.postId.hashCode() * 31) + (this.allow ? 1231 : 1237);
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
        List<sx1> list = TogglePostResponsesMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        TogglePostResponsesMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return km4.z("TogglePostResponsesMutation(postId=", this.postId, ", allow=", ")", this.allow);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/TogglePostResponsesMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation TogglePostResponsesMutation($postId: ID!, $allow: Boolean!) { setPostAllowResponses(allowResponses: $allow, targetPostId: $postId) { __typename allowResponses id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
