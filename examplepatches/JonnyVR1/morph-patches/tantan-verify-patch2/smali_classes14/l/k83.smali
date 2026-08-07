.class public Ll/k83;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/k83$a;
    }
.end annotation


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

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k83;->o(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/m27;->e4(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0, v1, p1, p2}, Ll/k83;->j(Lcom/p1/mobile/android/app/Act;ZLl/x20;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k83;->o(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(ZLl/k83$a;Ll/uxj0;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/jan;->P3()Lrx/c;

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 31
    .line 32
    iget-object p0, p0, Ll/m27;->U:Ll/byd0;

    .line 33
    .line 34
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    iget-object p0, p1, Ll/k83$a;->c:Ll/x20;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    iget-object p0, p1, Ll/k83$a;->c:Ll/x20;

    .line 54
    .line 55
    invoke-interface {p0}, Ll/x20;->call()V

    .line 56
    .line 57
    .line 58
    :cond_2
    iget-object p0, p1, Ll/k83$a;->g:Ll/x20;

    .line 59
    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    invoke-interface {p0}, Ll/x20;->call()V

    .line 63
    .line 64
    .line 65
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 68
    .line 69
    iget-object p0, p0, Ll/m27;->j0:Ll/jxd0;

    .line 70
    .line 71
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    new-array p0, p0, [Ljava/lang/Object;

    .line 78
    .line 79
    const-string p2, "boost_consumed"

    .line 80
    .line 81
    invoke-static {p2, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p1, Ll/k83$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 85
    .line 86
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 87
    .line 88
    if-ne p0, p1, :cond_4

    .line 89
    .line 90
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->i2:Lrx/subjects/b;

    .line 95
    .line 96
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    return-void
.end method

.method public static synthetic e(Ll/x20;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pa3;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Qk()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Xa()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    :goto_0
    if-lez v0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0}, Ll/x20;->call()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-static {p1, v1}, Ll/pa3;->g(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/j83;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Ll/j83;-><init>(Ll/x20;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Bk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic f(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ll/k83$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/m27;->V3()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->F:I

    .line 9
    .line 10
    invoke-static {p1}, Ll/o1j0;->n(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/k83$a;->h:Ll/x20;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic h(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static i(Ll/k83$a;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "boost"

    .line 10
    .line 11
    const-string v2, "minBoost"

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/k83$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    if-ne v0, v3, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/jan;->x3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    iget-boolean p0, p0, Ll/k83$a;->d:Z

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/pa3;->f()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/jan;->y3()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, v0}, Ll/jan;->x3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_2
    iget-object v0, p0, Ll/k83$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 67
    .line 68
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 69
    .line 70
    if-ne v0, v3, :cond_3

    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 75
    .line 76
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :cond_3
    iget-boolean p0, p0, Ll/k83$a;->d:Z

    .line 86
    .line 87
    if-eqz p0, :cond_4

    .line 88
    .line 89
    invoke-static {}, Ll/pa3;->f()Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_4

    .line 94
    .line 95
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/lqb;->t4()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0

    .line 104
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 107
    .line 108
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p0, v0}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;ZLl/x20;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/k83$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k83$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/k83$a;->c(Z)Ll/k83$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p2}, Ll/k83$a;->h(Ll/x20;)Ll/k83$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p3}, Ll/k83$a;->a(Z)Ll/k83$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/k83$a;->b(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/k83$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/k83;->k(Ll/k83$a;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static k(Ll/k83$a;)V
    .locals 8
    .param p0    # Ll/k83$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/k83$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->at()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    move v2, v0

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    :goto_1
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :goto_2
    invoke-static {p0}, Ll/k83;->i(Ll/k83$a;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget-object v0, p0, Ll/k83$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 36
    .line 37
    iget-object v4, p0, Ll/k83$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    iget-boolean v7, p0, Ll/k83$a;->f:Z

    .line 41
    .line 42
    const-string v5, ""

    .line 43
    .line 44
    invoke-virtual/range {v1 .. v7}, Ll/m27;->b4(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;ZZ)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/g83;

    .line 53
    .line 54
    invoke-direct {v1, v2, p0}, Ll/g83;-><init>(ZLl/k83$a;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/h83;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/h83;-><init>(Ll/k83$a;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/m27;->X3()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/m27;->s3()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/c83;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1, p2}, Ll/c83;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/d83;

    .line 34
    .line 35
    invoke-direct {v2, p0, p1, p2}, Ll/d83;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;)Z
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "svip"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Cd(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    new-instance v4, Ll/i83;

    .line 35
    .line 36
    invoke-direct {v4}, Ll/i83;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->S7(Z)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const-string v0, "p_promotion,callback"

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    invoke-static {v0, v1}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    const/4 v7, 0x0

    .line 59
    const/4 v8, 0x0

    .line 60
    move-object v3, p0

    .line 61
    invoke-interface/range {v2 .. v8}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->wm(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    return p0

    .line 66
    :cond_0
    return v1
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLjava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v2, "boost_purchase_shown"

    .line 5
    .line 6
    invoke-static {v2, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qt()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-static {}, Ll/joa;->M3()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    invoke-static {p0}, Ll/k83;->m(Lcom/p1/mobile/android/app/Act;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_6

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p0, p1}, Ll/pa3;->g(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 63
    .line 64
    invoke-interface {p2, p0, p1, p3, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    if-eqz p1, :cond_1

    .line 69
    .line 70
    invoke-static {}, Ll/pa3;->f()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Qk()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    goto :goto_0

    .line 89
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Xa()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    :goto_0
    if-lez v1, :cond_4

    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 104
    .line 105
    .line 106
    move-result-object p4

    .line 107
    invoke-virtual {p4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    invoke-interface {p4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qt()Z

    .line 112
    .line 113
    .line 114
    move-result p4

    .line 115
    if-eqz p4, :cond_2

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 118
    .line 119
    .line 120
    move-result-object p4

    .line 121
    invoke-virtual {p4}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 122
    .line 123
    .line 124
    move-result-object p4

    .line 125
    invoke-interface {p4}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Yl()Z

    .line 126
    .line 127
    .line 128
    move-result p4

    .line 129
    if-eqz p4, :cond_2

    .line 130
    .line 131
    invoke-static {p0, p2, v2, p1}, Ll/b83;->m(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 138
    .line 139
    invoke-virtual {p4}, Ll/m27;->x3()Z

    .line 140
    .line 141
    .line 142
    move-result p4

    .line 143
    if-nez p4, :cond_3

    .line 144
    .line 145
    if-nez p1, :cond_3

    .line 146
    .line 147
    if-nez p3, :cond_3

    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 154
    .line 155
    .line 156
    move-result-object p3

    .line 157
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qt()Z

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    if-nez p3, :cond_3

    .line 162
    .line 163
    new-instance p3, Ll/e83;

    .line 164
    .line 165
    invoke-direct {p3, p0, p2, p1}, Ll/e83;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 166
    .line 167
    .line 168
    invoke-static {p0, p3}, Ll/b83;->i(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_3
    invoke-static {p0, v0, p2, p1}, Ll/k83;->j(Lcom/p1/mobile/android/app/Act;ZLl/x20;Z)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_4
    invoke-static {p0}, Ll/k83;->m(Lcom/p1/mobile/android/app/Act;)Z

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    if-eqz p2, :cond_6

    .line 181
    .line 182
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result p3

    .line 194
    if-eqz p3, :cond_5

    .line 195
    .line 196
    invoke-static {p0, p1}, Ll/pa3;->g(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p4

    .line 200
    :cond_5
    invoke-interface {p2, p0, p4, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Bk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 201
    .line 202
    .line 203
    :cond_6
    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/f83;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/f83;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0, p2}, Ll/b83;->p(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
