package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.ResponseItemDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.StreamItem;
import com.medium.android.graphql.type.StreamItemType;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/UpdateResponseMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__post", "Ljava/util/List;", "__onStreamItemPostSimpleResponse", "__itemType", "__updatePostResponse", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UpdateResponseMutationSelections {
    public static final UpdateResponseMutationSelections INSTANCE = new UpdateResponseMutationSelections();
    private static final List<sx1> __itemType;
    private static final List<sx1> __onStreamItemPostSimpleResponse;
    private static final List<sx1> __post;
    private static final List<sx1> __root;
    private static final List<sx1> __updatePostResponse;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = ResponseItemDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Post", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR;
        List<sx1> listQ2 = d46.Q(new nx1("post", ka1.m(Post.INSTANCE), null, ey3Var, ey3Var, listR));
        __onStreamItemPostSimpleResponse = listQ2;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("StreamItemPostSimpleResponse", d46.Q("StreamItemPostSimpleResponse"), listQ2));
        __itemType = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        StreamItemType.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var2, new nx1("itemType", kyd.b(StreamItemType.type), null, ey3Var, ey3Var, listR2));
        __updatePostResponse = listR3;
        StreamItem.INSTANCE.getClass();
        sm8 sm8Var = StreamItem.type;
        sm8Var.getClass();
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__updatePostResponse_deltas;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("deltas")));
        mx1 mx1Var2 = Mutation.__updatePostResponse_latestRev;
        lx1 lx1Var2 = new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "latestRev")));
        mx1 mx1Var3 = Mutation.__updatePostResponse_responseId;
        __root = d46.Q(new nx1("updatePostResponse", sm8Var, null, ey3Var, d46.R(lx1Var, lx1Var2, new lx1(mx1Var3, new yv8(ka1.d(mx1Var3, "responseId")))), listR3));
    }

    private UpdateResponseMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
