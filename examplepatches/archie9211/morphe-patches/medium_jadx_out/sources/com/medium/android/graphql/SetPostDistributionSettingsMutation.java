package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SetPostDistributionSettingsMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SetPostDistributionSettingsMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SetPostDistributionSettingsMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.SetPostDistributionSettingsInput;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003*+)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/SetPostDistributionSettingsMutation;", "Lv78;", "Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$Data;", "Lcom/medium/android/graphql/type/SetPostDistributionSettingsInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/SetPostDistributionSettingsInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/SetPostDistributionSettingsInput;", "copy", "(Lcom/medium/android/graphql/type/SetPostDistributionSettingsInput;)Lcom/medium/android/graphql/SetPostDistributionSettingsMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/SetPostDistributionSettingsInput;", "getInput", "Companion", "Data", "SetPostDistributionSettings", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetPostDistributionSettingsMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "e593d77370cf5c49b78f5e1434043fda4d5f7c0f6f11378bc9c9bbdebd22099f";
    public static final String OPERATION_NAME = "SetPostDistributionSettingsMutation";
    private final SetPostDistributionSettingsInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$SetPostDistributionSettings;", "setPostDistributionSettings", "<init>", "(Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$SetPostDistributionSettings;)V", "component1", "()Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$SetPostDistributionSettings;", "copy", "(Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$SetPostDistributionSettings;)Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$SetPostDistributionSettings;", "getSetPostDistributionSettings", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetPostDistributionSettings setPostDistributionSettings;

        public Data(SetPostDistributionSettings setPostDistributionSettings) {
            this.setPostDistributionSettings = setPostDistributionSettings;
        }

        public static Data copy$default(Data data, SetPostDistributionSettings setPostDistributionSettings, int i, Object obj) {
            if ((i & 1) != 0) {
                setPostDistributionSettings = data.setPostDistributionSettings;
            }
            data.getClass();
            return new Data(setPostDistributionSettings);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetPostDistributionSettings getSetPostDistributionSettings() {
            return this.setPostDistributionSettings;
        }

        public final Data copy(SetPostDistributionSettings setPostDistributionSettings) {
            return new Data(setPostDistributionSettings);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setPostDistributionSettings, ((Data) other).setPostDistributionSettings);
        }

        public final SetPostDistributionSettings getSetPostDistributionSettings() {
            return this.setPostDistributionSettings;
        }

        public final int hashCode() {
            SetPostDistributionSettings setPostDistributionSettings = this.setPostDistributionSettings;
            if (setPostDistributionSettings == null) {
                return 0;
            }
            return setPostDistributionSettings.hashCode();
        }

        public final String toString() {
            return "Data(setPostDistributionSettings=" + this.setPostDistributionSettings + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J.\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0012J\u0013\u0010\u0013\u001a\u00020\u00052\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$SetPostDistributionSettings;", "", "__typename", "", "isPublishToEmail", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getId", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$SetPostDistributionSettings;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetPostDistributionSettings {
        private final String __typename;
        private final String id;
        private final Boolean isPublishToEmail;

        public SetPostDistributionSettings(String str, Boolean bool, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isPublishToEmail = bool;
            this.id = str2;
        }

        public static /* synthetic */ SetPostDistributionSettings copy$default(SetPostDistributionSettings setPostDistributionSettings, String str, Boolean bool, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setPostDistributionSettings.__typename;
            }
            if ((i & 2) != 0) {
                bool = setPostDistributionSettings.isPublishToEmail;
            }
            if ((i & 4) != 0) {
                str2 = setPostDistributionSettings.id;
            }
            return setPostDistributionSettings.copy(str, bool, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Boolean getIsPublishToEmail() {
            return this.isPublishToEmail;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final SetPostDistributionSettings copy(String __typename, Boolean isPublishToEmail, String id) {
            __typename.getClass();
            id.getClass();
            return new SetPostDistributionSettings(__typename, isPublishToEmail, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetPostDistributionSettings)) {
                return false;
            }
            SetPostDistributionSettings setPostDistributionSettings = (SetPostDistributionSettings) other;
            return g76.L(this.__typename, setPostDistributionSettings.__typename) && g76.L(this.isPublishToEmail, setPostDistributionSettings.isPublishToEmail) && g76.L(this.id, setPostDistributionSettings.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Boolean bool = this.isPublishToEmail;
            return this.id.hashCode() + ((iHashCode + (bool == null ? 0 : bool.hashCode())) * 31);
        }

        public final Boolean isPublishToEmail() {
            return this.isPublishToEmail;
        }

        public final String toString() {
            String str = this.__typename;
            Boolean bool = this.isPublishToEmail;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("SetPostDistributionSettings(__typename=");
            sb.append(str);
            sb.append(", isPublishToEmail=");
            sb.append(bool);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public SetPostDistributionSettingsMutation(SetPostDistributionSettingsInput setPostDistributionSettingsInput) {
        setPostDistributionSettingsInput.getClass();
        this.input = setPostDistributionSettingsInput;
    }

    public static /* synthetic */ SetPostDistributionSettingsMutation copy$default(SetPostDistributionSettingsMutation setPostDistributionSettingsMutation, SetPostDistributionSettingsInput setPostDistributionSettingsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            setPostDistributionSettingsInput = setPostDistributionSettingsMutation.input;
        }
        return setPostDistributionSettingsMutation.copy(setPostDistributionSettingsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SetPostDistributionSettingsMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final SetPostDistributionSettingsInput getInput() {
        return this.input;
    }

    public final SetPostDistributionSettingsMutation copy(SetPostDistributionSettingsInput input) {
        input.getClass();
        return new SetPostDistributionSettingsMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SetPostDistributionSettingsMutation($input: SetPostDistributionSettingsInput!) { setPostDistributionSettings(input: $input) { __typename isPublishToEmail id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof SetPostDistributionSettingsMutation) && g76.L(this.input, ((SetPostDistributionSettingsMutation) other).input);
    }

    public final SetPostDistributionSettingsInput getInput() {
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
        List<sx1> list = SetPostDistributionSettingsMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SetPostDistributionSettingsMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SetPostDistributionSettingsMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SetPostDistributionSettingsMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SetPostDistributionSettingsMutation($input: SetPostDistributionSettingsInput!) { setPostDistributionSettings(input: $input) { __typename isPublishToEmail id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
