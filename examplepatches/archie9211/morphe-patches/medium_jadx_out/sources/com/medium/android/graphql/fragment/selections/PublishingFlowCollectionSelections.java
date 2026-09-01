package com.medium.android.graphql.fragment.selections;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.medium.android.graphql.type.CollectionViewerEdge;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.ImageMetadata;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.PublicationPreference;
import com.medium.android.graphql.type.PublicationPreferenceValue;
import com.medium.android.graphql.type.UserPublicationEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
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
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001d\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000e\u0010\u0007\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/PublishingFlowCollectionSelections;", "", "<init>", "()V", "", "Lsx1;", "__avatar", "Ljava/util/List;", "__viewerEdge", "__userEdge", "__onEnumPreferenceValue", "__value", "__preferences", "__compatV3", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublishingFlowCollectionSelections {
    public static final PublishingFlowCollectionSelections INSTANCE = new PublishingFlowCollectionSelections();
    private static final List<sx1> __avatar;
    private static final List<sx1> __compatV3;
    private static final List<sx1> __onEnumPreferenceValue;
    private static final List<sx1> __preferences;
    private static final List<sx1> __root;
    private static final List<sx1> __userEdge;
    private static final List<sx1> __value;
    private static final List<sx1> __viewerEdge;

    private PublishingFlowCollectionSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __avatar = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isEditor", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("isWriter", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR2;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLBoolean.type;
        zl2Var.getClass();
        List<sx1> listR3 = d46.R(nx1Var, new nx1("canSubmit", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __userEdge = listR3;
        List<sx1> listQ = d46.Q(new nx1("value", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onEnumPreferenceValue = listQ;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("EnumPreferenceValue", d46.Q("EnumPreferenceValue"), listQ));
        __value = listR4;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PublicationPreferenceValue.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var2, nx1Var3, new nx1("value", kyd.b(PublicationPreferenceValue.type), null, ey3Var, ey3Var, listR4));
        __preferences = listR5;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        UserPublicationEdge.INSTANCE.getClass();
        sm8 sm8Var = UserPublicationEdge.type;
        sm8Var.getClass();
        Publication.INSTANCE.getClass();
        mx1 mx1Var = Publication.__userEdge_userId;
        mx1Var.getClass();
        nx1 nx1Var5 = new nx1("userEdge", sm8Var, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("userId"))), listR3);
        PublicationPreference.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var4, nx1Var5, new nx1("preferences", new rx1(new px1(kyd.b(PublicationPreference.type))), null, ey3Var, ey3Var, listR5), new nx1(kSWQKWZ.UcnlUcdu, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __compatV3 = listR6;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var8 = new nx1("name", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var9 = new nx1("slug", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var2 = ImageMetadata.type;
        sm8Var2.getClass();
        nx1 nx1Var10 = new nx1("avatar", sm8Var2, null, ey3Var, ey3Var, listR);
        CollectionViewerEdge.INSTANCE.getClass();
        __root = d46.R(nx1Var6, nx1Var7, nx1Var8, nx1Var9, nx1Var10, new nx1("viewerEdge", kyd.b(CollectionViewerEdge.type), null, ey3Var, ey3Var, listR2), new nx1("compatV3", kyd.b(Publication.type), null, ey3Var, ey3Var, listR6));
    }
}
