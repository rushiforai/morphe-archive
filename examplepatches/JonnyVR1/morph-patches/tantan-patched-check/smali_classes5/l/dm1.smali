.class public Ll/dm1;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/lm1;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Ll/p0k0;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic C0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/dm1;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dm1;->D0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/dm1;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dm1;->z0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    const-string v0, "RECOMMEND"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic h0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/x5l0;->b:Lrx/subjects/b;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic i0(Ll/dm1;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dm1;->x0(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ll/p0k0$b;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic k0(Ll/dm1;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dm1;->A0(Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic l0(Ll/dm1;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dm1;->C0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic m0(Ll/dm1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dm1;->y0()V

    return-void
.end method

.method public static synthetic n0(Ll/dm1;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dm1;->E0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private t0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v1, "type"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iput v1, p0, Ll/dm1;->b:I

    .line 30
    .line 31
    const-string v1, "from"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/dm1;->a:Ljava/lang/String;

    .line 38
    .line 39
    return-void
.end method

.method private synthetic z0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lm1;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lm1;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic A0(Ll/p0k0$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lm1;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/lm1;->z(Ll/p0k0$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic D0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/dm1;->s0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic E0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/p0k0$b;

    .line 8
    .line 9
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v1, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 39
    .line 40
    iget-object v3, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    invoke-interface {v1, v2, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v4, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 62
    .line 63
    new-instance v5, Ll/am1;

    .line 64
    .line 65
    invoke-direct {v5, v0}, Ll/am1;-><init>(Ll/p0k0$b;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v4, v5}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 69
    .line 70
    .line 71
    iget-object v4, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    iget-object v5, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 78
    .line 79
    if-nez v4, :cond_1

    .line 80
    .line 81
    iget-object v0, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 82
    .line 83
    invoke-interface {v5, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    iget-object v0, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 88
    .line 89
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :goto_0
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 105
    .line 106
    .line 107
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    invoke-virtual {v1, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Ll/bm1;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/bm1;-><init>(Ll/dm1;)V

    .line 122
    .line 123
    .line 124
    new-instance v2, Ll/cm1;

    .line 125
    .line 126
    invoke-direct {v2, p0}, Ll/cm1;-><init>(Ll/dm1;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_2
    invoke-virtual {p0}, Ll/dm1;->s0()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public G0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/dm1;->p0()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    if-ge v1, v2, :cond_0

    .line 13
    .line 14
    check-cast v3, Ll/lm1;

    .line 15
    .line 16
    iget-object v2, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/p0k0$b;

    .line 23
    .line 24
    iget-object v2, v2, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v3, v1, v2}, Ll/lm1;->A(IZ)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    check-cast v3, Ll/lm1;

    .line 47
    .line 48
    iget-object p0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 49
    .line 50
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Ll/p0k0$b;

    .line 55
    .line 56
    iget-object p0, p0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-virtual {v3, p0}, Ll/lm1;->l(Z)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dm1;->t0()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dm1;->u0()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/tl1;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/tl1;-><init>(Ll/dm1;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ul1;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ul1;-><init>(Ll/dm1;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/vl1;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/vl1;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/wl1;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/wl1;-><init>(Ll/dm1;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()V
    .locals 3

    .line 1
    new-instance v0, Ll/p0k0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p0k0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->LOCAL_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/p0k0$a;->h(Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)Ll/p0k0$a;

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->REMOTE_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/p0k0$a;->h(Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)Ll/p0k0$a;

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/p0k0$a;->n(Lcom/p1/mobile/putong/core/view/AvatarUpdateType;)Ll/p0k0$a;

    .line 19
    .line 20
    .line 21
    const-string v1, "verification"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/p0k0$a;->m(Ljava/lang/String;)Ll/p0k0$a;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/dm1;->c:Ll/p0k0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object p0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v0, p0}, Ll/p0k0;->J0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public p0()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    new-instance v1, Ll/xl1;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/xl1;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v1, 0x3

    .line 32
    invoke-static {p0, v1}, Ll/td8;->v0(Ljava/util/List;I)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public q0()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Ll/dm1;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "\u56fd\u5bb6\u7f51\u7edc\u8eab\u4efd\u8ba4\u8bc1"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    const-string p0, "\u5b9e\u540d\u00b7\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    const-string p0, "\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 22
    .line 23
    return-object p0
.end method

.method public r0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/p0k0$b;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dm1;->p0()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/yl1;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/yl1;-><init>(Ll/dm1;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    const-string v1, "recommend"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v1, "album"

    .line 28
    .line 29
    :goto_0
    iget-object v2, v0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const-string v3, "avatar_photo_source"

    .line 36
    .line 37
    const-string v4, "photo_status"

    .line 38
    .line 39
    const-string v5, "p_change_avatar_verification"

    .line 40
    .line 41
    const-string v6, "e_save_photo_continue_verify"

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    const-string p0, "\u7167\u7247\u4e0a\u4f20\u4e2d..."

    .line 46
    .line 47
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const-string p0, "uploading"

    .line 51
    .line 52
    invoke-static {v4, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v6, v5, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    iget-boolean v2, v0, Ll/p0k0$b;->f:Z

    .line 69
    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    iget-boolean v2, v0, Ll/p0k0$b;->e:Z

    .line 73
    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    const-string p0, "\u7167\u7247\u4e0a\u4f20\u5931\u8d25\uff0c\u8bf7\u66f4\u6362\u5934\u50cf\u540e\u5c1d\u8bd5"

    .line 77
    .line 78
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const-string p0, "upload_failed"

    .line 82
    .line 83
    invoke-static {v4, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {v6, v5, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    iget-object v0, v0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    const-string p0, "\u7167\u7247\u672a\u8bc6\u522b\u5230\u5355\u4eba\u6e05\u6670\u6b63\u8138\uff0c\u8bf7\u66f4\u6362\u5934\u50cf\u540e\u5c1d\u8bd5"

    .line 108
    .line 109
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    const-string p0, "image_quality"

    .line 113
    .line 114
    invoke-static {v4, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {v6, v5, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 131
    .line 132
    check-cast v0, Ll/lm1;

    .line 133
    .line 134
    invoke-virtual {v0}, Ll/lm1;->p()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_4

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v2, Ll/zl1;

    .line 145
    .line 146
    invoke-direct {v2, p0}, Ll/zl1;-><init>(Ll/dm1;)V

    .line 147
    .line 148
    .line 149
    const/4 p0, 0x1

    .line 150
    invoke-static {v0, p0, v2}, Ll/pq4;->j(Lcom/p1/mobile/android/app/Act;ZLjava/lang/Runnable;)V

    .line 151
    .line 152
    .line 153
    const-string p0, "privacy_agreement"

    .line 154
    .line 155
    invoke-static {v4, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {v6, v5, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_4
    const-string v0, "default"

    .line 172
    .line 173
    invoke-static {v4, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {v6, v5, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Ll/dm1;->F0()V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public s0()V
    .locals 3

    .line 1
    iget v0, p0, Ll/dm1;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    if-eq v0, v2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0, v1}, Ll/zki0;->F(Landroid/content/Context;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/dm1;->a:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v0, p0, v2, v1}, Ll/hxf;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final u0()V
    .locals 2

    .line 1
    new-instance v0, Ll/p0k0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p0k0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/dm1;->c:Ll/p0k0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/p0k0;->c0()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance v0, Ll/p0k0$b;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/p0k0$b;-><init>()V

    .line 17
    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/dkb;->ma()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    const-string v1, "\u4e94\u5b98\u4e0d\u6e05\u6670"

    .line 34
    .line 35
    iput-object v1, v0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    iput-boolean v1, v0, Ll/p0k0$b;->f:Z

    .line 39
    .line 40
    iget-object p0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/dm1;->d:Lrx/subjects/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/p0k0$b;

    .line 14
    .line 15
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/lm1;

    .line 4
    .line 5
    iget-object v0, v0, Ll/lm1;->s:Lv/VCheckBox;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dm1;->F0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
