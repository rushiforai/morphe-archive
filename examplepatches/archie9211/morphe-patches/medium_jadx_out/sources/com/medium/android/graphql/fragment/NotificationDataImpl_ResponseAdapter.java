package com.medium.android.graphql.fragment;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.graphql.fragment.HighlightDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.NewsletterDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.NotificationData;
import com.medium.android.graphql.fragment.UserFollowDataImpl_ResponseAdapter;
import com.medium.android.graphql.type.MarkupType;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.android.graphql.type.adapter.MarkupType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.PredefinedCatalogType_ResponseAdapter;
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
import defpackage.uob;
import defpackage.xl8;
import defpackage.yl2;
import defpackage.zm7;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0014\bÆ\u0002\u0018\u00002\u00020\u0001:\u0011\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010\u0011\u0012\u0013\u0014B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter;", "", "<init>", "()V", "NotificationData", "Post", "Creator", "ResponsePost", "Content", "BodyModel", "Paragraph", "Markup", "Quote", "Actor", "NewsletterV3", "Catalog", "Creator1", "Collection", "Avatar", "ViewerEdge", "RollupItem", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class NotificationDataImpl_ResponseAdapter {
    public static final NotificationDataImpl_ResponseAdapter INSTANCE = new NotificationDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Actor;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Actor;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Actor;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Actor;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Actor implements c8 {
        public static final Actor INSTANCE = new Actor();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "imageId", "name", "bio", "newsletterV3");

        private Actor() {
        }

        @Override // defpackage.c8
        public final NotificationData.Actor fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
            String str3 = null;
            NotificationData.NewsletterV3 newsletterV3 = null;
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
                    str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 5) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(NewsletterV3.INSTANCE, true);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    newsletterV3 = (NotificationData.NewsletterV3) objFromJson;
                }
            }
            reader.j();
            UserFollowData userFollowDataFromJson = UserFollowDataImpl_ResponseAdapter.UserFollowData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new NotificationData.Actor(strQ, strQ2, str, str2, str3, newsletterV3, userFollowDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Actor value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("imageId");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getImageId());
            writer.t0("name");
            xl8Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("bio");
            xl8Var.toJson(writer, customScalarAdapters, value.getBio());
            writer.t0("newsletterV3");
            sv0 sv0VarC = k8.c(NewsletterV3.INSTANCE, true);
            NotificationData.NewsletterV3 newsletterV3 = value.getNewsletterV3();
            if (newsletterV3 == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, newsletterV3);
            }
            UserFollowDataImpl_ResponseAdapter.UserFollowData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserFollowData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$BodyModel;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$BodyModel;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$BodyModel;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$BodyModel;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class BodyModel implements c8 {
        public static final BodyModel INSTANCE = new BodyModel();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "paragraphs");

        private BodyModel() {
        }

        @Override // defpackage.c8
        public final NotificationData.BodyModel fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            ArrayList arrayList = null;
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
                    sv0 sv0VarC = k8.c(Paragraph.INSTANCE, false);
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
            if (arrayList != null) {
                return new NotificationData.BodyModel(strQ, arrayList);
            }
            kng.L(reader, "paragraphs");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.BodyModel value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("paragraphs");
            sv0 sv0VarC = k8.c(Paragraph.INSTANCE, false);
            List<NotificationData.Paragraph> paragraphs = value.getParagraphs();
            paragraphs.getClass();
            writer.n();
            Iterator<T> it2 = paragraphs.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Catalog;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Catalog;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Catalog;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Catalog;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Catalog implements c8 {
        public static final Catalog INSTANCE = new Catalog();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "predefined", "creator");

        private Catalog() {
        }

        @Override // defpackage.c8
        public final NotificationData.Catalog fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            PredefinedCatalogType predefinedCatalogType = null;
            NotificationData.Creator1 creator1 = null;
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
                    predefinedCatalogType = (PredefinedCatalogType) k8.b(PredefinedCatalogType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 4) {
                        break;
                    }
                    creator1 = (NotificationData.Creator1) k8.c(Creator1.INSTANCE, false).fromJson(reader, customScalarAdapters);
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
            if (strQ3 == null) {
                kng.L(reader, "name");
                throw null;
            }
            if (creator1 != null) {
                return new NotificationData.Catalog(strQ, strQ2, strQ3, predefinedCatalogType, creator1);
            }
            kng.L(reader, "creator");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Catalog value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            fa4Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("predefined");
            k8.b(PredefinedCatalogType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getPredefined());
            writer.t0("creator");
            k8.c(Creator1.INSTANCE, false).toJson(writer, customScalarAdapters, value.getCreator());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Collection;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Collection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Collection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Collection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Collection implements c8 {
        public static final Collection INSTANCE = new Collection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "avatar", "viewerEdge");

        private Collection() {
        }

        @Override // defpackage.c8
        public final NotificationData.Collection fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            NotificationData.Avatar avatar = null;
            NotificationData.ViewerEdge viewerEdge = null;
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
                    avatar = (NotificationData.Avatar) objFromJson;
                } else {
                    if (iN0 != 4) {
                        break;
                    }
                    viewerEdge = (NotificationData.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
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
                return new NotificationData.Collection(strQ, strQ2, str, avatar, viewerEdge);
            }
            kng.L(reader, "viewerEdge");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Collection value) {
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
            NotificationData.Avatar avatar = value.getAvatar();
            if (avatar == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, avatar);
            }
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Content;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Content;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Content;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Content;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Content implements c8 {
        public static final Content INSTANCE = new Content();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "bodyModel");

        private Content() {
        }

        @Override // defpackage.c8
        public final NotificationData.Content fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            NotificationData.BodyModel bodyModel = null;
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
                    bodyModel = (NotificationData.BodyModel) k8.c(BodyModel.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (bodyModel != null) {
                return new NotificationData.Content(strQ, bodyModel);
            }
            kng.L(reader, "bodyModel");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Content value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("bodyModel");
            k8.c(BodyModel.INSTANCE, false).toJson(writer, customScalarAdapters, value.getBodyModel());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "imageId");

        private Creator() {
        }

        @Override // defpackage.c8
        public final NotificationData.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
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
                } else {
                    if (iN0 != 2) {
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
                return new NotificationData.Creator(strQ, strQ2, str);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Creator value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("imageId");
            k8.g.toJson(writer, customScalarAdapters, value.getImageId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Creator1;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Creator1;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Creator1;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Creator1;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator1 implements c8 {
        public static final Creator1 INSTANCE = new Creator1();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "imageId");

        private Creator1() {
        }

        @Override // defpackage.c8
        public final NotificationData.Creator1 fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
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
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new NotificationData.Creator1(strQ, strQ2, str, str2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Creator1 value) {
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
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Markup;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Markup;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Markup;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Markup;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Markup implements c8 {
        public static final Markup INSTANCE = new Markup();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "type", "start", "end");

        private Markup() {
        }

        @Override // defpackage.c8
        public final NotificationData.Markup fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            MarkupType markupType = null;
            Integer numValueOf = null;
            Integer numValueOf2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    markupType = (MarkupType) k8.b(MarkupType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    fa4 fa4Var2 = k8.a;
                    numValueOf = Integer.valueOf(reader.nextInt());
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    numValueOf2 = Integer.valueOf(reader.nextInt());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (numValueOf == null) {
                kng.L(reader, "start");
                throw null;
            }
            int iIntValue = numValueOf.intValue();
            if (numValueOf2 != null) {
                return new NotificationData.Markup(strQ, markupType, iIntValue, numValueOf2.intValue());
            }
            kng.L(reader, "end");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Markup value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("type");
            k8.b(MarkupType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getType());
            writer.t0("start");
            uob uobVar = k8.b;
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getStart()));
            writer.t0("end");
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getEnd()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$NewsletterV3;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$NewsletterV3;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$NewsletterV3;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$NewsletterV3;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class NewsletterV3 implements c8 {
        public static final NewsletterV3 INSTANCE = new NewsletterV3();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private NewsletterV3() {
        }

        @Override // defpackage.c8
        public final NotificationData.NewsletterV3 fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            NewsletterData newsletterDataFromJson = NewsletterDataImpl_ResponseAdapter.NewsletterData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new NotificationData.NewsletterV3(strQ, strQ2, newsletterDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.NewsletterV3 value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            NewsletterDataImpl_ResponseAdapter.NewsletterData.INSTANCE.toJson(writer, customScalarAdapters, value.getNewsletterData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Paragraph;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Paragraph;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Paragraph;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Paragraph;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Paragraph implements c8 {
        public static final Paragraph INSTANCE = new Paragraph();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "text", "markups");

        private Paragraph() {
        }

        @Override // defpackage.c8
        public final NotificationData.Paragraph fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            ArrayList arrayList = null;
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
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Markup.INSTANCE, false);
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
            if (strQ2 == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (arrayList != null) {
                return new NotificationData.Paragraph(strQ, strQ2, str, arrayList);
            }
            kng.L(reader, "markups");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Paragraph value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("text");
            k8.g.toJson(writer, customScalarAdapters, value.getText());
            writer.t0("markups");
            sv0 sv0VarC = k8.c(Markup.INSTANCE, false);
            List<NotificationData.Markup> markups = value.getMarkups();
            markups.getClass();
            writer.n();
            Iterator<T> it2 = markups.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Post;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Post;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Post;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Post;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Post implements c8 {
        public static final Post INSTANCE = new Post();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "title", "creator");

        private Post() {
        }

        @Override // defpackage.c8
        public final NotificationData.Post fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            NotificationData.Creator creator = null;
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
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Creator.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    creator = (NotificationData.Creator) objFromJson;
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new NotificationData.Post(strQ, strQ2, str, creator);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Post value) {
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
            writer.t0("creator");
            sv0 sv0VarC = k8.c(Creator.INSTANCE, false);
            NotificationData.Creator creator = value.getCreator();
            if (creator == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, creator);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Quote;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Quote;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Quote;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Quote;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Quote implements c8 {
        public static final Quote INSTANCE = new Quote();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private Quote() {
        }

        @Override // defpackage.c8
        public final NotificationData.Quote fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new NotificationData.Quote(strQ, strQ2, highlightDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Quote value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$RollupItem;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$RollupItem;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$RollupItem;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$RollupItem;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class RollupItem implements c8 {
        public static final RollupItem INSTANCE = new RollupItem();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "notificationName");

        private RollupItem() {
        }

        @Override // defpackage.c8
        public final NotificationData.RollupItem fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new NotificationData.RollupItem(strQ, strQ2);
            }
            kng.L(reader, "notificationName");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.RollupItem value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("notificationName");
            fa4Var.toJson(writer, customScalarAdapters, value.getNotificationName());
        }
    }

    private NotificationDataImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$Avatar;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$Avatar;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$Avatar;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$Avatar;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Avatar implements c8 {
        public static final Avatar INSTANCE = new Avatar();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private Avatar() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.Avatar value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }

        @Override // defpackage.c8
        public final NotificationData.Avatar fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 != 0) {
                    if (iN0 != 1) {
                        break;
                    }
                    fa4 fa4Var = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else {
                    fa4 fa4Var2 = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                }
            }
            if (strQ != null) {
                if (strQ2 != null) {
                    return new NotificationData.Avatar(strQ, strQ2);
                }
                kng.L(reader, "id");
                throw null;
            }
            kng.L(reader, MaAxRJinch.kodiRrQPNXnrQJp);
            throw null;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$NotificationData;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class NotificationData implements c8 {
        public static final NotificationData INSTANCE = new NotificationData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "notificationName", "notificationType", "isUnread", "occurredAt", "milestoneArg", "post", "responsePost", "quote", "actor", "catalog", "collection", "rollupItems");

        private NotificationData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.NotificationData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Long l;
            Object objFromJson;
            Object objFromJson2;
            Object objFromJson3;
            Object objFromJson4;
            Object objFromJson5;
            Object objFromJson6;
            Object objFromJson7;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            Long lValueOf = null;
            Integer num = null;
            NotificationData.Post post = null;
            NotificationData.ResponsePost responsePost = null;
            NotificationData.Quote quote = null;
            NotificationData.Actor actor = null;
            NotificationData.Catalog catalog = null;
            NotificationData.Collection collection = null;
            List list = null;
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
                        fa4 fa4Var3 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        continue;
                    case 3:
                        fa4 fa4Var4 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 4:
                        fa4 fa4Var5 = k8.a;
                        lValueOf = Long.valueOf(reader.nextLong());
                        boolValueOf = boolValueOf;
                        continue;
                    case 5:
                        num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                        continue;
                    case 6:
                        bool = boolValueOf;
                        l = lValueOf;
                        sv0 sv0VarC = k8.c(Post.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        post = (NotificationData.Post) objFromJson;
                        break;
                    case 7:
                        bool = boolValueOf;
                        l = lValueOf;
                        sv0 sv0VarC2 = k8.c(ResponsePost.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        responsePost = (NotificationData.ResponsePost) objFromJson2;
                        break;
                    case 8:
                        bool = boolValueOf;
                        l = lValueOf;
                        sv0 sv0VarC3 = k8.c(Quote.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson3 = null;
                        } else {
                            objFromJson3 = sv0VarC3.fromJson(reader, customScalarAdapters);
                        }
                        quote = (NotificationData.Quote) objFromJson3;
                        break;
                    case 9:
                        bool = boolValueOf;
                        l = lValueOf;
                        sv0 sv0VarC4 = k8.c(Actor.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson4 = null;
                        } else {
                            objFromJson4 = sv0VarC4.fromJson(reader, customScalarAdapters);
                        }
                        actor = (NotificationData.Actor) objFromJson4;
                        break;
                    case 10:
                        bool = boolValueOf;
                        l = lValueOf;
                        sv0 sv0VarC5 = k8.c(Catalog.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson5 = null;
                        } else {
                            objFromJson5 = sv0VarC5.fromJson(reader, customScalarAdapters);
                        }
                        catalog = (NotificationData.Catalog) objFromJson5;
                        break;
                    case 11:
                        bool = boolValueOf;
                        l = lValueOf;
                        sv0 sv0VarC6 = k8.c(Collection.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson6 = null;
                        } else {
                            objFromJson6 = sv0VarC6.fromJson(reader, customScalarAdapters);
                        }
                        collection = (NotificationData.Collection) objFromJson6;
                        break;
                    case 12:
                        bool = boolValueOf;
                        l = lValueOf;
                        zm7 zm7Var = new zm7(k8.c(RollupItem.INSTANCE, false));
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson7 = null;
                        } else {
                            objFromJson7 = zm7Var.fromJson(reader, customScalarAdapters);
                        }
                        list = (List) objFromJson7;
                        break;
                    default:
                        Boolean bool2 = boolValueOf;
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "notificationName");
                            throw null;
                        }
                        if (strQ3 == null) {
                            kng.L(reader, "notificationType");
                            throw null;
                        }
                        if (bool2 == null) {
                            kng.L(reader, "isUnread");
                            throw null;
                        }
                        Long l2 = lValueOf;
                        boolean zBooleanValue = bool2.booleanValue();
                        if (l2 != null) {
                            return new com.medium.android.graphql.fragment.NotificationData(strQ, strQ2, strQ3, zBooleanValue, l2.longValue(), num, post, responsePost, quote, actor, catalog, collection, list);
                        }
                        kng.L(reader, "occurredAt");
                        throw null;
                }
                boolValueOf = bool;
                lValueOf = l;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.NotificationData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("notificationName");
            fa4Var.toJson(writer, customScalarAdapters, value.getNotificationName());
            writer.t0(peNPu.DQmrqN);
            fa4Var.toJson(writer, customScalarAdapters, value.getNotificationType());
            writer.t0("isUnread");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isUnread()));
            writer.t0("occurredAt");
            k8.d.toJson(writer, customScalarAdapters, Long.valueOf(value.getOccurredAt()));
            writer.t0("milestoneArg");
            k8.i.toJson(writer, customScalarAdapters, value.getMilestoneArg());
            writer.t0("post");
            sv0 sv0VarC = k8.c(Post.INSTANCE, false);
            NotificationData.Post post = value.getPost();
            if (post == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, post);
            }
            writer.t0("responsePost");
            sv0 sv0VarC2 = k8.c(ResponsePost.INSTANCE, false);
            NotificationData.ResponsePost responsePost = value.getResponsePost();
            if (responsePost == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, responsePost);
            }
            writer.t0("quote");
            sv0 sv0VarC3 = k8.c(Quote.INSTANCE, true);
            NotificationData.Quote quote = value.getQuote();
            if (quote == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, quote);
            }
            writer.t0("actor");
            sv0 sv0VarC4 = k8.c(Actor.INSTANCE, true);
            NotificationData.Actor actor = value.getActor();
            if (actor == null) {
                writer.s0();
            } else {
                sv0VarC4.toJson(writer, customScalarAdapters, actor);
            }
            writer.t0("catalog");
            sv0 sv0VarC5 = k8.c(Catalog.INSTANCE, false);
            NotificationData.Catalog catalog = value.getCatalog();
            if (catalog == null) {
                writer.s0();
            } else {
                sv0VarC5.toJson(writer, customScalarAdapters, catalog);
            }
            writer.t0("collection");
            sv0 sv0VarC6 = k8.c(Collection.INSTANCE, false);
            NotificationData.Collection collection = value.getCollection();
            if (collection == null) {
                writer.s0();
            } else {
                sv0VarC6.toJson(writer, customScalarAdapters, collection);
            }
            writer.t0("rollupItems");
            zm7 zm7Var = new zm7(k8.c(RollupItem.INSTANCE, false));
            List<NotificationData.RollupItem> rollupItems = value.getRollupItems();
            if (rollupItems == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, rollupItems);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$ResponsePost;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ResponsePost implements c8 {
        public static final ResponsePost INSTANCE = new ResponsePost();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "content");

        private ResponsePost() {
        }

        @Override // defpackage.c8
        public final NotificationData.ResponsePost fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            NotificationData.Content content = null;
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
                    content = (NotificationData.Content) k8.c(Content.INSTANCE, false).fromJson(reader, customScalarAdapters);
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
            if (content != null) {
                return new NotificationData.ResponsePost(strQ, strQ2, content);
            }
            kng.L(reader, "content");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.ResponsePost value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0(Plbho.vdVxBakUlWWWvFS);
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("content");
            k8.c(Content.INSTANCE, false).toJson(writer, customScalarAdapters, value.getContent());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationDataImpl_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/fragment/NotificationData$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/NotificationData$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/NotificationData$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isEditor", "id");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final NotificationData.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new NotificationData.ViewerEdge(strQ, zBooleanValue, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, NotificationData.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("isEditor");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isEditor()));
            writer.t0(QFTsJPDEnO.yeusbCeDQ);
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }
}
