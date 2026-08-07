.class public Ll/x6d0;
.super Ll/spl0;
.source "SourceFile"


# static fields
.field public static volatile i:Ll/x6d0;


# instance fields
.field public b:Ll/jxd0;

.field public c:Z

.field public d:Ll/jxd0;

.field public e:Ll/jxd0;

.field public f:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/spl0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "have_show_hide_local_guide_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/x6d0;->b:Ll/jxd0;

    .line 34
    .line 35
    new-instance v0, Ll/jxd0;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "can_show_real_pic_tips"

    .line 40
    .line 41
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/x6d0;->d:Ll/jxd0;

    .line 63
    .line 64
    new-instance v0, Ll/jxd0;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v3, "can_show_real_id_and_pic_tips"

    .line 69
    .line 70
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Ll/x6d0;->e:Ll/jxd0;

    .line 92
    .line 93
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Ll/x6d0;->f:Lrx/subjects/b;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    iput-boolean v0, p0, Ll/x6d0;->g:Z

    .line 101
    .line 102
    return-void
.end method

.method public static synthetic c0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const-string v0, "each_prop"

    .line 2
    .line 3
    invoke-static {p0}, Ll/y6d0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_svip_trial_end_popup_confirm"

    .line 16
    .line 17
    const-string v2, "p_svip_trial_end_popup"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "p_svip_trial_end_popup,e_svip_trial_end_popup_confirm,click"

    .line 31
    .line 32
    invoke-static {p0}, Ll/y6d0;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {v0, p1, v1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic d0(Ll/l4g0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic e0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "each_prop"

    .line 2
    .line 3
    invoke-static {p0}, Ll/y6d0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_svip_trial_popup_confirm"

    .line 16
    .line 17
    const-string v2, "p_svip_trial_popup"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 25
    .line 26
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Ll/dt8;->j3(Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/w6d0;

    .line 33
    .line 34
    invoke-direct {v1, p1, p0, p2}, Ll/w6d0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic f0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "each_prop"

    .line 2
    .line 3
    invoke-static {p0}, Ll/y6d0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "e_svip_trial_end_popup_cancel"

    .line 16
    .line 17
    const-string v1, "p_svip_trial_end_popup"

    .line 18
    .line 19
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic g0(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "each_prop"

    .line 2
    .line 3
    invoke-static {p0}, Ll/y6d0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_svip_trial_popup_cancel"

    .line 16
    .line 17
    const-string v2, "p_svip_trial_popup"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 25
    .line 26
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Ll/dt8;->j3(Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)V
    .locals 2

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->operateResult:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1, p2}, Ll/y6d0;->t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->msg:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->msg:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public static l0()Ll/x6d0;
    .locals 2

    .line 1
    sget-object v0, Ll/x6d0;->i:Ll/x6d0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/x6d0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/x6d0;->i:Ll/x6d0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/x6d0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/x6d0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/x6d0;->i:Ll/x6d0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/x6d0;->i:Ll/x6d0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_svip_trial_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "each_prop"

    .line 14
    .line 15
    invoke-static {p1}, Ll/y6d0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    filled-new-array {v1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/z8j$a;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/z8j$a;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/y6d0;->e(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v1, v2}, Ll/z8j$a;->l(I)Ll/z8j$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {p1}, Ll/y6d0;->h(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {v1, v2}, Ll/z8j$a;->q(I)Ll/z8j$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {p1}, Ll/y6d0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Ll/z8j$a;->s(Ljava/lang/String;)Ll/z8j$a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {p1}, Ll/y6d0;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ll/z8j$a;->r(Ljava/lang/CharSequence;)Ll/z8j$a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v2, Ll/t6d0;

    .line 68
    .line 69
    invoke-direct {v2, p1, p0, p3}, Ll/t6d0;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-string p0, "\u7acb\u5373\u5f00\u542f"

    .line 73
    .line 74
    invoke-virtual {v1, p0, v2}, Ll/z8j$a;->o(Ljava/lang/String;Ll/x20;)Ll/z8j$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance p3, Ll/u6d0;

    .line 79
    .line 80
    invoke-direct {p3, p1}, Ll/u6d0;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const-string v1, "\u4e0d\uff0c\u8c22\u8c22"

    .line 84
    .line 85
    invoke-virtual {p0, v1, p3}, Ll/z8j$a;->n(Ljava/lang/String;Ll/x20;)Ll/z8j$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p3, "haveRead"

    .line 90
    .line 91
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_0

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    goto :goto_0

    .line 99
    :cond_0
    const-string p1, "*\u8bd5\u7528\u671f\u95f4\u53ef\u5728\u7b5b\u9009\u9875\u5173\u95ed\u6b64\u529f\u80fd"

    .line 100
    .line 101
    :goto_0
    invoke-virtual {p0, p1}, Ll/z8j$a;->m(Ljava/lang/String;)Ll/z8j$a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    new-instance p1, Ll/v6d0;

    .line 106
    .line 107
    invoke-direct {p1, v0, p2}, Ll/v6d0;-><init>(Ll/l4g0;Ll/x20;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p1}, Ll/z8j$a;->p(Ll/x20;)Ll/z8j$a;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Ll/z8j$a;->t()Ll/z8j;

    .line 115
    .line 116
    .line 117
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method


# virtual methods
.method public j0()V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 4
    .line 5
    const-string v0, "haveRead"

    .line 6
    .line 7
    const-string v1, "opening"

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/dt8;->m3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/dt8;->o3()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/dt8;->v3(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public k0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public m0()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 4
    .line 5
    const-string v0, "haveRead"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/dt8;->n3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FreeTrialConfig;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/core/data/FreeTrialConfig;->benefitCount:I

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public n0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/x6d0;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public o0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/x6d0;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public p0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6d0;->e:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6d0;->d:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r0(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dt8;->o3()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 12
    .line 13
    const-string v2, "haveRead"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ll/dt8;->n3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FreeTrialConfig;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    iget v1, v1, Lcom/p1/mobile/putong/core/data/FreeTrialConfig;->benefitCount:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v1, 0x0

    .line 29
    :goto_0
    if-le v0, v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, p1, v2}, Ll/x6d0;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/x6d0;->q0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/x6d0;->p0(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/x6d0;->n0(Z)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->v1:Ll/dt8;

    .line 14
    .line 15
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0, p2, v0}, Ll/dt8;->j3(Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    .line 18
    .line 19
    .line 20
    const-class p0, Landroid/app/Dialog;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "p_svip_trial_end_popup"

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "each_prop"

    .line 33
    .line 34
    invoke-static {p2}, Ll/y6d0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    filled-new-array {v0}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/z8j$a;

    .line 50
    .line 51
    invoke-direct {v0, p1}, Ll/z8j$a;-><init>(Landroid/content/Context;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p2}, Ll/y6d0;->e(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Ll/z8j$a;->l(I)Ll/z8j$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {p2}, Ll/y6d0;->h(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Ll/z8j$a;->q(I)Ll/z8j$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {p2}, Ll/y6d0;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Ll/z8j$a;->s(Ljava/lang/String;)Ll/z8j$a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {p2}, Ll/y6d0;->j(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ll/z8j$a;->r(Ljava/lang/CharSequence;)Ll/z8j$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/q6d0;

    .line 87
    .line 88
    invoke-direct {v1, p2, p1}, Ll/q6d0;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 89
    .line 90
    .line 91
    const-string p1, "\u7ee7\u7eed\u4f7f\u7528"

    .line 92
    .line 93
    invoke-virtual {v0, p1, v1}, Ll/z8j$a;->o(Ljava/lang/String;Ll/x20;)Ll/z8j$a;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    new-instance v0, Ll/r6d0;

    .line 98
    .line 99
    invoke-direct {v0, p2}, Ll/r6d0;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    const-string p2, "\u4e0d\uff0c\u8c22\u8c22"

    .line 103
    .line 104
    invoke-virtual {p1, p2, v0}, Ll/z8j$a;->n(Ljava/lang/String;Ll/x20;)Ll/z8j$a;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance p2, Ll/s6d0;

    .line 109
    .line 110
    invoke-direct {p2, p0}, Ll/s6d0;-><init>(Ll/l4g0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, p2}, Ll/z8j$a;->p(Ll/x20;)Ll/z8j$a;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1}, Ll/z8j$a;->t()Ll/z8j;

    .line 118
    .line 119
    .line 120
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public t0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0, p3}, Ll/x6d0;->u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
