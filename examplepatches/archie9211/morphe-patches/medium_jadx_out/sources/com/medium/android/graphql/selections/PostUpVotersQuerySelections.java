package com.medium.android.graphql.selections;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.medium.android.graphql.fragment.selections.CreatorPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.PagingParamsDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PageParams;
import com.medium.android.graphql.type.Paging;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.VoterConnection;
import com.medium.android.graphql.type.VoterItem;
import defpackage.b09;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0007\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/selections/PostUpVotersQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__user", "Ljava/util/List;", "__onVoterItem", "__items", "__next", "__pagingInfo", "__voters", "__onPost", "__post", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostUpVotersQuerySelections {
    public static final PostUpVotersQuerySelections INSTANCE = new PostUpVotersQuerySelections();
    private static final List<sx1> __items;
    private static final List<sx1> __next;
    private static final List<sx1> __onPost;
    private static final List<sx1> __onVoterItem;
    private static final List<sx1> __pagingInfo;
    private static final List<sx1> __post;
    private static final List<sx1> __root;
    private static final List<sx1> __user;
    private static final List<sx1> __voters;

    private PostUpVotersQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("User");
        List<sx1> list = CreatorPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "User", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR;
        List<sx1> listQ2 = d46.Q(new nx1("user", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR));
        __onVoterItem = listQ2;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("VoterItem", d46.Q("VoterItem"), listQ2));
        __items = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("PageParams");
        List<sx1> list2 = PagingParamsDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var2, y30.c(list2, "PageParams", listQ3, list2));
        __next = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("next", b09.u(PageParams.INSTANCE), null, ey3Var, ey3Var, listR3));
        __pagingInfo = listR4;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        VoterItem.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var3, new nx1("items", new rx1(new px1(kyd.b(VoterItem.type))), null, ey3Var, ey3Var, listR2), new nx1("pagingInfo", km4.v(Paging.INSTANCE), null, ey3Var, ey3Var, listR4));
        __voters = listR5;
        VoterConnection.INSTANCE.getClass();
        sm8 sm8Var = VoterConnection.type;
        sm8Var.getClass();
        Post.INSTANCE.getClass();
        mx1 mx1Var = Post.__voters_paging;
        mx1Var.getClass();
        List<sx1> listQ4 = d46.Q(new nx1("voters", sm8Var, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("paging"))), listR5));
        __onPost = listQ4;
        List<sx1> listR6 = d46.R(new nx1(aJzfoQ.wQqF, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Post", d46.Q("Post"), listQ4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR6;
        sm8 sm8Var2 = Post.type;
        sm8Var2.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var2 = Query.__post_id;
        mx1Var2.getClass();
        __root = d46.Q(new nx1("post", sm8Var2, null, ey3Var, ka1.y(mx1Var2, new yv8(new tx1("postId"))), listR6));
    }
}
