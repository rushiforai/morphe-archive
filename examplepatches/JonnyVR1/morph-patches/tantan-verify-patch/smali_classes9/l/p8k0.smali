.class public Ll/p8k0;
.super Ll/ms2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/ms2<",
        "Ll/m8k0<",
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
    invoke-direct {p0, p1}, Ll/ms2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/m8k0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/m8k0;-><init>(Lv/VText;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic j4(Ll/p8k0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p8k0;->n4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic k4(Ll/p8k0;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/p8k0;->m4(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Landroid/view/View;)V

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
    new-instance v1, Ll/n8k0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/n8k0;-><init>(Ll/p8k0;)V

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
    check-cast p0, Ll/m8k0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/m8k0;->c()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public W3(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8k0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/m8k0;->f(Lcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l4(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Landroid/view/View;)V
    .locals 6

    .line 1
    const/4 v2, 0x0

    .line 2
    const-string v5, "liveRoom"

    .line 3
    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move v3, p2

    .line 7
    move-object v4, p3

    .line 8
    invoke-virtual/range {v0 .. v5}, Ll/p8k0;->l4(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/putong/data/User;)V
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
    invoke-virtual {p0}, Ll/ms2;->f4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

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
    invoke-virtual {p0}, Ll/ms2;->d4()Ll/ms2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/ms2;->h4()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ms2;->Z3(Lcom/p1/mobile/putong/data/User;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public o4()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

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
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

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
    if-nez v2, :cond_1

    .line 22
    .line 23
    goto :goto_4

    .line 24
    :cond_1
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/ms2;->i0(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    invoke-virtual {p0}, Ll/ms2;->f4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getFrom()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/16 v1, 0x258

    .line 39
    .line 40
    if-ne v0, v1, :cond_2

    .line 41
    .line 42
    const-string v0, "liveProfilecard_pkanchor"

    .line 43
    .line 44
    :goto_2
    move-object v5, v0

    .line 45
    goto :goto_3

    .line 46
    :cond_2
    if-eqz v4, :cond_3

    .line 47
    .line 48
    const-string v0, "liveProfilecard"

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    const-string v0, "live_watcher_profilecard"

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :goto_3
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v0, 0x2

    .line 61
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    new-instance v0, Ll/th0$a;

    .line 68
    .line 69
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    const-string v1, "\u786e\u5b9a\u8981\u53d6\u6d88\u5173\u6ce8\u5417\uff1f"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget v1, Ll/n9c0;->d:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/o8k0;

    .line 93
    .line 94
    invoke-direct {v1, p0, v2, v4, v5}, Ll/o8k0;-><init>(Ll/p8k0;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const/4 v0, 0x1

    .line 108
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 121
    .line 122
    .line 123
    :cond_4
    :goto_4
    return-void

    .line 124
    :cond_5
    const/4 v3, 0x1

    .line 125
    const-string v6, "liveRoom"

    .line 126
    .line 127
    move-object v1, p0

    .line 128
    invoke-virtual/range {v1 .. v6}, Ll/p8k0;->l4(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {p0, v5, v0, v1}, Ll/xak0;->e(Ljava/lang/String;Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public p4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

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
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

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
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-virtual {v1, v2, v3, v4, v4}, Ll/wrv;->z0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ms2;->a4()V

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
    invoke-static {v1, p0, v0}, Ll/xak0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method
