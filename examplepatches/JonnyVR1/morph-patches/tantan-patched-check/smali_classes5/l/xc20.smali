.class public Ll/xc20;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/d0;->T:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/d0;->T:Ll/jxd0;

    .line 24
    .line 25
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-static {p0, p1}, Ll/xc20;->x(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/lang/Double;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/xc20;->w(Ljava/lang/Double;Ljava/lang/Runnable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic f()Ljava/lang/Double;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 12
    .line 13
    return-object v0
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "id_verification_age_check_button"

    .line 2
    .line 3
    const-string v0, "update"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_id_verification_age_check_input"

    .line 14
    .line 15
    const-string v1, "p_id_verification_age_check_input_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Ll/xc20;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic h(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    const-string p0, "id_verification_age_check_button"

    .line 7
    .line 8
    const-string p1, "make_sure"

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "e_id_verification_age_check_update"

    .line 19
    .line 20
    const-string v0, "p_id_verification_age_check_update_popup"

    .line 21
    .line 22
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic j(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p0, "id_verification_age_check_button"

    .line 2
    .line 3
    const-string v0, "give_up"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_id_verification_age_check_input"

    .line 14
    .line 15
    const-string v1, "p_id_verification_age_check_input_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->T:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic m(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p0, "id_verification_age_check_button"

    .line 2
    .line 3
    const-string v0, "not_update"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_id_verification_age_check_update"

    .line 14
    .line 15
    const-string v1, "p_id_verification_age_check_update_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic n(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/yc2;->d()Lcom/p1/mobile/putong/data/IdCard;

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/tc20;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/tc20;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/uc20;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/uc20;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/vc20;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/vc20;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->I1(Lcom/p1/mobile/android/app/Act;Ll/pcj;Ll/y20;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static p(Ljava/lang/String;)Z
    .locals 8

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v2, 0xf

    .line 13
    .line 14
    if-ge v0, v2, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    const/4 v0, 0x6

    .line 18
    const/16 v2, 0xa

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/16 v3, 0xc

    .line 29
    .line 30
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/16 v4, 0xe

    .line 39
    .line 40
    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v4

    .line 56
    invoke-virtual {v3, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 57
    .line 58
    .line 59
    const/4 v4, 0x1

    .line 60
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    const/4 v6, 0x2

    .line 65
    invoke-virtual {v3, v6}, Ljava/util/Calendar;->get(I)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    add-int/2addr v6, v4

    .line 70
    const/4 v7, 0x5

    .line 71
    invoke-virtual {v3, v7}, Ljava/util/Calendar;->get(I)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-lt v2, v6, :cond_2

    .line 76
    .line 77
    if-ne v2, v6, :cond_1

    .line 78
    .line 79
    if-gt p0, v3, :cond_1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    sub-int/2addr v5, v0

    .line 83
    sub-int/2addr v5, v4

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    :goto_0
    sub-int/2addr v5, v0

    .line 86
    :goto_1
    const/16 p0, 0x12

    .line 87
    .line 88
    if-lt v5, p0, :cond_3

    .line 89
    .line 90
    return v4

    .line 91
    :cond_3
    return v1

    .line 92
    :catch_0
    move-exception p0

    .line 93
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    :cond_4
    :goto_2
    return v1
.end method

.method public static q(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0xf

    .line 12
    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x6

    .line 17
    const/16 v1, 0xe

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    :goto_0
    const-string p0, "empty"

    .line 25
    .line 26
    return-object p0
.end method

.method public static r(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Ll/x20;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v1, 0x9c49

    .line 11
    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "p_id_verification_age_check_update_popup"

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "tooltips_trigger_mode"

    .line 28
    .line 29
    const-string v1, "passive"

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/th0$a;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    sget v1, Lcom/p1/mobile/putong/core/R$string;->U7:I

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget v1, Lcom/p1/mobile/putong/core/R$string;->W7:I

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance v1, Ll/qc20;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/qc20;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget v1, Lcom/p1/mobile/putong/core/R$string;->V7:I

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance v1, Ll/rc20;

    .line 79
    .line 80
    invoke-direct {v1, p1}, Ll/rc20;-><init>(Ll/l4g0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance v1, Ll/sc20;

    .line 88
    .line 89
    invoke-direct {v1, p2}, Ll/sc20;-><init>(Ll/x20;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 100
    .line 101
    .line 102
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_0
    invoke-static {p1}, Ll/ey6;->a(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public static s(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Server;

    .line 2
    .line 3
    const-string v1, "verification_type"

    .line 4
    .line 5
    const-string v2, "verification_result_code"

    .line 6
    .line 7
    const-string v3, "sdk_name"

    .line 8
    .line 9
    const-string v4, "p_profile_picture_verification_pageShow"

    .line 10
    .line 11
    const-string v5, "e_verification_scanface_token"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Bh:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 18
    .line 19
    .line 20
    invoke-static {v3, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p1, Lcom/tantanapp/common/network/ApiExcep$Server;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/tantanapp/common/network/ApiExcep;->response:Ll/i5d0;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/i5d0;->q()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {v1, p4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    filled-new-array {p0, p1, p2}, [Ll/sfj0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v5, v4, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 53
    .line 54
    if-eqz v0, :cond_9

    .line 55
    .line 56
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 57
    .line 58
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 59
    .line 60
    invoke-static {v3, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v1, p4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p4

    .line 76
    filled-new-array {p3, v2, p4}, [Ll/sfj0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-static {v5, v4, p3}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 84
    .line 85
    const p3, 0x9c41

    .line 86
    .line 87
    .line 88
    if-ne v0, p3, :cond_1

    .line 89
    .line 90
    const-string p0, "\u5df2\u7ecf\u8ba4\u8bc1\u5b8c\u6210"

    .line 91
    .line 92
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    const p3, 0x9c44

    .line 97
    .line 98
    .line 99
    if-ne v0, p3, :cond_2

    .line 100
    .line 101
    sget p0, Lcom/p1/mobile/putong/core/R$string;->k8:I

    .line 102
    .line 103
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    const p3, 0x9c45

    .line 108
    .line 109
    .line 110
    if-ne v0, p3, :cond_3

    .line 111
    .line 112
    sget p1, Lcom/p1/mobile/putong/core/R$string;->l8:I

    .line 113
    .line 114
    const-string p2, "5"

    .line 115
    .line 116
    const-string p3, "24"

    .line 117
    .line 118
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    const p3, 0x9c46

    .line 131
    .line 132
    .line 133
    if-ne v0, p3, :cond_4

    .line 134
    .line 135
    sget p1, Lcom/p1/mobile/putong/core/R$string;->R7:I

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {p0, p1}, Ll/xc20;->y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_4
    const p3, 0x9c47

    .line 146
    .line 147
    .line 148
    const/4 p4, 0x0

    .line 149
    if-ne v0, p3, :cond_6

    .line 150
    .line 151
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    if-nez p2, :cond_5

    .line 156
    .line 157
    const-string p2, ":"

    .line 158
    .line 159
    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    if-lez p2, :cond_5

    .line 164
    .line 165
    add-int/lit8 p2, p2, 0x1

    .line 166
    .line 167
    :try_start_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    goto :goto_0

    .line 172
    :catch_0
    move-exception p1

    .line 173
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 174
    .line 175
    .line 176
    :cond_5
    const-string p1, ""

    .line 177
    .line 178
    :goto_0
    sget p2, Lcom/p1/mobile/putong/core/R$string;->n8:I

    .line 179
    .line 180
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p0, p2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    new-instance p2, Lcom/p1/mobile/android/app/Dialog$e;

    .line 189
    .line 190
    invoke-direct {p2, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    sget p1, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->s0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-virtual {p0, p4}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_6
    const p1, 0x9c48

    .line 212
    .line 213
    .line 214
    if-ne v0, p1, :cond_7

    .line 215
    .line 216
    new-instance p1, Lcom/p1/mobile/android/app/Dialog$e;

    .line 217
    .line 218
    invoke-direct {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 219
    .line 220
    .line 221
    sget p0, Lcom/p1/mobile/putong/core/R$string;->o8:I

    .line 222
    .line 223
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    sget p1, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 228
    .line 229
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->s0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-virtual {p0, p4}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :cond_7
    const p1, 0x9c4a

    .line 242
    .line 243
    .line 244
    if-ne v0, p1, :cond_8

    .line 245
    .line 246
    sget p0, Lcom/p1/mobile/putong/core/R$string;->pr:I

    .line 247
    .line 248
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 249
    .line 250
    .line 251
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 252
    .line 253
    invoke-interface {p0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    const-string p1, "idverifivation_teenager_user_id"

    .line 258
    .line 259
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    const-string p1, "idverifivation_teenager_user_birthday"

    .line 264
    .line 265
    invoke-static {p2}, Ll/xc20;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p2

    .line 269
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    const-string p1, "e_id_verification_info_teenager_input"

    .line 278
    .line 279
    const-string p2, "p_id_verification_info_input_view"

    .line 280
    .line 281
    invoke-static {p1, p2, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :cond_8
    const p1, 0x9c4c

    .line 286
    .line 287
    .line 288
    if-ne v0, p1, :cond_9

    .line 289
    .line 290
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Js:I

    .line 291
    .line 292
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    invoke-static {p0, p1}, Ll/xc20;->y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_9
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Bh:I

    .line 301
    .line 302
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method public static t(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    new-instance v0, Ll/jc20;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jc20;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/oc20;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/oc20;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/pc20;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/pc20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static u(Ljava/lang/String;)Z
    .locals 14

    .line 1
    const/4 v1, 0x0

    .line 2
    if-eqz p0, :cond_4

    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    const-string v0, "(^[1-9]\\d{5}(18|19|20)\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}$)"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/16 v3, 0x12

    .line 26
    .line 27
    if-ne v2, v3, :cond_3

    .line 28
    .line 29
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/16 v0, 0x11

    .line 34
    .line 35
    new-array v2, v0, [I

    .line 36
    .line 37
    fill-array-data v2, :array_0

    .line 38
    .line 39
    .line 40
    const-string v3, "1"

    .line 41
    .line 42
    const-string v4, "0"

    .line 43
    .line 44
    const-string v5, "X"

    .line 45
    .line 46
    const-string v6, "9"

    .line 47
    .line 48
    const-string v7, "8"

    .line 49
    .line 50
    const-string v8, "7"

    .line 51
    .line 52
    const-string v9, "6"

    .line 53
    .line 54
    const-string v10, "5"

    .line 55
    .line 56
    const-string v11, "4"

    .line 57
    .line 58
    const-string v12, "3"

    .line 59
    .line 60
    const-string v13, "2"

    .line 61
    .line 62
    filled-new-array/range {v3 .. v13}, [Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    move v4, v1

    .line 67
    move v5, v4

    .line 68
    :goto_0
    if-ge v4, v0, :cond_1

    .line 69
    .line 70
    aget-char v6, p0, v4

    .line 71
    .line 72
    invoke-static {v6}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    aget v7, v2, v4

    .line 81
    .line 82
    mul-int/2addr v6, v7

    .line 83
    add-int/2addr v5, v6

    .line 84
    add-int/lit8 v4, v4, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    .line 88
    move-object p0, v0

    .line 89
    goto :goto_1

    .line 90
    :cond_1
    aget-char p0, p0, v0

    .line 91
    .line 92
    rem-int/lit8 v5, v5, 0xb

    .line 93
    .line 94
    aget-object v0, v3, v5

    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    if-eqz p0, :cond_2

    .line 113
    .line 114
    const/4 p0, 0x1

    .line 115
    return p0

    .line 116
    :cond_2
    return v1

    .line 117
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    return v1

    .line 121
    :cond_3
    return v0

    .line 122
    :cond_4
    :goto_2
    return v1

    .line 123
    :array_0
    .array-data 4
        0x7
        0x9
        0xa
        0x5
        0x8
        0x4
        0x2
        0x1
        0x6
        0x3
        0x7
        0x9
        0xa
        0x5
        0x8
        0x4
        0x2
    .end array-data
.end method

.method public static v(Ll/jl80;I)V
    .locals 5

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_1
    sget v0, Ll/vcc0;->B0:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget v2, Ll/c9c0;->n:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 55
    .line 56
    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 57
    .line 58
    sget v3, Ll/qa00;->c:I

    .line 59
    .line 60
    add-int/2addr v2, v3

    .line 61
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    sget v0, Ll/vcc0;->A0:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const v2, 0x3fd9999a    # 1.7f

    .line 79
    .line 80
    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    int-to-float v1, v1

    .line 88
    const/high16 v3, 0x3f800000    # 1.0f

    .line 89
    .line 90
    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 98
    .line 99
    iget v3, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 100
    .line 101
    sget v4, Ll/qa00;->e:I

    .line 102
    .line 103
    add-int/2addr v3, v4

    .line 104
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    sget v0, Ll/vcc0;->w0:I

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lv/VButton;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    const/16 v3, 0x10

    .line 122
    .line 123
    if-eqz v1, :cond_5

    .line 124
    .line 125
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 130
    .line 131
    if-ne p1, v3, :cond_4

    .line 132
    .line 133
    iget v4, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 134
    .line 135
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    add-int/2addr v4, v2

    .line 140
    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 144
    .line 145
    const/high16 v4, 0x40d00000    # 6.5f

    .line 146
    .line 147
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    sub-int/2addr v2, v4

    .line 152
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 153
    .line 154
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    .line 156
    .line 157
    :cond_5
    if-ne p1, v3, :cond_6

    .line 158
    .line 159
    sget p1, Ll/vcc0;->s0:I

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    check-cast p0, Lv/VText;

    .line 166
    .line 167
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_6

    .line 172
    .line 173
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 178
    .line 179
    iget v0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 180
    .line 181
    const/high16 v1, 0x40000000    # 2.0f

    .line 182
    .line 183
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    sub-int/2addr v0, v1

    .line 188
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 189
    .line 190
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 191
    .line 192
    .line 193
    :cond_6
    :goto_1
    return-void
.end method

.method public static w(Ljava/lang/Double;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Settings;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 19
    .line 20
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance v0, Ll/wc20;

    .line 49
    .line 50
    invoke-direct {v0, p1}, Ll/wc20;-><init>(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ll/kc20;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/kc20;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_review_id_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, p0, v0}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_id_verification_age_check_input_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "tooltips_trigger_mode"

    .line 14
    .line 15
    const-string v2, "passive"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/th0$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget v2, Lcom/p1/mobile/putong/core/R$string;->S7:I

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v2, Ll/lc20;

    .line 44
    .line 45
    invoke-direct {v2}, Ll/lc20;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    sget v2, Lcom/p1/mobile/putong/core/R$string;->T7:I

    .line 53
    .line 54
    invoke-virtual {p1, v2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v2, Ll/mc20;

    .line 59
    .line 60
    invoke-direct {v2, v0}, Ll/mc20;-><init>(Ll/l4g0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v2, Ll/nc20;

    .line 68
    .line 69
    invoke-direct {v2, p0}, Ll/nc20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ll/th0$a;->a()Ll/th0;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 80
    .line 81
    .line 82
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
