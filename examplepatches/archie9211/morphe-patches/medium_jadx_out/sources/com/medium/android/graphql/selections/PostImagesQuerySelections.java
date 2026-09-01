package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.ImageMetadataDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.ImageMetadata;
import com.medium.android.graphql.type.Paragraph;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostContent;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RichText;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.n04;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/PostImagesQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__metadata", "Ljava/util/List;", "__paragraphs", "__bodyModel", "__content", "__post", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostImagesQuerySelections {
    public static final PostImagesQuerySelections INSTANCE = new PostImagesQuerySelections();
    private static final List<sx1> __bodyModel;
    private static final List<sx1> __content;
    private static final List<sx1> __metadata;
    private static final List<sx1> __paragraphs;
    private static final List<sx1> __post;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("ImageMetadata");
        List<sx1> list = ImageMetadataDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "ImageMetadata", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __metadata = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        ParagraphType.INSTANCE.getClass();
        n04 n04Var = ParagraphType.type;
        n04Var.getClass();
        nx1 nx1Var3 = new nx1("type", n04Var, null, ey3Var, ey3Var, ey3Var);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var = ImageMetadata.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, nx1Var3, new nx1("metadata", sm8Var, null, ey3Var, ey3Var, listR));
        __paragraphs = listR2;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Paragraph.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var4, new nx1("paragraphs", new rx1(new px1(kyd.b(Paragraph.type))), null, ey3Var, ey3Var, listR2));
        __bodyModel = listR3;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RichText.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var5, new nx1("bodyModel", kyd.b(RichText.type), null, ey3Var, ey3Var, listR3));
        __content = listR4;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PostContent.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(PostContent.type);
        Post.INSTANCE.getClass();
        mx1 mx1Var = Post.__content_postMeteringOptions;
        mx1Var.getClass();
        List<sx1> listR5 = d46.R(nx1Var6, new nx1("content", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("postMeteringOptions"))), listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR5;
        sm8 sm8Var2 = Post.type;
        sm8Var2.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var2 = Query.__post_id;
        mx1Var2.getClass();
        __root = d46.Q(new nx1("post", sm8Var2, null, ey3Var, ka1.y(mx1Var2, new yv8(new tx1("postId"))), listR5));
    }

    private PostImagesQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
