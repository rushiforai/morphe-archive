.class public Ll/m6p0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/atm0<",
        "Ll/k6p0<",
        "TD;>;TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lv/VText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lv/VText;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/k6p0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/k6p0;-><init>(Lv/VText;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic l4(Ll/m6p0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m6p0;->n4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private synthetic n4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/htd0;->b:Ll/htd0;

    .line 6
    .line 7
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/jfv;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Ll/atm0;->e4()Ll/atm0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/atm0;->i4()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/atm0;->a4(Lcom/p1/mobile/putong/data/User;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/jfv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/jfv;->g()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/l6p0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/l6p0;-><init>(Ll/m6p0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Ll/k6p0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/k6p0;->c()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/k6p0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/k6p0;->e(Lcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m4(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o4()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    move-object v2, v0

    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 15
    .line 16
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    if-eqz v2, :cond_4

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_3

    .line 30
    :cond_1
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/atm0;->i0(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const-string v0, "liveProfilecard"

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    const-string v0, "live_watcher_profilecard"

    .line 42
    .line 43
    :goto_2
    invoke-virtual {p0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getFrom()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/16 v3, 0x258

    .line 52
    .line 53
    if-ne v1, v3, :cond_3

    .line 54
    .line 55
    const-string v0, "liveProfilecard_pkanchor"

    .line 56
    .line 57
    :cond_3
    move-object v5, v0

    .line 58
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/atm0;->i0(Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {p0}, Ll/atm0;->e4()Ll/atm0;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ll/atm0;->c4()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    const/4 v3, 0x1

    .line 73
    move-object v1, p0

    .line 74
    invoke-virtual/range {v1 .. v6}, Ll/m6p0;->m4(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p0, v5, v0, v1}, Ll/w7p0;->a(Ljava/lang/String;Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_4
    :goto_3
    return-void
.end method

.method public p4()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 14
    .line 15
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    :goto_0
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget-object v4, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    invoke-virtual {v2, v3, v4, v5, v5}, Ll/wrv;->z0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/atm0;->b4()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1, p0, v0}, Ll/w7p0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method
