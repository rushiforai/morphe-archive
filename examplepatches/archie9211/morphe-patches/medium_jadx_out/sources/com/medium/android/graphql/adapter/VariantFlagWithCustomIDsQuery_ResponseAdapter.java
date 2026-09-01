package com.medium.android.graphql.adapter;

import com.medium.android.graphql.VariantFlagWithCustomIDsQuery;
import defpackage.ae6;
import defpackage.c8;
import defpackage.d46;
import defpackage.dm2;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.ygf;
import defpackage.yl2;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001:\u0007\u0004\u0005\u0006\u0007\b\t\nB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u000b"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "VariantFlagWithCustomIDs", "OnVariantFlag", "ValueType", "OnVariantFlagBoolean", "OnVariantFlagNumber", "OnVariantFlagString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class VariantFlagWithCustomIDsQuery_ResponseAdapter {
    public static final VariantFlagWithCustomIDsQuery_ResponseAdapter INSTANCE = new VariantFlagWithCustomIDsQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("variantFlagWithCustomIDs");

        private Data() {
        }

        @Override // defpackage.c8
        public final VariantFlagWithCustomIDsQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            VariantFlagWithCustomIDsQuery.VariantFlagWithCustomIDs variantFlagWithCustomIDs = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                variantFlagWithCustomIDs = (VariantFlagWithCustomIDsQuery.VariantFlagWithCustomIDs) k8.c(VariantFlagWithCustomIDs.INSTANCE, true).fromJson(reader, customScalarAdapters);
            }
            if (variantFlagWithCustomIDs != null) {
                return new VariantFlagWithCustomIDsQuery.Data(variantFlagWithCustomIDs);
            }
            kng.L(reader, "variantFlagWithCustomIDs");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, VariantFlagWithCustomIDsQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("variantFlagWithCustomIDs");
            k8.c(VariantFlagWithCustomIDs.INSTANCE, true).toJson(writer, customScalarAdapters, value.getVariantFlagWithCustomIDs());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter$OnVariantFlag;", "Lc8;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlag;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlag;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlag;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnVariantFlag implements c8 {
        public static final OnVariantFlag INSTANCE = new OnVariantFlag();
        private static final List<String> RESPONSE_NAMES = d46.R("name", "valueType");

        private OnVariantFlag() {
        }

        @Override // defpackage.c8
        public final VariantFlagWithCustomIDsQuery.OnVariantFlag fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            VariantFlagWithCustomIDsQuery.ValueType valueType = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    valueType = (VariantFlagWithCustomIDsQuery.ValueType) k8.c(ValueType.INSTANCE, true).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "name");
                throw null;
            }
            if (valueType != null) {
                return new VariantFlagWithCustomIDsQuery.OnVariantFlag(strQ, valueType);
            }
            kng.L(reader, "valueType");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, VariantFlagWithCustomIDsQuery.OnVariantFlag value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("name");
            k8.a.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("valueType");
            k8.c(ValueType.INSTANCE, true).toJson(writer, customScalarAdapters, value.getValueType());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter$OnVariantFlagBoolean;", "Lc8;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagBoolean;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagBoolean;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagBoolean;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnVariantFlagBoolean implements c8 {
        public static final OnVariantFlagBoolean INSTANCE = new OnVariantFlagBoolean();
        private static final List<String> RESPONSE_NAMES = d46.Q("booleanValue");

        private OnVariantFlagBoolean() {
        }

        @Override // defpackage.c8
        public final VariantFlagWithCustomIDsQuery.OnVariantFlagBoolean fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                boolValueOf = Boolean.valueOf(reader.nextBoolean());
            }
            if (boolValueOf != null) {
                return new VariantFlagWithCustomIDsQuery.OnVariantFlagBoolean(boolValueOf.booleanValue());
            }
            kng.L(reader, "booleanValue");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, VariantFlagWithCustomIDsQuery.OnVariantFlagBoolean value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("booleanValue");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getBooleanValue()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter$OnVariantFlagNumber;", "Lc8;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagNumber;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagNumber;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagNumber;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnVariantFlagNumber implements c8 {
        public static final OnVariantFlagNumber INSTANCE = new OnVariantFlagNumber();
        private static final List<String> RESPONSE_NAMES = d46.Q("numberValue");

        private OnVariantFlagNumber() {
        }

        @Override // defpackage.c8
        public final VariantFlagWithCustomIDsQuery.OnVariantFlagNumber fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            Double dValueOf = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                dValueOf = Double.valueOf(reader.nextDouble());
            }
            if (dValueOf != null) {
                return new VariantFlagWithCustomIDsQuery.OnVariantFlagNumber(dValueOf.doubleValue());
            }
            kng.L(reader, "numberValue");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, VariantFlagWithCustomIDsQuery.OnVariantFlagNumber value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("numberValue");
            k8.c.toJson(writer, customScalarAdapters, Double.valueOf(value.getNumberValue()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter$OnVariantFlagString;", "Lc8;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagString;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagString;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$OnVariantFlagString;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnVariantFlagString implements c8 {
        public static final OnVariantFlagString INSTANCE = new OnVariantFlagString();
        private static final List<String> RESPONSE_NAMES = d46.Q("stringValue");

        private OnVariantFlagString() {
        }

        @Override // defpackage.c8
        public final VariantFlagWithCustomIDsQuery.OnVariantFlagString fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            if (strQ != null) {
                return new VariantFlagWithCustomIDsQuery.OnVariantFlagString(strQ);
            }
            kng.L(reader, "stringValue");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, VariantFlagWithCustomIDsQuery.OnVariantFlagString value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("stringValue");
            k8.a.toJson(writer, customScalarAdapters, value.getStringValue());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter$ValueType;", "Lc8;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$ValueType;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$ValueType;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$ValueType;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ValueType implements c8 {
        public static final ValueType INSTANCE = new ValueType();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private ValueType() {
        }

        @Override // defpackage.c8
        public final VariantFlagWithCustomIDsQuery.ValueType fromJson(fd6 reader, yl2 customScalarAdapters) {
            VariantFlagWithCustomIDsQuery.OnVariantFlagBoolean onVariantFlagBooleanFromJson;
            VariantFlagWithCustomIDsQuery.OnVariantFlagNumber onVariantFlagNumberFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            VariantFlagWithCustomIDsQuery.OnVariantFlagString onVariantFlagStringFromJson = null;
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            if (strQ == null) {
                ygf.f("__typename was not found");
                return null;
            }
            if (dm2.B(dm2.Q("VariantFlagBoolean"), set2, strQ, set)) {
                reader.j();
                onVariantFlagBooleanFromJson = OnVariantFlagBoolean.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onVariantFlagBooleanFromJson = null;
            }
            if (dm2.B(dm2.Q("VariantFlagNumber"), set2, strQ, set)) {
                reader.j();
                onVariantFlagNumberFromJson = OnVariantFlagNumber.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onVariantFlagNumberFromJson = null;
            }
            if (dm2.B(dm2.Q("VariantFlagString"), set2, strQ, set)) {
                reader.j();
                onVariantFlagStringFromJson = OnVariantFlagString.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new VariantFlagWithCustomIDsQuery.ValueType(strQ, onVariantFlagBooleanFromJson, onVariantFlagNumberFromJson, onVariantFlagStringFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, VariantFlagWithCustomIDsQuery.ValueType value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnVariantFlagBoolean() != null) {
                OnVariantFlagBoolean.INSTANCE.toJson(writer, customScalarAdapters, value.getOnVariantFlagBoolean());
            }
            if (value.getOnVariantFlagNumber() != null) {
                OnVariantFlagNumber.INSTANCE.toJson(writer, customScalarAdapters, value.getOnVariantFlagNumber());
            }
            if (value.getOnVariantFlagString() != null) {
                OnVariantFlagString.INSTANCE.toJson(writer, customScalarAdapters, value.getOnVariantFlagString());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/VariantFlagWithCustomIDsQuery_ResponseAdapter$VariantFlagWithCustomIDs;", "Lc8;", "Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/VariantFlagWithCustomIDsQuery$VariantFlagWithCustomIDs;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class VariantFlagWithCustomIDs implements c8 {
        public static final VariantFlagWithCustomIDs INSTANCE = new VariantFlagWithCustomIDs();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private VariantFlagWithCustomIDs() {
        }

        @Override // defpackage.c8
        public final VariantFlagWithCustomIDsQuery.VariantFlagWithCustomIDs fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            VariantFlagWithCustomIDsQuery.OnVariantFlag onVariantFlagFromJson = null;
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            if (strQ == null) {
                ygf.f("__typename was not found");
                return null;
            }
            if (dm2.B(dm2.Q("VariantFlag"), customScalarAdapters.a, strQ, customScalarAdapters.b)) {
                reader.j();
                onVariantFlagFromJson = OnVariantFlag.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new VariantFlagWithCustomIDsQuery.VariantFlagWithCustomIDs(strQ, onVariantFlagFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, VariantFlagWithCustomIDsQuery.VariantFlagWithCustomIDs value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnVariantFlag() != null) {
                OnVariantFlag.INSTANCE.toJson(writer, customScalarAdapters, value.getOnVariantFlag());
            }
        }
    }

    private VariantFlagWithCustomIDsQuery_ResponseAdapter() {
    }
}
