package com.medium.android.graphql.fragment;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.graphql.fragment.CollectionFollowDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.CollectionNewsletterDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.HighlightDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ImageMetadataDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.InResponseToPostImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostClapsDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostMenuDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.PostMetaData;
import com.medium.android.graphql.fragment.PostVisibilityDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.ResponseCountDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.UserBlockDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.UserFollowDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.UserMuteDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.UserNewsletterDataImpl_ResponseAdapter;
import com.medium.android.graphql.type.InResponseToEntityType;
import com.medium.android.graphql.type.PostPaywallType;
import com.medium.android.graphql.type.PostVisibilityType;
import com.medium.android.graphql.type.adapter.InResponseToEntityType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.PostPaywallType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.PostVisibilityType_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dm2;
import defpackage.dq1;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.xl8;
import defpackage.ygf;
import defpackage.yl2;
import defpackage.zi5;
import defpackage.zm7;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0015\bÆ\u0002\u0018\u00002\u00020\u0001:\u0012\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010\u0011\u0012\u0013\u0014\u0015B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter;", "", "<init>", "()V", "PostMetaData", "ViewerEdge", "Paywall", "CreatorSpotlight", "PreviewImage", "InResponseToPostResult", "InResponseToMediaResource", "MediumQuote", "Collection", "Avatar", "ViewerEdge1", "LatestPostsConnection", "Post", "Creator", "ViewerEdge2", "Verifications", "AdminCollection", "PreviewContent", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostMetaDataImpl_ResponseAdapter {
    public static final PostMetaDataImpl_ResponseAdapter INSTANCE = new PostMetaDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$AdminCollection;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$AdminCollection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$AdminCollection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$AdminCollection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class AdminCollection implements c8 {
        public static final AdminCollection INSTANCE = new AdminCollection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private AdminCollection() {
        }

        @Override // defpackage.c8
        public final PostMetaData.AdminCollection fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new PostMetaData.AdminCollection(strQ, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.AdminCollection value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$Avatar;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$Avatar;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$Avatar;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$Avatar;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Avatar implements c8 {
        public static final Avatar INSTANCE = new Avatar();
        private static final List<String> RESPONSE_NAMES = d46.R(CspinKvYN.zIakzI, "id");

        private Avatar() {
        }

        @Override // defpackage.c8
        public final PostMetaData.Avatar fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new PostMetaData.Avatar(strQ, strQ2, imageMetadataDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.Avatar value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$Collection;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$Collection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$Collection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$Collection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Collection implements c8 {
        public static final Collection INSTANCE = new Collection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "slug", "name", "shortDescription", "description", "avatar", "viewerEdge", "latestPostsConnection");

        private Collection() {
        }

        @Override // defpackage.c8
        public final PostMetaData.Collection fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            Object objFromJson2;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
            String str3 = null;
            String str4 = null;
            PostMetaData.Avatar avatar = null;
            PostMetaData.ViewerEdge1 viewerEdge1 = null;
            PostMetaData.LatestPostsConnection latestPostsConnection = null;
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
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 5:
                        str4 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        sv0 sv0VarC = k8.c(Avatar.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        avatar = (PostMetaData.Avatar) objFromJson2;
                        break;
                    case 7:
                        viewerEdge1 = (PostMetaData.ViewerEdge1) k8.c(ViewerEdge1.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        break;
                    case 8:
                        sv0 sv0VarC2 = k8.c(LatestPostsConnection.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        latestPostsConnection = (PostMetaData.LatestPostsConnection) objFromJson;
                        break;
                    default:
                        reader.j();
                        CollectionNewsletterData collectionNewsletterDataFromJson = CollectionNewsletterDataImpl_ResponseAdapter.CollectionNewsletterData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        CollectionFollowData collectionFollowDataFromJson = CollectionFollowDataImpl_ResponseAdapter.CollectionFollowData.INSTANCE.fromJson(reader, customScalarAdapters);
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (viewerEdge1 != null) {
                            return new PostMetaData.Collection(strQ, strQ2, str, str2, str3, str4, avatar, viewerEdge1, latestPostsConnection, collectionNewsletterDataFromJson, collectionFollowDataFromJson);
                        }
                        kng.L(reader, "viewerEdge");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.Collection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("slug");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getSlug());
            writer.t0("name");
            xl8Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("shortDescription");
            xl8Var.toJson(writer, customScalarAdapters, value.getShortDescription());
            writer.t0("description");
            xl8Var.toJson(writer, customScalarAdapters, value.getDescription());
            writer.t0("avatar");
            sv0 sv0VarC = k8.c(Avatar.INSTANCE, true);
            PostMetaData.Avatar avatar = value.getAvatar();
            if (avatar == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, avatar);
            }
            writer.t0("viewerEdge");
            k8.c(ViewerEdge1.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("latestPostsConnection");
            sv0 sv0VarC2 = k8.c(LatestPostsConnection.INSTANCE, false);
            PostMetaData.LatestPostsConnection latestPostsConnection = value.getLatestPostsConnection();
            if (latestPostsConnection == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, latestPostsConnection);
            }
            CollectionNewsletterDataImpl_ResponseAdapter.CollectionNewsletterData.INSTANCE.toJson(writer, customScalarAdapters, value.getCollectionNewsletterData());
            CollectionFollowDataImpl_ResponseAdapter.CollectionFollowData.INSTANCE.toJson(writer, customScalarAdapters, value.getCollectionFollowData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "username", "bio", "tippingLink", "imageId", "twitterScreenName", "hasSubdomain", "viewerEdge", "verifications", "adminCollections");

        private Creator() {
        }

        @Override // defpackage.c8
        public final PostMetaData.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
            String str3 = null;
            String str4 = null;
            String str5 = null;
            String strQ3 = null;
            PostMetaData.ViewerEdge2 viewerEdge2 = null;
            PostMetaData.Verifications verifications = null;
            ArrayList arrayListE = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        continue;
                    case 1:
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        continue;
                    case 2:
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 3:
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 4:
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 5:
                        str4 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 6:
                        str5 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 7:
                        fa4 fa4Var3 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        continue;
                    case 8:
                        fa4 fa4Var4 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 9:
                        bool = boolValueOf;
                        viewerEdge2 = (PostMetaData.ViewerEdge2) k8.c(ViewerEdge2.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        break;
                    case 10:
                        bool = boolValueOf;
                        sv0 sv0VarC = k8.c(Verifications.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        verifications = (PostMetaData.Verifications) objFromJson;
                        break;
                    case 11:
                        bool = boolValueOf;
                        sv0 sv0VarC2 = k8.c(AdminCollection.INSTANCE, false);
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
                        break;
                    default:
                        reader.j();
                        UserBlockData userBlockDataFromJson = UserBlockDataImpl_ResponseAdapter.UserBlockData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        UserFollowData userFollowDataFromJson = UserFollowDataImpl_ResponseAdapter.UserFollowData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        UserNewsletterData userNewsletterDataFromJson = UserNewsletterDataImpl_ResponseAdapter.UserNewsletterData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        UserMuteData userMuteDataFromJson = UserMuteDataImpl_ResponseAdapter.UserMuteData.INSTANCE.fromJson(reader, customScalarAdapters);
                        Boolean bool2 = boolValueOf;
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (strQ3 == null) {
                            kng.L(reader, "twitterScreenName");
                            throw null;
                        }
                        if (bool2 == null) {
                            kng.L(reader, "hasSubdomain");
                            throw null;
                        }
                        boolean zBooleanValue = bool2.booleanValue();
                        if (viewerEdge2 == null) {
                            kng.L(reader, "viewerEdge");
                            throw null;
                        }
                        if (arrayListE != null) {
                            return new PostMetaData.Creator(strQ, strQ2, str, str2, str3, str4, str5, strQ3, zBooleanValue, viewerEdge2, verifications, arrayListE, userBlockDataFromJson, userFollowDataFromJson, userNewsletterDataFromJson, userMuteDataFromJson);
                        }
                        kng.L(reader, "adminCollections");
                        throw null;
                }
                boolValueOf = bool;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.Creator value) {
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
            writer.t0("bio");
            xl8Var.toJson(writer, customScalarAdapters, value.getBio());
            writer.t0("tippingLink");
            xl8Var.toJson(writer, customScalarAdapters, value.getTippingLink());
            writer.t0("imageId");
            xl8Var.toJson(writer, customScalarAdapters, value.getImageId());
            writer.t0("twitterScreenName");
            fa4Var.toJson(writer, customScalarAdapters, value.getTwitterScreenName());
            writer.t0("hasSubdomain");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getHasSubdomain()));
            writer.t0("viewerEdge");
            k8.c(ViewerEdge2.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("verifications");
            sv0 sv0VarC = k8.c(Verifications.INSTANCE, false);
            PostMetaData.Verifications verifications = value.getVerifications();
            if (verifications == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, verifications);
            }
            writer.t0("adminCollections");
            sv0 sv0VarC2 = k8.c(AdminCollection.INSTANCE, false);
            List<PostMetaData.AdminCollection> adminCollections = value.getAdminCollections();
            adminCollections.getClass();
            writer.n();
            Iterator<T> it2 = adminCollections.iterator();
            while (it2.hasNext()) {
                sv0VarC2.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
            UserBlockDataImpl_ResponseAdapter.UserBlockData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserBlockData());
            UserFollowDataImpl_ResponseAdapter.UserFollowData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserFollowData());
            UserNewsletterDataImpl_ResponseAdapter.UserNewsletterData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserNewsletterData());
            UserMuteDataImpl_ResponseAdapter.UserMuteData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserMuteData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$InResponseToMediaResource;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class InResponseToMediaResource implements c8 {
        public static final InResponseToMediaResource INSTANCE = new InResponseToMediaResource();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "mediumQuote", "id");

        private InResponseToMediaResource() {
        }

        @Override // defpackage.c8
        public final PostMetaData.InResponseToMediaResource fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            PostMetaData.MediumQuote mediumQuote = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    sv0 sv0VarC = k8.c(MediumQuote.INSTANCE, true);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    mediumQuote = (PostMetaData.MediumQuote) objFromJson;
                } else {
                    if (iN0 != 2) {
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
                return new PostMetaData.InResponseToMediaResource(strQ, mediumQuote, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.InResponseToMediaResource value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("mediumQuote");
            sv0 sv0VarC = k8.c(MediumQuote.INSTANCE, true);
            PostMetaData.MediumQuote mediumQuote = value.getMediumQuote();
            if (mediumQuote == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, mediumQuote);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$InResponseToPostResult;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class InResponseToPostResult implements c8 {
        public static final InResponseToPostResult INSTANCE = new InResponseToPostResult();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private InResponseToPostResult() {
        }

        @Override // defpackage.c8
        public final PostMetaData.InResponseToPostResult fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            InResponseToPost inResponseToPostFromJson = null;
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
            if (dm2.B(dm2.Q("Post"), customScalarAdapters.a, strQ, customScalarAdapters.b)) {
                reader.j();
                inResponseToPostFromJson = InResponseToPostImpl_ResponseAdapter.InResponseToPost.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new PostMetaData.InResponseToPostResult(strQ, inResponseToPostFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.InResponseToPostResult value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getInResponseToPost() != null) {
                InResponseToPostImpl_ResponseAdapter.InResponseToPost.INSTANCE.toJson(writer, customScalarAdapters, value.getInResponseToPost());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$LatestPostsConnection;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$LatestPostsConnection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$LatestPostsConnection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$LatestPostsConnection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class LatestPostsConnection implements c8 {
        public static final LatestPostsConnection INSTANCE = new LatestPostsConnection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "posts");

        private LatestPostsConnection() {
        }

        @Override // defpackage.c8
        public final PostMetaData.LatestPostsConnection fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            List list = null;
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
                    zm7 zm7Var = new zm7(k8.c(Post.INSTANCE, false));
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = zm7Var.fromJson(reader, customScalarAdapters);
                    }
                    list = (List) objFromJson;
                }
            }
            if (strQ != null) {
                return new PostMetaData.LatestPostsConnection(strQ, list);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.LatestPostsConnection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("posts");
            zm7 zm7Var = new zm7(k8.c(Post.INSTANCE, false));
            List<PostMetaData.Post> posts = value.getPosts();
            if (posts == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, posts);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$MediumQuote;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$MediumQuote;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$MediumQuote;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$MediumQuote;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MediumQuote implements c8 {
        public static final MediumQuote INSTANCE = new MediumQuote();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private MediumQuote() {
        }

        @Override // defpackage.c8
        public final PostMetaData.MediumQuote fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            HighlightData highlightDataFromJson = HighlightDataImpl_ResponseAdapter.HighlightData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new PostMetaData.MediumQuote(strQ, strQ2, highlightDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.MediumQuote value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            HighlightDataImpl_ResponseAdapter.HighlightData.INSTANCE.toJson(writer, customScalarAdapters, value.getHighlightData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$Post;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$Post;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$Post;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$Post;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Post implements c8 {
        public static final Post INSTANCE = new Post();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", PqkdNGCEoxOKZk.OlbBbddii, "latestPublishedAt");

        private Post() {
        }

        @Override // defpackage.c8
        public final PostMetaData.Post fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            Long lValueOf = null;
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
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf = null;
                    } else {
                        lValueOf = Long.valueOf(reader.nextLong());
                    }
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new PostMetaData.Post(strQ, strQ2, lValueOf);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.Post value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("latestPublishedAt");
            dq1 dq1Var = k8.d;
            Long latestPublishedAt = value.getLatestPublishedAt();
            if (latestPublishedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, latestPublishedAt);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$PostMetaData;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostMetaData implements c8 {
        public static final PostMetaData INSTANCE = new PostMetaData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "title", "visibility", "viewerEdge", "detectedLanguage", "mediumUrl", "readingTime", AXoTRPEGKEve.zULmFQER, "isLocked", "allowResponses", "isProxyPost", "latestPublishedVersion", "firstPublishedAt", "previewImage", "inResponseToPostResult", "inResponseToMediaResource", "inResponseToEntityType", "canonicalUrl", "collection", "creator", "previewContent", "pinnedByCreatorAt", "isNewsletter");

        private PostMetaData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.PostMetaData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Boolean bool2;
            Object objFromJson;
            Object objFromJson2;
            Object objFromJson3;
            Object objFromJson4;
            Object objFromJson5;
            Object objFromJson6;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String strQ2 = null;
            String str = null;
            PostVisibilityType postVisibilityTypeFromJson = null;
            PostMetaData.ViewerEdge viewerEdge = null;
            String str2 = null;
            String str3 = null;
            Double d = null;
            Long lValueOf = null;
            Boolean bool3 = null;
            Boolean bool4 = null;
            Boolean boolValueOf2 = null;
            String strQ3 = null;
            Long lValueOf2 = null;
            PostMetaData.PreviewImage previewImage = null;
            PostMetaData.InResponseToPostResult inResponseToPostResult = null;
            PostMetaData.InResponseToMediaResource inResponseToMediaResource = null;
            InResponseToEntityType inResponseToEntityType = null;
            String str4 = null;
            PostMetaData.Collection collection = null;
            PostMetaData.Creator creator = null;
            PostMetaData.PreviewContent previewContent = null;
            Long lValueOf3 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        continue;
                    case 1:
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        continue;
                    case 2:
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 3:
                        postVisibilityTypeFromJson = PostVisibilityType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        continue;
                    case 4:
                        viewerEdge = (PostMetaData.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        boolValueOf = boolValueOf;
                        continue;
                    case 5:
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 6:
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 7:
                        d = (Double) k8.h.fromJson(reader, customScalarAdapters);
                        continue;
                    case 8:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        dq1 dq1Var = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf = null;
                        }
                        break;
                    case 9:
                        bool3 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        continue;
                    case 10:
                        bool4 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        continue;
                    case 11:
                        fa4 fa4Var3 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 12:
                        fa4 fa4Var4 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        continue;
                    case 13:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        dq1 dq1Var2 = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf2 = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf2 = null;
                        }
                        break;
                    case 14:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        sv0 sv0VarC = k8.c(PreviewImage.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        previewImage = (PostMetaData.PreviewImage) objFromJson;
                        break;
                    case 15:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        sv0 sv0VarC2 = k8.c(InResponseToPostResult.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        inResponseToPostResult = (PostMetaData.InResponseToPostResult) objFromJson2;
                        break;
                    case 16:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        sv0 sv0VarC3 = k8.c(InResponseToMediaResource.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson3 = null;
                        } else {
                            objFromJson3 = sv0VarC3.fromJson(reader, customScalarAdapters);
                        }
                        inResponseToMediaResource = (PostMetaData.InResponseToMediaResource) objFromJson3;
                        break;
                    case 17:
                        inResponseToEntityType = (InResponseToEntityType) k8.b(InResponseToEntityType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                        continue;
                    case 18:
                        str4 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        continue;
                    case 19:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        sv0 sv0VarC4 = k8.c(Collection.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson4 = null;
                        } else {
                            objFromJson4 = sv0VarC4.fromJson(reader, customScalarAdapters);
                        }
                        collection = (PostMetaData.Collection) objFromJson4;
                        break;
                    case 20:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        sv0 sv0VarC5 = k8.c(Creator.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson5 = null;
                        } else {
                            objFromJson5 = sv0VarC5.fromJson(reader, customScalarAdapters);
                        }
                        creator = (PostMetaData.Creator) objFromJson5;
                        break;
                    case 21:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        sv0 sv0VarC6 = k8.c(PreviewContent.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson6 = null;
                        } else {
                            objFromJson6 = sv0VarC6.fromJson(reader, customScalarAdapters);
                        }
                        previewContent = (PostMetaData.PreviewContent) objFromJson6;
                        break;
                    case 22:
                        bool = boolValueOf;
                        bool2 = boolValueOf2;
                        dq1 dq1Var3 = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf3 = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf3 = null;
                        }
                        break;
                    case 23:
                        fa4 fa4Var5 = k8.a;
                        boolValueOf2 = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    default:
                        reader.j();
                        PostClapsData postClapsDataFromJson = PostClapsDataImpl_ResponseAdapter.PostClapsData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        ResponseCountData responseCountDataFromJson = ResponseCountDataImpl_ResponseAdapter.ResponseCountData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        PostVisibilityData postVisibilityDataFromJson = PostVisibilityDataImpl_ResponseAdapter.PostVisibilityData.INSTANCE.fromJson(reader, customScalarAdapters);
                        reader.j();
                        PostMenuData postMenuDataFromJson = PostMenuDataImpl_ResponseAdapter.PostMenuData.INSTANCE.fromJson(reader, customScalarAdapters);
                        Boolean bool5 = boolValueOf;
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (postVisibilityTypeFromJson == null) {
                            kng.L(reader, "visibility");
                            throw null;
                        }
                        if (viewerEdge == null) {
                            kng.L(reader, "viewerEdge");
                            throw null;
                        }
                        if (bool5 == null) {
                            kng.L(reader, "isProxyPost");
                            throw null;
                        }
                        Boolean bool6 = boolValueOf2;
                        boolean zBooleanValue = bool5.booleanValue();
                        if (strQ3 == null) {
                            kng.L(reader, "latestPublishedVersion");
                            throw null;
                        }
                        if (bool6 != null) {
                            return new com.medium.android.graphql.fragment.PostMetaData(strQ, strQ2, str, postVisibilityTypeFromJson, viewerEdge, str2, str3, d, lValueOf, bool3, bool4, zBooleanValue, strQ3, lValueOf2, previewImage, inResponseToPostResult, inResponseToMediaResource, inResponseToEntityType, str4, collection, creator, previewContent, lValueOf3, bool6.booleanValue(), postClapsDataFromJson, responseCountDataFromJson, postVisibilityDataFromJson, postMenuDataFromJson);
                        }
                        kng.L(reader, "isNewsletter");
                        throw null;
                }
                boolValueOf = bool;
                boolValueOf2 = bool2;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.PostMetaData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("title");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getTitle());
            writer.t0("visibility");
            PostVisibilityType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getVisibility());
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("detectedLanguage");
            xl8Var.toJson(writer, customScalarAdapters, value.getDetectedLanguage());
            writer.t0("mediumUrl");
            xl8Var.toJson(writer, customScalarAdapters, value.getMediumUrl());
            writer.t0("readingTime");
            k8.h.toJson(writer, customScalarAdapters, value.getReadingTime());
            writer.t0("updatedAt");
            dq1 dq1Var = k8.d;
            Long updatedAt = value.getUpdatedAt();
            if (updatedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, updatedAt);
            }
            writer.t0("isLocked");
            xl8 xl8Var2 = k8.j;
            xl8Var2.toJson(writer, customScalarAdapters, value.isLocked());
            writer.t0("allowResponses");
            xl8Var2.toJson(writer, customScalarAdapters, value.getAllowResponses());
            writer.t0("isProxyPost");
            zi5 zi5Var = k8.e;
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isProxyPost()));
            writer.t0("latestPublishedVersion");
            fa4Var.toJson(writer, customScalarAdapters, value.getLatestPublishedVersion());
            writer.t0("firstPublishedAt");
            Long firstPublishedAt = value.getFirstPublishedAt();
            if (firstPublishedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstPublishedAt);
            }
            writer.t0("previewImage");
            sv0 sv0VarC = k8.c(PreviewImage.INSTANCE, true);
            PostMetaData.PreviewImage previewImage = value.getPreviewImage();
            if (previewImage == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, previewImage);
            }
            writer.t0("inResponseToPostResult");
            sv0 sv0VarC2 = k8.c(InResponseToPostResult.INSTANCE, true);
            PostMetaData.InResponseToPostResult inResponseToPostResult = value.getInResponseToPostResult();
            if (inResponseToPostResult == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, inResponseToPostResult);
            }
            writer.t0("inResponseToMediaResource");
            sv0 sv0VarC3 = k8.c(InResponseToMediaResource.INSTANCE, false);
            PostMetaData.InResponseToMediaResource inResponseToMediaResource = value.getInResponseToMediaResource();
            if (inResponseToMediaResource == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, inResponseToMediaResource);
            }
            writer.t0("inResponseToEntityType");
            k8.b(InResponseToEntityType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getInResponseToEntityType());
            writer.t0("canonicalUrl");
            xl8Var.toJson(writer, customScalarAdapters, value.getCanonicalUrl());
            writer.t0("collection");
            sv0 sv0VarC4 = k8.c(Collection.INSTANCE, true);
            PostMetaData.Collection collection = value.getCollection();
            if (collection == null) {
                writer.s0();
            } else {
                sv0VarC4.toJson(writer, customScalarAdapters, collection);
            }
            writer.t0("creator");
            sv0 sv0VarC5 = k8.c(Creator.INSTANCE, true);
            PostMetaData.Creator creator = value.getCreator();
            if (creator == null) {
                writer.s0();
            } else {
                sv0VarC5.toJson(writer, customScalarAdapters, creator);
            }
            writer.t0("previewContent");
            sv0 sv0VarC6 = k8.c(PreviewContent.INSTANCE, false);
            PostMetaData.PreviewContent previewContent = value.getPreviewContent();
            if (previewContent == null) {
                writer.s0();
            } else {
                sv0VarC6.toJson(writer, customScalarAdapters, previewContent);
            }
            writer.t0("pinnedByCreatorAt");
            Long pinnedByCreatorAt = value.getPinnedByCreatorAt();
            if (pinnedByCreatorAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, pinnedByCreatorAt);
            }
            writer.t0("isNewsletter");
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isNewsletter()));
            PostClapsDataImpl_ResponseAdapter.PostClapsData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostClapsData());
            ResponseCountDataImpl_ResponseAdapter.ResponseCountData.INSTANCE.toJson(writer, customScalarAdapters, value.getResponseCountData());
            PostVisibilityDataImpl_ResponseAdapter.PostVisibilityData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostVisibilityData());
            PostMenuDataImpl_ResponseAdapter.PostMenuData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostMenuData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$PreviewContent;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PreviewContent implements c8 {
        public static final PreviewContent INSTANCE = new PreviewContent();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "subtitle");

        private PreviewContent() {
        }

        @Override // defpackage.c8
        public final PostMetaData.PreviewContent fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new PostMetaData.PreviewContent(strQ, str);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.PreviewContent value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$PreviewImage;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PreviewImage implements c8 {
        public static final PreviewImage INSTANCE = new PreviewImage();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private PreviewImage() {
        }

        @Override // defpackage.c8
        public final PostMetaData.PreviewImage fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new PostMetaData.PreviewImage(strQ, strQ2, imageMetadataDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.PreviewImage value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$Verifications;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$Verifications;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$Verifications;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$Verifications;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Verifications implements c8 {
        public static final Verifications INSTANCE = new Verifications();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isBookAuthor");

        private Verifications() {
        }

        @Override // defpackage.c8
        public final PostMetaData.Verifications fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new PostMetaData.Verifications(strQ, boolValueOf.booleanValue());
            }
            kng.L(reader, "isBookAuthor");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.Verifications value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "paywall", "shareKey");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final PostMetaData.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            PostMetaData.Paywall paywall = null;
            String str = null;
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
                    sv0 sv0VarC = k8.c(Paywall.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    paywall = (PostMetaData.Paywall) objFromJson;
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new PostMetaData.ViewerEdge(strQ, strQ2, paywall, str);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("paywall");
            sv0 sv0VarC = k8.c(Paywall.INSTANCE, false);
            PostMetaData.Paywall paywall = value.getPaywall();
            if (paywall == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, paywall);
            }
            writer.t0("shareKey");
            k8.g.toJson(writer, customScalarAdapters, value.getShareKey());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$ViewerEdge1;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge1;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge1;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge1;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge1 implements c8 {
        public static final ViewerEdge1 INSTANCE = new ViewerEdge1();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "isFollowing", "isEditor", "canEditPosts", "canEditOwnPosts", "isMuting");

        private ViewerEdge1() {
        }

        @Override // defpackage.c8
        public final PostMetaData.ViewerEdge1 fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            Boolean boolValueOf2 = null;
            String strQ = null;
            String strQ2 = null;
            Boolean boolValueOf3 = null;
            Boolean boolValueOf4 = null;
            Boolean boolValueOf5 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        bool = boolValueOf2;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        bool = boolValueOf2;
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    case 2:
                        fa4 fa4Var3 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 3:
                        fa4 fa4Var4 = k8.a;
                        boolValueOf2 = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 4:
                        bool = boolValueOf2;
                        fa4 fa4Var5 = k8.a;
                        boolValueOf3 = Boolean.valueOf(reader.nextBoolean());
                        break;
                    case 5:
                        bool = boolValueOf2;
                        fa4 fa4Var6 = k8.a;
                        boolValueOf4 = Boolean.valueOf(reader.nextBoolean());
                        break;
                    case 6:
                        bool = boolValueOf2;
                        fa4 fa4Var7 = k8.a;
                        boolValueOf5 = Boolean.valueOf(reader.nextBoolean());
                        break;
                    default:
                        Boolean bool2 = boolValueOf2;
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (boolValueOf == null) {
                            kng.L(reader, "isFollowing");
                            throw null;
                        }
                        Boolean bool3 = boolValueOf3;
                        boolean zBooleanValue = boolValueOf.booleanValue();
                        if (bool2 == null) {
                            kng.L(reader, "isEditor");
                            throw null;
                        }
                        Boolean bool4 = boolValueOf4;
                        boolean zBooleanValue2 = bool2.booleanValue();
                        if (bool3 == null) {
                            kng.L(reader, "canEditPosts");
                            throw null;
                        }
                        Boolean bool5 = boolValueOf5;
                        boolean zBooleanValue3 = bool3.booleanValue();
                        if (bool4 == null) {
                            kng.L(reader, "canEditOwnPosts");
                            throw null;
                        }
                        boolean zBooleanValue4 = bool4.booleanValue();
                        if (bool5 != null) {
                            return new PostMetaData.ViewerEdge1(strQ, strQ2, zBooleanValue, zBooleanValue2, zBooleanValue3, zBooleanValue4, bool5.booleanValue());
                        }
                        kng.L(reader, "isMuting");
                        throw null;
                }
                boolValueOf2 = bool;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.ViewerEdge1 value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("isFollowing");
            zi5 zi5Var = k8.e;
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isFollowing()));
            writer.t0("isEditor");
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isEditor()));
            writer.t0("canEditPosts");
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getCanEditPosts()));
            writer.t0("canEditOwnPosts");
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getCanEditOwnPosts()));
            writer.t0("isMuting");
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isMuting()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$ViewerEdge2;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge2;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge2;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge2;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge2 implements c8 {
        public static final ViewerEdge2 INSTANCE = new ViewerEdge2();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "isUser");

        private ViewerEdge2() {
        }

        @Override // defpackage.c8
        public final PostMetaData.ViewerEdge2 fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new PostMetaData.ViewerEdge2(strQ, strQ2, boolValueOf.booleanValue());
            }
            kng.L(reader, "isUser");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.ViewerEdge2 value) {
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

    private PostMetaDataImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$CreatorSpotlight;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$CreatorSpotlight;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$CreatorSpotlight;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$CreatorSpotlight;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CreatorSpotlight implements c8 {
        public static final CreatorSpotlight INSTANCE = new CreatorSpotlight();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "name", "jobTitle", "company", "imageId", "hideOnMediumScreen");

        private CreatorSpotlight() {
        }

        @Override // defpackage.c8
        public final PostMetaData.CreatorSpotlight fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            String str = null;
            String strQ4 = null;
            Boolean bool = null;
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
                    fa4 fa4Var3 = k8.a;
                    strQ3 = reader.q();
                    strQ3.getClass();
                } else if (iN0 == 3) {
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 4) {
                    fa4 fa4Var4 = k8.a;
                    strQ4 = reader.q();
                    strQ4.getClass();
                } else {
                    if (iN0 != 5) {
                        break;
                    }
                    bool = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "name");
                throw null;
            }
            if (strQ3 == null) {
                kng.L(reader, "jobTitle");
                throw null;
            }
            if (strQ4 != null) {
                return new PostMetaData.CreatorSpotlight(strQ, strQ2, strQ3, str, strQ4, bool);
            }
            kng.L(reader, "imageId");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.CreatorSpotlight value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0(MaAxRJinch.HnfnNkMDBdXi);
            fa4Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("jobTitle");
            fa4Var.toJson(writer, customScalarAdapters, value.getJobTitle());
            writer.t0("company");
            k8.g.toJson(writer, customScalarAdapters, value.getCompany());
            writer.t0("imageId");
            fa4Var.toJson(writer, customScalarAdapters, value.getImageId());
            writer.t0("hideOnMediumScreen");
            k8.j.toJson(writer, customScalarAdapters, value.getHideOnMediumScreen());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaDataImpl_ResponseAdapter$Paywall;", "Lc8;", "Lcom/medium/android/graphql/fragment/PostMetaData$Paywall;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PostMetaData$Paywall;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PostMetaData$Paywall;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Paywall implements c8 {
        public static final Paywall INSTANCE = new Paywall();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", ZVsviyDAr.wcbgxBkGgWH, "creatorSpotlights");

        private Paywall() {
        }

        @Override // defpackage.c8
        public final PostMetaData.Paywall fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            PostPaywallType postPaywallTypeFromJson = null;
            ArrayList arrayList = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    postPaywallTypeFromJson = PostPaywallType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(CreatorSpotlight.INSTANCE, false);
                    ArrayList arrayListE = ev6.E(reader);
                    while (reader.hasNext()) {
                        try {
                            arrayListE.add(sv0VarC.fromJson(reader, customScalarAdapters));
                        } catch (ApolloGraphQLException e) {
                            while (reader.hasNext()) {
                                reader.v();
                            }
                            reader.k();
                            throw e;
                        }
                    }
                    reader.k();
                    arrayList = arrayListE;
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (postPaywallTypeFromJson == null) {
                kng.L(reader, "type");
                throw null;
            }
            if (arrayList != null) {
                return new PostMetaData.Paywall(strQ, postPaywallTypeFromJson, arrayList);
            }
            kng.L(reader, "creatorSpotlights");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, PostMetaData.Paywall value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("type");
            PostPaywallType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getType());
            writer.t0(kSWQKWZ.PaktUoJ);
            sv0 sv0VarC = k8.c(CreatorSpotlight.INSTANCE, false);
            List<PostMetaData.CreatorSpotlight> creatorSpotlights = value.getCreatorSpotlights();
            creatorSpotlights.getClass();
            writer.n();
            Iterator<T> it2 = creatorSpotlights.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }
}
