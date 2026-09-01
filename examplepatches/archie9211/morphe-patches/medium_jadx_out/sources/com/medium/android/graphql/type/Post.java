package com.medium.android.graphql.type;

import defpackage.d46;
import defpackage.gy2;
import defpackage.mx1;
import defpackage.sm8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/type/Post;", "", "<init>", "()V", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Post {
    private static final sm8 type;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private static final mx1 __highlightGroup_groupId = new mx1("groupId", false);
    private static final mx1 __content_postMeteringOptions = new mx1("postMeteringOptions", false);
    private static final mx1 __reposters_after = new mx1("after", false);
    private static final mx1 __reposters_first = new mx1("first", false);
    private static final mx1 __threadedPostResponses_paging = new mx1("paging", false);
    private static final mx1 __threadedPostResponses_sortType = new mx1("sortType", false);
    private static final mx1 __voters_paging = new mx1("paging", false);
    private static final mx1 __publicationFeaturingEventsConnection_first = new mx1("first", false);
    private static final mx1 __publicationFeaturingEventsConnection_after = new mx1("after", false);

    static {
        List listQ = d46.Q("id");
        Boostable.INSTANCE.getClass();
        type = new sm8("Post", listQ, d46.Q(Boostable.type));
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0006\u001a\u0004\b\n\u0010\bR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0006\u001a\u0004\b\f\u0010\bR\u0017\u0010\r\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0006\u001a\u0004\b\u000e\u0010\bR\u0017\u0010\u000f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0006\u001a\u0004\b\u0010\u0010\bR\u0017\u0010\u0011\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0006\u001a\u0004\b\u0012\u0010\bR\u0017\u0010\u0013\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0006\u001a\u0004\b\u0014\u0010\bR\u0017\u0010\u0015\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0006\u001a\u0004\b\u0016\u0010\bR\u0017\u0010\u0017\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0006\u001a\u0004\b\u0018\u0010\bR\u0017\u0010\u001a\u001a\u00020\u00198\u0006¢\u0006\f\n\u0004\b\u001a\u0010\u001b\u001a\u0004\b\u001c\u0010\u001d¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/type/Post$Companion;", "", "<init>", "()V", "Lmx1;", "__highlightGroup_groupId", "Lmx1;", "get__highlightGroup_groupId", "()Lmx1;", "__content_postMeteringOptions", "get__content_postMeteringOptions", "__reposters_after", "get__reposters_after", "__reposters_first", "get__reposters_first", "__threadedPostResponses_paging", "get__threadedPostResponses_paging", "__threadedPostResponses_sortType", "get__threadedPostResponses_sortType", "__voters_paging", "get__voters_paging", "__publicationFeaturingEventsConnection_first", "get__publicationFeaturingEventsConnection_first", "__publicationFeaturingEventsConnection_after", "get__publicationFeaturingEventsConnection_after", "Lsm8;", "type", "Lsm8;", "getType", "()Lsm8;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final sm8 getType() {
            return Post.type;
        }

        public final mx1 get__content_postMeteringOptions() {
            return Post.__content_postMeteringOptions;
        }

        public final mx1 get__highlightGroup_groupId() {
            return Post.__highlightGroup_groupId;
        }

        public final mx1 get__publicationFeaturingEventsConnection_after() {
            return Post.__publicationFeaturingEventsConnection_after;
        }

        public final mx1 get__publicationFeaturingEventsConnection_first() {
            return Post.__publicationFeaturingEventsConnection_first;
        }

        public final mx1 get__reposters_after() {
            return Post.__reposters_after;
        }

        public final mx1 get__reposters_first() {
            return Post.__reposters_first;
        }

        public final mx1 get__threadedPostResponses_paging() {
            return Post.__threadedPostResponses_paging;
        }

        public final mx1 get__threadedPostResponses_sortType() {
            return Post.__threadedPostResponses_sortType;
        }

        public final mx1 get__voters_paging() {
            return Post.__voters_paging;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
