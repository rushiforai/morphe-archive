package com.medium.android.graphql.selections;

import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.LoginMethod;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RememberMeAccountHintResult;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import defpackage.zl2;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010\u0007\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/selections/RememberMeAccountHintQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onRememberMeAccountHint", "Ljava/util/List;", "__onNotFound", "__rememberMeAccountHint", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RememberMeAccountHintQuerySelections {
    public static final RememberMeAccountHintQuerySelections INSTANCE = new RememberMeAccountHintQuerySelections();
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __onRememberMeAccountHint;
    private static final List<sx1> __rememberMeAccountHint;
    private static final List<sx1> __root;

    private RememberMeAccountHintQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        zl2 zl2VarI = y30.i(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("imageId", zl2VarI, null, ey3Var, ey3Var, ey3Var);
        LoginMethod.INSTANCE.getClass();
        List<sx1> listR = d46.R(nx1Var, new nx1("loginMethod", kyd.b(LoginMethod.type), null, ey3Var, ey3Var, ey3Var), new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("obfuscatedEmail", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("userId", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onRememberMeAccountHint = listR;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("RememberMeAccountHint", d46.Q("RememberMeAccountHint"), listR), new ox1("NotFound", d46.Q("NotFound"), listQ));
        __rememberMeAccountHint = listR2;
        RememberMeAccountHintResult.INSTANCE.getClass();
        b1e b1eVar = RememberMeAccountHintResult.type;
        b1eVar.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__rememberMeAccountHint_input;
        mx1Var.getClass();
        String str = MaAxRJinch.JAFmxO;
        Map mapSingletonMap = Collections.singletonMap(str, new tx1(str));
        mapSingletonMap.getClass();
        __root = d46.Q(new nx1("rememberMeAccountHint", b1eVar, null, ey3Var, ka1.y(mx1Var, new yv8(mapSingletonMap)), listR2));
    }
}
