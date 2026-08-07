.class public Ll/bby;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/czl;
.implements Lv/VTexturePlayer$b;
.implements Ll/eam;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VFrame_ColorFilter;

.field public e:Lv/VImage;

.field public f:Lv/VProgressBar;

.field public g:Landroid/widget/ProgressBar;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/putong/data/Video;

.field public j:Lv/VTexturePlayer;

.field public k:Z

.field public l:J

.field public m:J

.field public n:Ll/kcg0;

.field public o:Ll/kcg0;

.field public p:Ll/kcg0;

.field public q:Ll/kcg0;

.field public r:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/bby;->l:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/bby;->m:J

    .line 9
    .line 10
    return-void
.end method

.method private A(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bby;->P(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/bby;->b:Lv/VDraweeView;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    sget v0, Ll/ddc0;->A:I

    .line 35
    .line 36
    invoke-direct {p0, v0}, Ll/bby;->z(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/bby;->d:Lv/VFrame_ColorFilter;

    .line 40
    .line 41
    const/high16 v2, 0x3f800000    # 1.0f

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 44
    .line 45
    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 50
    .line 51
    iget-object v0, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/bby;->g:Landroid/widget/ProgressBar;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/bby;->n:Ll/kcg0;

    .line 62
    .line 63
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/bby;->o:Ll/kcg0;

    .line 67
    .line 68
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/bby;->p:Ll/kcg0;

    .line 72
    .line 73
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Ll/bby;->n:Ll/kcg0;

    .line 77
    .line 78
    iput-object p1, p0, Ll/bby;->o:Ll/kcg0;

    .line 79
    .line 80
    iput-object p1, p0, Ll/bby;->p:Ll/kcg0;

    .line 81
    .line 82
    :cond_0
    return-void
.end method

.method private B()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VTexturePlayer;

    .line 21
    .line 22
    iput-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    new-instance v0, Lv/VTexturePlayer;

    .line 30
    .line 31
    iget-object v1, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1, p0}, Lv/VTexturePlayer;-><init>(Landroid/content/Context;Lv/VTexturePlayer$b;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 47
    .line 48
    sget v1, Ll/ddc0;->K:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 54
    .line 55
    const/4 v1, -0x1

    .line 56
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 57
    .line 58
    .line 59
    const/16 v2, 0x11

    .line 60
    .line 61
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/bby;->C()F

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    const/high16 v3, 0x3f800000    # 1.0f

    .line 68
    .line 69
    cmpg-float v2, v2, v3

    .line 70
    .line 71
    if-gez v2, :cond_1

    .line 72
    .line 73
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 74
    .line 75
    iget-object v1, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 80
    .line 81
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 82
    .line 83
    iget-object v2, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    mul-int/2addr v1, v2

    .line 90
    iget-object v2, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 95
    .line 96
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 97
    .line 98
    div-int/2addr v1, v2

    .line 99
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    invoke-virtual {p0}, Ll/bby;->C()F

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    cmpl-float v2, v2, v3

    .line 107
    .line 108
    if-lez v2, :cond_2

    .line 109
    .line 110
    iget-object v2, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 111
    .line 112
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 113
    .line 114
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 115
    .line 116
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 117
    .line 118
    invoke-static {}, Ll/bnl0;->y0()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    mul-int/2addr v2, v3

    .line 123
    iget-object v3, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 124
    .line 125
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 126
    .line 127
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 128
    .line 129
    iget v3, v3, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 130
    .line 131
    div-int/2addr v2, v3

    .line 132
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 133
    .line 134
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_2
    invoke-static {}, Ll/bnl0;->y0()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 142
    .line 143
    invoke-static {}, Ll/bnl0;->y0()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 148
    .line 149
    :goto_0
    iget-object v1, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 150
    .line 151
    iget-object p0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 152
    .line 153
    invoke-virtual {v1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    .line 155
    .line 156
    :cond_3
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lv/VTexturePlayer;->u()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/bby;->k:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/bby;->M()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/bby;->k:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/bby;->N()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic J(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bby;->h:Lv/VImage;

    .line 2
    .line 3
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/cey;->j()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget v1, Ll/gbc0;->o1:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v1, Ll/gbc0;->p1:I

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Lv/VTexturePlayer;->setVolume(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public static synthetic e(Ll/bby;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bby;->K(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Ll/bby;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bby;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/bby;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bby;->J(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j(Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->F:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p0, v0}, Ll/o1j0;->i(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic k(Ll/bby;Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bby;->E(Ljava/lang/String;ILjava/lang/Integer;)V

    return-void
.end method

.method public static synthetic l(Ll/bby;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bby;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/cbl0;->u(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic n(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/cey;->j()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    xor-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/cey;->p(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic o(Ll/bby;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bby;->L(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic p(Ll/bby;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bby;->D()V

    return-void
.end method

.method public static synthetic q(Ll/bby;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bby;->H(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic r(Ll/bby;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bby;->I(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static bridge synthetic s(Ll/bby;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bby;->l:J

    return-wide v0
.end method

.method public static bridge synthetic t(Ll/bby;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bby;->m:J

    return-wide v0
.end method

.method public static bridge synthetic u(Ll/bby;)Lv/VTexturePlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    return-object p0
.end method

.method public static bridge synthetic v(Ll/bby;)Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    return-object p0
.end method

.method public static bridge synthetic w(Ll/bby;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bby;->m:J

    return-void
.end method

.method private z(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bby;->d:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Ll/bby;->d:Lv/VFrame_ColorFilter;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-ne v4, p1, :cond_0

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    move v4, v1

    .line 26
    :goto_1
    invoke-static {v3, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void
.end method


# virtual methods
.method public final C()F
    .locals 2

    .line 1
    iget-object p0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 13
    .line 14
    int-to-float p0, p0

    .line 15
    mul-float/2addr p0, v1

    .line 16
    int-to-float v0, v0

    .line 17
    div-float/2addr p0, v0

    .line 18
    return p0
.end method

.method public final synthetic D()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VTexturePlayer;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E(Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bby;->l:J

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Ll/c7y;->d(JILjava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Ll/bby;->b(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bby;->M()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/cey;->d()Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/cey;->d()Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/bby;->N()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final synthetic K(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/bby;->r:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lv/VTexturePlayer;->t:Ll/azl;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic L(Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    iget-object p1, p1, Lv/VTexturePlayer;->t:Ll/azl;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/azl;->getCurrentPosition()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    float-to-int p1, p1

    .line 10
    iget-object v0, p0, Ll/bby;->g:Landroid/widget/ProgressBar;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-gt p1, v0, :cond_1

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/bby;->g:Landroid/widget/ProgressBar;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object p0, p0, Ll/bby;->g:Landroid/widget/ProgressBar;

    .line 29
    .line 30
    if-le p1, v0, :cond_2

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, p1, v0}, Landroid/widget/ProgressBar;->setProgress(IZ)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lv/VTexturePlayer;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Ll/bby;->P(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 17
    .line 18
    invoke-virtual {p0}, Lv/VTexturePlayer;->r()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public N()V
    .locals 12

    .line 1
    iget-boolean v0, p0, Ll/bby;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Lv/VTexturePlayer;->u()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    invoke-direct {p0}, Ll/bby;->B()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/bby;->O()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/cey;->m(Lcom/p1/mobile/putong/data/Media;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Ll/cey;->o(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 41
    .line 42
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Ll/cey;->j()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v0, v2}, Lv/VTexturePlayer;->setVolume(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/bby;->C()F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/high16 v2, 0x3f800000    # 1.0f

    .line 58
    .line 59
    cmpl-float v2, v0, v2

    .line 60
    .line 61
    iget-object v3, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 62
    .line 63
    if-nez v2, :cond_2

    .line 64
    .line 65
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Video;->formatSquare()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    :goto_1
    move-object v7, v2

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    goto :goto_1

    .line 76
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->u5()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    iput-wide v3, p0, Ll/bby;->l:J

    .line 93
    .line 94
    sget v11, Ll/c7y;->a:I

    .line 95
    .line 96
    iget-object v3, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 97
    .line 98
    invoke-virtual {v3, v2}, Lv/VTexturePlayer;->setIsInABGroup(Z)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 102
    .line 103
    new-instance v4, Ll/bby$a;

    .line 104
    .line 105
    invoke-direct {v4, p0, v7, v11}, Ll/bby$a;-><init>(Ll/bby;Ljava/lang/String;I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3, v4}, Lv/VTexturePlayer;->setOnBufferListener(Lv/VTexturePlayer$c;)V

    .line 109
    .line 110
    .line 111
    iget-object v3, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 112
    .line 113
    new-instance v4, Ll/say;

    .line 114
    .line 115
    invoke-direct {v4}, Ll/say;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v3, v4}, Lv/VTexturePlayer;->setNetErrorListener(Ll/y20;)V

    .line 119
    .line 120
    .line 121
    iget-object v3, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 122
    .line 123
    new-instance v4, Ll/tay;

    .line 124
    .line 125
    invoke-direct {v4, v7}, Ll/tay;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v4}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-virtual {v4, v5}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    iget-object v5, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 141
    .line 142
    iget v5, v5, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 143
    .line 144
    const/4 v6, 0x0

    .line 145
    invoke-virtual {v3, v6, v4, v5}, Lv/VTexturePlayer;->w(Lv/VTexturePlayer$a;Lrx/c;F)V

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 149
    .line 150
    invoke-static {v7}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    float-to-double v5, v0

    .line 159
    if-nez v2, :cond_3

    .line 160
    .line 161
    iget-object v0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 164
    .line 165
    const-string v2, "http"

    .line 166
    .line 167
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_3

    .line 172
    .line 173
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 174
    .line 175
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-nez v0, :cond_3

    .line 180
    .line 181
    :goto_3
    move v8, v1

    .line 182
    goto :goto_4

    .line 183
    :cond_3
    const/4 v1, 0x0

    .line 184
    goto :goto_3

    .line 185
    :goto_4
    sget v9, Lcom/p1/mobile/putong/core/member/R$string;->F:I

    .line 186
    .line 187
    sget v10, Lcom/p1/mobile/putong/core/member/R$string;->R0:I

    .line 188
    .line 189
    invoke-virtual/range {v3 .. v10}, Lv/VTexturePlayer;->s(Landroid/net/Uri;DLjava/lang/String;ZII)V

    .line 190
    .line 191
    .line 192
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0, v7}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    new-instance v1, Ll/uay;

    .line 209
    .line 210
    invoke-direct {v1, p0, v7, v11}, Ll/uay;-><init>(Ll/bby;Ljava/lang/String;I)V

    .line 211
    .line 212
    .line 213
    new-instance p0, Ll/vay;

    .line 214
    .line 215
    invoke-direct {p0}, Ll/vay;-><init>()V

    .line 216
    .line 217
    .line 218
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public final O()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/bby;->r:Z

    .line 3
    .line 4
    return-void
.end method

.method public final P(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/bby;->r:Z

    .line 3
    .line 4
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Ll/cey;->o(Z)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/bby;->q:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Ll/bby;->q:Ll/kcg0;

    .line 21
    .line 22
    iget-object p0, p0, Ll/bby;->g:Landroid/widget/ProgressBar;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public a(Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 13
    .line 14
    iput-object p1, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 15
    .line 16
    iget-object p1, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    new-instance v0, Ll/way;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/way;-><init>(Ll/bby;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/bby;->d:Lv/VFrame_ColorFilter;

    .line 27
    .line 28
    new-instance v0, Ll/xay;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/xay;-><init>(Ll/bby;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/bby;->g:Landroid/widget/ProgressBar;

    .line 37
    .line 38
    iget-object v0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 39
    .line 40
    iget v0, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 41
    .line 42
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 43
    .line 44
    mul-float/2addr v0, v1

    .line 45
    float-to-int v0, v0

    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 52
    .line 53
    const-string v0, "raw"

    .line 54
    .line 55
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object v0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 70
    .line 71
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xf(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-nez p1, :cond_0

    .line 76
    .line 77
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 78
    .line 79
    const-string v0, "not supported yet"

    .line 80
    .line 81
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p6:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 85
    .line 86
    const/16 v1, 0x64

    .line 87
    .line 88
    const-string v2, "core_newmeet_video_uri"

    .line 89
    .line 90
    invoke-static {p1, v2, v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->i(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 95
    .line 96
    iget-object v1, p0, Ll/bby;->b:Lv/VDraweeView;

    .line 97
    .line 98
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 103
    .line 104
    iget-object v0, p0, Ll/bby;->b:Lv/VDraweeView;

    .line 105
    .line 106
    iget-object v1, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->k0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-object p1, p0, Ll/bby;->h:Lv/VImage;

    .line 114
    .line 115
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Ll/cey;->j()Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    sget v0, Ll/gbc0;->o1:I

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_2
    sget v0, Ll/gbc0;->p1:I

    .line 129
    .line 130
    :goto_1
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/bby;->h:Lv/VImage;

    .line 134
    .line 135
    new-instance v0, Ll/yay;

    .line 136
    .line 137
    invoke-direct {v0}, Ll/yay;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Ll/cey;->d()Lcom/p1/mobile/putong/data/Media;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    if-eqz p1, :cond_3

    .line 152
    .line 153
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p1}, Ll/cey;->d()Lcom/p1/mobile/putong/data/Media;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iget-object v0, p0, Ll/bby;->i:Lcom/p1/mobile/putong/data/Video;

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-eqz p1, :cond_3

    .line 168
    .line 169
    iget-object p1, p0, Ll/bby;->c:Landroid/widget/FrameLayout;

    .line 170
    .line 171
    new-instance v0, Ll/zay;

    .line 172
    .line 173
    invoke-direct {v0, p0}, Ll/zay;-><init>(Ll/bby;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 177
    .line 178
    .line 179
    :cond_3
    iget-object p1, p0, Ll/bby;->n:Ll/kcg0;

    .line 180
    .line 181
    if-nez p1, :cond_4

    .line 182
    .line 183
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-virtual {p1}, Ll/cey;->q()Lrx/c;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    new-instance v0, Ll/aby;

    .line 200
    .line 201
    invoke-direct {v0, p0}, Ll/aby;-><init>(Ll/bby;)V

    .line 202
    .line 203
    .line 204
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iput-object p1, p0, Ll/bby;->n:Ll/kcg0;

    .line 213
    .line 214
    :cond_4
    iget-object p1, p0, Ll/bby;->p:Ll/kcg0;

    .line 215
    .line 216
    if-nez p1, :cond_5

    .line 217
    .line 218
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    new-instance v0, Ll/oay;

    .line 223
    .line 224
    invoke-direct {v0, p0}, Ll/oay;-><init>(Ll/bby;)V

    .line 225
    .line 226
    .line 227
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iput-object p1, p0, Ll/bby;->p:Ll/kcg0;

    .line 236
    .line 237
    :cond_5
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    invoke-virtual {p1}, Ll/cey;->r()Lrx/c;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    new-instance v0, Ll/pay;

    .line 254
    .line 255
    invoke-direct {v0, p0}, Ll/pay;-><init>(Ll/bby;)V

    .line 256
    .line 257
    .line 258
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    iput-object p1, p0, Ll/bby;->o:Ll/kcg0;

    .line 267
    .line 268
    iget-object p1, p0, Ll/bby;->q:Ll/kcg0;

    .line 269
    .line 270
    if-nez p1, :cond_6

    .line 271
    .line 272
    const-wide/16 v0, 0x50

    .line 273
    .line 274
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 275
    .line 276
    invoke-static {v0, v1, p1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    new-instance p2, Ll/qay;

    .line 297
    .line 298
    invoke-direct {p2, p0}, Ll/qay;-><init>(Ll/bby;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    new-instance p2, Ll/ray;

    .line 306
    .line 307
    invoke-direct {p2, p0}, Ll/ray;-><init>(Ll/bby;)V

    .line 308
    .line 309
    .line 310
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 311
    .line 312
    .line 313
    move-result-object p2

    .line 314
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iput-object p1, p0, Ll/bby;->q:Ll/kcg0;

    .line 319
    .line 320
    :cond_6
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/bby;->A(Z)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/bby;->M()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bby;->x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()V
    .locals 1

    .line 1
    sget v0, Ll/ddc0;->A:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/bby;->z(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    sget v0, Ll/ddc0;->q:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/bby;->z(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onComplete()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VTexturePlayer;->v()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bby;->onPause()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/bby;->j:Lv/VTexturePlayer;

    .line 10
    .line 11
    new-instance v1, Ll/nay;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/nay;-><init>(Ll/bby;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v2, 0x190

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onError(II)V
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/Throwable;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "MeetFeedImageItemView play video error"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, " "

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/16 p1, 0x64

    .line 29
    .line 30
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    sget v0, Ll/ddc0;->A:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/bby;->z(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, v0}, Ll/bby;->z(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ll/bby;->A(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cby;->b(Ll/bby;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, v0}, Ll/bby;->z(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
