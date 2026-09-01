package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.yv8;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001d\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0007\u001a\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/selections/SubscribeNewsletterV3MutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__root", "Ljava/util/List;", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SubscribeNewsletterV3MutationSelections {
    public static final SubscribeNewsletterV3MutationSelections INSTANCE = new SubscribeNewsletterV3MutationSelections();
    private static final List<sx1> __root;

    private SubscribeNewsletterV3MutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        zl2 zl2VarE = ka1.e(GraphQLBoolean.INSTANCE);
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__subscribeNewsletterV3_newsletterV3Id;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1(mBTDfueQiGWRV.BmcISFiQNI)));
        mx1 mx1Var2 = Mutation.__subscribeNewsletterV3_shouldRecordConsent;
        List listR = d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "shouldRecordConsent"))));
        ey3 ey3Var = ey3.a;
        __root = d46.Q(new nx1("subscribeNewsletterV3", zl2VarE, null, ey3Var, listR, ey3Var));
    }
}
