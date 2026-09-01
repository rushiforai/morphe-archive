package com.medium.android.graphql.adapter;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.graphql.AllFollowingQuery;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CollectionPreviewDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.TagData;
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
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\bÆ\u0002\u0018\u00002\u00020\u0001:\f\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000fB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "User", "OnUser", "MissionControl", "OnUserMissionControl", "Counts", "FollowingUserConnection", "User1", "FollowingCollectionConnection", "Collection", "FollowedTags", "Tag", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AllFollowingQuery_ResponseAdapter {
    public static final AllFollowingQuery_ResponseAdapter INSTANCE = new AllFollowingQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$Collection;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$Collection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$Collection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$Collection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Collection implements c8 {
        public static final Collection INSTANCE = new Collection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private Collection() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.Collection fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            CollectionPreviewData collectionPreviewDataFromJson = CollectionPreviewDataImpl_ResponseAdapter.CollectionPreviewData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new AllFollowingQuery.Collection(strQ, strQ2, collectionPreviewDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.Collection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            CollectionPreviewDataImpl_ResponseAdapter.CollectionPreviewData.INSTANCE.toJson(writer, customScalarAdapters, value.getCollectionPreviewData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("user");

        private Data() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            AllFollowingQuery.User user = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(User.INSTANCE, true);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                user = (AllFollowingQuery.User) objFromJson;
            }
            return new AllFollowingQuery.Data(user);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("user");
            sv0 sv0VarC = k8.c(User.INSTANCE, true);
            AllFollowingQuery.User user = value.getUser();
            if (user == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, user);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$FollowedTags;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$FollowedTags;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$FollowedTags;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$FollowedTags;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class FollowedTags implements c8 {
        public static final FollowedTags INSTANCE = new FollowedTags();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "tags");

        private FollowedTags() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.FollowedTags fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                    sv0 sv0VarC = k8.c(Tag.INSTANCE, true);
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
                return new AllFollowingQuery.FollowedTags(strQ, arrayList);
            }
            kng.L(reader, "tags");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.FollowedTags value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("tags");
            sv0 sv0VarC = k8.c(Tag.INSTANCE, true);
            List<AllFollowingQuery.Tag> tags = value.getTags();
            tags.getClass();
            writer.n();
            Iterator<T> it2 = tags.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$FollowingCollectionConnection;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$FollowingCollectionConnection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$FollowingCollectionConnection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$FollowingCollectionConnection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class FollowingCollectionConnection implements c8 {
        public static final FollowingCollectionConnection INSTANCE = new FollowingCollectionConnection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "collections");

        private FollowingCollectionConnection() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.FollowingCollectionConnection fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                    sv0 sv0VarC = k8.c(Collection.INSTANCE, true);
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
                return new AllFollowingQuery.FollowingCollectionConnection(strQ, arrayList);
            }
            kng.L(reader, "collections");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.FollowingCollectionConnection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("collections");
            sv0 sv0VarC = k8.c(Collection.INSTANCE, true);
            List<AllFollowingQuery.Collection> collections = value.getCollections();
            collections.getClass();
            writer.n();
            Iterator<T> it2 = collections.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$FollowingUserConnection;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$FollowingUserConnection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$FollowingUserConnection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$FollowingUserConnection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class FollowingUserConnection implements c8 {
        public static final FollowingUserConnection INSTANCE = new FollowingUserConnection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "users");

        private FollowingUserConnection() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.FollowingUserConnection fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                    sv0 sv0VarC = k8.c(User1.INSTANCE, true);
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
                return new AllFollowingQuery.FollowingUserConnection(strQ, arrayList);
            }
            kng.L(reader, "users");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.FollowingUserConnection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("users");
            sv0 sv0VarC = k8.c(User1.INSTANCE, true);
            List<AllFollowingQuery.User1> users = value.getUsers();
            users.getClass();
            writer.n();
            Iterator<T> it2 = users.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$MissionControl;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$MissionControl;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$MissionControl;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$MissionControl;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class MissionControl implements c8 {
        public static final MissionControl INSTANCE = new MissionControl();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private MissionControl() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.MissionControl fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            AllFollowingQuery.OnUserMissionControl onUserMissionControlFromJson = OnUserMissionControl.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new AllFollowingQuery.MissionControl(strQ, onUserMissionControlFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.MissionControl value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            OnUserMissionControl.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUserMissionControl());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$OnUser;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$OnUser;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$OnUser;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$OnUser;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUser implements c8 {
        public static final OnUser INSTANCE = new OnUser();
        private static final List<String> RESPONSE_NAMES = d46.R("missionControl", "followingUserConnection", "followingCollectionConnection", "followedTags");

        private OnUser() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.OnUser fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            Object objFromJson2;
            Object objFromJson3;
            Object objFromJson4;
            reader.getClass();
            customScalarAdapters.getClass();
            AllFollowingQuery.MissionControl missionControl = null;
            AllFollowingQuery.FollowingUserConnection followingUserConnection = null;
            AllFollowingQuery.FollowingCollectionConnection followingCollectionConnection = null;
            AllFollowingQuery.FollowedTags followedTags = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    sv0 sv0VarC = k8.c(MissionControl.INSTANCE, true);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson4 = null;
                    } else {
                        objFromJson4 = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    missionControl = (AllFollowingQuery.MissionControl) objFromJson4;
                } else if (iN0 == 1) {
                    sv0 sv0VarC2 = k8.c(FollowingUserConnection.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson3 = null;
                    } else {
                        objFromJson3 = sv0VarC2.fromJson(reader, customScalarAdapters);
                    }
                    followingUserConnection = (AllFollowingQuery.FollowingUserConnection) objFromJson3;
                } else if (iN0 == 2) {
                    sv0 sv0VarC3 = k8.c(FollowingCollectionConnection.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson2 = null;
                    } else {
                        objFromJson2 = sv0VarC3.fromJson(reader, customScalarAdapters);
                    }
                    followingCollectionConnection = (AllFollowingQuery.FollowingCollectionConnection) objFromJson2;
                } else {
                    if (iN0 != 3) {
                        return new AllFollowingQuery.OnUser(missionControl, followingUserConnection, followingCollectionConnection, followedTags);
                    }
                    sv0 sv0VarC4 = k8.c(FollowedTags.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC4.fromJson(reader, customScalarAdapters);
                    }
                    followedTags = (AllFollowingQuery.FollowedTags) objFromJson;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.OnUser value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("missionControl");
            sv0 sv0VarC = k8.c(MissionControl.INSTANCE, true);
            AllFollowingQuery.MissionControl missionControl = value.getMissionControl();
            if (missionControl == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, missionControl);
            }
            writer.t0("followingUserConnection");
            sv0 sv0VarC2 = k8.c(FollowingUserConnection.INSTANCE, false);
            AllFollowingQuery.FollowingUserConnection followingUserConnection = value.getFollowingUserConnection();
            if (followingUserConnection == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, followingUserConnection);
            }
            writer.t0("followingCollectionConnection");
            sv0 sv0VarC3 = k8.c(FollowingCollectionConnection.INSTANCE, false);
            AllFollowingQuery.FollowingCollectionConnection followingCollectionConnection = value.getFollowingCollectionConnection();
            if (followingCollectionConnection == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, followingCollectionConnection);
            }
            writer.t0("followedTags");
            sv0 sv0VarC4 = k8.c(FollowedTags.INSTANCE, false);
            AllFollowingQuery.FollowedTags followedTags = value.getFollowedTags();
            if (followedTags == null) {
                writer.s0();
            } else {
                sv0VarC4.toJson(writer, customScalarAdapters, followedTags);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$OnUserMissionControl;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$OnUserMissionControl;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$OnUserMissionControl;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$OnUserMissionControl;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUserMissionControl implements c8 {
        public static final OnUserMissionControl INSTANCE = new OnUserMissionControl();
        private static final List<String> RESPONSE_NAMES = d46.Q("counts");

        private OnUserMissionControl() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.OnUserMissionControl fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            AllFollowingQuery.Counts counts = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(Counts.INSTANCE, false);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                counts = (AllFollowingQuery.Counts) objFromJson;
            }
            return new AllFollowingQuery.OnUserMissionControl(counts);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.OnUserMissionControl value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("counts");
            sv0 sv0VarC = k8.c(Counts.INSTANCE, false);
            AllFollowingQuery.Counts counts = value.getCounts();
            if (counts == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, counts);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$Tag;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$Tag;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$Tag;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$Tag;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Tag implements c8 {
        public static final Tag INSTANCE = new Tag();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "normalizedTagSlug");

        private Tag() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.Tag fromJson(fd6 reader, yl2 customScalarAdapters) {
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
                return new AllFollowingQuery.Tag(strQ, strQ2, tagDataFromJson);
            }
            kng.L(reader, "normalizedTagSlug");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.Tag value) {
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

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$User;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$User;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$User;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$User;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class User implements c8 {
        public static final User INSTANCE = new User();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private User() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.User fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            AllFollowingQuery.OnUser onUserFromJson = OnUser.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new AllFollowingQuery.User(strQ, strQ2, onUserFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.User value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            OnUser.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUser());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$User1;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$User1;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$User1;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$User1;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class User1 implements c8 {
        public static final User1 INSTANCE = new User1();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id");

        private User1() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.User1 fromJson(fd6 reader, yl2 customScalarAdapters) {
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
            CreatorPreviewData creatorPreviewDataFromJson = CreatorPreviewDataImpl_ResponseAdapter.CreatorPreviewData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new AllFollowingQuery.User1(strQ, strQ2, creatorPreviewDataFromJson);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.User1 value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            CreatorPreviewDataImpl_ResponseAdapter.CreatorPreviewData.INSTANCE.toJson(writer, customScalarAdapters, value.getCreatorPreviewData());
        }
    }

    private AllFollowingQuery_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AllFollowingQuery_ResponseAdapter$Counts;", "Lc8;", "Lcom/medium/android/graphql/AllFollowingQuery$Counts;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AllFollowingQuery$Counts;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AllFollowingQuery$Counts;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Counts implements c8 {
        public static final Counts INSTANCE = new Counts();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "followedAuthors", "followedCollections", "followedTags");

        private Counts() {
        }

        @Override // defpackage.c8
        public final AllFollowingQuery.Counts fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Integer num = null;
            Integer num2 = null;
            Integer num3 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    num2 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    num3 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ != null) {
                return new AllFollowingQuery.Counts(strQ, num, num2, num3);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AllFollowingQuery.Counts value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("followedAuthors");
            xl8 xl8Var = k8.i;
            xl8Var.toJson(writer, customScalarAdapters, value.getFollowedAuthors());
            writer.t0("followedCollections");
            xl8Var.toJson(writer, customScalarAdapters, value.getFollowedCollections());
            writer.t0(ZVsviyDAr.MVcCIjfnJP);
            xl8Var.toJson(writer, customScalarAdapters, value.getFollowedTags());
        }
    }
}
