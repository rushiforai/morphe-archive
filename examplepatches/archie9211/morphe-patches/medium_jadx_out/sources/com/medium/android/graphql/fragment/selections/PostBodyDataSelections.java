package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Paragraph;
import com.medium.android.graphql.type.Section;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/PostBodyDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__sections", "Ljava/util/List;", "__paragraphs", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostBodyDataSelections {
    public static final PostBodyDataSelections INSTANCE = new PostBodyDataSelections();
    private static final List<sx1> __paragraphs;
    private static final List<sx1> __root;
    private static final List<sx1> __sections;

    private PostBodyDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Section");
        List<sx1> list = SectionDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Section", listQ, list));
        __sections = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Paragraph");
        List<sx1> list2 = ParagraphDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, nx1Var3, y30.c(list2, "Paragraph", listQ2, list2));
        __paragraphs = listR2;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Section.INSTANCE.getClass();
        nx1 nx1Var5 = new nx1(AEVqIoD.DyXaWaHwHT, new rx1(new px1(kyd.b(Section.type))), null, ey3Var, ey3Var, listR);
        Paragraph.INSTANCE.getClass();
        __root = d46.R(nx1Var4, nx1Var5, new nx1("paragraphs", new rx1(new px1(kyd.b(Paragraph.type))), null, ey3Var, ey3Var, listR2));
    }
}
