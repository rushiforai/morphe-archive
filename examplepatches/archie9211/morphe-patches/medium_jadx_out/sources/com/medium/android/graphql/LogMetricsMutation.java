package com.medium.android.graphql;

import com.medium.android.graphql.adapter.LogMetricsMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.LogMetricsMutation_VariablesAdapter;
import com.medium.android.graphql.selections.LogMetricsMutationSelections;
import com.medium.android.graphql.type.LogClientEventsInput;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003*+)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/LogMetricsMutation;", "Lv78;", "Lcom/medium/android/graphql/LogMetricsMutation$Data;", "Lcom/medium/android/graphql/type/LogClientEventsInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/LogClientEventsInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/LogClientEventsInput;", "copy", "(Lcom/medium/android/graphql/type/LogClientEventsInput;)Lcom/medium/android/graphql/LogMetricsMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/LogClientEventsInput;", "getInput", "Companion", "Data", "LogClientEvents", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class LogMetricsMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "6c44525cf15357b088436ba2889f07fcd129292995eaea56367ca2b70b46c6ad";
    public static final String OPERATION_NAME = "logMetricsMutation";
    private final LogClientEventsInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/LogMetricsMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/LogMetricsMutation$LogClientEvents;", "logClientEvents", "<init>", "(Lcom/medium/android/graphql/LogMetricsMutation$LogClientEvents;)V", "component1", "()Lcom/medium/android/graphql/LogMetricsMutation$LogClientEvents;", "copy", "(Lcom/medium/android/graphql/LogMetricsMutation$LogClientEvents;)Lcom/medium/android/graphql/LogMetricsMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/LogMetricsMutation$LogClientEvents;", "getLogClientEvents", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final LogClientEvents logClientEvents;

        public Data(LogClientEvents logClientEvents) {
            logClientEvents.getClass();
            this.logClientEvents = logClientEvents;
        }

        public static /* synthetic */ Data copy$default(Data data, LogClientEvents logClientEvents, int i, Object obj) {
            if ((i & 1) != 0) {
                logClientEvents = data.logClientEvents;
            }
            return data.copy(logClientEvents);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final LogClientEvents getLogClientEvents() {
            return this.logClientEvents;
        }

        public final Data copy(LogClientEvents logClientEvents) {
            logClientEvents.getClass();
            return new Data(logClientEvents);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.logClientEvents, ((Data) other).logClientEvents);
        }

        public final LogClientEvents getLogClientEvents() {
            return this.logClientEvents;
        }

        public final int hashCode() {
            return this.logClientEvents.hashCode();
        }

        public final String toString() {
            return "Data(logClientEvents=" + this.logClientEvents + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00052\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/LogMetricsMutation$LogClientEvents;", "", "__typename", "", "success", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getSuccess", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class LogClientEvents {
        private final String __typename;
        private final boolean success;

        public LogClientEvents(String str, boolean z) {
            str.getClass();
            this.__typename = str;
            this.success = z;
        }

        public static /* synthetic */ LogClientEvents copy$default(LogClientEvents logClientEvents, String str, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = logClientEvents.__typename;
            }
            if ((i & 2) != 0) {
                z = logClientEvents.success;
            }
            return logClientEvents.copy(str, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getSuccess() {
            return this.success;
        }

        public final LogClientEvents copy(String __typename, boolean success) {
            __typename.getClass();
            return new LogClientEvents(__typename, success);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof LogClientEvents)) {
                return false;
            }
            LogClientEvents logClientEvents = (LogClientEvents) other;
            return g76.L(this.__typename, logClientEvents.__typename) && this.success == logClientEvents.success;
        }

        public final boolean getSuccess() {
            return this.success;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + (this.success ? 1231 : 1237);
        }

        public final String toString() {
            return km4.z("LogClientEvents(__typename=", this.__typename, ", success=", ")", this.success);
        }
    }

    public LogMetricsMutation(LogClientEventsInput logClientEventsInput) {
        logClientEventsInput.getClass();
        this.input = logClientEventsInput;
    }

    public static /* synthetic */ LogMetricsMutation copy$default(LogMetricsMutation logMetricsMutation, LogClientEventsInput logClientEventsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            logClientEventsInput = logMetricsMutation.input;
        }
        return logMetricsMutation.copy(logClientEventsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(LogMetricsMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final LogClientEventsInput getInput() {
        return this.input;
    }

    public final LogMetricsMutation copy(LogClientEventsInput input) {
        input.getClass();
        return new LogMetricsMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation logMetricsMutation($input: LogClientEventsInput!) { logClientEvents(input: $input) { __typename success } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof LogMetricsMutation) && g76.L(this.input, ((LogMetricsMutation) other).input);
    }

    public final LogClientEventsInput getInput() {
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
        List<sx1> list = LogMetricsMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        LogMetricsMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "LogMetricsMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/LogMetricsMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation logMetricsMutation($input: LogClientEventsInput!) { logClientEvents(input: $input) { __typename success } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
