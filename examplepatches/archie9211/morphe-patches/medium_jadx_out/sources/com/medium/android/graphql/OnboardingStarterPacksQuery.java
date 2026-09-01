package com.medium.android.graphql;

import com.medium.android.graphql.adapter.OnboardingStarterPacksQuery_ResponseAdapter;
import com.medium.android.graphql.selections.OnboardingStarterPacksQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\u0018\u0000  2\b\u0012\u0004\u0012\u00020\u00020\u0001:\t!\"#$%&'( B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u001a\u0010\b\u001a\u00020\u00072\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0096\u0002¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\u000e\u001a\u00020\rH\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\rH\u0016¢\u0006\u0004\b\u0010\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\rH\u0016¢\u0006\u0004\b\u0011\u0010\u000fJ'\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0015\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001f¨\u0006)"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery;", "Luqa;", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$Data;", "<init>", "()V", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "Companion", "Data", "OnboardingStarterPacks", "OnOnboardingStarterPacks", "StarterPack", "WriterConnection", "RecommendedPublisher", "OnUser", "OnPublication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class OnboardingStarterPacksQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "635edeba56bb4cc7bf3d36de7a5035ae73764f98ea1f9052dc25ddbfb519b6b8";
    public static final String OPERATION_NAME = "OnboardingStarterPacksQuery";

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnboardingStarterPacks;", "onboardingStarterPacks", "<init>", "(Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnboardingStarterPacks;)V", "component1", "()Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnboardingStarterPacks;", "copy", "(Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnboardingStarterPacks;)Lcom/medium/android/graphql/OnboardingStarterPacksQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnboardingStarterPacks;", "getOnboardingStarterPacks", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final OnboardingStarterPacks onboardingStarterPacks;

        public Data(OnboardingStarterPacks onboardingStarterPacks) {
            onboardingStarterPacks.getClass();
            this.onboardingStarterPacks = onboardingStarterPacks;
        }

        public static /* synthetic */ Data copy$default(Data data, OnboardingStarterPacks onboardingStarterPacks, int i, Object obj) {
            if ((i & 1) != 0) {
                onboardingStarterPacks = data.onboardingStarterPacks;
            }
            return data.copy(onboardingStarterPacks);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final OnboardingStarterPacks getOnboardingStarterPacks() {
            return this.onboardingStarterPacks;
        }

        public final Data copy(OnboardingStarterPacks onboardingStarterPacks) {
            onboardingStarterPacks.getClass();
            return new Data(onboardingStarterPacks);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.onboardingStarterPacks, ((Data) other).onboardingStarterPacks);
        }

        public final OnboardingStarterPacks getOnboardingStarterPacks() {
            return this.onboardingStarterPacks;
        }

        public final int hashCode() {
            return this.onboardingStarterPacks.hashCode();
        }

        public final String toString() {
            return "Data(onboardingStarterPacks=" + this.onboardingStarterPacks + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnOnboardingStarterPacks;", "", "starterPacks", "", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$StarterPack;", "<init>", "(Ljava/util/List;)V", "getStarterPacks", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnOnboardingStarterPacks {
        private final List<StarterPack> starterPacks;

        public OnOnboardingStarterPacks(List<StarterPack> list) {
            list.getClass();
            this.starterPacks = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnOnboardingStarterPacks copy$default(OnOnboardingStarterPacks onOnboardingStarterPacks, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onOnboardingStarterPacks.starterPacks;
            }
            return onOnboardingStarterPacks.copy(list);
        }

        public final List<StarterPack> component1() {
            return this.starterPacks;
        }

        public final OnOnboardingStarterPacks copy(List<StarterPack> starterPacks) {
            starterPacks.getClass();
            return new OnOnboardingStarterPacks(starterPacks);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnOnboardingStarterPacks) && g76.L(this.starterPacks, ((OnOnboardingStarterPacks) other).starterPacks);
        }

        public final List<StarterPack> getStarterPacks() {
            return this.starterPacks;
        }

        public final int hashCode() {
            return this.starterPacks.hashCode();
        }

        public final String toString() {
            return ka1.t("OnOnboardingStarterPacks(starterPacks=", ")", this.starterPacks);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnPublication;", "", "id", "", "<init>", "(Ljava/lang/String;)V", "getId", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublication {
        private final String id;

        public OnPublication(String str) {
            str.getClass();
            this.id = str;
        }

        public static /* synthetic */ OnPublication copy$default(OnPublication onPublication, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPublication.id;
            }
            return onPublication.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnPublication copy(String id) {
            id.getClass();
            return new OnPublication(id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPublication) && g76.L(this.id, ((OnPublication) other).id);
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.id.hashCode();
        }

        public final String toString() {
            return ev6.x("OnPublication(id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnUser;", "", "id", "", "<init>", "(Ljava/lang/String;)V", "getId", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final String id;

        public OnUser(String str) {
            str.getClass();
            this.id = str;
        }

        public static /* synthetic */ OnUser copy$default(OnUser onUser, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUser.id;
            }
            return onUser.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnUser copy(String id) {
            id.getClass();
            return new OnUser(id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUser) && g76.L(this.id, ((OnUser) other).id);
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.id.hashCode();
        }

        public final String toString() {
            return ev6.x("OnUser(id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnboardingStarterPacks;", "", "__typename", "", "onOnboardingStarterPacks", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnOnboardingStarterPacks;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnOnboardingStarterPacks;)V", "get__typename", "()Ljava/lang/String;", "getOnOnboardingStarterPacks", "()Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnOnboardingStarterPacks;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnboardingStarterPacks {
        private final String __typename;
        private final OnOnboardingStarterPacks onOnboardingStarterPacks;

        public OnboardingStarterPacks(String str, OnOnboardingStarterPacks onOnboardingStarterPacks) {
            str.getClass();
            this.__typename = str;
            this.onOnboardingStarterPacks = onOnboardingStarterPacks;
        }

        public static /* synthetic */ OnboardingStarterPacks copy$default(OnboardingStarterPacks onboardingStarterPacks, String str, OnOnboardingStarterPacks onOnboardingStarterPacks, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onboardingStarterPacks.__typename;
            }
            if ((i & 2) != 0) {
                onOnboardingStarterPacks = onboardingStarterPacks.onOnboardingStarterPacks;
            }
            return onboardingStarterPacks.copy(str, onOnboardingStarterPacks);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnOnboardingStarterPacks getOnOnboardingStarterPacks() {
            return this.onOnboardingStarterPacks;
        }

        public final OnboardingStarterPacks copy(String __typename, OnOnboardingStarterPacks onOnboardingStarterPacks) {
            __typename.getClass();
            return new OnboardingStarterPacks(__typename, onOnboardingStarterPacks);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnboardingStarterPacks)) {
                return false;
            }
            OnboardingStarterPacks onboardingStarterPacks = (OnboardingStarterPacks) other;
            return g76.L(this.__typename, onboardingStarterPacks.__typename) && g76.L(this.onOnboardingStarterPacks, onboardingStarterPacks.onOnboardingStarterPacks);
        }

        public final OnOnboardingStarterPacks getOnOnboardingStarterPacks() {
            return this.onOnboardingStarterPacks;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnOnboardingStarterPacks onOnboardingStarterPacks = this.onOnboardingStarterPacks;
            return iHashCode + (onOnboardingStarterPacks == null ? 0 : onOnboardingStarterPacks.hashCode());
        }

        public final String toString() {
            return "OnboardingStarterPacks(__typename=" + this.__typename + ", onOnboardingStarterPacks=" + this.onOnboardingStarterPacks + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$RecommendedPublisher;", "", "__typename", "", "onUser", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnUser;", "onPublication", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnPublication;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnUser;Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnPublication;)V", "get__typename", "()Ljava/lang/String;", "getOnUser", "()Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnUser;", "getOnPublication", "()Lcom/medium/android/graphql/OnboardingStarterPacksQuery$OnPublication;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RecommendedPublisher {
        private final String __typename;
        private final OnPublication onPublication;
        private final OnUser onUser;

        public RecommendedPublisher(String str, OnUser onUser, OnPublication onPublication) {
            str.getClass();
            this.__typename = str;
            this.onUser = onUser;
            this.onPublication = onPublication;
        }

        public static /* synthetic */ RecommendedPublisher copy$default(RecommendedPublisher recommendedPublisher, String str, OnUser onUser, OnPublication onPublication, int i, Object obj) {
            if ((i & 1) != 0) {
                str = recommendedPublisher.__typename;
            }
            if ((i & 2) != 0) {
                onUser = recommendedPublisher.onUser;
            }
            if ((i & 4) != 0) {
                onPublication = recommendedPublisher.onPublication;
            }
            return recommendedPublisher.copy(str, onUser, onPublication);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUser getOnUser() {
            return this.onUser;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnPublication getOnPublication() {
            return this.onPublication;
        }

        public final RecommendedPublisher copy(String __typename, OnUser onUser, OnPublication onPublication) {
            __typename.getClass();
            return new RecommendedPublisher(__typename, onUser, onPublication);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RecommendedPublisher)) {
                return false;
            }
            RecommendedPublisher recommendedPublisher = (RecommendedPublisher) other;
            return g76.L(this.__typename, recommendedPublisher.__typename) && g76.L(this.onUser, recommendedPublisher.onUser) && g76.L(this.onPublication, recommendedPublisher.onPublication);
        }

        public final OnPublication getOnPublication() {
            return this.onPublication;
        }

        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnUser onUser = this.onUser;
            int iHashCode2 = (iHashCode + (onUser == null ? 0 : onUser.hashCode())) * 31;
            OnPublication onPublication = this.onPublication;
            return iHashCode2 + (onPublication != null ? onPublication.hashCode() : 0);
        }

        public final String toString() {
            return "RecommendedPublisher(__typename=" + this.__typename + ", onUser=" + this.onUser + ", onPublication=" + this.onPublication + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007\u0012\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\n0\u0007¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0003J\u000f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\n0\u0007HÆ\u0003JG\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\n0\u0007HÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000eR\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\t\u001a\b\u0012\u0004\u0012\u00020\n0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$StarterPack;", "", "__typename", "", "id", "categoryName", "writerConnections", "", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$WriterConnection;", "recommendedPublishers", "Lcom/medium/android/graphql/OnboardingStarterPacksQuery$RecommendedPublisher;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCategoryName", "getWriterConnections", "()Ljava/util/List;", "getRecommendedPublishers", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class StarterPack {
        private final String __typename;
        private final String categoryName;
        private final String id;
        private final List<RecommendedPublisher> recommendedPublishers;
        private final List<WriterConnection> writerConnections;

        public StarterPack(String str, String str2, String str3, List<WriterConnection> list, List<RecommendedPublisher> list2) {
            str.getClass();
            str2.getClass();
            str3.getClass();
            list.getClass();
            list2.getClass();
            this.__typename = str;
            this.id = str2;
            this.categoryName = str3;
            this.writerConnections = list;
            this.recommendedPublishers = list2;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ StarterPack copy$default(StarterPack starterPack, String str, String str2, String str3, List list, List list2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = starterPack.__typename;
            }
            if ((i & 2) != 0) {
                str2 = starterPack.id;
            }
            if ((i & 4) != 0) {
                str3 = starterPack.categoryName;
            }
            if ((i & 8) != 0) {
                list = starterPack.writerConnections;
            }
            if ((i & 16) != 0) {
                list2 = starterPack.recommendedPublishers;
            }
            List list3 = list2;
            String str4 = str3;
            return starterPack.copy(str, str2, str4, list, list3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getCategoryName() {
            return this.categoryName;
        }

        public final List<WriterConnection> component4() {
            return this.writerConnections;
        }

        public final List<RecommendedPublisher> component5() {
            return this.recommendedPublishers;
        }

        public final StarterPack copy(String __typename, String id, String categoryName, List<WriterConnection> writerConnections, List<RecommendedPublisher> recommendedPublishers) {
            __typename.getClass();
            id.getClass();
            categoryName.getClass();
            writerConnections.getClass();
            recommendedPublishers.getClass();
            return new StarterPack(__typename, id, categoryName, writerConnections, recommendedPublishers);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof StarterPack)) {
                return false;
            }
            StarterPack starterPack = (StarterPack) other;
            return g76.L(this.__typename, starterPack.__typename) && g76.L(this.id, starterPack.id) && g76.L(this.categoryName, starterPack.categoryName) && g76.L(this.writerConnections, starterPack.writerConnections) && g76.L(this.recommendedPublishers, starterPack.recommendedPublishers);
        }

        public final String getCategoryName() {
            return this.categoryName;
        }

        public final String getId() {
            return this.id;
        }

        public final List<RecommendedPublisher> getRecommendedPublishers() {
            return this.recommendedPublishers;
        }

        public final List<WriterConnection> getWriterConnections() {
            return this.writerConnections;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.recommendedPublishers.hashCode() + wgd.p(wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.categoryName), 31, this.writerConnections);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.categoryName;
            List<WriterConnection> list = this.writerConnections;
            List<RecommendedPublisher> list2 = this.recommendedPublishers;
            StringBuilder sbU = y30.u("StarterPack(__typename=", str, ", id=", str2, ", categoryName=");
            sbU.append(str3);
            sbU.append(", writerConnections=");
            sbU.append(list);
            sbU.append(", recommendedPublishers=");
            return b09.B(sbU, list2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$WriterConnection;", "", "__typename", "", "imageId", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getImageId", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class WriterConnection {
        private final String __typename;
        private final String id;
        private final String imageId;

        public WriterConnection(String str, String str2, String str3) {
            str.getClass();
            str3.getClass();
            this.__typename = str;
            this.imageId = str2;
            this.id = str3;
        }

        public static /* synthetic */ WriterConnection copy$default(WriterConnection writerConnection, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = writerConnection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = writerConnection.imageId;
            }
            if ((i & 4) != 0) {
                str3 = writerConnection.id;
            }
            return writerConnection.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final WriterConnection copy(String __typename, String imageId, String id) {
            __typename.getClass();
            id.getClass();
            return new WriterConnection(__typename, imageId, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof WriterConnection)) {
                return false;
            }
            WriterConnection writerConnection = (WriterConnection) other;
            return g76.L(this.__typename, writerConnection.__typename) && g76.L(this.imageId, writerConnection.imageId) && g76.L(this.id, writerConnection.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.imageId;
            return this.id.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.imageId;
            return ka1.v(y30.u("WriterConnection(__typename=", str, ", imageId=", str2, ", id="), this.id, ")");
        }
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(OnboardingStarterPacksQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query OnboardingStarterPacksQuery { onboardingStarterPacks { __typename ... on OnboardingStarterPacks { starterPacks { __typename id categoryName writerConnections { __typename imageId id } recommendedPublishers { __typename ... on User { id } ... on Publication { id } } } } } }";
    }

    public final boolean equals(Object other) {
        return other != null && other.getClass() == OnboardingStarterPacksQuery.class;
    }

    public final int hashCode() {
        return n1b.a.b(OnboardingStarterPacksQuery.class).hashCode();
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
        List<sx1> list = OnboardingStarterPacksQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPacksQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query OnboardingStarterPacksQuery { onboardingStarterPacks { __typename ... on OnboardingStarterPacks { starterPacks { __typename id categoryName writerConnections { __typename imageId id } recommendedPublishers { __typename ... on User { id } ... on Publication { id } } } } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
