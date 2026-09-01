package com.medium.android.graphql.type;

import defpackage.ey3;
import defpackage.gy2;
import defpackage.mx1;
import defpackage.sm8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/type/UserReadingHistory;", "", "<init>", "()V", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserReadingHistory {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private static final mx1 __postPreviewConnection_paging = new mx1("paging", false);
    private static final sm8 type;

    static {
        ey3 ey3Var = ey3.a;
        type = new sm8("UserReadingHistory", ey3Var, ey3Var);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u0010\u000b\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/type/UserReadingHistory$Companion;", "", "<init>", "()V", "Lmx1;", "__postPreviewConnection_paging", "Lmx1;", "get__postPreviewConnection_paging", "()Lmx1;", "Lsm8;", "type", "Lsm8;", "getType", "()Lsm8;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final sm8 getType() {
            return UserReadingHistory.type;
        }

        public final mx1 get__postPreviewConnection_paging() {
            return UserReadingHistory.__postPreviewConnection_paging;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
