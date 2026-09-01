package com.medium.android.graphql.fragment;

import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.graphql.type.MembershipTier;
import com.medium.android.graphql.type.adapter.MembershipTier_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dq1;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0004B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/fragment/MembershipFragmentImpl_ResponseAdapter;", "", "<init>", "()V", "MembershipFragment", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MembershipFragmentImpl_ResponseAdapter {
    public static final MembershipFragmentImpl_ResponseAdapter INSTANCE = new MembershipFragmentImpl_ResponseAdapter();

    private MembershipFragmentImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/MembershipFragmentImpl_ResponseAdapter$MembershipFragment;", "Lc8;", "Lcom/medium/android/graphql/fragment/MembershipFragment;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/MembershipFragment;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/MembershipFragment;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MembershipFragment implements c8 {
        public static final MembershipFragment INSTANCE = new MembershipFragment();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "tier", "memberSince", "friendSince");

        private MembershipFragment() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.MembershipFragment fromJson(fd6 reader, yl2 customScalarAdapters) {
            Long l;
            reader.getClass();
            customScalarAdapters.getClass();
            Long lValueOf = null;
            String strQ = null;
            MembershipTier membershipTierFromJson = null;
            Long lValueOf2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    l = lValueOf;
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    l = lValueOf;
                    membershipTierFromJson = MembershipTier_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    fa4 fa4Var2 = k8.a;
                    lValueOf = Long.valueOf(reader.nextLong());
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    l = lValueOf;
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf2 = null;
                    } else {
                        lValueOf2 = Long.valueOf(reader.nextLong());
                    }
                }
                lValueOf = l;
            }
            Long l2 = lValueOf;
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (membershipTierFromJson == null) {
                kng.L(reader, "tier");
                throw null;
            }
            if (l2 != null) {
                return new com.medium.android.graphql.fragment.MembershipFragment(strQ, membershipTierFromJson, l2.longValue(), lValueOf2);
            }
            kng.L(reader, "memberSince");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.MembershipFragment value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("tier");
            MembershipTier_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getTier());
            writer.t0("memberSince");
            dq1 dq1Var = k8.d;
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getMemberSince()));
            writer.t0(KLTXZbnQvj.ERJNbbqlPv);
            Long friendSince = value.getFriendSince();
            if (friendSince == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, friendSince);
            }
        }
    }
}
