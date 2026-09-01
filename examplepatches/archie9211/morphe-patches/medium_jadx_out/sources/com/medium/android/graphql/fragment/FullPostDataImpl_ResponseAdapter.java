package com.medium.android.graphql.fragment;

import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.fragment.LinkMetadataListImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostBodyDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostFeaturingStatusDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostFooterCountDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostMetaDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostPromotionBannerDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostRepostCountDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostRepostStateDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.TagNoViewerEdgeDataImpl_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.xl8;
import defpackage.yl2;
import defpackage.zm7;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001:\u0006\u0004\u0005\u0006\u0007\b\tB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl_ResponseAdapter;", "", "<init>", "()V", "FullPostData", "Tag", "Content", "BodyModel", "ShareKeyCreator", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FullPostDataImpl_ResponseAdapter {
    public static final FullPostDataImpl_ResponseAdapter INSTANCE = new FullPostDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl_ResponseAdapter$BodyModel;", "Lc8;", "Lcom/medium/android/graphql/fragment/FullPostData$BodyModel;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/FullPostData$BodyModel;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/FullPostData$BodyModel;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class BodyModel implements c8 {
        public static final BodyModel INSTANCE = new BodyModel();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private BodyModel() {
        }

        @Override // defpackage.c8
        public final FullPostData.BodyModel fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            PostBodyData postBodyDataFromJson = PostBodyDataImpl_ResponseAdapter.PostBodyData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new FullPostData.BodyModel(strQ, postBodyDataFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, FullPostData.BodyModel value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            PostBodyDataImpl_ResponseAdapter.PostBodyData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostBodyData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl_ResponseAdapter$Content;", "Lc8;", "Lcom/medium/android/graphql/fragment/FullPostData$Content;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/FullPostData$Content;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/FullPostData$Content;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Content implements c8 {
        public static final Content INSTANCE = new Content();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "bodyModel", "isLockedPreviewOnly", "validatedShareKey", "shareKeyCreator");

        private Content() {
        }

        @Override // defpackage.c8
        public final FullPostData.Content fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            FullPostData.BodyModel bodyModel = null;
            String str = null;
            FullPostData.ShareKeyCreator shareKeyCreator = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    bool = boolValueOf;
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    bool = boolValueOf;
                    bodyModel = (FullPostData.BodyModel) k8.c(BodyModel.INSTANCE, true).fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    fa4 fa4Var2 = k8.a;
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                } else if (iN0 == 3) {
                    bool = boolValueOf;
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 4) {
                        break;
                    }
                    bool = boolValueOf;
                    sv0 sv0VarC = k8.c(ShareKeyCreator.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    shareKeyCreator = (FullPostData.ShareKeyCreator) objFromJson;
                }
                boolValueOf = bool;
            }
            Boolean bool2 = boolValueOf;
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (bodyModel == null) {
                kng.L(reader, "bodyModel");
                throw null;
            }
            if (bool2 != null) {
                return new FullPostData.Content(strQ, bodyModel, bool2.booleanValue(), str, shareKeyCreator);
            }
            kng.L(reader, "isLockedPreviewOnly");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, FullPostData.Content value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("bodyModel");
            k8.c(BodyModel.INSTANCE, true).toJson(writer, customScalarAdapters, value.getBodyModel());
            writer.t0("isLockedPreviewOnly");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isLockedPreviewOnly()));
            writer.t0("validatedShareKey");
            k8.g.toJson(writer, customScalarAdapters, value.getValidatedShareKey());
            writer.t0("shareKeyCreator");
            sv0 sv0VarC = k8.c(ShareKeyCreator.INSTANCE, false);
            FullPostData.ShareKeyCreator shareKeyCreator = value.getShareKeyCreator();
            if (shareKeyCreator == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, shareKeyCreator);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl_ResponseAdapter$FullPostData;", "Lc8;", "Lcom/medium/android/graphql/fragment/FullPostData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/FullPostData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/FullPostData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class FullPostData implements c8 {
        public static final FullPostData INSTANCE = new FullPostData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "tags", "content", "id");

        private FullPostData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.FullPostData fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            ArrayList arrayListFromJson = null;
            FullPostData.Content content = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    zm7 zm7Var = new zm7(k8.c(Tag.INSTANCE, true));
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        arrayListFromJson = null;
                    } else {
                        arrayListFromJson = zm7Var.fromJson(reader, customScalarAdapters);
                    }
                } else if (iN0 == 2) {
                    content = (FullPostData.Content) k8.c(Content.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            reader.j();
            PostMetaData postMetaDataFromJson = PostMetaDataImpl_ResponseAdapter.PostMetaData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            LinkMetadataList linkMetadataListFromJson = LinkMetadataListImpl_ResponseAdapter.LinkMetadataList.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            PostFooterCountData postFooterCountDataFromJson = PostFooterCountDataImpl_ResponseAdapter.PostFooterCountData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            PostFeaturingStatusData postFeaturingStatusDataFromJson = PostFeaturingStatusDataImpl_ResponseAdapter.PostFeaturingStatusData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            PostPromotionBannerData postPromotionBannerDataFromJson = PostPromotionBannerDataImpl_ResponseAdapter.PostPromotionBannerData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            PostRepostStateData postRepostStateDataFromJson = PostRepostStateDataImpl_ResponseAdapter.PostRepostStateData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            PostRepostCountData postRepostCountDataFromJson = PostRepostCountDataImpl_ResponseAdapter.PostRepostCountData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (content == null) {
                kng.L(reader, "content");
                throw null;
            }
            if (strQ2 != null) {
                return new com.medium.android.graphql.fragment.FullPostData(strQ, arrayListFromJson, content, strQ2, postMetaDataFromJson, linkMetadataListFromJson, postFooterCountDataFromJson, postFeaturingStatusDataFromJson, postPromotionBannerDataFromJson, postRepostStateDataFromJson, postRepostCountDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.FullPostData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("tags");
            zm7 zm7Var = new zm7(k8.c(Tag.INSTANCE, true));
            List<FullPostData.Tag> tags = value.getTags();
            if (tags == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, tags);
            }
            writer.t0("content");
            k8.c(Content.INSTANCE, false).toJson(writer, customScalarAdapters, value.getContent());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            PostMetaDataImpl_ResponseAdapter.PostMetaData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostMetaData());
            LinkMetadataListImpl_ResponseAdapter.LinkMetadataList.INSTANCE.toJson(writer, customScalarAdapters, value.getLinkMetadataList());
            PostFooterCountDataImpl_ResponseAdapter.PostFooterCountData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostFooterCountData());
            PostFeaturingStatusDataImpl_ResponseAdapter.PostFeaturingStatusData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostFeaturingStatusData());
            PostPromotionBannerDataImpl_ResponseAdapter.PostPromotionBannerData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostPromotionBannerData());
            PostRepostStateDataImpl_ResponseAdapter.PostRepostStateData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostRepostStateData());
            PostRepostCountDataImpl_ResponseAdapter.PostRepostCountData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostRepostCountData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl_ResponseAdapter$ShareKeyCreator;", "Lc8;", "Lcom/medium/android/graphql/fragment/FullPostData$ShareKeyCreator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/FullPostData$ShareKeyCreator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/FullPostData$ShareKeyCreator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ShareKeyCreator implements c8 {
        public static final ShareKeyCreator INSTANCE = new ShareKeyCreator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "username", fiHTiFJ.oHL);

        private ShareKeyCreator() {
        }

        @Override // defpackage.c8
        public final FullPostData.ShareKeyCreator fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
            FullPostData.ViewerEdge viewerEdge = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else if (iN0 == 2) {
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 3) {
                    str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 4) {
                        break;
                    }
                    viewerEdge = (FullPostData.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (viewerEdge != null) {
                return new FullPostData.ShareKeyCreator(strQ, strQ2, str, str2, viewerEdge);
            }
            kng.L(reader, "viewerEdge");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, FullPostData.ShareKeyCreator value) {
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
            writer.t0("username");
            xl8Var.toJson(writer, customScalarAdapters, value.getUsername());
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/fragment/FullPostData$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/FullPostData$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/FullPostData$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "isUser");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final FullPostData.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            Boolean boolValueOf = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (boolValueOf != null) {
                return new FullPostData.ViewerEdge(strQ, strQ2, boolValueOf.booleanValue());
            }
            kng.L(reader, "isUser");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, FullPostData.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("isUser");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isUser()));
        }
    }

    private FullPostDataImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl_ResponseAdapter$Tag;", "Lc8;", "Lcom/medium/android/graphql/fragment/FullPostData$Tag;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/FullPostData$Tag;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/FullPostData$Tag;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Tag implements c8 {
        public static final Tag INSTANCE = new Tag();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "normalizedTagSlug");

        private Tag() {
        }

        @Override // defpackage.c8
        public final FullPostData.Tag fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            TagNoViewerEdgeData tagNoViewerEdgeDataFromJson = TagNoViewerEdgeDataImpl_ResponseAdapter.TagNoViewerEdgeData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new FullPostData.Tag(strQ, strQ2, tagNoViewerEdgeDataFromJson);
            }
            kng.L(reader, "normalizedTagSlug");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, FullPostData.Tag value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0(DtuT.fXnKL);
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("normalizedTagSlug");
            fa4Var.toJson(writer, customScalarAdapters, value.getNormalizedTagSlug());
            TagNoViewerEdgeDataImpl_ResponseAdapter.TagNoViewerEdgeData.INSTANCE.toJson(writer, customScalarAdapters, value.getTagNoViewerEdgeData());
        }
    }
}
