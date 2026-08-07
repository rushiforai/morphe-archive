.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/animation/AnimatorSet;

.field public i:Landroid/animation/AnimatorSet;

.field public j:Landroid/animation/Animator$AnimatorListener;

.field public k:Landroid/animation/Animator$AnimatorListener;

.field public l:Z

.field public m:Z

.field public final n:Ljava/lang/Runnable;

.field public final o:Ljava/lang/Runnable;

.field public p:Z

.field public q:Ljava/lang/String;

.field public r:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->l:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->m:Z

    .line 9
    .line 10
    new-instance p2, Ll/dch;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/dch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->n:Ljava/lang/Runnable;

    .line 16
    .line 17
    new-instance p2, Ll/ech;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/ech;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->o:Ljava/lang/Runnable;

    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->p:Z

    .line 25
    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->r:Z

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->n0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->s0()V

    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->o:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->p:Z

    return-void
.end method


# virtual methods
.method public getTitleView()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->d:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public final m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fch;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->o:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    :goto_0
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->o0()Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->k:Landroid/animation/Animator$AnimatorListener;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public o0()Landroid/animation/AnimatorSet;
    .locals 13

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    const-string v4, "alpha"

    .line 15
    .line 16
    invoke-static {v1, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v5, 0x172

    .line 21
    .line 22
    invoke-virtual {v1, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 26
    .line 27
    new-array v7, v2, [F

    .line 28
    .line 29
    fill-array-data v7, :array_1

    .line 30
    .line 31
    .line 32
    invoke-static {v3, v4, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v1, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    const/high16 v6, 0x41200000    # 10.0f

    .line 46
    .line 47
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    sub-int/2addr v5, v7

    .line 52
    int-to-float v5, v5

    .line 53
    new-array v7, v2, [F

    .line 54
    .line 55
    const/4 v8, 0x0

    .line 56
    const/4 v9, 0x0

    .line 57
    aput v9, v7, v8

    .line 58
    .line 59
    const/4 v10, 0x1

    .line 60
    aput v5, v7, v10

    .line 61
    .line 62
    const-string v5, "translationY"

    .line 63
    .line 64
    invoke-static {v4, v5, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    const-wide/16 v11, 0x17c

    .line 69
    .line 70
    invoke-virtual {v4, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    neg-int p0, p0

    .line 80
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    add-int/2addr p0, v6

    .line 85
    int-to-float p0, p0

    .line 86
    new-array v6, v2, [F

    .line 87
    .line 88
    aput p0, v6, v8

    .line 89
    .line 90
    aput v9, v6, v10

    .line 91
    .line 92
    invoke-static {v7, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    const-wide/16 v5, 0xa

    .line 100
    .line 101
    invoke-virtual {v1, v5, v6}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v5, v6}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 105
    .line 106
    .line 107
    const/4 v5, 0x4

    .line 108
    new-array v5, v5, [Landroid/animation/Animator;

    .line 109
    .line 110
    aput-object v1, v5, v8

    .line 111
    .line 112
    aput-object v3, v5, v10

    .line 113
    .line 114
    aput-object p0, v5, v2

    .line 115
    .line 116
    const/4 p0, 0x3

    .line 117
    aput-object v4, v5, p0

    .line 118
    .line 119
    invoke-virtual {v0, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 120
    .line 121
    .line 122
    return-object v0

    .line 123
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->m:Z

    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->m:Z

    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->m0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->e:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->e:Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->d:Lv/VText;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$a;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$b;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->k:Landroid/animation/Animator$AnimatorListener;

    .line 38
    .line 39
    return-void
.end method

.method public p0()Landroid/animation/AnimatorSet;
    .locals 12

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    const-string v4, "alpha"

    .line 15
    .line 16
    invoke-static {v1, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v3, 0x172

    .line 21
    .line 22
    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    neg-int v4, v4

    .line 32
    const/high16 v5, 0x41200000    # 10.0f

    .line 33
    .line 34
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    add-int/2addr v4, v6

    .line 39
    int-to-float v4, v4

    .line 40
    new-array v6, v2, [F

    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    const/4 v8, 0x0

    .line 44
    aput v8, v6, v7

    .line 45
    .line 46
    const/4 v9, 0x1

    .line 47
    aput v4, v6, v9

    .line 48
    .line 49
    const-string v4, "translationY"

    .line 50
    .line 51
    invoke-static {v3, v4, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const-wide/16 v10, 0x17c

    .line 56
    .line 57
    invoke-virtual {v3, v10, v11}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    sub-int/2addr p0, v5

    .line 71
    int-to-float p0, p0

    .line 72
    new-array v5, v2, [F

    .line 73
    .line 74
    aput p0, v5, v7

    .line 75
    .line 76
    aput v8, v5, v9

    .line 77
    .line 78
    invoke-static {v6, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, v10, v11}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    const-wide/16 v4, 0xa

    .line 86
    .line 87
    invoke-virtual {v1, v4, v5}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 88
    .line 89
    .line 90
    const/4 v4, 0x3

    .line 91
    new-array v4, v4, [Landroid/animation/Animator;

    .line 92
    .line 93
    aput-object v1, v4, v7

    .line 94
    .line 95
    aput-object p0, v4, v9

    .line 96
    .line 97
    aput-object v3, v4, v2

    .line 98
    .line 99
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 100
    .line 101
    .line 102
    return-object v0

    .line 103
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public q0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public r0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->n:Ljava/lang/Runnable;

    .line 11
    .line 12
    const-wide/16 v1, 0x5

    .line 13
    .line 14
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final s0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->r:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->n:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {v1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->p0()Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public setScrollTv(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->q:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 9
    .line 10
    const-string p1, "\u559c\u6b22+1"

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->q0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->p:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->r:Z

    .line 14
    .line 15
    :cond_1
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->p:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 19
    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->h:Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->i:Landroid/animation/AnimatorSet;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 56
    .line 57
    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 59
    .line 60
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->q:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 72
    .line 73
    const/high16 v2, 0x3f800000    # 1.0f

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->f:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 84
    .line 85
    const/4 v1, 0x4

    .line 86
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->g:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {p0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 92
    .line 93
    .line 94
    return-void
.end method
