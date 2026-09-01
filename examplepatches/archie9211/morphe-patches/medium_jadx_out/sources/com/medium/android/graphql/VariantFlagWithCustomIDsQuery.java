package com.medium.android.graphql;

import com.medium.android.graphql.adapter.VariantFlagWithCustomIDsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.VariantFlagWithCustomIDsQuery_VariablesAdapter;
import com.medium.android.graphql.selections.VariantFlagWithCustomIDsQuerySelections;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.VariantFlagWithCID;
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
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\b*+,-./0)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u00061"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery;", "Luqa;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$Data;", "Lcom/medium/android/graphql/type/VariantFlagWithCID;", "input", "<init>", "(Lcom/medium/android/graphql/type/VariantFlagWithCID;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/VariantFlagWithCID;", "copy", "(Lcom/medium/android/graphql/type/VariantFlagWithCID;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/VariantFlagWithCID;", "getInput", "Companion", "Data", "VariantFlagWithCustomIDs", "OnVariantFlag", "ValueType", "OnVariantFlagBoolean", "OnVariantFlagNumber", "OnVariantFlagString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class VariantFlagWithCustomIDsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d794bc169ff0279e6eb73bde357fe26ae6e2fc20bf5f1029b8178936fe33f07b";
    public static final String OPERATION_NAME = "VariantFlagWithCustomIDsQuery";
    private final VariantFlagWithCID input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;", "variantFlagWithCustomIDs", "<init>", "(Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;)V", "component1", "()Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;", "copy", "(Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;", "getVariantFlagWithCustomIDs", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final VariantFlagWithCustomIDs variantFlagWithCustomIDs;

        public Data(VariantFlagWithCustomIDs variantFlagWithCustomIDs) {
            variantFlagWithCustomIDs.getClass();
            this.variantFlagWithCustomIDs = variantFlagWithCustomIDs;
        }

        public static /* synthetic */ Data copy$default(Data data, VariantFlagWithCustomIDs variantFlagWithCustomIDs, int i, Object obj) {
            if ((i & 1) != 0) {
                variantFlagWithCustomIDs = data.variantFlagWithCustomIDs;
            }
            return data.copy(variantFlagWithCustomIDs);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final VariantFlagWithCustomIDs getVariantFlagWithCustomIDs() {
            return this.variantFlagWithCustomIDs;
        }

        public final Data copy(VariantFlagWithCustomIDs variantFlagWithCustomIDs) {
            variantFlagWithCustomIDs.getClass();
            return new Data(variantFlagWithCustomIDs);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.variantFlagWithCustomIDs, ((Data) other).variantFlagWithCustomIDs);
        }

        public final VariantFlagWithCustomIDs getVariantFlagWithCustomIDs() {
            return this.variantFlagWithCustomIDs;
        }

        public final int hashCode() {
            return this.variantFlagWithCustomIDs.hashCode();
        }

        public final String toString() {
            return "Data(variantFlagWithCustomIDs=" + this.variantFlagWithCustomIDs + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlag;", "", "name", "", "valueType", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$ValueType;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$ValueType;)V", "getName", "()Ljava/lang/String;", "getValueType", "()Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$ValueType;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnVariantFlag {
        private final String name;
        private final ValueType valueType;

        public OnVariantFlag(String str, ValueType valueType) {
            str.getClass();
            valueType.getClass();
            this.name = str;
            this.valueType = valueType;
        }

        public static /* synthetic */ OnVariantFlag copy$default(OnVariantFlag onVariantFlag, String str, ValueType valueType, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onVariantFlag.name;
            }
            if ((i & 2) != 0) {
                valueType = onVariantFlag.valueType;
            }
            return onVariantFlag.copy(str, valueType);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ValueType getValueType() {
            return this.valueType;
        }

        public final OnVariantFlag copy(String name, ValueType valueType) {
            name.getClass();
            valueType.getClass();
            return new OnVariantFlag(name, valueType);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnVariantFlag)) {
                return false;
            }
            OnVariantFlag onVariantFlag = (OnVariantFlag) other;
            return g76.L(this.name, onVariantFlag.name) && g76.L(this.valueType, onVariantFlag.valueType);
        }

        public final String getName() {
            return this.name;
        }

        public final ValueType getValueType() {
            return this.valueType;
        }

        public final int hashCode() {
            return this.valueType.hashCode() + (this.name.hashCode() * 31);
        }

        public final String toString() {
            return "OnVariantFlag(name=" + this.name + ", valueType=" + this.valueType + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u00032\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagBoolean;", "", "booleanValue", "", "<init>", "(Z)V", "getBooleanValue", "()Z", "component1", "copy", "equals", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnVariantFlagBoolean {
        private final boolean booleanValue;

        public OnVariantFlagBoolean(boolean z) {
            this.booleanValue = z;
        }

        public static OnVariantFlagBoolean copy$default(OnVariantFlagBoolean onVariantFlagBoolean, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                z = onVariantFlagBoolean.booleanValue;
            }
            onVariantFlagBoolean.getClass();
            return new OnVariantFlagBoolean(z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final boolean getBooleanValue() {
            return this.booleanValue;
        }

        public final OnVariantFlagBoolean copy(boolean booleanValue) {
            return new OnVariantFlagBoolean(booleanValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnVariantFlagBoolean) && this.booleanValue == ((OnVariantFlagBoolean) other).booleanValue;
        }

        public final boolean getBooleanValue() {
            return this.booleanValue;
        }

        public final int hashCode() {
            return this.booleanValue ? 1231 : 1237;
        }

        public final String toString() {
            return b09.z("OnVariantFlagBoolean(booleanValue=", ")", this.booleanValue);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagNumber;", "", "numberValue", "", "<init>", "(D)V", "getNumberValue", "()D", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnVariantFlagNumber {
        private final double numberValue;

        public OnVariantFlagNumber(double d) {
            this.numberValue = d;
        }

        public static OnVariantFlagNumber copy$default(OnVariantFlagNumber onVariantFlagNumber, double d, int i, Object obj) {
            if ((i & 1) != 0) {
                d = onVariantFlagNumber.numberValue;
            }
            onVariantFlagNumber.getClass();
            return new OnVariantFlagNumber(d);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final double getNumberValue() {
            return this.numberValue;
        }

        public final OnVariantFlagNumber copy(double numberValue) {
            return new OnVariantFlagNumber(numberValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnVariantFlagNumber) && Double.compare(this.numberValue, ((OnVariantFlagNumber) other).numberValue) == 0;
        }

        public final double getNumberValue() {
            return this.numberValue;
        }

        public final int hashCode() {
            long jDoubleToLongBits = Double.doubleToLongBits(this.numberValue);
            return (int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32));
        }

        public final String toString() {
            return "OnVariantFlagNumber(numberValue=" + this.numberValue + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagString;", "", "stringValue", "", "<init>", "(Ljava/lang/String;)V", "getStringValue", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnVariantFlagString {
        private final String stringValue;

        public OnVariantFlagString(String str) {
            str.getClass();
            this.stringValue = str;
        }

        public static /* synthetic */ OnVariantFlagString copy$default(OnVariantFlagString onVariantFlagString, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onVariantFlagString.stringValue;
            }
            return onVariantFlagString.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getStringValue() {
            return this.stringValue;
        }

        public final OnVariantFlagString copy(String stringValue) {
            stringValue.getClass();
            return new OnVariantFlagString(stringValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnVariantFlagString) && g76.L(this.stringValue, ((OnVariantFlagString) other).stringValue);
        }

        public final String getStringValue() {
            return this.stringValue;
        }

        public final int hashCode() {
            return this.stringValue.hashCode();
        }

        public final String toString() {
            return ev6.x("OnVariantFlagString(stringValue=", this.stringValue, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$ValueType;", "", "__typename", "", "onVariantFlagBoolean", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagBoolean;", "onVariantFlagNumber", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagNumber;", "onVariantFlagString", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagString;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagBoolean;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagNumber;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagString;)V", "get__typename", "()Ljava/lang/String;", "getOnVariantFlagBoolean", "()Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagBoolean;", "getOnVariantFlagNumber", "()Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagNumber;", "getOnVariantFlagString", "()Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagString;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ValueType {
        private final String __typename;
        private final OnVariantFlagBoolean onVariantFlagBoolean;
        private final OnVariantFlagNumber onVariantFlagNumber;
        private final OnVariantFlagString onVariantFlagString;

        public ValueType(String str, OnVariantFlagBoolean onVariantFlagBoolean, OnVariantFlagNumber onVariantFlagNumber, OnVariantFlagString onVariantFlagString) {
            str.getClass();
            this.__typename = str;
            this.onVariantFlagBoolean = onVariantFlagBoolean;
            this.onVariantFlagNumber = onVariantFlagNumber;
            this.onVariantFlagString = onVariantFlagString;
        }

        public static /* synthetic */ ValueType copy$default(ValueType valueType, String str, OnVariantFlagBoolean onVariantFlagBoolean, OnVariantFlagNumber onVariantFlagNumber, OnVariantFlagString onVariantFlagString, int i, Object obj) {
            if ((i & 1) != 0) {
                str = valueType.__typename;
            }
            if ((i & 2) != 0) {
                onVariantFlagBoolean = valueType.onVariantFlagBoolean;
            }
            if ((i & 4) != 0) {
                onVariantFlagNumber = valueType.onVariantFlagNumber;
            }
            if ((i & 8) != 0) {
                onVariantFlagString = valueType.onVariantFlagString;
            }
            return valueType.copy(str, onVariantFlagBoolean, onVariantFlagNumber, onVariantFlagString);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnVariantFlagBoolean getOnVariantFlagBoolean() {
            return this.onVariantFlagBoolean;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnVariantFlagNumber getOnVariantFlagNumber() {
            return this.onVariantFlagNumber;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnVariantFlagString getOnVariantFlagString() {
            return this.onVariantFlagString;
        }

        public final ValueType copy(String __typename, OnVariantFlagBoolean onVariantFlagBoolean, OnVariantFlagNumber onVariantFlagNumber, OnVariantFlagString onVariantFlagString) {
            __typename.getClass();
            return new ValueType(__typename, onVariantFlagBoolean, onVariantFlagNumber, onVariantFlagString);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ValueType)) {
                return false;
            }
            ValueType valueType = (ValueType) other;
            return g76.L(this.__typename, valueType.__typename) && g76.L(this.onVariantFlagBoolean, valueType.onVariantFlagBoolean) && g76.L(this.onVariantFlagNumber, valueType.onVariantFlagNumber) && g76.L(this.onVariantFlagString, valueType.onVariantFlagString);
        }

        public final OnVariantFlagBoolean getOnVariantFlagBoolean() {
            return this.onVariantFlagBoolean;
        }

        public final OnVariantFlagNumber getOnVariantFlagNumber() {
            return this.onVariantFlagNumber;
        }

        public final OnVariantFlagString getOnVariantFlagString() {
            return this.onVariantFlagString;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnVariantFlagBoolean onVariantFlagBoolean = this.onVariantFlagBoolean;
            int iHashCode2 = (iHashCode + (onVariantFlagBoolean == null ? 0 : onVariantFlagBoolean.hashCode())) * 31;
            OnVariantFlagNumber onVariantFlagNumber = this.onVariantFlagNumber;
            int iHashCode3 = (iHashCode2 + (onVariantFlagNumber == null ? 0 : onVariantFlagNumber.hashCode())) * 31;
            OnVariantFlagString onVariantFlagString = this.onVariantFlagString;
            return iHashCode3 + (onVariantFlagString != null ? onVariantFlagString.hashCode() : 0);
        }

        public final String toString() {
            return "ValueType(__typename=" + this.__typename + ", onVariantFlagBoolean=" + this.onVariantFlagBoolean + ", onVariantFlagNumber=" + this.onVariantFlagNumber + ", onVariantFlagString=" + this.onVariantFlagString + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;", "", "__typename", "", "onVariantFlag", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlag;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlag;)V", "get__typename", "()Ljava/lang/String;", "getOnVariantFlag", "()Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlag;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class VariantFlagWithCustomIDs {
        private final String __typename;
        private final OnVariantFlag onVariantFlag;

        public VariantFlagWithCustomIDs(String str, OnVariantFlag onVariantFlag) {
            str.getClass();
            this.__typename = str;
            this.onVariantFlag = onVariantFlag;
        }

        public static /* synthetic */ VariantFlagWithCustomIDs copy$default(VariantFlagWithCustomIDs variantFlagWithCustomIDs, String str, OnVariantFlag onVariantFlag, int i, Object obj) {
            if ((i & 1) != 0) {
                str = variantFlagWithCustomIDs.__typename;
            }
            if ((i & 2) != 0) {
                onVariantFlag = variantFlagWithCustomIDs.onVariantFlag;
            }
            return variantFlagWithCustomIDs.copy(str, onVariantFlag);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnVariantFlag getOnVariantFlag() {
            return this.onVariantFlag;
        }

        public final VariantFlagWithCustomIDs copy(String __typename, OnVariantFlag onVariantFlag) {
            __typename.getClass();
            return new VariantFlagWithCustomIDs(__typename, onVariantFlag);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof VariantFlagWithCustomIDs)) {
                return false;
            }
            VariantFlagWithCustomIDs variantFlagWithCustomIDs = (VariantFlagWithCustomIDs) other;
            return g76.L(this.__typename, variantFlagWithCustomIDs.__typename) && g76.L(this.onVariantFlag, variantFlagWithCustomIDs.onVariantFlag);
        }

        public final OnVariantFlag getOnVariantFlag() {
            return this.onVariantFlag;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnVariantFlag onVariantFlag = this.onVariantFlag;
            return iHashCode + (onVariantFlag == null ? 0 : onVariantFlag.hashCode());
        }

        public final String toString() {
            return "VariantFlagWithCustomIDs(__typename=" + this.__typename + ", onVariantFlag=" + this.onVariantFlag + ")";
        }
    }

    public VariantFlagWithCustomIDsQuery(VariantFlagWithCID variantFlagWithCID) {
        variantFlagWithCID.getClass();
        this.input = variantFlagWithCID;
    }

    public static /* synthetic */ VariantFlagWithCustomIDsQuery copy$default(VariantFlagWithCustomIDsQuery variantFlagWithCustomIDsQuery, VariantFlagWithCID variantFlagWithCID, int i, Object obj) {
        if ((i & 1) != 0) {
            variantFlagWithCID = variantFlagWithCustomIDsQuery.input;
        }
        return variantFlagWithCustomIDsQuery.copy(variantFlagWithCID);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(VariantFlagWithCustomIDsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final VariantFlagWithCID getInput() {
        return this.input;
    }

    public final VariantFlagWithCustomIDsQuery copy(VariantFlagWithCID input) {
        input.getClass();
        return new VariantFlagWithCustomIDsQuery(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query VariantFlagWithCustomIDsQuery($input: VariantFlagWithCID!) { variantFlagWithCustomIDs(input: $input) { __typename ... on VariantFlag { name valueType { __typename ... on VariantFlagBoolean { booleanValue: value } ... on VariantFlagNumber { numberValue: value } ... on VariantFlagString { stringValue: value } } } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof VariantFlagWithCustomIDsQuery) && g76.L(this.input, ((VariantFlagWithCustomIDsQuery) other).input);
    }

    public final VariantFlagWithCID getInput() {
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
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = VariantFlagWithCustomIDsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        VariantFlagWithCustomIDsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "VariantFlagWithCustomIDsQuery(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query VariantFlagWithCustomIDsQuery($input: VariantFlagWithCID!) { variantFlagWithCustomIDs(input: $input) { __typename ... on VariantFlag { name valueType { __typename ... on VariantFlagBoolean { booleanValue: value } ... on VariantFlagNumber { numberValue: value } ... on VariantFlagString { stringValue: value } } } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
