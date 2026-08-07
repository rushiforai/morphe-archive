.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;
.super Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesBaseView;
.source "SourceFile"


# instance fields
.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;

.field public d:Lv/VImage;

.field public e:Landroid/animation/Animator;

.field public f:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 10
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->e:Landroid/animation/Animator;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->f:Landroid/animation/Animator;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->j()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->h()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->i()V

    return-void
.end method

.method private g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    sget-object v1, Ll/zft;->B:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "context_single_room"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ll/izs;->k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c(Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic h()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic i()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic j()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a()V
    .locals 11

    .line 1
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v8, 0x2

    .line 7
    new-array v7, v8, [F

    .line 8
    .line 9
    fill-array-data v7, :array_0

    .line 10
    .line 11
    .line 12
    const-string v1, "translationX"

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    const-wide/16 v4, 0x198

    .line 17
    .line 18
    move-object v0, p0

    .line 19
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    .line 24
    .line 25
    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 26
    .line 27
    .line 28
    new-array v7, v8, [F

    .line 29
    .line 30
    fill-array-data v7, :array_1

    .line 31
    .line 32
    .line 33
    const-string v1, "skewValue"

    .line 34
    .line 35
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    .line 40
    .line 41
    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 42
    .line 43
    .line 44
    new-array v7, v8, [F

    .line 45
    .line 46
    fill-array-data v7, :array_2

    .line 47
    .line 48
    .line 49
    const-string v1, "translationX"

    .line 50
    .line 51
    const-wide/16 v4, 0xe1

    .line 52
    .line 53
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object v10

    .line 57
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    .line 58
    .line 59
    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 60
    .line 61
    .line 62
    new-array v7, v8, [F

    .line 63
    .line 64
    fill-array-data v7, :array_3

    .line 65
    .line 66
    .line 67
    const-string v1, "skewValue"

    .line 68
    .line 69
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    filled-new-array {p0, v9}, [Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    filled-new-array {v10, v1}, [Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    filled-new-array {p0, v1}, [Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iput-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->e:Landroid/animation/Animator;

    .line 98
    .line 99
    new-instance v1, Ll/e680;

    .line 100
    .line 101
    invoke-direct {v1, v0}, Ll/e680;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;)V

    .line 102
    .line 103
    .line 104
    invoke-static {p0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    iget-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->e:Landroid/animation/Animator;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :array_0
    .array-data 4
        0x439f0000    # 318.0f
        -0x3d3a0000    # -99.0f
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    :array_1
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f000000    # 0.5f
    .end array-data

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    :array_2
    .array-data 4
        -0x3d3a0000    # -99.0f
        0x0
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    :array_3
    .array-data 4
        0x3f000000    # 0.5f
        0x0
    .end array-data
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h680;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v8, Landroid/view/animation/AccelerateInterpolator;

    .line 11
    .line 12
    invoke-direct {v8}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v9, v0, [F

    .line 17
    .line 18
    fill-array-data v9, :array_0

    .line 19
    .line 20
    .line 21
    const-string v3, "skewValue"

    .line 22
    .line 23
    const-wide/16 v4, 0x0

    .line 24
    .line 25
    const-wide/16 v6, 0xd0

    .line 26
    .line 27
    move-object v2, p0

    .line 28
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    move-object v1, v2

    .line 33
    new-instance v2, Ll/f680;

    .line 34
    .line 35
    invoke-direct {v2, v1}, Ll/f680;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p0, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    new-instance v7, Landroid/view/animation/AccelerateInterpolator;

    .line 42
    .line 43
    invoke-direct {v7}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 44
    .line 45
    .line 46
    new-array v8, v0, [F

    .line 47
    .line 48
    fill-array-data v8, :array_1

    .line 49
    .line 50
    .line 51
    const-string v2, "skewValue"

    .line 52
    .line 53
    const-wide/16 v3, 0x0

    .line 54
    .line 55
    const-wide/16 v5, 0xd0

    .line 56
    .line 57
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    new-instance v7, Landroid/view/animation/AccelerateInterpolator;

    .line 62
    .line 63
    invoke-direct {v7}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 64
    .line 65
    .line 66
    new-array v8, v0, [F

    .line 67
    .line 68
    fill-array-data v8, :array_2

    .line 69
    .line 70
    .line 71
    const-string v2, "translationX"

    .line 72
    .line 73
    const-wide/16 v5, 0x177

    .line 74
    .line 75
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v2, Ll/g680;

    .line 80
    .line 81
    invoke-direct {v2, v1}, Ll/g680;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    filled-new-array {v9, v0}, [Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    filled-new-array {p0, v0}, [Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    iput-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->f:Landroid/animation/Animator;

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :array_0
    .array-data 4
        0x0
        -0x41000000    # -0.5f
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    :array_1
    .array-data 4
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    :array_2
    .array-data 4
        0x0
        0x439f0000    # 318.0f
    .end array-data
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->e:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesBaseView;->b(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->f:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesBaseView;->b(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->e:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesBaseView;->b(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->f:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesBaseView;->b(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->g()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setWinTimes(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->d:Lv/VImage;

    .line 2
    .line 3
    sget v1, Ll/obc0;->H5:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkOtherWinTimesView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;

    .line 9
    .line 10
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->setNumber(J)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesBaseView;->setWinTimes(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
