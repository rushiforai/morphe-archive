package com.medium.android.graphql.type;

import defpackage.d46;
import defpackage.ey3;
import defpackage.gy2;
import defpackage.mx1;
import defpackage.sm8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/type/Tag;", "", "<init>", "()V", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Tag {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private static final mx1 __curatedLists_first = new mx1("first", false);
    private static final mx1 __posts_timeRange = new mx1("timeRange", false);
    private static final mx1 __posts_sortOrder = new mx1("sortOrder", false);
    private static final mx1 __posts_first = new mx1("first", false);
    private static final mx1 __posts_after = new mx1("after", false);
    private static final sm8 type = new sm8("Tag", d46.Q("normalizedTagSlug"), ey3.a);

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0006\u001a\u0004\b\n\u0010\bR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0006\u001a\u0004\b\f\u0010\bR\u0017\u0010\r\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0006\u001a\u0004\b\u000e\u0010\bR\u0017\u0010\u000f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0006\u001a\u0004\b\u0010\u0010\bR\u0017\u0010\u0012\u001a\u00020\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/type/Tag$Companion;", "", "<init>", "()V", "Lmx1;", "__curatedLists_first", "Lmx1;", "get__curatedLists_first", "()Lmx1;", "__posts_timeRange", "get__posts_timeRange", "__posts_sortOrder", "get__posts_sortOrder", "__posts_first", "get__posts_first", "__posts_after", "get__posts_after", "Lsm8;", "type", "Lsm8;", "getType", "()Lsm8;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final sm8 getType() {
            return Tag.type;
        }

        public final mx1 get__curatedLists_first() {
            return Tag.__curatedLists_first;
        }

        public final mx1 get__posts_after() {
            return Tag.__posts_after;
        }

        public final mx1 get__posts_first() {
            return Tag.__posts_first;
        }

        public final mx1 get__posts_sortOrder() {
            return Tag.__posts_sortOrder;
        }

        public final mx1 get__posts_timeRange() {
            return Tag.__posts_timeRange;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
