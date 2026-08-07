.class public Ll/u9k0;
.super Ll/ms2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/ms2<",
        "Ll/s9k0<",
        "TD;>;TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ms2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/s9k0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/s9k0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic j4(Ll/u9k0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u9k0;->m4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private synthetic m4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/s9k0;

    .line 6
    .line 7
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/jfv;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ms2;->f4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Ll/s9k0;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/s9k0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/s9k0;->a:Ll/x3t;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/x3t;->l()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/s9k0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/s9k0;->a:Ll/x3t;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/x3t;->C(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/oo2;->V0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/vp20;->p()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/s9k0;

    .line 36
    .line 37
    iget-object v0, v0, Ll/s9k0;->a:Ll/x3t;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Ll/oo2;->B:Ll/x7g;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/x7g;->A()Ll/cm0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ll/x3t;->E(Ll/cm0;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast v0, Ll/s9k0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v1, v1, Ll/vak0;->c:Ll/nsv;

    .line 69
    .line 70
    :goto_0
    invoke-virtual {v0, v1}, Ll/s9k0;->k(Ll/nsv;)V

    .line 71
    .line 72
    .line 73
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 74
    .line 75
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ll/jfv;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/jfv;->g()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/t9k0;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/t9k0;-><init>(Ll/u9k0;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 108
    .line 109
    check-cast v0, Ll/s9k0;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, p0}, Ll/s9k0;->n(Ll/vak0;)V

    .line 116
    .line 117
    .line 118
    :cond_3
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/s9k0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s9k0;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/s9k0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/s9k0;->a:Ll/x3t;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/x3t;->m()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 15
    .line 16
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->k:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p4, ""

    .line 30
    .line 31
    :goto_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "%s%s  \u00b7  %s %s"

    .line 36
    .line 37
    filled-new-array {p2, p0, p4, p3}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p1, v0, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    :goto_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 47
    .line 48
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->k:I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p3, "%s%s"

    .line 59
    .line 60
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p1, p3, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public l4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 26
    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method
