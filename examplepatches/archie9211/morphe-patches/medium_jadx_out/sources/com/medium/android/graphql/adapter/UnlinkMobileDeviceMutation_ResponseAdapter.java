package com.medium.android.graphql.adapter;

import com.medium.android.graphql.UnlinkMobileDeviceMutation;
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
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\bÆ\u0002\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007"}, d2 = {"Lcom/medium/android/graphql/adapter/UnlinkMobileDeviceMutation_ResponseAdapter;", "", "<init>", "()V", "Data", "UnlinkMobileDevice", "OnMutationSuccess", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UnlinkMobileDeviceMutation_ResponseAdapter {
    public static final UnlinkMobileDeviceMutation_ResponseAdapter INSTANCE = new UnlinkMobileDeviceMutation_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/UnlinkMobileDeviceMutation_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q(UnlinkMobileDeviceMutation.OPERATION_NAME);

        private Data() {
        }

        @Override // defpackage.c8
        public final UnlinkMobileDeviceMutation.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            UnlinkMobileDeviceMutation.UnlinkMobileDevice unlinkMobileDevice = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                unlinkMobileDevice = (UnlinkMobileDeviceMutation.UnlinkMobileDevice) k8.c(UnlinkMobileDevice.INSTANCE, true).fromJson(reader, customScalarAdapters);
            }
            if (unlinkMobileDevice != null) {
                return new UnlinkMobileDeviceMutation.Data(unlinkMobileDevice);
            }
            kng.L(reader, UnlinkMobileDeviceMutation.OPERATION_NAME);
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, UnlinkMobileDeviceMutation.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0(UnlinkMobileDeviceMutation.OPERATION_NAME);
            k8.c(UnlinkMobileDevice.INSTANCE, true).toJson(writer, customScalarAdapters, value.getUnlinkMobileDevice());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/UnlinkMobileDeviceMutation_ResponseAdapter$OnMutationSuccess;", "Lc8;", "Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$OnMutationSuccess;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$OnMutationSuccess;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$OnMutationSuccess;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnMutationSuccess implements c8 {
        public static final OnMutationSuccess INSTANCE = new OnMutationSuccess();
        private static final List<String> RESPONSE_NAMES = d46.Q("success");

        private OnMutationSuccess() {
        }

        @Override // defpackage.c8
        public final UnlinkMobileDeviceMutation.OnMutationSuccess fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                boolValueOf = Boolean.valueOf(reader.nextBoolean());
            }
            if (boolValueOf != null) {
                return new UnlinkMobileDeviceMutation.OnMutationSuccess(boolValueOf.booleanValue());
            }
            kng.L(reader, "success");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, UnlinkMobileDeviceMutation.OnMutationSuccess value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("success");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getSuccess()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/UnlinkMobileDeviceMutation_ResponseAdapter$UnlinkMobileDevice;", "Lc8;", "Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$UnlinkMobileDevice;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$UnlinkMobileDevice;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/UnlinkMobileDeviceMutation$UnlinkMobileDevice;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class UnlinkMobileDevice implements c8 {
        public static final UnlinkMobileDevice INSTANCE = new UnlinkMobileDevice();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private UnlinkMobileDevice() {
        }

        @Override // defpackage.c8
        public final UnlinkMobileDeviceMutation.UnlinkMobileDevice fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            UnlinkMobileDeviceMutation.OnMutationSuccess onMutationSuccessFromJson = null;
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
            if (dm2.B(dm2.Q("MutationSuccess"), customScalarAdapters.a, strQ, customScalarAdapters.b)) {
                reader.j();
                onMutationSuccessFromJson = OnMutationSuccess.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new UnlinkMobileDeviceMutation.UnlinkMobileDevice(strQ, onMutationSuccessFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, UnlinkMobileDeviceMutation.UnlinkMobileDevice value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnMutationSuccess() != null) {
                OnMutationSuccess.INSTANCE.toJson(writer, customScalarAdapters, value.getOnMutationSuccess());
            }
        }
    }

    private UnlinkMobileDeviceMutation_ResponseAdapter() {
    }
}
