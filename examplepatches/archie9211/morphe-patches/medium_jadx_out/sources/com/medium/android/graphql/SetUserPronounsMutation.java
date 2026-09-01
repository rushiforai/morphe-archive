package com.medium.android.graphql;

import com.medium.android.explore.ui.vAWg.OphtYB;
import com.medium.android.graphql.adapter.SetUserPronounsMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SetUserPronounsMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.MutationSuccessData;
import com.medium.android.graphql.selections.SetUserPronounsMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.SetUserPronounsInput;
import defpackage.ae6;
import defpackage.c8;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003*+)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/SetUserPronounsMutation;", "Lv78;", "Lcom/medium/android/graphql/SetUserPronounsMutation$Data;", "Lcom/medium/android/graphql/type/SetUserPronounsInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/SetUserPronounsInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/SetUserPronounsInput;", "copy", "(Lcom/medium/android/graphql/type/SetUserPronounsInput;)Lcom/medium/android/graphql/SetUserPronounsMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/SetUserPronounsInput;", "getInput", "Companion", "Data", "SetUserPronouns", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetUserPronounsMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "83060280c9dbaef27159f6a3eba4e0ce77a15abf06f03066fe388546c47da4de";
    public static final String OPERATION_NAME = "SetUserPronounsMutation";
    private final SetUserPronounsInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SetUserPronounsMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SetUserPronounsMutation$SetUserPronouns;", "setUserPronouns", "<init>", "(Lcom/medium/android/graphql/SetUserPronounsMutation$SetUserPronouns;)V", "component1", "()Lcom/medium/android/graphql/SetUserPronounsMutation$SetUserPronouns;", "copy", "(Lcom/medium/android/graphql/SetUserPronounsMutation$SetUserPronouns;)Lcom/medium/android/graphql/SetUserPronounsMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SetUserPronounsMutation$SetUserPronouns;", "getSetUserPronouns", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetUserPronouns setUserPronouns;

        public Data(SetUserPronouns setUserPronouns) {
            setUserPronouns.getClass();
            this.setUserPronouns = setUserPronouns;
        }

        public static /* synthetic */ Data copy$default(Data data, SetUserPronouns setUserPronouns, int i, Object obj) {
            if ((i & 1) != 0) {
                setUserPronouns = data.setUserPronouns;
            }
            return data.copy(setUserPronouns);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetUserPronouns getSetUserPronouns() {
            return this.setUserPronouns;
        }

        public final Data copy(SetUserPronouns setUserPronouns) {
            setUserPronouns.getClass();
            return new Data(setUserPronouns);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setUserPronouns, ((Data) other).setUserPronouns);
        }

        public final SetUserPronouns getSetUserPronouns() {
            return this.setUserPronouns;
        }

        public final int hashCode() {
            return this.setUserPronouns.hashCode();
        }

        public final String toString() {
            return "Data(setUserPronouns=" + this.setUserPronouns + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/SetUserPronounsMutation$SetUserPronouns;", "", "__typename", "", "mutationSuccessData", "Lcom/medium/android/graphql/fragment/MutationSuccessData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MutationSuccessData;)V", "get__typename", "()Ljava/lang/String;", "getMutationSuccessData", "()Lcom/medium/android/graphql/fragment/MutationSuccessData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetUserPronouns {
        private final String __typename;
        private final MutationSuccessData mutationSuccessData;

        public SetUserPronouns(String str, MutationSuccessData mutationSuccessData) {
            str.getClass();
            this.__typename = str;
            this.mutationSuccessData = mutationSuccessData;
        }

        public static /* synthetic */ SetUserPronouns copy$default(SetUserPronouns setUserPronouns, String str, MutationSuccessData mutationSuccessData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setUserPronouns.__typename;
            }
            if ((i & 2) != 0) {
                mutationSuccessData = setUserPronouns.mutationSuccessData;
            }
            return setUserPronouns.copy(str, mutationSuccessData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MutationSuccessData getMutationSuccessData() {
            return this.mutationSuccessData;
        }

        public final SetUserPronouns copy(String __typename, MutationSuccessData mutationSuccessData) {
            __typename.getClass();
            return new SetUserPronouns(__typename, mutationSuccessData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetUserPronouns)) {
                return false;
            }
            SetUserPronouns setUserPronouns = (SetUserPronouns) other;
            return g76.L(this.__typename, setUserPronouns.__typename) && g76.L(this.mutationSuccessData, setUserPronouns.mutationSuccessData);
        }

        public final MutationSuccessData getMutationSuccessData() {
            return this.mutationSuccessData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            MutationSuccessData mutationSuccessData = this.mutationSuccessData;
            return iHashCode + (mutationSuccessData == null ? 0 : mutationSuccessData.hashCode());
        }

        public final String toString() {
            return "SetUserPronouns(__typename=" + this.__typename + OphtYB.JcOxXqWfJZd + this.mutationSuccessData + ")";
        }
    }

    public SetUserPronounsMutation(SetUserPronounsInput setUserPronounsInput) {
        setUserPronounsInput.getClass();
        this.input = setUserPronounsInput;
    }

    public static /* synthetic */ SetUserPronounsMutation copy$default(SetUserPronounsMutation setUserPronounsMutation, SetUserPronounsInput setUserPronounsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            setUserPronounsInput = setUserPronounsMutation.input;
        }
        return setUserPronounsMutation.copy(setUserPronounsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SetUserPronounsMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final SetUserPronounsInput getInput() {
        return this.input;
    }

    public final SetUserPronounsMutation copy(SetUserPronounsInput input) {
        input.getClass();
        return new SetUserPronounsMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SetUserPronounsMutation($input: SetUserPronounsInput!) { setUserPronouns(input: $input) { __typename ...MutationSuccessData } }  fragment MutationSuccessData on MutationSuccess { __typename success }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof SetUserPronounsMutation) && g76.L(this.input, ((SetUserPronounsMutation) other).input);
    }

    public final SetUserPronounsInput getInput() {
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
        List<sx1> list = SetUserPronounsMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SetUserPronounsMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SetUserPronounsMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SetUserPronounsMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SetUserPronounsMutation($input: SetUserPronounsInput!) { setUserPronouns(input: $input) { __typename ...MutationSuccessData } }  fragment MutationSuccessData on MutationSuccess { __typename success }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
