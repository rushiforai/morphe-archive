.class public Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Landroid/animation/Animator;

.field public i:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->d()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->e()V

    return-void
.end method

.method private getAnimatorDismiss()Landroid/animation/Animator;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->i:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->e:Landroid/view/View;

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    new-array v8, v0, [F

    .line 18
    .line 19
    fill-array-data v8, :array_0

    .line 20
    .line 21
    .line 22
    const-string v2, "alpha"

    .line 23
    .line 24
    const-wide/16 v3, 0xc8

    .line 25
    .line 26
    const-wide/16 v5, 0xc8

    .line 27
    .line 28
    const/4 v7, 0x0

    .line 29
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->i:Landroid/animation/Animator;

    .line 34
    .line 35
    new-instance v1, Ll/plr;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/plr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->i:Landroid/animation/Animator;

    .line 44
    .line 45
    return-object p0

    .line 46
    nop

    .line 47
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private getAnimatorShow()Landroid/animation/Animator;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->h:Landroid/animation/Animator;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->h:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->g:Landroid/view/View;

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    new-array v9, v1, [F

    .line 20
    .line 21
    fill-array-data v9, :array_0

    .line 22
    .line 23
    .line 24
    const-string v3, "alpha"

    .line 25
    .line 26
    const-wide/16 v4, 0x0

    .line 27
    .line 28
    const-wide/16 v6, 0x258

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->e:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->e:Landroid/view/View;

    .line 42
    .line 43
    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    const/high16 v11, 0x41200000    # 10.0f

    .line 48
    .line 49
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    int-to-float v6, v6

    .line 54
    sub-float/2addr v5, v6

    .line 55
    new-array v10, v1, [F

    .line 56
    .line 57
    const/4 v12, 0x0

    .line 58
    aput v4, v10, v12

    .line 59
    .line 60
    const/4 v13, 0x1

    .line 61
    aput v5, v10, v13

    .line 62
    .line 63
    const-string v4, "translationX"

    .line 64
    .line 65
    const-wide/16 v5, 0x0

    .line 66
    .line 67
    const-wide/16 v7, 0x258

    .line 68
    .line 69
    const/4 v9, 0x0

    .line 70
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->f:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {v14}, Landroid/view/View;->getTranslationX()F

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->f:Landroid/view/View;

    .line 81
    .line 82
    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    int-to-float v6, v6

    .line 91
    sub-float/2addr v5, v6

    .line 92
    new-array v1, v1, [F

    .line 93
    .line 94
    aput v4, v1, v12

    .line 95
    .line 96
    aput v5, v1, v13

    .line 97
    .line 98
    const-string v15, "translationX"

    .line 99
    .line 100
    const-wide/16 v16, 0x64

    .line 101
    .line 102
    const-wide/16 v18, 0x258

    .line 103
    .line 104
    const/16 v20, 0x0

    .line 105
    .line 106
    move-object/from16 v21, v1

    .line 107
    .line 108
    invoke-static/range {v14 .. v21}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    filled-new-array {v2, v3, v1}, [Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->h:Landroid/animation/Animator;

    .line 121
    .line 122
    new-instance v2, Ll/qlr;

    .line 123
    .line 124
    invoke-direct {v2, v0}, Ll/qlr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->h:Landroid/animation/Animator;

    .line 131
    .line 132
    return-object v0

    .line 133
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rlr;->a(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->e:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->f:Landroid/view/View;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->e:Landroid/view/View;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->g:Landroid/view/View;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->f:Landroid/view/View;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->g:Landroid/view/View;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->b:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->g:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    sub-int/2addr v1, v2

    .line 26
    int-to-float v1, v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->f:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->e:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->getAnimatorShow()Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic e()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->getAnimatorDismiss()Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-wide/16 v0, 0x258

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->i:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->i:Landroid/animation/Animator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->i:Landroid/animation/Animator;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->h:Landroid/animation/Animator;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->h:Landroid/animation/Animator;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->h:Landroid/animation/Animator;

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersNewLikeBubble;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
