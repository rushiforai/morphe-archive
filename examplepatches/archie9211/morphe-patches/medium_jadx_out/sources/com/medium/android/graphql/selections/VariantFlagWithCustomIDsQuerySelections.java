package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLFloat;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.VariantFlagValueType;
import com.medium.android.graphql.type.VariantFlagWithCustomIDsResult;
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
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/selections/VariantFlagWithCustomIDsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onVariantFlagBoolean", "Ljava/util/List;", "__onVariantFlagNumber", "__onVariantFlagString", "__valueType", "__onVariantFlag", "__variantFlagWithCustomIDs", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class VariantFlagWithCustomIDsQuerySelections {
    public static final VariantFlagWithCustomIDsQuerySelections INSTANCE = new VariantFlagWithCustomIDsQuerySelections();
    private static final List<sx1> __onVariantFlag;
    private static final List<sx1> __onVariantFlagBoolean;
    private static final List<sx1> __onVariantFlagNumber;
    private static final List<sx1> __onVariantFlagString;
    private static final List<sx1> __root;
    private static final List<sx1> __valueType;
    private static final List<sx1> __variantFlagWithCustomIDs;

    static {
        rx1 rx1VarD = y30.d(GraphQLBoolean.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("value", rx1VarD, "booleanValue", ey3Var, ey3Var, ey3Var));
        __onVariantFlagBoolean = listQ;
        GraphQLFloat.INSTANCE.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("value", kyd.b(GraphQLFloat.type), "numberValue", ey3Var, ey3Var, ey3Var));
        __onVariantFlagNumber = listQ2;
        List<sx1> listQ3 = d46.Q(new nx1("value", y30.f(GraphQLString.INSTANCE), "stringValue", ey3Var, ey3Var, ey3Var));
        __onVariantFlagString = listQ3;
        List<sx1> listR = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("VariantFlagBoolean", d46.Q("VariantFlagBoolean"), listQ), new ox1("VariantFlagNumber", d46.Q("VariantFlagNumber"), listQ2), new ox1("VariantFlagString", d46.Q("VariantFlagString"), listQ3));
        __valueType = listR;
        nx1 nx1Var = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        VariantFlagValueType.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var, new nx1("valueType", kyd.b(VariantFlagValueType.type), null, ey3Var, ey3Var, listR));
        __onVariantFlag = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("VariantFlag", d46.Q("VariantFlag"), listR2));
        __variantFlagWithCustomIDs = listR3;
        VariantFlagWithCustomIDsResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(VariantFlagWithCustomIDsResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__variantFlagWithCustomIDs_input;
        mx1Var.getClass();
        __root = d46.Q(new nx1("variantFlagWithCustomIDs", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR3));
    }

    private VariantFlagWithCustomIDsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
