package com.medium.android.graphql.fragment;

import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.android.graphql.fragment.CollectionFollowDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.CollectionMuteDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ImageMetadataDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostClapsDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostFeaturingStatusDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.fragment.PostRepostCountDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostShareDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostViewStateDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostVisibilityDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ResponseCountDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.UserFollowDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.UserMuteDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.UserNewsletterDataImpl_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dq1;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.xl8;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\f\bÆ\u0002\u0018\u00002\u00020\u0001:\t\u0004\u0005\u0006\u0007\b\t\n\u000b\fB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter;", "", "<init>", "()V", "PostPreviewData", "PreviewContent", "PreviewImage", "Collection", "Avatar", "ViewerEdge", "Creator", "ViewerEdge1", "Verifications", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostPreviewDataImpl_ResponseAdapter {
    public static final PostPreviewDataImpl_ResponseAdapter INSTANCE = new PostPreviewDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$Avatar;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$Avatar;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$Avatar;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$Avatar;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Avatar implements c8 {
        public static final Avatar INSTANCE = new Avatar();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private Avatar() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.Avatar fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new PostPreviewData.Avatar(strQ, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.Avatar value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$Collection;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Collection implements c8 {
        public static final Collection INSTANCE = new Collection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "avatar", "viewerEdge");

        private Collection() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.Collection fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            PostPreviewData.Avatar avatar = null;
            PostPreviewData.ViewerEdge viewerEdge = null;
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
                    sv0 sv0VarC = k8.c(Avatar.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    avatar = (PostPreviewData.Avatar) objFromJson;
                } else {
                    if (iN0 != 4) {
                        break;
                    }
                    viewerEdge = (PostPreviewData.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            reader.j();
            CollectionFollowData collectionFollowDataFromJson = CollectionFollowDataImpl_ResponseAdapter.CollectionFollowData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            CollectionMuteData collectionMuteDataFromJson = CollectionMuteDataImpl_ResponseAdapter.CollectionMuteData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (viewerEdge != null) {
                return new PostPreviewData.Collection(strQ, strQ2, str, avatar, viewerEdge, collectionFollowDataFromJson, collectionMuteDataFromJson);
            }
            kng.L(reader, "viewerEdge");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.Collection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            k8.g.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("avatar");
            sv0 sv0VarC = k8.c(Avatar.INSTANCE, false);
            PostPreviewData.Avatar avatar = value.getAvatar();
            if (avatar == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, avatar);
            }
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            CollectionFollowDataImpl_ResponseAdapter.CollectionFollowData.INSTANCE.toJson(writer, customScalarAdapters, value.getCollectionFollowData());
            CollectionMuteDataImpl_ResponseAdapter.CollectionMuteData.INSTANCE.toJson(writer, customScalarAdapters, value.getCollectionMuteData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "imageId", "viewerEdge", "verifications");

        private Creator() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
            PostPreviewData.ViewerEdge1 viewerEdge1 = null;
            PostPreviewData.Verifications verifications = null;
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
                } else if (iN0 == 4) {
                    viewerEdge1 = (PostPreviewData.ViewerEdge1) k8.c(ViewerEdge1.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 5) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Verifications.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    verifications = (PostPreviewData.Verifications) objFromJson;
                }
            }
            reader.j();
            UserFollowData userFollowDataFromJson = UserFollowDataImpl_ResponseAdapter.UserFollowData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            UserMuteData userMuteDataFromJson = UserMuteDataImpl_ResponseAdapter.UserMuteData.INSTANCE.fromJson(reader, customScalarAdapters);
            reader.j();
            UserNewsletterData userNewsletterDataFromJson = UserNewsletterDataImpl_ResponseAdapter.UserNewsletterData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (viewerEdge1 != null) {
                return new PostPreviewData.Creator(strQ, strQ2, str, str2, viewerEdge1, verifications, userFollowDataFromJson, userMuteDataFromJson, userNewsletterDataFromJson);
            }
            kng.L(reader, "viewerEdge");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.Creator value) {
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
            writer.t0("imageId");
            xl8Var.toJson(writer, customScalarAdapters, value.getImageId());
            writer.t0("viewerEdge");
            k8.c(ViewerEdge1.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("verifications");
            sv0 sv0VarC = k8.c(Verifications.INSTANCE, false);
            PostPreviewData.Verifications verifications = value.getVerifications();
            if (verifications == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, verifications);
            }
            UserFollowDataImpl_ResponseAdapter.UserFollowData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserFollowData());
            UserMuteDataImpl_ResponseAdapter.UserMuteData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserMuteData());
            UserNewsletterDataImpl_ResponseAdapter.UserNewsletterData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserNewsletterData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$PostPreviewData;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostPreviewData implements c8 {
        public static final PostPreviewData INSTANCE = new PostPreviewData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "title", "previewContent", "previewImage", "readingTime", "pinnedByCreatorAt", "firstPublishedAt", "updatedAt", "latestPublishedVersion", "collection", "creator");

        private PostPreviewData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.PostPreviewData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            Object objFromJson2;
            Object objFromJson3;
            Object objFromJson4;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            PostPreviewData.PreviewContent previewContent = null;
            PostPreviewData.PreviewImage previewImage = null;
            Double d = null;
            Long lValueOf = null;
            Long lValueOf2 = null;
            Long lValueOf3 = null;
            String strQ3 = null;
            PostPreviewData.Collection collection = null;
            PostPreviewData.Creator creator = null;
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
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        sv0 sv0VarC = k8.c(PreviewContent.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        previewContent = (PostPreviewData.PreviewContent) objFromJson2;
                        break;
                    case 4:
                        sv0 sv0VarC2 = k8.c(PreviewImage.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson3 = null;
                        } else {
                            objFromJson3 = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        previewImage = (PostPreviewData.PreviewImage) objFromJson3;
                        break;
                    case 5:
                        d = (Double) k8.h.fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        dq1 dq1Var = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf = null;
                        }
                        break;
                    case 7:
                        dq1 dq1Var2 = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf2 = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf2 = null;
                        }
                        break;
                    case 8:
                        dq1 dq1Var3 = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf3 = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf3 = null;
                        }
                        break;
                    case 9:
                        fa4 fa4Var3 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        break;
                    case 10:
                        sv0 sv0VarC3 = k8.c(Collection.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson4 = null;
                        } else {
                            objFromJson4 = sv0VarC3.fromJson(reader, customScalarAdapters);
                        }
                        collection = (PostPreviewData.Collection) objFromJson4;
                        break;
                    case 11:
                        sv0 sv0VarC4 = k8.c(Creator.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC4.fromJson(reader, customScalarAdapters);
                        }
                        creator = (PostPreviewData.Creator) objFromJson;
                        break;
                    default:
                        reader.j();
                        PostClapsData postClapsDataFromJson = PostClapsDataImpl_ResponseAdapter.PostClapsData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        ResponseCountData responseCountDataFromJson = ResponseCountDataImpl_ResponseAdapter.ResponseCountData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        PostVisibilityData postVisibilityDataFromJson = PostVisibilityDataImpl_ResponseAdapter.PostVisibilityData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        PostShareData postShareDataFromJson = PostShareDataImpl_ResponseAdapter.PostShareData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        PostFeaturingStatusData postFeaturingStatusDataFromJson = PostFeaturingStatusDataImpl_ResponseAdapter.PostFeaturingStatusData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        PostViewStateData postViewStateDataFromJson = PostViewStateDataImpl_ResponseAdapter.PostViewStateData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        PostRepostCountData postRepostCountDataFromJson = PostRepostCountDataImpl_ResponseAdapter.PostRepostCountData.INSTANCE.fromJson(reader, customScalarAdapters);
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (strQ3 != null) {
                            return new com.medium.android.graphql.fragment.PostPreviewData(strQ, strQ2, str, previewContent, previewImage, d, lValueOf, lValueOf2, lValueOf3, strQ3, collection, creator, postClapsDataFromJson, responseCountDataFromJson, postVisibilityDataFromJson, postShareDataFromJson, postFeaturingStatusDataFromJson, postViewStateDataFromJson, postRepostCountDataFromJson);
                        }
                        kng.L(reader, "latestPublishedVersion");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.PostPreviewData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("title");
            k8.g.toJson(writer, customScalarAdapters, value.getTitle());
            writer.t0("previewContent");
            sv0 sv0VarC = k8.c(PreviewContent.INSTANCE, false);
            PostPreviewData.PreviewContent previewContent = value.getPreviewContent();
            if (previewContent == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, previewContent);
            }
            writer.t0("previewImage");
            sv0 sv0VarC2 = k8.c(PreviewImage.INSTANCE, true);
            PostPreviewData.PreviewImage previewImage = value.getPreviewImage();
            if (previewImage == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, previewImage);
            }
            writer.t0("readingTime");
            k8.h.toJson(writer, customScalarAdapters, value.getReadingTime());
            writer.t0("pinnedByCreatorAt");
            dq1 dq1Var = k8.d;
            Long pinnedByCreatorAt = value.getPinnedByCreatorAt();
            if (pinnedByCreatorAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, pinnedByCreatorAt);
            }
            writer.t0("firstPublishedAt");
            Long firstPublishedAt = value.getFirstPublishedAt();
            if (firstPublishedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstPublishedAt);
            }
            writer.t0("updatedAt");
            Long updatedAt = value.getUpdatedAt();
            if (updatedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, updatedAt);
            }
            writer.t0("latestPublishedVersion");
            fa4Var.toJson(writer, customScalarAdapters, value.getLatestPublishedVersion());
            writer.t0("collection");
            sv0 sv0VarC3 = k8.c(Collection.INSTANCE, true);
            PostPreviewData.Collection collection = value.getCollection();
            if (collection == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, collection);
            }
            writer.t0("creator");
            sv0 sv0VarC4 = k8.c(Creator.INSTANCE, true);
            PostPreviewData.Creator creator = value.getCreator();
            if (creator == null) {
                writer.s0();
            } else {
                sv0VarC4.toJson(writer, customScalarAdapters, creator);
            }
            PostClapsDataImpl_ResponseAdapter.PostClapsData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostClapsData());
            ResponseCountDataImpl_ResponseAdapter.ResponseCountData.INSTANCE.toJson(writer, customScalarAdapters, value.getResponseCountData());
            PostVisibilityDataImpl_ResponseAdapter.PostVisibilityData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostVisibilityData());
            PostShareDataImpl_ResponseAdapter.PostShareData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostShareData());
            PostFeaturingStatusDataImpl_ResponseAdapter.PostFeaturingStatusData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostFeaturingStatusData());
            PostViewStateDataImpl_ResponseAdapter.PostViewStateData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostViewStateData());
            PostRepostCountDataImpl_ResponseAdapter.PostRepostCountData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostRepostCountData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$PreviewContent;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PreviewContent implements c8 {
        public static final PreviewContent INSTANCE = new PreviewContent();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "subtitle");

        private PreviewContent() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.PreviewContent fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String str = null;
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
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ != null) {
                return new PostPreviewData.PreviewContent(strQ, str);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.PreviewContent value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("subtitle");
            k8.g.toJson(writer, customScalarAdapters, value.getSubtitle());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$PreviewImage;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PreviewImage implements c8 {
        public static final PreviewImage INSTANCE = new PreviewImage();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private PreviewImage() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.PreviewImage fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new PostPreviewData.PreviewImage(strQ, strQ2, imageMetadataDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.PreviewImage value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$Verifications;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$Verifications;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$Verifications;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$Verifications;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Verifications implements c8 {
        public static final Verifications INSTANCE = new Verifications();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isBookAuthor");

        private Verifications() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.Verifications fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Boolean boolValueOf = null;
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
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (boolValueOf != null) {
                return new PostPreviewData.Verifications(strQ, boolValueOf.booleanValue());
            }
            kng.L(reader, "isBookAuthor");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.Verifications value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("isBookAuthor");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isBookAuthor()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isEditor", "id");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Boolean boolValueOf = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (boolValueOf == null) {
                kng.L(reader, "isEditor");
                throw null;
            }
            boolean zBooleanValue = boolValueOf.booleanValue();
            if (strQ2 != null) {
                return new PostPreviewData.ViewerEdge(strQ, zBooleanValue, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("isEditor");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isEditor()));
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    private PostPreviewDataImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewDataImpl_ResponseAdapter$ViewerEdge1;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge1;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge1;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge1;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge1 implements c8 {
        public static final ViewerEdge1 INSTANCE = new ViewerEdge1();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isUser", "id");

        private ViewerEdge1() {
        }

        @Override // defpackage.c8
        public final PostPreviewData.ViewerEdge1 fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Boolean boolValueOf = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (boolValueOf == null) {
                kng.L(reader, "isUser");
                throw null;
            }
            boolean zBooleanValue = boolValueOf.booleanValue();
            if (strQ2 != null) {
                return new PostPreviewData.ViewerEdge1(strQ, zBooleanValue, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostPreviewData.ViewerEdge1 value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("isUser");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isUser()));
            writer.t0(bPUi.IuGbXQauMwEJFJm);
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }
}
