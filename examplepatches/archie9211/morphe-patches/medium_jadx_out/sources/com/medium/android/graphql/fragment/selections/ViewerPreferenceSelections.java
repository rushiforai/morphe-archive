package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.UserPreferenceValue;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/ViewerPreferenceSelections;", "", "<init>", "()V", "", "Lsx1;", "__onStringPreferenceValue", "Ljava/util/List;", "__onBooleanPreferenceValue", "__onIntPreferenceValue", "__onStringSetPreferenceValue", "__onEnumPreferenceValue", "__value", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ViewerPreferenceSelections {
    public static final ViewerPreferenceSelections INSTANCE = new ViewerPreferenceSelections();
    private static final List<sx1> __onBooleanPreferenceValue;
    private static final List<sx1> __onEnumPreferenceValue;
    private static final List<sx1> __onIntPreferenceValue;
    private static final List<sx1> __onStringPreferenceValue;
    private static final List<sx1> __onStringSetPreferenceValue;
    private static final List<sx1> __root;
    private static final List<sx1> __value;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("value", rx1VarF, "stringValue", ey3Var, ey3Var, ey3Var));
        __onStringPreferenceValue = listQ;
        List<sx1> listQ2 = d46.Q(new nx1("value", y30.d(GraphQLBoolean.INSTANCE), "booleanValue", ey3Var, ey3Var, ey3Var));
        __onBooleanPreferenceValue = listQ2;
        GraphQLInt.INSTANCE.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("value", kyd.b(GraphQLInt.type), "intValue", ey3Var, ey3Var, ey3Var));
        __onIntPreferenceValue = listQ3;
        List<sx1> listQ4 = d46.Q(new nx1("value", new rx1(new px1(kyd.b(GraphQLString.type))), "stringSetValue", ey3Var, ey3Var, ey3Var));
        __onStringSetPreferenceValue = listQ4;
        List<sx1> listQ5 = d46.Q(new nx1("value", kyd.b(GraphQLString.type), "enumValue", ey3Var, ey3Var, ey3Var));
        __onEnumPreferenceValue = listQ5;
        List<sx1> listR = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("StringPreferenceValue", d46.Q("StringPreferenceValue"), listQ), new ox1("BooleanPreferenceValue", d46.Q("BooleanPreferenceValue"), listQ2), new ox1("IntPreferenceValue", d46.Q("IntPreferenceValue"), listQ3), new ox1("StringSetPreferenceValue", d46.Q("StringSetPreferenceValue"), listQ4), new ox1("EnumPreferenceValue", d46.Q("EnumPreferenceValue"), listQ5));
        __value = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        UserPreferenceValue.INSTANCE.getClass();
        __root = d46.R(nx1Var, nx1Var2, new nx1("value", kyd.b(UserPreferenceValue.type), null, ey3Var, ey3Var, listR));
    }

    private ViewerPreferenceSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
