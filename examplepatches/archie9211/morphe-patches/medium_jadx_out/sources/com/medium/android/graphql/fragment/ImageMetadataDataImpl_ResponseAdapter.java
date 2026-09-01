package com.medium.android.graphql.fragment;

import defpackage.ae6;
import defpackage.c8;
import defpackage.d46;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.xl8;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0004B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/fragment/ImageMetadataDataImpl_ResponseAdapter;", "", "<init>", "()V", "ImageMetadataData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ImageMetadataDataImpl_ResponseAdapter {
    public static final ImageMetadataDataImpl_ResponseAdapter INSTANCE = new ImageMetadataDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ImageMetadataDataImpl_ResponseAdapter$ImageMetadataData;", "Lc8;", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ImageMetadataData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ImageMetadataData implements c8 {
        public static final ImageMetadataData INSTANCE = new ImageMetadataData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "originalWidth", "originalHeight", "focusPercentX", "focusPercentY", "alt");

        private ImageMetadataData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.ImageMetadataData fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            Integer num = null;
            Integer num2 = null;
            Double d = null;
            Double d2 = null;
            String str = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    case 2:
                        num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        num2 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        d = (Double) k8.h.fromJson(reader, customScalarAdapters);
                        break;
                    case 5:
                        d2 = (Double) k8.h.fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    default:
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 != null) {
                            return new com.medium.android.graphql.fragment.ImageMetadataData(strQ, strQ2, num, num2, d, d2, str);
                        }
                        kng.L(reader, "id");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.ImageMetadataData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("originalWidth");
            xl8 xl8Var = k8.i;
            xl8Var.toJson(writer, customScalarAdapters, value.getOriginalWidth());
            writer.t0("originalHeight");
            xl8Var.toJson(writer, customScalarAdapters, value.getOriginalHeight());
            writer.t0("focusPercentX");
            xl8 xl8Var2 = k8.h;
            xl8Var2.toJson(writer, customScalarAdapters, value.getFocusPercentX());
            writer.t0("focusPercentY");
            xl8Var2.toJson(writer, customScalarAdapters, value.getFocusPercentY());
            writer.t0("alt");
            k8.g.toJson(writer, customScalarAdapters, value.getAlt());
        }
    }

    private ImageMetadataDataImpl_ResponseAdapter() {
    }
}
