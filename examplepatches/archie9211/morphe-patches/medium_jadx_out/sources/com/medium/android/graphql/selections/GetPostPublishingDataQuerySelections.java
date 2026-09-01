package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.DraftDataSelections;
import com.medium.android.graphql.fragment.selections.ImageMetadataDataSelections;
import com.medium.android.graphql.fragment.selections.PublishingFlowPublicationSelections;
import com.medium.android.graphql.type.DraftResult;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.ImageMetadata;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostViewerEdge;
import com.medium.android.graphql.type.PostVisibilityType;
import com.medium.android.graphql.type.PreviewContent;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.PublicationSubmission;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import com.medium.android.graphql.type.Query;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000f\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0007R\u001d\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0007\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/selections/GetPostPublishingDataQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onDraft", "Ljava/util/List;", "__onUnauthorized", "__onNotFound", "__draftResult", "__previewContent", "__previewImage", "__publication", "__mostRecentSubmission", "__viewerEdge", "__post", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetPostPublishingDataQuerySelections {
    public static final GetPostPublishingDataQuerySelections INSTANCE = new GetPostPublishingDataQuerySelections();
    private static final List<sx1> __draftResult;
    private static final List<sx1> __mostRecentSubmission;
    private static final List<sx1> __onDraft;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __post;
    private static final List<sx1> __previewContent;
    private static final List<sx1> __previewImage;
    private static final List<sx1> __publication;
    private static final List<sx1> __root;
    private static final List<sx1> __viewerEdge;

    static {
        List listQ = d46.Q("Draft");
        List<sx1> list = DraftDataSelections.INSTANCE.get__root();
        list.getClass();
        List<sx1> listQ2 = d46.Q(new ox1("Draft", listQ, list));
        __onDraft = listQ2;
        zl2 zl2VarI = y30.i(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2VarI, null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ3;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ4 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ4;
        List<sx1> listR = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Draft", d46.Q("Draft"), listQ2), new ox1("Unauthorized", d46.Q("Unauthorized"), listQ3), new ox1("NotFound", d46.Q("NotFound"), listQ4));
        __draftResult = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listR2 = d46.R(nx1Var, new nx1("subtitle", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __previewContent = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ5 = d46.Q("ImageMetadata");
        List<sx1> list2 = ImageMetadataDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var2, y30.c(list2, "ImageMetadata", listQ5, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __previewImage = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ6 = d46.Q("Publication");
        List<sx1> list3 = PublishingFlowPublicationSelections.INSTANCE.get__root();
        List<sx1> listR4 = d46.R(nx1Var3, y30.c(list3, "Publication", listQ6, list3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __publication = listR4;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PublicationSubmissionStatus.INSTANCE.getClass();
        nx1 nx1Var5 = new nx1("status", kyd.b(PublicationSubmissionStatus.type), null, ey3Var, ey3Var, ey3Var);
        Publication.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var4, nx1Var5, new nx1("publication", kyd.b(Publication.type), null, ey3Var, ey3Var, listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __mostRecentSubmission = listR5;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PublicationSubmission.INSTANCE.getClass();
        sm8 sm8Var = PublicationSubmission.type;
        sm8Var.getClass();
        List<sx1> listR6 = d46.R(nx1Var6, new nx1("mostRecentSubmission", sm8Var, null, ey3Var, ey3Var, listR5), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR6;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var8 = new nx1("title", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        PreviewContent.INSTANCE.getClass();
        sm8 sm8Var2 = PreviewContent.type;
        sm8Var2.getClass();
        nx1 nx1Var9 = new nx1("previewContent", sm8Var2, null, ey3Var, ey3Var, listR2);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var3 = ImageMetadata.type;
        sm8Var3.getClass();
        nx1 nx1Var10 = new nx1("previewImage", sm8Var3, null, ey3Var, ey3Var, listR3);
        nx1 nx1Var11 = new nx1("isPublished", ka1.e(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLBoolean.type;
        zl2Var4.getClass();
        nx1 nx1Var12 = new nx1("isPublishToEmail", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        PostVisibilityType.INSTANCE.getClass();
        nx1 nx1Var13 = new nx1("visibility", kyd.b(PostVisibilityType.type), null, ey3Var, ey3Var, ey3Var);
        PostViewerEdge.INSTANCE.getClass();
        List<sx1> listR7 = d46.R(nx1Var7, nx1Var8, nx1Var9, nx1Var10, nx1Var11, nx1Var12, nx1Var13, new nx1("viewerEdge", kyd.b(PostViewerEdge.type), null, ey3Var, ey3Var, listR6), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR7;
        DraftResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(DraftResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__draftResult_id;
        mx1Var.getClass();
        nx1 nx1Var14 = new nx1("draftResult", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("postId"))), listR);
        sm8 sm8VarM = ka1.m(Post.INSTANCE);
        mx1 mx1Var2 = Query.__post_id;
        __root = d46.R(nx1Var14, new nx1("post", sm8VarM, null, ey3Var, ka1.y(mx1Var2, new yv8(ka1.d(mx1Var2, "postId"))), listR7));
    }

    private GetPostPublishingDataQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
