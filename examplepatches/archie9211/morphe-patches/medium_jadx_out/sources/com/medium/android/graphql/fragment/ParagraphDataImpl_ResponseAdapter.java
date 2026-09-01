package com.medium.android.graphql.fragment;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.graphql.fragment.IframeDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ImageMetadataDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.MarkupDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.MixtapeMetadataDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.LayoutType;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.graphql.type.SyntaxHighlightMode;
import com.medium.android.graphql.type.adapter.LayoutType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.ParagraphType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.SyntaxHighlightMode_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.xl8;
import defpackage.yl2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@kotlin.Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001:\u0007\u0004\u0005\u0006\u0007\b\t\nB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u000b"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter;", "", "<init>", "()V", "ParagraphData", "Iframe", "Markup", "Metadata", "MixtapeMetadata", "DropCapImage", "CodeBlockMetadata", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ParagraphDataImpl_ResponseAdapter {
    public static final ParagraphDataImpl_ResponseAdapter INSTANCE = new ParagraphDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter$CodeBlockMetadata;", "Lc8;", "Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CodeBlockMetadata implements c8 {
        public static final CodeBlockMetadata INSTANCE = new CodeBlockMetadata();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "lang", "mode");

        private CodeBlockMetadata() {
        }

        @Override // defpackage.c8
        public final ParagraphData.CodeBlockMetadata fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String str = null;
            SyntaxHighlightMode syntaxHighlightModeFromJson = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    syntaxHighlightModeFromJson = SyntaxHighlightMode_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (syntaxHighlightModeFromJson != null) {
                return new ParagraphData.CodeBlockMetadata(strQ, str, syntaxHighlightModeFromJson);
            }
            kng.L(reader, "mode");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, ParagraphData.CodeBlockMetadata value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("lang");
            k8.g.toJson(writer, customScalarAdapters, value.getLang());
            writer.t0("mode");
            SyntaxHighlightMode_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getMode());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter$DropCapImage;", "Lc8;", "Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class DropCapImage implements c8 {
        public static final DropCapImage INSTANCE = new DropCapImage();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private DropCapImage() {
        }

        @Override // defpackage.c8
        public final ParagraphData.DropCapImage fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
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
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            reader.j();
            ImageMetadataData imageMetadataDataFromJson = ImageMetadataDataImpl_ResponseAdapter.ImageMetadataData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new ParagraphData.DropCapImage(strQ, strQ2, imageMetadataDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, ParagraphData.DropCapImage value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            ImageMetadataDataImpl_ResponseAdapter.ImageMetadataData.INSTANCE.toJson(writer, customScalarAdapters, value.getImageMetadataData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter$Iframe;", "Lc8;", "Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Iframe implements c8 {
        public static final Iframe INSTANCE = new Iframe();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private Iframe() {
        }

        @Override // defpackage.c8
        public final ParagraphData.Iframe fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            IframeData iframeDataFromJson = IframeDataImpl_ResponseAdapter.IframeData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new ParagraphData.Iframe(strQ, iframeDataFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, ParagraphData.Iframe value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            IframeDataImpl_ResponseAdapter.IframeData.INSTANCE.toJson(writer, customScalarAdapters, value.getIframeData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter$Markup;", "Lc8;", "Lcom/medium/android/graphql/fragment/ParagraphData$Markup;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ParagraphData$Markup;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ParagraphData$Markup;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Markup implements c8 {
        public static final Markup INSTANCE = new Markup();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private Markup() {
        }

        @Override // defpackage.c8
        public final ParagraphData.Markup fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            MarkupData markupDataFromJson = MarkupDataImpl_ResponseAdapter.MarkupData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new ParagraphData.Markup(strQ, markupDataFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, ParagraphData.Markup value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            MarkupDataImpl_ResponseAdapter.MarkupData.INSTANCE.toJson(writer, customScalarAdapters, value.getMarkupData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter$Metadata;", "Lc8;", "Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Metadata implements c8 {
        public static final Metadata INSTANCE = new Metadata();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private Metadata() {
        }

        @Override // defpackage.c8
        public final ParagraphData.Metadata fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
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
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            reader.j();
            ImageMetadataData imageMetadataDataFromJson = ImageMetadataDataImpl_ResponseAdapter.ImageMetadataData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new ParagraphData.Metadata(strQ, strQ2, imageMetadataDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, ParagraphData.Metadata value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            ImageMetadataDataImpl_ResponseAdapter.ImageMetadataData.INSTANCE.toJson(writer, customScalarAdapters, value.getImageMetadataData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter$MixtapeMetadata;", "Lc8;", "Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MixtapeMetadata implements c8 {
        public static final MixtapeMetadata INSTANCE = new MixtapeMetadata();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private MixtapeMetadata() {
        }

        @Override // defpackage.c8
        public final ParagraphData.MixtapeMetadata fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            MixtapeMetadataData mixtapeMetadataDataFromJson = MixtapeMetadataDataImpl_ResponseAdapter.MixtapeMetadataData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new ParagraphData.MixtapeMetadata(strQ, mixtapeMetadataDataFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, ParagraphData.MixtapeMetadata value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            MixtapeMetadataDataImpl_ResponseAdapter.MixtapeMetadataData.INSTANCE.toJson(writer, customScalarAdapters, value.getMixtapeMetadataData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphDataImpl_ResponseAdapter$ParagraphData;", "Lc8;", "Lcom/medium/android/graphql/fragment/ParagraphData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/ParagraphData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/ParagraphData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ParagraphData implements c8 {
        public static final ParagraphData INSTANCE = new ParagraphData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "href", "text", "iframe", "layout", "markups", "metadata", "mixtapeMetadata", "type", "hasDropCap", "dropCapImage", "codeBlockMetadata");

        private ParagraphData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.ParagraphData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            ParagraphData.CodeBlockMetadata codeBlockMetadata;
            String str;
            Object objFromJson2;
            Object objFromJson3;
            Object objFromJson4;
            Object objFromJson5;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str2 = null;
            String str3 = null;
            String str4 = null;
            ParagraphData.Iframe iframe = null;
            LayoutType layoutType = null;
            ArrayList arrayListE = null;
            ParagraphData.Metadata metadata = null;
            ParagraphData.MixtapeMetadata mixtapeMetadata = null;
            ParagraphType paragraphType = null;
            Boolean bool = null;
            ParagraphData.DropCapImage dropCapImage = null;
            ParagraphData.CodeBlockMetadata codeBlockMetadata2 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        codeBlockMetadata = codeBlockMetadata2;
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 2:
                        codeBlockMetadata = codeBlockMetadata2;
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 3:
                        codeBlockMetadata = codeBlockMetadata2;
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 4:
                        codeBlockMetadata = codeBlockMetadata2;
                        str4 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 5:
                        codeBlockMetadata = codeBlockMetadata2;
                        str = strQ;
                        sv0 sv0VarC = k8.c(Iframe.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        iframe = (ParagraphData.Iframe) objFromJson2;
                        strQ = str;
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 6:
                        codeBlockMetadata = codeBlockMetadata2;
                        layoutType = (LayoutType) k8.b(LayoutType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 7:
                        codeBlockMetadata = codeBlockMetadata2;
                        str = strQ;
                        sv0 sv0VarC2 = k8.c(Markup.INSTANCE, true);
                        arrayListE = ev6.E(reader);
                        while (reader.hasNext()) {
                            try {
                                arrayListE.add(sv0VarC2.fromJson(reader, customScalarAdapters));
                            } catch (ApolloGraphQLException e) {
                                while (reader.hasNext()) {
                                    reader.v();
                                }
                                reader.k();
                                throw e;
                            }
                            break;
                        }
                        reader.k();
                        strQ = str;
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 8:
                        codeBlockMetadata = codeBlockMetadata2;
                        str = strQ;
                        sv0 sv0VarC3 = k8.c(Metadata.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson3 = null;
                        } else {
                            objFromJson3 = sv0VarC3.fromJson(reader, customScalarAdapters);
                        }
                        metadata = (ParagraphData.Metadata) objFromJson3;
                        strQ = str;
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 9:
                        codeBlockMetadata = codeBlockMetadata2;
                        str = strQ;
                        sv0 sv0VarC4 = k8.c(MixtapeMetadata.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson4 = null;
                        } else {
                            objFromJson4 = sv0VarC4.fromJson(reader, customScalarAdapters);
                        }
                        mixtapeMetadata = (ParagraphData.MixtapeMetadata) objFromJson4;
                        strQ = str;
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 10:
                        codeBlockMetadata = codeBlockMetadata2;
                        paragraphType = (ParagraphType) k8.b(ParagraphType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 11:
                        codeBlockMetadata = codeBlockMetadata2;
                        bool = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 12:
                        ParagraphData.CodeBlockMetadata codeBlockMetadata3 = codeBlockMetadata2;
                        str = strQ;
                        sv0 sv0VarC5 = k8.c(DropCapImage.INSTANCE, true);
                        codeBlockMetadata = codeBlockMetadata3;
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson5 = null;
                        } else {
                            objFromJson5 = sv0VarC5.fromJson(reader, customScalarAdapters);
                        }
                        dropCapImage = (ParagraphData.DropCapImage) objFromJson5;
                        strQ = str;
                        codeBlockMetadata2 = codeBlockMetadata;
                        break;
                    case 13:
                        sv0 sv0VarC6 = k8.c(CodeBlockMetadata.INSTANCE, false);
                        String str5 = strQ;
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC6.fromJson(reader, customScalarAdapters);
                        }
                        strQ = str5;
                        codeBlockMetadata2 = (ParagraphData.CodeBlockMetadata) objFromJson;
                        break;
                    default:
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (arrayListE != null) {
                            return new com.medium.android.graphql.fragment.ParagraphData(strQ, strQ2, str2, str3, str4, iframe, layoutType, arrayListE, metadata, mixtapeMetadata, paragraphType, bool, dropCapImage, codeBlockMetadata2);
                        }
                        kng.L(reader, "markups");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.ParagraphData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("href");
            xl8Var.toJson(writer, customScalarAdapters, value.getHref());
            writer.t0("text");
            xl8Var.toJson(writer, customScalarAdapters, value.getText());
            writer.t0("iframe");
            sv0 sv0VarC = k8.c(Iframe.INSTANCE, true);
            ParagraphData.Iframe iframe = value.getIframe();
            if (iframe == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, iframe);
            }
            writer.t0("layout");
            k8.b(LayoutType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getLayout());
            writer.t0("markups");
            sv0 sv0VarC2 = k8.c(Markup.INSTANCE, true);
            List<ParagraphData.Markup> markups = value.getMarkups();
            markups.getClass();
            writer.n();
            Iterator<T> it2 = markups.iterator();
            while (it2.hasNext()) {
                sv0VarC2.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
            writer.t0("metadata");
            sv0 sv0VarC3 = k8.c(Metadata.INSTANCE, true);
            ParagraphData.Metadata metadata = value.getMetadata();
            if (metadata == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, metadata);
            }
            writer.t0("mixtapeMetadata");
            sv0 sv0VarC4 = k8.c(MixtapeMetadata.INSTANCE, true);
            ParagraphData.MixtapeMetadata mixtapeMetadata = value.getMixtapeMetadata();
            if (mixtapeMetadata == null) {
                writer.s0();
            } else {
                sv0VarC4.toJson(writer, customScalarAdapters, mixtapeMetadata);
            }
            writer.t0("type");
            k8.b(ParagraphType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getType());
            writer.t0("hasDropCap");
            k8.j.toJson(writer, customScalarAdapters, value.getHasDropCap());
            writer.t0("dropCapImage");
            sv0 sv0VarC5 = k8.c(DropCapImage.INSTANCE, true);
            ParagraphData.DropCapImage dropCapImage = value.getDropCapImage();
            if (dropCapImage == null) {
                writer.s0();
            } else {
                sv0VarC5.toJson(writer, customScalarAdapters, dropCapImage);
            }
            writer.t0("codeBlockMetadata");
            sv0 sv0VarC6 = k8.c(CodeBlockMetadata.INSTANCE, false);
            ParagraphData.CodeBlockMetadata codeBlockMetadata = value.getCodeBlockMetadata();
            if (codeBlockMetadata == null) {
                writer.s0();
            } else {
                sv0VarC6.toJson(writer, customScalarAdapters, codeBlockMetadata);
            }
        }
    }

    private ParagraphDataImpl_ResponseAdapter() {
    }
}
