package com.medium.android.graphql.fragment;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.graphql.fragment.DraftData;
import com.medium.android.graphql.fragment.TagDataImpl_ResponseAdapter;
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
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\b"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftDataImpl_ResponseAdapter;", "", "<init>", "()V", "DraftData", "Creator", "NewsletterV3", "Tag", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DraftDataImpl_ResponseAdapter {
    public static final DraftDataImpl_ResponseAdapter INSTANCE = new DraftDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftDataImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/DraftData$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/DraftData$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/DraftData$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "imageId", "newsletterV3");

        private Creator() {
        }

        @Override // defpackage.c8
        public final DraftData.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
            DraftData.NewsletterV3 newsletterV3 = null;
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
                    sv0 sv0VarC = k8.c(NewsletterV3.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    newsletterV3 = (DraftData.NewsletterV3) objFromJson;
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new DraftData.Creator(strQ, strQ2, str, str2, newsletterV3);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, DraftData.Creator value) {
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
            writer.t0("newsletterV3");
            sv0 sv0VarC = k8.c(NewsletterV3.INSTANCE, false);
            DraftData.NewsletterV3 newsletterV3 = value.getNewsletterV3();
            if (newsletterV3 == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, newsletterV3);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftDataImpl_ResponseAdapter$NewsletterV3;", "Lc8;", "Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class NewsletterV3 implements c8 {
        public static final NewsletterV3 INSTANCE = new NewsletterV3();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "subscribersCount", "id");

        private NewsletterV3() {
        }

        @Override // defpackage.c8
        public final DraftData.NewsletterV3 fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Integer num = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
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
                return new DraftData.NewsletterV3(strQ, num, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, DraftData.NewsletterV3 value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("subscribersCount");
            k8.i.toJson(writer, customScalarAdapters, value.getSubscribersCount());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftDataImpl_ResponseAdapter$Tag;", "Lc8;", "Lcom/medium/android/graphql/fragment/DraftData$Tag;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/DraftData$Tag;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/DraftData$Tag;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Tag implements c8 {
        public static final Tag INSTANCE = new Tag();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "normalizedTagSlug");

        private Tag() {
        }

        @Override // defpackage.c8
        public final DraftData.Tag fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            TagData tagDataFromJson = TagDataImpl_ResponseAdapter.TagData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new DraftData.Tag(strQ, strQ2, tagDataFromJson);
            }
            kng.L(reader, "normalizedTagSlug");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, DraftData.Tag value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("normalizedTagSlug");
            fa4Var.toJson(writer, customScalarAdapters, value.getNormalizedTagSlug());
            TagDataImpl_ResponseAdapter.TagData.INSTANCE.toJson(writer, customScalarAdapters, value.getTagData());
        }
    }

    private DraftDataImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftDataImpl_ResponseAdapter$DraftData;", "Lc8;", "Lcom/medium/android/graphql/fragment/DraftData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/DraftData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/DraftData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class DraftData implements c8 {
        public static final DraftData INSTANCE = new DraftData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", PqkdNGCEoxOKZk.sVWDcuWlp, "title", "featuredImageId", "subtitle", "curationEligible", "tags", "imageIds");

        private DraftData() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.DraftData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("creator");
            k8.c(Creator.INSTANCE, false).toJson(writer, customScalarAdapters, value.getCreator());
            writer.t0("title");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getTitle());
            writer.t0("featuredImageId");
            xl8Var.toJson(writer, customScalarAdapters, value.getFeaturedImageId());
            writer.t0("subtitle");
            xl8Var.toJson(writer, customScalarAdapters, value.getSubtitle());
            writer.t0("curationEligible");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getCurationEligible()));
            writer.t0("tags");
            sv0 sv0VarC = k8.c(Tag.INSTANCE, true);
            List<DraftData.Tag> tags = value.getTags();
            tags.getClass();
            writer.n();
            Iterator<T> it2 = tags.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
            writer.t0("imageIds");
            List<String> imageIds = value.getImageIds();
            imageIds.getClass();
            writer.n();
            Iterator<T> it3 = imageIds.iterator();
            while (it3.hasNext()) {
                fa4Var.toJson(writer, customScalarAdapters, it3.next());
            }
            writer.k();
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.DraftData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            DraftData.Creator creator = null;
            String str = null;
            String str2 = null;
            String str3 = null;
            ArrayList arrayListE = null;
            ArrayList arrayListE2 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        bool = boolValueOf;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        bool = boolValueOf;
                        creator = (DraftData.Creator) k8.c(Creator.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        break;
                    case 2:
                        bool = boolValueOf;
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        bool = boolValueOf;
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        bool = boolValueOf;
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 5:
                        fa4 fa4Var2 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 6:
                        bool = boolValueOf;
                        sv0 sv0VarC = k8.c(Tag.INSTANCE, true);
                        arrayListE = ev6.E(reader);
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
                        break;
                    case 7:
                        bool = boolValueOf;
                        fa4 fa4Var3 = k8.a;
                        arrayListE2 = ev6.E(reader);
                        while (reader.hasNext()) {
                            try {
                                String strQ2 = reader.q();
                                strQ2.getClass();
                                arrayListE2.add(strQ2);
                            } catch (ApolloGraphQLException e2) {
                                while (reader.hasNext()) {
                                    reader.v();
                                }
                                reader.k();
                                throw e2;
                            }
                        }
                        reader.k();
                        break;
                    default:
                        Boolean bool2 = boolValueOf;
                        if (strQ != null) {
                            if (creator != null) {
                                if (bool2 != null) {
                                    boolean zBooleanValue = bool2.booleanValue();
                                    if (arrayListE != null) {
                                        if (arrayListE2 != null) {
                                            return new com.medium.android.graphql.fragment.DraftData(strQ, creator, str, str2, str3, zBooleanValue, arrayListE, arrayListE2);
                                        }
                                        kng.L(reader, "imageIds");
                                        throw null;
                                    }
                                    kng.L(reader, "tags");
                                    throw null;
                                }
                                kng.L(reader, "curationEligible");
                                throw null;
                            }
                            kng.L(reader, "creator");
                            throw null;
                        }
                        kng.L(reader, peNPu.AZWtsimlMbI);
                        throw null;
                }
                boolValueOf = bool;
            }
        }
    }
}
