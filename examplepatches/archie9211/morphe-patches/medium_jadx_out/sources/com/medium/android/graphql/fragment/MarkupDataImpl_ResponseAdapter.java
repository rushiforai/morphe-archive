package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.AnchorType;
import com.medium.android.graphql.type.MarkupType;
import com.medium.android.graphql.type.adapter.AnchorType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.MarkupType_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.uob;
import defpackage.xl8;
import defpackage.yl2;
import defpackage.zm7;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0004B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/fragment/MarkupDataImpl_ResponseAdapter;", "", "<init>", "()V", "MarkupData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MarkupDataImpl_ResponseAdapter {
    public static final MarkupDataImpl_ResponseAdapter INSTANCE = new MarkupDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/MarkupDataImpl_ResponseAdapter$MarkupData;", "Lc8;", "Lcom/medium/android/graphql/fragment/MarkupData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/MarkupData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/MarkupData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MarkupData implements c8 {
        public static final MarkupData INSTANCE = new MarkupData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "name", "type", "start", "end", "href", "title", "rel", "anchorType", "userId", "creatorIds");

        private MarkupData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.MarkupData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            Integer num;
            reader.getClass();
            customScalarAdapters.getClass();
            Integer numValueOf = null;
            String strQ = null;
            String str = null;
            MarkupType markupType = null;
            Integer numValueOf2 = null;
            String str2 = null;
            String str3 = null;
            String str4 = null;
            AnchorType anchorType = null;
            String str5 = null;
            List list = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        num = numValueOf;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        num = numValueOf;
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 2:
                        num = numValueOf;
                        markupType = (MarkupType) k8.b(MarkupType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        fa4 fa4Var2 = k8.a;
                        numValueOf = Integer.valueOf(reader.nextInt());
                        continue;
                    case 4:
                        num = numValueOf;
                        fa4 fa4Var3 = k8.a;
                        numValueOf2 = Integer.valueOf(reader.nextInt());
                        break;
                    case 5:
                        num = numValueOf;
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        num = numValueOf;
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 7:
                        num = numValueOf;
                        str4 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 8:
                        num = numValueOf;
                        anchorType = (AnchorType) k8.b(AnchorType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                        break;
                    case 9:
                        num = numValueOf;
                        str5 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 10:
                        Integer num2 = numValueOf;
                        Integer num3 = numValueOf2;
                        zm7 zm7VarA = k8.a(k8.g);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = zm7VarA.fromJson(reader, customScalarAdapters);
                        }
                        list = (List) objFromJson;
                        numValueOf = num2;
                        numValueOf2 = num3;
                        continue;
                    default:
                        Integer num4 = numValueOf;
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (num4 == null) {
                            kng.L(reader, "start");
                            throw null;
                        }
                        Integer num5 = numValueOf2;
                        int iIntValue = num4.intValue();
                        if (num5 != null) {
                            return new com.medium.android.graphql.fragment.MarkupData(strQ, str, markupType, iIntValue, num5.intValue(), str2, str3, str4, anchorType, str5, list);
                        }
                        kng.L(reader, "end");
                        throw null;
                }
                numValueOf = num;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.MarkupData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("name");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("type");
            k8.b(MarkupType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getType());
            writer.t0("start");
            uob uobVar = k8.b;
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getStart()));
            writer.t0("end");
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getEnd()));
            writer.t0("href");
            xl8Var.toJson(writer, customScalarAdapters, value.getHref());
            writer.t0("title");
            xl8Var.toJson(writer, customScalarAdapters, value.getTitle());
            writer.t0("rel");
            xl8Var.toJson(writer, customScalarAdapters, value.getRel());
            writer.t0("anchorType");
            k8.b(AnchorType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getAnchorType());
            writer.t0("userId");
            xl8Var.toJson(writer, customScalarAdapters, value.getUserId());
            writer.t0("creatorIds");
            zm7 zm7Var = new zm7(xl8Var);
            List<String> creatorIds = value.getCreatorIds();
            if (creatorIds == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, creatorIds);
            }
        }
    }

    private MarkupDataImpl_ResponseAdapter() {
    }
}
