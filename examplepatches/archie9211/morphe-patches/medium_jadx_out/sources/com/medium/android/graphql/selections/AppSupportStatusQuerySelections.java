package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.AppConfig;
import com.medium.android.graphql.type.AppConfigSupportStatus;
import com.medium.android.graphql.type.GraphQLString;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0006\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001d\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\b\u0010\u0007\u001a\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/medium/android/graphql/selections/AppSupportStatusQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__appConfig", "Ljava/util/List;", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AppSupportStatusQuerySelections {
    public static final AppSupportStatusQuerySelections INSTANCE = new AppSupportStatusQuerySelections();
    private static final List<sx1> __appConfig;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        AppConfigSupportStatus.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(AppConfigSupportStatus.type);
        AppConfig.INSTANCE.getClass();
        mx1 mx1Var = AppConfig.__supportStatus_osVersion;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("osVersion")));
        mx1 mx1Var2 = AppConfig.__supportStatus_platform;
        mx1Var2.getClass();
        lx1 lx1Var2 = new lx1(mx1Var2, new yv8("ANDROID"));
        mx1 mx1Var3 = AppConfig.__supportStatus_version;
        List<sx1> listR = d46.R(nx1Var, new nx1("supportStatus", rx1VarB, null, ey3Var, d46.R(lx1Var, lx1Var2, new lx1(mx1Var3, new yv8(ka1.d(mx1Var3, "appVersion")))), ey3Var));
        __appConfig = listR;
        __root = d46.Q(new nx1("appConfig", kyd.b(AppConfig.type), null, ey3Var, ey3Var, listR));
    }

    private AppSupportStatusQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
