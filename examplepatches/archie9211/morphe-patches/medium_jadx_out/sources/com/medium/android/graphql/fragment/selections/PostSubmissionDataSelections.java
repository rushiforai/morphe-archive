package com.medium.android.graphql.fragment.selections;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.ImageMetadata;
import com.medium.android.graphql.type.PostViewerEdge;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.PublicationSubmission;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/PostSubmissionDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__avatar", "Ljava/util/List;", "__publication", "__mostRecentSubmission", "__viewerEdge", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostSubmissionDataSelections {
    public static final PostSubmissionDataSelections INSTANCE = new PostSubmissionDataSelections();
    private static final List<sx1> __avatar;
    private static final List<sx1> __mostRecentSubmission;
    private static final List<sx1> __publication;
    private static final List<sx1> __root;
    private static final List<sx1> __viewerEdge;

    private PostSubmissionDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __avatar = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var = ImageMetadata.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var, nx1Var2, new nx1("avatar", sm8Var, null, ey3Var, ey3Var, listR), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __publication = listR2;
        nx1 nx1Var3 = new nx1(aJzfoQ.PpdSSyYWlkSmTm, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PublicationSubmissionStatus.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("status", kyd.b(PublicationSubmissionStatus.type), null, ey3Var, ey3Var, ey3Var);
        Publication.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var3, nx1Var4, new nx1("publication", kyd.b(Publication.type), null, ey3Var, ey3Var, listR2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __mostRecentSubmission = listR3;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PublicationSubmission.INSTANCE.getClass();
        sm8 sm8Var2 = PublicationSubmission.type;
        sm8Var2.getClass();
        List<sx1> listR4 = d46.R(nx1Var5, new nx1("mostRecentSubmission", sm8Var2, null, ey3Var, ey3Var, listR3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR4;
        nx1 nx1Var6 = new nx1(bPUi.hRpaUzVyZyoT, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PostViewerEdge.INSTANCE.getClass();
        __root = d46.R(nx1Var6, new nx1("viewerEdge", kyd.b(PostViewerEdge.type), null, ey3Var, ey3Var, listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
    }
}
