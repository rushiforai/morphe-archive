package com.medium.android.graphql;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.medium.android.graphql.adapter.TogglePinMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.TogglePinMutation_VariablesAdapter;
import com.medium.android.graphql.selections.TogglePinMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.SetPostPinnedOnCreatorProfileInput;
import defpackage.ae6;
import defpackage.b09;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005*+,-)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006."}, d2 = {"Lcom/medium/android/graphql/TogglePinMutation;", "Lv78;", "Lcom/medium/android/graphql/TogglePinMutation$Data;", "Lcom/medium/android/graphql/type/SetPostPinnedOnCreatorProfileInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/SetPostPinnedOnCreatorProfileInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/SetPostPinnedOnCreatorProfileInput;", "copy", "(Lcom/medium/android/graphql/type/SetPostPinnedOnCreatorProfileInput;)Lcom/medium/android/graphql/TogglePinMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/SetPostPinnedOnCreatorProfileInput;", "getInput", "Companion", "Data", "SetPostPinnedOnCreatorProfile", "OnMutationSuccess", "OnMaxPinnedStoriesReached", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TogglePinMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "abcb2feff5e647fe3701cc817dfc62cc2a1270b993d12abe5d9fb937e3be3bab";
    public static final String OPERATION_NAME = "TogglePin";
    private final SetPostPinnedOnCreatorProfileInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/TogglePinMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/TogglePinMutation$SetPostPinnedOnCreatorProfile;", "setPostPinnedOnCreatorProfile", "<init>", "(Lcom/medium/android/graphql/TogglePinMutation$SetPostPinnedOnCreatorProfile;)V", "component1", "()Lcom/medium/android/graphql/TogglePinMutation$SetPostPinnedOnCreatorProfile;", "copy", "(Lcom/medium/android/graphql/TogglePinMutation$SetPostPinnedOnCreatorProfile;)Lcom/medium/android/graphql/TogglePinMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/TogglePinMutation$SetPostPinnedOnCreatorProfile;", "getSetPostPinnedOnCreatorProfile", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetPostPinnedOnCreatorProfile setPostPinnedOnCreatorProfile;

        public Data(SetPostPinnedOnCreatorProfile setPostPinnedOnCreatorProfile) {
            setPostPinnedOnCreatorProfile.getClass();
            this.setPostPinnedOnCreatorProfile = setPostPinnedOnCreatorProfile;
        }

        public static /* synthetic */ Data copy$default(Data data, SetPostPinnedOnCreatorProfile setPostPinnedOnCreatorProfile, int i, Object obj) {
            if ((i & 1) != 0) {
                setPostPinnedOnCreatorProfile = data.setPostPinnedOnCreatorProfile;
            }
            return data.copy(setPostPinnedOnCreatorProfile);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetPostPinnedOnCreatorProfile getSetPostPinnedOnCreatorProfile() {
            return this.setPostPinnedOnCreatorProfile;
        }

        public final Data copy(SetPostPinnedOnCreatorProfile setPostPinnedOnCreatorProfile) {
            setPostPinnedOnCreatorProfile.getClass();
            return new Data(setPostPinnedOnCreatorProfile);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setPostPinnedOnCreatorProfile, ((Data) other).setPostPinnedOnCreatorProfile);
        }

        public final SetPostPinnedOnCreatorProfile getSetPostPinnedOnCreatorProfile() {
            return this.setPostPinnedOnCreatorProfile;
        }

        public final int hashCode() {
            return this.setPostPinnedOnCreatorProfile.hashCode();
        }

        public final String toString() {
            return AXoTRPEGKEve.jEVZxsa + this.setPostPinnedOnCreatorProfile + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/TogglePinMutation$OnMaxPinnedStoriesReached;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMaxPinnedStoriesReached {
        private final String message;

        public OnMaxPinnedStoriesReached(String str) {
            this.message = str;
        }

        public static OnMaxPinnedStoriesReached copy$default(OnMaxPinnedStoriesReached onMaxPinnedStoriesReached, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onMaxPinnedStoriesReached.message;
            }
            onMaxPinnedStoriesReached.getClass();
            return new OnMaxPinnedStoriesReached(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnMaxPinnedStoriesReached copy(String message) {
            return new OnMaxPinnedStoriesReached(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnMaxPinnedStoriesReached) && g76.L(this.message, ((OnMaxPinnedStoriesReached) other).message);
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
            return ev6.x("OnMaxPinnedStoriesReached(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u00032\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/TogglePinMutation$OnMutationSuccess;", "", "success", "", "<init>", "(Z)V", "getSuccess", "()Z", "component1", "copy", "equals", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMutationSuccess {
        private final boolean success;

        public OnMutationSuccess(boolean z) {
            this.success = z;
        }

        public static OnMutationSuccess copy$default(OnMutationSuccess onMutationSuccess, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                z = onMutationSuccess.success;
            }
            onMutationSuccess.getClass();
            return new OnMutationSuccess(z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final boolean getSuccess() {
            return this.success;
        }

        public final OnMutationSuccess copy(boolean success) {
            return new OnMutationSuccess(success);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnMutationSuccess) && this.success == ((OnMutationSuccess) other).success;
        }

        public final boolean getSuccess() {
            return this.success;
        }

        public final int hashCode() {
            return this.success ? 1231 : 1237;
        }

        public final String toString() {
            return b09.z("OnMutationSuccess(success=", ")", this.success);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/TogglePinMutation$SetPostPinnedOnCreatorProfile;", "", "__typename", "", "onMutationSuccess", "Lcom/medium/android/graphql/TogglePinMutation$OnMutationSuccess;", "onMaxPinnedStoriesReached", "Lcom/medium/android/graphql/TogglePinMutation$OnMaxPinnedStoriesReached;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/TogglePinMutation$OnMutationSuccess;Lcom/medium/android/graphql/TogglePinMutation$OnMaxPinnedStoriesReached;)V", "get__typename", "()Ljava/lang/String;", "getOnMutationSuccess", "()Lcom/medium/android/graphql/TogglePinMutation$OnMutationSuccess;", "getOnMaxPinnedStoriesReached", "()Lcom/medium/android/graphql/TogglePinMutation$OnMaxPinnedStoriesReached;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetPostPinnedOnCreatorProfile {
        private final String __typename;
        private final OnMaxPinnedStoriesReached onMaxPinnedStoriesReached;
        private final OnMutationSuccess onMutationSuccess;

        public SetPostPinnedOnCreatorProfile(String str, OnMutationSuccess onMutationSuccess, OnMaxPinnedStoriesReached onMaxPinnedStoriesReached) {
            str.getClass();
            this.__typename = str;
            this.onMutationSuccess = onMutationSuccess;
            this.onMaxPinnedStoriesReached = onMaxPinnedStoriesReached;
        }

        public static /* synthetic */ SetPostPinnedOnCreatorProfile copy$default(SetPostPinnedOnCreatorProfile setPostPinnedOnCreatorProfile, String str, OnMutationSuccess onMutationSuccess, OnMaxPinnedStoriesReached onMaxPinnedStoriesReached, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setPostPinnedOnCreatorProfile.__typename;
            }
            if ((i & 2) != 0) {
                onMutationSuccess = setPostPinnedOnCreatorProfile.onMutationSuccess;
            }
            if ((i & 4) != 0) {
                onMaxPinnedStoriesReached = setPostPinnedOnCreatorProfile.onMaxPinnedStoriesReached;
            }
            return setPostPinnedOnCreatorProfile.copy(str, onMutationSuccess, onMaxPinnedStoriesReached);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnMutationSuccess getOnMutationSuccess() {
            return this.onMutationSuccess;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnMaxPinnedStoriesReached getOnMaxPinnedStoriesReached() {
            return this.onMaxPinnedStoriesReached;
        }

        public final SetPostPinnedOnCreatorProfile copy(String __typename, OnMutationSuccess onMutationSuccess, OnMaxPinnedStoriesReached onMaxPinnedStoriesReached) {
            __typename.getClass();
            return new SetPostPinnedOnCreatorProfile(__typename, onMutationSuccess, onMaxPinnedStoriesReached);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetPostPinnedOnCreatorProfile)) {
                return false;
            }
            SetPostPinnedOnCreatorProfile setPostPinnedOnCreatorProfile = (SetPostPinnedOnCreatorProfile) other;
            return g76.L(this.__typename, setPostPinnedOnCreatorProfile.__typename) && g76.L(this.onMutationSuccess, setPostPinnedOnCreatorProfile.onMutationSuccess) && g76.L(this.onMaxPinnedStoriesReached, setPostPinnedOnCreatorProfile.onMaxPinnedStoriesReached);
        }

        public final OnMaxPinnedStoriesReached getOnMaxPinnedStoriesReached() {
            return this.onMaxPinnedStoriesReached;
        }

        public final OnMutationSuccess getOnMutationSuccess() {
            return this.onMutationSuccess;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnMutationSuccess onMutationSuccess = this.onMutationSuccess;
            int iHashCode2 = (iHashCode + (onMutationSuccess == null ? 0 : onMutationSuccess.hashCode())) * 31;
            OnMaxPinnedStoriesReached onMaxPinnedStoriesReached = this.onMaxPinnedStoriesReached;
            return iHashCode2 + (onMaxPinnedStoriesReached != null ? onMaxPinnedStoriesReached.hashCode() : 0);
        }

        public final String toString() {
            return "SetPostPinnedOnCreatorProfile(__typename=" + this.__typename + ", onMutationSuccess=" + this.onMutationSuccess + ", onMaxPinnedStoriesReached=" + this.onMaxPinnedStoriesReached + ")";
        }
    }

    public TogglePinMutation(SetPostPinnedOnCreatorProfileInput setPostPinnedOnCreatorProfileInput) {
        setPostPinnedOnCreatorProfileInput.getClass();
        this.input = setPostPinnedOnCreatorProfileInput;
    }

    public static /* synthetic */ TogglePinMutation copy$default(TogglePinMutation togglePinMutation, SetPostPinnedOnCreatorProfileInput setPostPinnedOnCreatorProfileInput, int i, Object obj) {
        if ((i & 1) != 0) {
            setPostPinnedOnCreatorProfileInput = togglePinMutation.input;
        }
        return togglePinMutation.copy(setPostPinnedOnCreatorProfileInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(TogglePinMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final SetPostPinnedOnCreatorProfileInput getInput() {
        return this.input;
    }

    public final TogglePinMutation copy(SetPostPinnedOnCreatorProfileInput input) {
        input.getClass();
        return new TogglePinMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation TogglePin($input: SetPostPinnedOnCreatorProfileInput!) { setPostPinnedOnCreatorProfile(input: $input) { __typename ... on MutationSuccess { success } ... on MaxPinnedStoriesReached { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof TogglePinMutation) && g76.L(this.input, ((TogglePinMutation) other).input);
    }

    public final SetPostPinnedOnCreatorProfileInput getInput() {
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
        List<sx1> list = TogglePinMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        TogglePinMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "TogglePinMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/TogglePinMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation TogglePin($input: SetPostPinnedOnCreatorProfileInput!) { setPostPinnedOnCreatorProfile(input: $input) { __typename ... on MutationSuccess { success } ... on MaxPinnedStoriesReached { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
