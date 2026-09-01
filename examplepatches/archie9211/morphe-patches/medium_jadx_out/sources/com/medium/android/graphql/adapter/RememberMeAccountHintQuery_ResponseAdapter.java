package com.medium.android.graphql.adapter;

import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.graphql.RememberMeAccountHintQuery;
import com.medium.android.graphql.type.LoginMethod;
import com.medium.android.graphql.type.adapter.LoginMethod_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dm2;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.ygf;
import defpackage.yl2;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\b"}, d2 = {"Lcom/medium/android/graphql/adapter/RememberMeAccountHintQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "RememberMeAccountHint", "OnRememberMeAccountHint", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RememberMeAccountHintQuery_ResponseAdapter {
    public static final RememberMeAccountHintQuery_ResponseAdapter INSTANCE = new RememberMeAccountHintQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/RememberMeAccountHintQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/RememberMeAccountHintQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/RememberMeAccountHintQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("rememberMeAccountHint");

        private Data() {
        }

        @Override // defpackage.c8
        public final RememberMeAccountHintQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            RememberMeAccountHintQuery.RememberMeAccountHint rememberMeAccountHint = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(RememberMeAccountHint.INSTANCE, true);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                rememberMeAccountHint = (RememberMeAccountHintQuery.RememberMeAccountHint) objFromJson;
            }
            return new RememberMeAccountHintQuery.Data(rememberMeAccountHint);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, RememberMeAccountHintQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("rememberMeAccountHint");
            sv0 sv0VarC = k8.c(RememberMeAccountHint.INSTANCE, true);
            RememberMeAccountHintQuery.RememberMeAccountHint rememberMeAccountHint = value.getRememberMeAccountHint();
            if (rememberMeAccountHint == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, rememberMeAccountHint);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/RememberMeAccountHintQuery_ResponseAdapter$OnNotFound;", "Lc8;", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnNotFound;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnNotFound;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnNotFound;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnNotFound implements c8 {
        public static final OnNotFound INSTANCE = new OnNotFound();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnNotFound() {
        }

        @Override // defpackage.c8
        public final RememberMeAccountHintQuery.OnNotFound fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new RememberMeAccountHintQuery.OnNotFound(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, RememberMeAccountHintQuery.OnNotFound value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/RememberMeAccountHintQuery_ResponseAdapter$OnRememberMeAccountHint;", "Lc8;", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnRememberMeAccountHint;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnRememberMeAccountHint;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/RememberMeAccountHintQuery$OnRememberMeAccountHint;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnRememberMeAccountHint implements c8 {
        public static final OnRememberMeAccountHint INSTANCE = new OnRememberMeAccountHint();
        private static final List<String> RESPONSE_NAMES = d46.R("imageId", "loginMethod", "name", "obfuscatedEmail", "userId");

        private OnRememberMeAccountHint() {
        }

        @Override // defpackage.c8
        public final RememberMeAccountHintQuery.OnRememberMeAccountHint fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            LoginMethod loginMethodFromJson = null;
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 1) {
                    loginMethodFromJson = LoginMethod_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 3) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else {
                    if (iN0 != 4) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    strQ3 = reader.q();
                    strQ3.getClass();
                }
            }
            if (loginMethodFromJson == null) {
                kng.L(reader, "loginMethod");
                throw null;
            }
            if (strQ == null) {
                kng.L(reader, "name");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "obfuscatedEmail");
                throw null;
            }
            if (strQ3 != null) {
                return new RememberMeAccountHintQuery.OnRememberMeAccountHint(str, loginMethodFromJson, strQ, strQ2, strQ3);
            }
            kng.L(reader, "userId");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, RememberMeAccountHintQuery.OnRememberMeAccountHint value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("imageId");
            k8.g.toJson(writer, customScalarAdapters, value.getImageId());
            writer.t0("loginMethod");
            LoginMethod_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getLoginMethod());
            writer.t0("name");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("obfuscatedEmail");
            fa4Var.toJson(writer, customScalarAdapters, value.getObfuscatedEmail());
            writer.t0("userId");
            fa4Var.toJson(writer, customScalarAdapters, value.getUserId());
        }
    }

    private RememberMeAccountHintQuery_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/RememberMeAccountHintQuery_ResponseAdapter$RememberMeAccountHint;", "Lc8;", "Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/RememberMeAccountHintQuery$RememberMeAccountHint;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class RememberMeAccountHint implements c8 {
        public static final RememberMeAccountHint INSTANCE = new RememberMeAccountHint();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private RememberMeAccountHint() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, RememberMeAccountHintQuery.RememberMeAccountHint value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnRememberMeAccountHint() != null) {
                OnRememberMeAccountHint.INSTANCE.toJson(writer, customScalarAdapters, value.getOnRememberMeAccountHint());
            }
            if (value.getOnNotFound() != null) {
                OnNotFound.INSTANCE.toJson(writer, customScalarAdapters, value.getOnNotFound());
            }
        }

        @Override // defpackage.c8
        public final RememberMeAccountHintQuery.RememberMeAccountHint fromJson(fd6 reader, yl2 customScalarAdapters) {
            RememberMeAccountHintQuery.OnRememberMeAccountHint onRememberMeAccountHintFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            RememberMeAccountHintQuery.OnNotFound onNotFoundFromJson = null;
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            if (strQ != null) {
                if (dm2.B(dm2.Q("RememberMeAccountHint"), set2, strQ, set)) {
                    reader.j();
                    onRememberMeAccountHintFromJson = OnRememberMeAccountHint.INSTANCE.fromJson(reader, customScalarAdapters);
                } else {
                    onRememberMeAccountHintFromJson = null;
                }
                if (dm2.B(dm2.Q(MaAxRJinch.BqzRhj), set2, strQ, set)) {
                    reader.j();
                    onNotFoundFromJson = OnNotFound.INSTANCE.fromJson(reader, customScalarAdapters);
                }
                return new RememberMeAccountHintQuery.RememberMeAccountHint(strQ, onRememberMeAccountHintFromJson, onNotFoundFromJson);
            }
            ygf.f("__typename was not found");
            return null;
        }
    }
}
