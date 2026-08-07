.class public Ll/x1k;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/e2k;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:I

.field public b:I

.field public c:Z

.field public d:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/NewGiftWall;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x63

    .line 5
    .line 6
    iput p1, p0, Ll/x1k;->a:I

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput p1, p0, Ll/x1k;->b:I

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/x1k;->c:Z

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Ll/x1k;->d:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 15
    .line 16
    new-instance p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/x1k;->e:Ljava/util/ArrayList;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic g0(Ll/x1k;ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x1k;->r0(ILjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

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

.method public static synthetic j0(Ll/x1k;ILl/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x1k;->q0(ILl/bkj0;)V

    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l0(Ll/x1k;Lcom/p1/mobile/putong/core/data/GiftWallSocial;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1k;->s0(Lcom/p1/mobile/putong/core/data/GiftWallSocial;)V

    return-void
.end method

.method public static synthetic m0(Ll/x1k;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1k;->p0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic n0(Ll/x1k;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x1k;->o0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic o0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e2k;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2k;->u()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Ll/x1k;->t0(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/n1k;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/n1k;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/o1k;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/o1k;-><init>(Ll/x1k;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/p1k;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/p1k;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/q1k;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/q1k;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/r1k;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/r1k;-><init>(Ll/x1k;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Ll/s1k;

    .line 57
    .line 58
    invoke-direct {p0}, Ll/s1k;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/x1k;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/x1k;->b:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/x1k;->t0(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x1k;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q0(ILl/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/e2k;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/e2k;->y()V

    .line 17
    .line 18
    .line 19
    iput-boolean v1, p0, Ll/x1k;->c:Z

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object v0, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ljava/util/Collection;

    .line 25
    .line 26
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iput-boolean v1, p0, Ll/x1k;->c:Z

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object v0, p0, Ll/x1k;->e:Ljava/util/ArrayList;

    .line 36
    .line 37
    iget-object v2, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v2, Ljava/util/Collection;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v0, Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/16 v2, 0x63

    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    if-lt v0, v2, :cond_2

    .line 56
    .line 57
    move v0, v3

    .line 58
    goto :goto_0

    .line 59
    :cond_2
    move v0, v1

    .line 60
    :goto_0
    iput-boolean v0, p0, Ll/x1k;->c:Z

    .line 61
    .line 62
    iget v0, p0, Ll/x1k;->b:I

    .line 63
    .line 64
    add-int/2addr v0, v3

    .line 65
    iput v0, p0, Ll/x1k;->b:I

    .line 66
    .line 67
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast v0, Ll/e2k;

    .line 70
    .line 71
    iget-object v2, p0, Ll/x1k;->e:Ljava/util/ArrayList;

    .line 72
    .line 73
    if-ne p1, v3, :cond_3

    .line 74
    .line 75
    move v1, v3

    .line 76
    :cond_3
    invoke-virtual {v0, v2, v1}, Ll/e2k;->x(Ljava/util/List;Z)V

    .line 77
    .line 78
    .line 79
    :goto_1
    iget-object p1, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 82
    .line 83
    iput-object p1, p0, Ll/x1k;->d:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_4

    .line 90
    .line 91
    iget-object p1, p0, Ll/x1k;->d:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 94
    .line 95
    const-string v0, "hide"

    .line 96
    .line 97
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_4

    .line 102
    .line 103
    iget-object p1, p0, Ll/x1k;->d:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 104
    .line 105
    invoke-static {p1}, Ll/i1k;->h(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;)Ll/bkj0;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 110
    .line 111
    check-cast v0, Ll/e2k;

    .line 112
    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v2, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v2, Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v2, Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v2, " "

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast p1, Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {v0, p1}, Ll/e2k;->z(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 153
    .line 154
    check-cast p1, Ll/e2k;

    .line 155
    .line 156
    invoke-virtual {p1}, Ll/e2k;->k()V

    .line 157
    .line 158
    .line 159
    :goto_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 160
    .line 161
    check-cast p0, Ll/e2k;

    .line 162
    .line 163
    iget-object p1, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 164
    .line 165
    check-cast p1, Ljava/lang/Integer;

    .line 166
    .line 167
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    invoke-virtual {p0, p1}, Ll/e2k;->w(I)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public final synthetic r0(ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/e2k;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/e2k;->y()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/e2k;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/e2k;->k()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/core/data/GiftWallSocial;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/e2k;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/e2k;->l()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->dailySocial:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->dailySocial:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 23
    .line 24
    iput-object p1, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->totalSocial:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->totalSocial:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 37
    .line 38
    iput-object p1, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p1, Ll/e2k;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/e2k;->l()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 49
    .line 50
    :goto_0
    const/4 p1, 0x0

    .line 51
    :goto_1
    iget-object v0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 60
    .line 61
    check-cast v0, Ll/e2k;

    .line 62
    .line 63
    iget-object p0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 64
    .line 65
    invoke-virtual {v0, p1, p0}, Ll/e2k;->A(ZLcom/p1/mobile/putong/core/data/GiftWallSocialItem;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public final t0(I)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 4
    .line 5
    const/16 v1, 0x63

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1}, Ll/lu8;->M3(II)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/v1k;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/v1k;-><init>(Ll/x1k;I)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/w1k;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1}, Ll/w1k;-><init>(Ll/x1k;I)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public u0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lu8;->L3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/t1k;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/t1k;-><init>(Ll/x1k;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/u1k;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/u1k;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public x0()V
    .locals 3

    .line 1
    new-instance v0, Ll/wwj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p0, p0, Ll/x1k;->d:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 8
    .line 9
    const-string v2, "p_presentwall"

    .line 10
    .line 11
    invoke-direct {v0, v1, p0, v2}, Ll/wwj;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/wwj;->l()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public y0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;->canChat:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object p0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;->userID:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v2, p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object p0, p0, Ll/x1k;->f:Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;->userID:Ljava/lang/String;

    .line 55
    .line 56
    const-string v4, "from_giftwall"

    .line 57
    .line 58
    invoke-interface {v2, v3, p0, v4, v1}, Ll/r97;->M1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method
