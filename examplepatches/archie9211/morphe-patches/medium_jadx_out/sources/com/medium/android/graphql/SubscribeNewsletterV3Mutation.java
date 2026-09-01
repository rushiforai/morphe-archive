package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SubscribeNewsletterV3Mutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SubscribeNewsletterV3Mutation_VariablesAdapter;
import com.medium.android.graphql.selections.SubscribeNewsletterV3MutationSelections;
import com.medium.android.graphql.type.Mutation;
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
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\n\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002.-B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u000bJ\u0018\u0010\u001d\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ,\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\u000bJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00062\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\u000bR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010+\u001a\u0004\b,\u0010\u001e¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/SubscribeNewsletterV3Mutation;", "Lv78;", "Lcom/medium/android/graphql/SubscribeNewsletterV3Mutation$Data;", "", "newsletterV3Id", "Lzv8;", "", "shouldRecordConsent", "<init>", "(Ljava/lang/String;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "copy", "(Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/SubscribeNewsletterV3Mutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getNewsletterV3Id", "Lzv8;", "getShouldRecordConsent", "Companion", "Data", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SubscribeNewsletterV3Mutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d4cacfbf315e93d347d7ab646467d89e8e8a29ace611ee1cec0e3a3b2d72d142";
    public static final String OPERATION_NAME = "SubscribeNewsletterV3";
    private final String newsletterV3Id;
    private final zv8 shouldRecordConsent;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0012\u001a\u00020\u00022\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0012\u0010\u0013R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0014\u001a\u0004\b\u0015\u0010\u0007¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/SubscribeNewsletterV3Mutation$Data;", "Lu78;", "", "subscribeNewsletterV3", "<init>", "(Ljava/lang/Boolean;)V", "component1", "()Ljava/lang/Boolean;", "copy", "(Ljava/lang/Boolean;)Lcom/medium/android/graphql/SubscribeNewsletterV3Mutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/Boolean;", "getSubscribeNewsletterV3", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final Boolean subscribeNewsletterV3;

        public Data(Boolean bool) {
            this.subscribeNewsletterV3 = bool;
        }

        public static Data copy$default(Data data, Boolean bool, int i, Object obj) {
            if ((i & 1) != 0) {
                bool = data.subscribeNewsletterV3;
            }
            data.getClass();
            return new Data(bool);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Boolean getSubscribeNewsletterV3() {
            return this.subscribeNewsletterV3;
        }

        public final Data copy(Boolean subscribeNewsletterV3) {
            return new Data(subscribeNewsletterV3);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.subscribeNewsletterV3, ((Data) other).subscribeNewsletterV3);
        }

        public final Boolean getSubscribeNewsletterV3() {
            return this.subscribeNewsletterV3;
        }

        public final int hashCode() {
            Boolean bool = this.subscribeNewsletterV3;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "Data(subscribeNewsletterV3=" + this.subscribeNewsletterV3 + ")";
        }
    }

    public SubscribeNewsletterV3Mutation(String str, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.newsletterV3Id = str;
        this.shouldRecordConsent = zv8Var;
    }

    public static /* synthetic */ SubscribeNewsletterV3Mutation copy$default(SubscribeNewsletterV3Mutation subscribeNewsletterV3Mutation, String str, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = subscribeNewsletterV3Mutation.newsletterV3Id;
        }
        if ((i & 2) != 0) {
            zv8Var = subscribeNewsletterV3Mutation.shouldRecordConsent;
        }
        return subscribeNewsletterV3Mutation.copy(str, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SubscribeNewsletterV3Mutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getNewsletterV3Id() {
        return this.newsletterV3Id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getShouldRecordConsent() {
        return this.shouldRecordConsent;
    }

    public final SubscribeNewsletterV3Mutation copy(String newsletterV3Id, zv8 shouldRecordConsent) {
        newsletterV3Id.getClass();
        shouldRecordConsent.getClass();
        return new SubscribeNewsletterV3Mutation(newsletterV3Id, shouldRecordConsent);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SubscribeNewsletterV3($newsletterV3Id: ID!, $shouldRecordConsent: Boolean) { subscribeNewsletterV3(newsletterV3Id: $newsletterV3Id, shouldRecordConsent: $shouldRecordConsent) }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SubscribeNewsletterV3Mutation)) {
            return false;
        }
        SubscribeNewsletterV3Mutation subscribeNewsletterV3Mutation = (SubscribeNewsletterV3Mutation) other;
        return g76.L(this.newsletterV3Id, subscribeNewsletterV3Mutation.newsletterV3Id) && g76.L(this.shouldRecordConsent, subscribeNewsletterV3Mutation.shouldRecordConsent);
    }

    public final String getNewsletterV3Id() {
        return this.newsletterV3Id;
    }

    public final zv8 getShouldRecordConsent() {
        return this.shouldRecordConsent;
    }

    public final int hashCode() {
        return this.shouldRecordConsent.hashCode() + (this.newsletterV3Id.hashCode() * 31);
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
        List<sx1> list = SubscribeNewsletterV3MutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SubscribeNewsletterV3Mutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SubscribeNewsletterV3Mutation(newsletterV3Id=" + this.newsletterV3Id + ", shouldRecordConsent=" + this.shouldRecordConsent + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SubscribeNewsletterV3Mutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SubscribeNewsletterV3($newsletterV3Id: ID!, $shouldRecordConsent: Boolean) { subscribeNewsletterV3(newsletterV3Id: $newsletterV3Id, shouldRecordConsent: $shouldRecordConsent) }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ SubscribeNewsletterV3Mutation(String str, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var);
    }
}
