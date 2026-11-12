.class public final Lyl6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyl6;->a:Landroid/content/Context;

    iput-object p2, p0, Lyl6;->b:Lumi;

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "default_browser"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lyl6;->c:Lb59;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-object p0, p0, Lyl6;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Z
    .registers 4

    const-string v0, "HUAWEI"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    return v1

    :cond_c
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_DEFAULT_APPS_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :try_start_13
    iget-object p0, p0, Lyl6;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/high16 v2, 0x10000

    invoke-virtual {p0, v0, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p0
    :try_end_1f
    .catch Ljava/lang/NullPointerException; {:try_start_13 .. :try_end_1f} :catch_23

    if-eqz p0, :cond_23

    const/4 p0, 0x1

    return p0

    :catch_23
    :cond_23
    return v1
.end method

.method public final c()Z
    .registers 4

    iget-object v0, p0, Lyl6;->a:Landroid/content/Context;

    const-string v1, "role"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/role/RoleManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    const-string v2, "android.app.role.BROWSER"

    invoke-virtual {v0, v2}, Landroid/app/role/RoleManager;->isRoleAvailable(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object p0, p0, Lyl6;->c:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "role_auto_denied"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_27

    const/4 p0, 0x1

    return p0

    :cond_27
    return v1
.end method

.method public final d()Lsl6;
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lyl6;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->k()Lsl6;

    move-result-object p0

    return-object p0
.end method

.method public final e(Loi;Ljava/lang/Runnable;)V
    .registers 11

    invoke-virtual {p0}, Lyl6;->c()Z

    move-result v0

    iget-object v1, p0, Lyl6;->a:Landroid/content/Context;

    if-eqz v0, :cond_29

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const-string v0, "role"

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/role/RoleManager;

    const-string v1, "android.app.role.BROWSER"

    invoke-virtual {v0, v1}, Landroid/app/role/RoleManager;->createRequestRoleIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    new-instance v2, Lwl6;

    move-object v3, p0

    move-object v7, p1

    move-object v6, p2

    invoke-direct/range {v2 .. v7}, Lwl6;-><init>(Lyl6;JLjava/lang/Runnable;Loi;)V

    move-object p1, v7

    check-cast p1, Lhjf;

    invoke-virtual {p1, v0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void

    :cond_29
    move-object v3, p0

    invoke-virtual {v3}, Lyl6;->b()Z

    move-result p0

    if-eqz p0, :cond_54

    new-instance p0, Landroid/content/Intent;

    const-string p1, "android.settings.MANAGE_DEFAULT_APPS_SETTINGS"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 p1, 0x50000000

    invoke-virtual {p0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string p1, ":settings:fragment_args_key"

    const-string p2, "default_browser"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, ":settings:show_fragment_args"

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    :try_start_50
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_53
    .catch Landroid/content/ActivityNotFoundException; {:try_start_50 .. :try_end_53} :catch_53

    :catch_53
    return-void

    :cond_54
    invoke-static {}, Lsl6;->a()Landroid/content/Intent;

    move-result-object p0

    const-string p1, "com.opera.android.extra.DO_NOT_OPEN_TAB"

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.opera.android.extra.DO_NOT_INTERCEPT"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final f()Z
    .registers 2

    invoke-virtual {p0}, Lyl6;->g()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lyl6;->d()Lsl6;

    move-result-object p0

    invoke-virtual {p0}, Lsl6;->b()Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 3

    invoke-static {}, Ltl6;->a()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Lyl6;->a()Z

    move-result v0

    if-nez v0, :cond_e

    :cond_d
    return v1

    :cond_e
    invoke-virtual {p0}, Lyl6;->c()Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Lyl6;->b()Z

    move-result p0

    if-nez p0, :cond_1b

    return v1

    :cond_1b
    const/4 p0, 0x1

    return p0
.end method

.method public final h(Lx5f;)V
    .registers 5

    new-instance v0, Luk6;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Luk6;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lyl6;->b:Lumi;

    invoke-virtual {p0, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, Lxl6;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lxl6;-><init>(Lx5f;B)V

    invoke-virtual {p0, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final i(Lorm;Lvb0;Lac0;ZLjava/lang/String;)V
    .registers 15

    const-wide/16 v0, 0x0

    iget-object v2, p0, Lyl6;->c:Lb59;

    const-string v3, "non_manual_shown_count"

    if-nez p4, :cond_28

    sget-object p4, Lac0;->c:Lac0;

    if-eq p3, p4, :cond_28

    sget-object p4, Lac0;->f:Lac0;

    if-eq p3, p4, :cond_28

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/content/SharedPreferences;

    invoke-interface {p4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {p4, v3, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    invoke-interface {v4, v3, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p4

    invoke-interface {p4}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_28
    invoke-static {}, Ltl6;->a()Z

    move-result p4

    if-nez p4, :cond_30

    const/4 p4, 0x0

    goto :goto_48

    :cond_30
    invoke-virtual {p0}, Lyl6;->d()Lsl6;

    move-result-object p4

    invoke-virtual {p4}, Lsl6;->b()Z

    move-result v4

    if-eqz v4, :cond_3d

    sget-object p4, Lkb0;->b:Lkb0;

    goto :goto_48

    :cond_3d
    invoke-virtual {p4}, Lsl6;->c()Z

    move-result p4

    if-eqz p4, :cond_46

    sget-object p4, Lkb0;->d:Lkb0;

    goto :goto_48

    :cond_46
    sget-object p4, Lkb0;->c:Lkb0;

    :goto_48
    if-eqz p4, :cond_6e

    invoke-virtual {p0}, Lyl6;->c()Z

    move-result v4

    if-eqz v4, :cond_53

    sget-object p0, Ljb0;->d:Ljb0;

    goto :goto_5e

    :cond_53
    invoke-virtual {p0}, Lyl6;->b()Z

    move-result p0

    if-eqz p0, :cond_5c

    sget-object p0, Ljb0;->c:Ljb0;

    goto :goto_5e

    :cond_5c
    sget-object p0, Ljb0;->b:Ljb0;

    :goto_5e
    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    check-cast p1, Lx5f;

    iget-boolean v2, p1, Lx5f;->h:Z

    if-nez v2, :cond_6f

    :cond_6e
    return-void

    :cond_6f
    iget-object v2, p1, Lx5f;->d:Lzpa;

    new-instance v3, Lp56;

    const/4 v4, -0x1

    const/4 v5, 0x6

    const/16 v6, 0x98b

    invoke-direct {v3, v6, v4, v5}, Ljf0;-><init>(III)V

    const/4 v4, 0x1

    if-eqz p2, :cond_81

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_81
    invoke-virtual {v3, v4, v4, p4}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p2, 0x2

    invoke-virtual {v3, p2, v4, p3}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p2, 0x3

    invoke-virtual {v3, p2, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p0, 0x4

    invoke-virtual {v3, p0, v4, v0, v1}, Ljf0;->p(IIJ)V

    if-eqz p5, :cond_96

    const/4 p0, 0x5

    invoke-virtual {v3, p0, v4, p5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_96
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p2

    invoke-virtual {p2, v2}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    const/16 p3, 0xa

    invoke-virtual {p2, p3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/List;

    if-eqz p4, :cond_b8

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_b8

    new-instance p5, Lhf0;

    invoke-direct {p5, p2, p3, p4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_c1

    :cond_b8
    invoke-static {p2, p3, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object p4

    new-instance p5, Lhf0;

    invoke-direct {p5, p2, p3, p4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_c1
    invoke-virtual {p5, v3}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, p0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final j()V
    .registers 3

    iget-object p0, p0, Lyl6;->c:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "has_been_default_browser_previously"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "default_browser_removal_time"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final k()Z
    .registers 4

    invoke-virtual {p0}, Lyl6;->d()Lsl6;

    move-result-object v0

    invoke-virtual {v0}, Lsl6;->b()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_11

    invoke-virtual {p0}, Lyl6;->a()Z

    move-result v1

    if-nez v1, :cond_12

    :cond_11
    return v2

    :cond_12
    invoke-virtual {v0}, Lsl6;->c()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1a

    return v1

    :cond_1a
    invoke-virtual {p0}, Lyl6;->c()Z

    move-result v0

    if-nez v0, :cond_27

    invoke-virtual {p0}, Lyl6;->b()Z

    move-result p0

    if-nez p0, :cond_27

    return v2

    :cond_27
    return v1
.end method
