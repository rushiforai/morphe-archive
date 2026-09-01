package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SetAllowCurationMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SetAllowCurationMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SetAllowCurationMutationSelections;
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
@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 ,2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003-.,B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\nJ$\u0010\u001e\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b \u0010\nJ\u0010\u0010\"\u001a\u00020!HÖ\u0001¢\u0006\u0004\b\"\u0010#J\u001a\u0010&\u001a\u00020\u00032\b\u0010%\u001a\u0004\u0018\u00010$HÖ\u0003¢\u0006\u0004\b&\u0010'R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010(\u001a\u0004\b)\u0010\u001cR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010*\u001a\u0004\b+\u0010\n¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/SetAllowCurationMutation;", "Lv78;", "Lcom/medium/android/graphql/SetAllowCurationMutation$Data;", "", "allowCuration", "", "postId", "<init>", "(ZLjava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Z", "component2", "copy", "(ZLjava/lang/String;)Lcom/medium/android/graphql/SetAllowCurationMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Z", "getAllowCuration", "Ljava/lang/String;", "getPostId", "Companion", "Data", "SetPostAllowCuration", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetAllowCurationMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "e456339c1372b48450d27cf7559955fc0f364af8772f1b9bf1ee17cab83b4df2";
    public static final String OPERATION_NAME = "SetAllowCurationMutation";
    private final boolean allowCuration;
    private final String postId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SetAllowCurationMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SetAllowCurationMutation$SetPostAllowCuration;", "setPostAllowCuration", "<init>", "(Lcom/medium/android/graphql/SetAllowCurationMutation$SetPostAllowCuration;)V", "component1", "()Lcom/medium/android/graphql/SetAllowCurationMutation$SetPostAllowCuration;", "copy", "(Lcom/medium/android/graphql/SetAllowCurationMutation$SetPostAllowCuration;)Lcom/medium/android/graphql/SetAllowCurationMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SetAllowCurationMutation$SetPostAllowCuration;", "getSetPostAllowCuration", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetPostAllowCuration setPostAllowCuration;

        public Data(SetPostAllowCuration setPostAllowCuration) {
            this.setPostAllowCuration = setPostAllowCuration;
        }

        public static Data copy$default(Data data, SetPostAllowCuration setPostAllowCuration, int i, Object obj) {
            if ((i & 1) != 0) {
                setPostAllowCuration = data.setPostAllowCuration;
            }
            data.getClass();
            return new Data(setPostAllowCuration);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetPostAllowCuration getSetPostAllowCuration() {
            return this.setPostAllowCuration;
        }

        public final Data copy(SetPostAllowCuration setPostAllowCuration) {
            return new Data(setPostAllowCuration);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setPostAllowCuration, ((Data) other).setPostAllowCuration);
        }

        public final SetPostAllowCuration getSetPostAllowCuration() {
            return this.setPostAllowCuration;
        }

        public final int hashCode() {
            SetPostAllowCuration setPostAllowCuration = this.setPostAllowCuration;
            if (setPostAllowCuration == null) {
                return 0;
            }
            return setPostAllowCuration.hashCode();
        }

        public final String toString() {
            return "Data(setPostAllowCuration=" + this.setPostAllowCuration + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/SetAllowCurationMutation$SetPostAllowCuration;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetPostAllowCuration {
        private final String __typename;
        private final String id;

        public SetPostAllowCuration(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ SetPostAllowCuration copy$default(SetPostAllowCuration setPostAllowCuration, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setPostAllowCuration.__typename;
            }
            if ((i & 2) != 0) {
                str2 = setPostAllowCuration.id;
            }
            return setPostAllowCuration.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final SetPostAllowCuration copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new SetPostAllowCuration(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetPostAllowCuration)) {
                return false;
            }
            SetPostAllowCuration setPostAllowCuration = (SetPostAllowCuration) other;
            return g76.L(this.__typename, setPostAllowCuration.__typename) && g76.L(this.id, setPostAllowCuration.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("SetPostAllowCuration(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    public SetAllowCurationMutation(boolean z, String str) {
        str.getClass();
        this.allowCuration = z;
        this.postId = str;
    }

    public static /* synthetic */ SetAllowCurationMutation copy$default(SetAllowCurationMutation setAllowCurationMutation, boolean z, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            z = setAllowCurationMutation.allowCuration;
        }
        if ((i & 2) != 0) {
            str = setAllowCurationMutation.postId;
        }
        return setAllowCurationMutation.copy(z, str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SetAllowCurationMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final boolean getAllowCuration() {
        return this.allowCuration;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final SetAllowCurationMutation copy(boolean allowCuration, String postId) {
        postId.getClass();
        return new SetAllowCurationMutation(allowCuration, postId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SetAllowCurationMutation($allowCuration: Boolean!, $postId: ID!) { setPostAllowCuration(allowCuration: $allowCuration, targetPostId: $postId) { __typename id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SetAllowCurationMutation)) {
            return false;
        }
        SetAllowCurationMutation setAllowCurationMutation = (SetAllowCurationMutation) other;
        return this.allowCuration == setAllowCurationMutation.allowCuration && g76.L(this.postId, setAllowCurationMutation.postId);
    }

    public final boolean getAllowCuration() {
        return this.allowCuration;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.postId.hashCode() + ((this.allowCuration ? 1231 : 1237) * 31);
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
        List<sx1> list = SetAllowCurationMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SetAllowCurationMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SetAllowCurationMutation(allowCuration=" + this.allowCuration + ", postId=" + this.postId + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SetAllowCurationMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SetAllowCurationMutation($allowCuration: Boolean!, $postId: ID!) { setPostAllowCuration(allowCuration: $allowCuration, targetPostId: $postId) { __typename id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
