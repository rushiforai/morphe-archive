package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.CodeBlockMetadata;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Iframe;
import com.medium.android.graphql.type.ImageMetadata;
import com.medium.android.graphql.type.LayoutType;
import com.medium.android.graphql.type.Markup;
import com.medium.android.graphql.type.MixtapeMetadata;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.graphql.type.SyntaxHighlightMode;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.n04;
import defpackage.nx1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/ParagraphDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__iframe", "Ljava/util/List;", "__markups", "__metadata", "__mixtapeMetadata", "__dropCapImage", "__codeBlockMetadata", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ParagraphDataSelections {
    public static final ParagraphDataSelections INSTANCE = new ParagraphDataSelections();
    private static final List<sx1> __codeBlockMetadata;
    private static final List<sx1> __dropCapImage;
    private static final List<sx1> __iframe;
    private static final List<sx1> __markups;
    private static final List<sx1> __metadata;
    private static final List<sx1> __mixtapeMetadata;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Iframe");
        List<sx1> list = IframeDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Iframe", listQ, list));
        __iframe = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Markup");
        List<sx1> list2 = MarkupDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "Markup", listQ2, list2));
        __markups = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("ImageMetadata");
        ImageMetadataDataSelections imageMetadataDataSelections = ImageMetadataDataSelections.INSTANCE;
        List<sx1> list3 = imageMetadataDataSelections.get__root();
        List<sx1> listR3 = d46.R(nx1Var3, y30.c(list3, "ImageMetadata", listQ3, list3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __metadata = listR3;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ4 = d46.Q("MixtapeMetadata");
        List<sx1> list4 = MixtapeMetadataDataSelections.INSTANCE.get__root();
        List<sx1> listR4 = d46.R(nx1Var4, y30.c(list4, "MixtapeMetadata", listQ4, list4));
        __mixtapeMetadata = listR4;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ5 = d46.Q("ImageMetadata");
        List<sx1> list5 = imageMetadataDataSelections.get__root();
        List<sx1> listR5 = d46.R(nx1Var5, y30.c(list5, "ImageMetadata", listQ5, list5), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __dropCapImage = listR5;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var7 = new nx1("lang", zl2Var, null, ey3Var, ey3Var, ey3Var);
        SyntaxHighlightMode.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var6, nx1Var7, new nx1("mode", kyd.b(SyntaxHighlightMode.type), null, ey3Var, ey3Var, ey3Var));
        __codeBlockMetadata = listR6;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var9 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var10 = new nx1("name", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var11 = new nx1("href", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        nx1 nx1Var12 = new nx1("text", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        Iframe.INSTANCE.getClass();
        sm8 sm8Var = Iframe.type;
        sm8Var.getClass();
        nx1 nx1Var13 = new nx1("iframe", sm8Var, null, ey3Var, ey3Var, listR);
        LayoutType.INSTANCE.getClass();
        n04 n04Var = LayoutType.type;
        n04Var.getClass();
        nx1 nx1Var14 = new nx1("layout", n04Var, null, ey3Var, ey3Var, ey3Var);
        Markup.INSTANCE.getClass();
        nx1 nx1Var15 = new nx1("markups", new rx1(new px1(kyd.b(Markup.type))), null, ey3Var, ey3Var, listR2);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var2 = ImageMetadata.type;
        sm8Var2.getClass();
        nx1 nx1Var16 = new nx1("metadata", sm8Var2, null, ey3Var, ey3Var, listR3);
        MixtapeMetadata.INSTANCE.getClass();
        sm8 sm8Var3 = MixtapeMetadata.type;
        sm8Var3.getClass();
        nx1 nx1Var17 = new nx1("mixtapeMetadata", sm8Var3, null, ey3Var, ey3Var, listR4);
        ParagraphType.INSTANCE.getClass();
        n04 n04Var2 = ParagraphType.type;
        n04Var2.getClass();
        nx1 nx1Var18 = new nx1("type", n04Var2, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var19 = new nx1("hasDropCap", ka1.e(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var4 = ImageMetadata.type;
        sm8Var4.getClass();
        nx1 nx1Var20 = new nx1("dropCapImage", sm8Var4, null, ey3Var, ey3Var, listR5);
        CodeBlockMetadata.INSTANCE.getClass();
        sm8 sm8Var5 = CodeBlockMetadata.type;
        sm8Var5.getClass();
        __root = d46.R(nx1Var8, nx1Var9, nx1Var10, nx1Var11, nx1Var12, nx1Var13, nx1Var14, nx1Var15, nx1Var16, nx1Var17, nx1Var18, nx1Var19, nx1Var20, new nx1("codeBlockMetadata", sm8Var5, null, ey3Var, ey3Var, listR6));
    }

    private ParagraphDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
