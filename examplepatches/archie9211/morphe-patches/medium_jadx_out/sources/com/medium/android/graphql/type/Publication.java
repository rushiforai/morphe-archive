package com.medium.android.graphql.type;

import defpackage.d46;
import defpackage.ey3;
import defpackage.gy2;
import defpackage.mx1;
import defpackage.sm8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/type/Publication;", "", "<init>", "()V", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Publication {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private static final mx1 __featuredPostsConnection_first = new mx1("first", false);
    private static final mx1 __featuredPostsConnection_after = new mx1("after", false);
    private static final mx1 __featuredPostsConnection_opts = new mx1("opts", false);
    private static final mx1 __postsConnection_first = new mx1("first", false);
    private static final mx1 __postsConnection_after = new mx1("after", false);
    private static final mx1 __postsConnection_filter = new mx1("filter", false);
    private static final mx1 __publicationPostsConnection_first = new mx1("first", false);
    private static final mx1 __publicationPostsConnection_after = new mx1("after", false);
    private static final mx1 __publicationPostsConnection_orderBy = new mx1("orderBy", false);
    private static final mx1 __publicationPostsConnection_filter = new mx1("filter", false);
    private static final mx1 __popularPosts_input = new mx1("input", false);
    private static final mx1 __mastheadConnection_first = new mx1("first", false);
    private static final mx1 __mastheadConnection_after = new mx1("after", false);
    private static final mx1 __mastheadConnection_opts = new mx1("opts", false);
    private static final mx1 __userEdge_userId = new mx1("userId", false);
    private static final sm8 type = new sm8("Publication", d46.Q("id"), ey3.a);

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b \n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0006\u001a\u0004\b\n\u0010\bR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0006\u001a\u0004\b\f\u0010\bR\u0017\u0010\r\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0006\u001a\u0004\b\u000e\u0010\bR\u0017\u0010\u000f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0006\u001a\u0004\b\u0010\u0010\bR\u0017\u0010\u0011\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0006\u001a\u0004\b\u0012\u0010\bR\u0017\u0010\u0013\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0006\u001a\u0004\b\u0014\u0010\bR\u0017\u0010\u0015\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0006\u001a\u0004\b\u0016\u0010\bR\u0017\u0010\u0017\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0006\u001a\u0004\b\u0018\u0010\bR\u0017\u0010\u0019\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u0006\u001a\u0004\b\u001a\u0010\bR\u0017\u0010\u001b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001b\u0010\u0006\u001a\u0004\b\u001c\u0010\bR\u0017\u0010\u001d\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001d\u0010\u0006\u001a\u0004\b\u001e\u0010\bR\u0017\u0010\u001f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001f\u0010\u0006\u001a\u0004\b \u0010\bR\u0017\u0010!\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b!\u0010\u0006\u001a\u0004\b\"\u0010\bR\u0017\u0010#\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b#\u0010\u0006\u001a\u0004\b$\u0010\bR\u0017\u0010&\u001a\u00020%8\u0006¢\u0006\f\n\u0004\b&\u0010'\u001a\u0004\b(\u0010)¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/type/Publication$Companion;", "", "<init>", "()V", "Lmx1;", "__featuredPostsConnection_first", "Lmx1;", "get__featuredPostsConnection_first", "()Lmx1;", "__featuredPostsConnection_after", "get__featuredPostsConnection_after", "__featuredPostsConnection_opts", "get__featuredPostsConnection_opts", "__postsConnection_first", "get__postsConnection_first", "__postsConnection_after", "get__postsConnection_after", "__postsConnection_filter", "get__postsConnection_filter", "__publicationPostsConnection_first", "get__publicationPostsConnection_first", "__publicationPostsConnection_after", "get__publicationPostsConnection_after", "__publicationPostsConnection_orderBy", "get__publicationPostsConnection_orderBy", "__publicationPostsConnection_filter", "get__publicationPostsConnection_filter", "__popularPosts_input", "get__popularPosts_input", "__mastheadConnection_first", "get__mastheadConnection_first", "__mastheadConnection_after", "get__mastheadConnection_after", "__mastheadConnection_opts", "get__mastheadConnection_opts", "__userEdge_userId", "get__userEdge_userId", "Lsm8;", "type", "Lsm8;", "getType", "()Lsm8;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final sm8 getType() {
            return Publication.type;
        }

        public final mx1 get__featuredPostsConnection_after() {
            return Publication.__featuredPostsConnection_after;
        }

        public final mx1 get__featuredPostsConnection_first() {
            return Publication.__featuredPostsConnection_first;
        }

        public final mx1 get__featuredPostsConnection_opts() {
            return Publication.__featuredPostsConnection_opts;
        }

        public final mx1 get__mastheadConnection_after() {
            return Publication.__mastheadConnection_after;
        }

        public final mx1 get__mastheadConnection_first() {
            return Publication.__mastheadConnection_first;
        }

        public final mx1 get__mastheadConnection_opts() {
            return Publication.__mastheadConnection_opts;
        }

        public final mx1 get__popularPosts_input() {
            return Publication.__popularPosts_input;
        }

        public final mx1 get__postsConnection_after() {
            return Publication.__postsConnection_after;
        }

        public final mx1 get__postsConnection_filter() {
            return Publication.__postsConnection_filter;
        }

        public final mx1 get__postsConnection_first() {
            return Publication.__postsConnection_first;
        }

        public final mx1 get__publicationPostsConnection_after() {
            return Publication.__publicationPostsConnection_after;
        }

        public final mx1 get__publicationPostsConnection_filter() {
            return Publication.__publicationPostsConnection_filter;
        }

        public final mx1 get__publicationPostsConnection_first() {
            return Publication.__publicationPostsConnection_first;
        }

        public final mx1 get__publicationPostsConnection_orderBy() {
            return Publication.__publicationPostsConnection_orderBy;
        }

        public final mx1 get__userEdge_userId() {
            return Publication.__userEdge_userId;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
