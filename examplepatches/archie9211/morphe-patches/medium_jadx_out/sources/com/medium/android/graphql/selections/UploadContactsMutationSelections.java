package com.medium.android.graphql.selections;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UploadContactsResult;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/UploadContactsMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__onUploadContactsSuccess", "Ljava/util/List;", "__onUnauthorized", "__onBadRequest", "__uploadContacts", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UploadContactsMutationSelections {
    public static final UploadContactsMutationSelections INSTANCE = new UploadContactsMutationSelections();
    private static final List<sx1> __onBadRequest;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __onUploadContactsSuccess;
    private static final List<sx1> __root;
    private static final List<sx1> __uploadContacts;

    private UploadContactsMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        GraphQLInt.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(GraphQLInt.type);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("contactsUploaded", rx1VarB, null, ey3Var, ey3Var, ey3Var));
        __onUploadContactsSuccess = listQ;
        List<sx1> listQ2 = d46.Q(new nx1("message", y30.i(GraphQLString.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ2;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onBadRequest = listQ3;
        List<sx1> listR = d46.R(new nx1(PqkdNGCEoxOKZk.pKugQvEyAnBM, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("UploadContactsSuccess", d46.Q("UploadContactsSuccess"), listQ), new ox1("Unauthorized", d46.Q("Unauthorized"), listQ2), new ox1("BadRequest", d46.Q("BadRequest"), listQ3));
        __uploadContacts = listR;
        UploadContactsResult.INSTANCE.getClass();
        rx1 rx1VarB2 = kyd.b(UploadContactsResult.type);
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__uploadContacts_input;
        mx1Var.getClass();
        __root = d46.Q(new nx1("uploadContacts", rx1VarB2, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR));
    }
}
