.class public Ll/fqj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Ll/f1g0;

.field public c:Landroid/animation/Animator;

.field public d:Landroid/animation/Animator;

.field public e:Lv/VFrame;

.field public f:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/f1g0;Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/fqj0;->b:Ll/f1g0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/fqj0;->e:Lv/VFrame;

    .line 7
    .line 8
    new-instance p2, Lv/VImage;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/fqj0;->f:Lv/VImage;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleX(F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b(Ll/fqj0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fqj0;->f(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    return-void
.end method

.method public static synthetic c(Ll/fqj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fqj0;->g()V

    return-void
.end method


# virtual methods
.method public final d(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/fqj0;->b:Ll/f1g0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-interface {v0, v1}, Ll/f1g0;->c(Z)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_1
    sget-object v0, Ll/fqj0$b;->a:[I

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    aget v0, v0, v2

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    const/4 v3, 0x2

    .line 30
    if-eq v0, v2, :cond_4

    .line 31
    .line 32
    if-eq v0, v3, :cond_3

    .line 33
    .line 34
    const/4 v4, 0x3

    .line 35
    if-eq v0, v4, :cond_2

    .line 36
    .line 37
    move v0, v1

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 40
    .line 41
    sget v4, Ll/dbc0;->kv:I

    .line 42
    .line 43
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    goto :goto_2

    .line 53
    :cond_3
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 54
    .line 55
    sget v4, Ll/dbc0;->Wq:I

    .line 56
    .line 57
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    :goto_1
    neg-int v0, v0

    .line 67
    goto :goto_2

    .line 68
    :cond_4
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 69
    .line 70
    sget v4, Ll/dbc0;->lv:I

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    goto :goto_1

    .line 82
    :goto_2
    invoke-virtual {p0}, Ll/fqj0;->e()Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    iget-object v5, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 87
    .line 88
    sget-object v6, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 89
    .line 90
    int-to-float v0, v0

    .line 91
    new-array v12, v3, [F

    .line 92
    .line 93
    const/4 v7, 0x0

    .line 94
    aput v7, v12, v1

    .line 95
    .line 96
    aput v0, v12, v2

    .line 97
    .line 98
    const-wide/16 v7, 0xc8

    .line 99
    .line 100
    const-wide/16 v9, 0x1f4

    .line 101
    .line 102
    const/4 v11, 0x0

    .line 103
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v5, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 108
    .line 109
    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 110
    .line 111
    new-array v12, v3, [F

    .line 112
    .line 113
    fill-array-data v12, :array_0

    .line 114
    .line 115
    .line 116
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    filled-new-array {v4, v0, v1}, [Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Ll/fqj0;->c:Landroid/animation/Animator;

    .line 129
    .line 130
    new-instance v1, Ll/fqj0$a;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/fqj0$a;-><init>(Ll/fqj0;)V

    .line 133
    .line 134
    .line 135
    new-instance v2, Ll/dqj0;

    .line 136
    .line 137
    invoke-direct {v2, p0, p1}, Ll/dqj0;-><init>(Ll/fqj0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ll/fqj0;->c:Landroid/animation/Animator;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final e()Landroid/animation/Animator;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 2
    .line 3
    const/high16 v1, 0x42400000    # 48.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 14
    .line 15
    const/high16 v1, 0x42c00000    # 96.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Ll/fqj0;->f:Lv/VImage;

    .line 26
    .line 27
    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 28
    .line 29
    const/4 v0, 0x5

    .line 30
    new-array v9, v0, [F

    .line 31
    .line 32
    fill-array-data v9, :array_0

    .line 33
    .line 34
    .line 35
    const-wide/16 v4, 0x0

    .line 36
    .line 37
    const-wide/16 v6, 0x1f4

    .line 38
    .line 39
    const/4 v8, 0x0

    .line 40
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/fqj0;->f:Lv/VImage;

    .line 45
    .line 46
    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 47
    .line 48
    new-array v9, v0, [F

    .line 49
    .line 50
    fill-array-data v9, :array_1

    .line 51
    .line 52
    .line 53
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    filled-new-array {v1, v0}, [Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/eqj0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/eqj0;-><init>(Ll/fqj0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    return-object v0

    .line 74
    nop

    .line 75
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fqj0;->b:Ll/f1g0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, p0, p1, v1, v2}, Ll/f1g0;->k(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;FZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fqj0;->e:Lv/VFrame;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

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
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/view/ViewGroup;

    .line 28
    .line 29
    iget-object p0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    sget-object p2, Ll/fqj0$b;->b:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, p2, p1

    .line 8
    .line 9
    const/4 p2, 0x2

    .line 10
    if-eq p1, p2, :cond_0

    .line 11
    .line 12
    const/4 p2, 0x3

    .line 13
    if-eq p1, p2, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/fqj0;->h()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/fqj0;->k(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public j(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fqj0;->c:Landroid/animation/Animator;

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
    iget-object v0, p0, Ll/fqj0;->c:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/fqj0;->d:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Ll/fqj0;->d:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :cond_2
    iput-object p1, p0, Ll/fqj0;->a:Landroid/view/View;

    .line 35
    .line 36
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    const/high16 v0, 0x42c00000    # 96.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-direct {p1, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 49
    .line 50
    .line 51
    const/16 v0, 0x11

    .line 52
    .line 53
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 54
    .line 55
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Ll/fqj0;->f:Lv/VImage;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/view/ViewGroup;

    .line 74
    .line 75
    iget-object v1, p0, Ll/fqj0;->f:Lv/VImage;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    iget-object v0, p0, Ll/fqj0;->e:Lv/VFrame;

    .line 81
    .line 82
    iget-object v1, p0, Ll/fqj0;->f:Lv/VImage;

    .line 83
    .line 84
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p2}, Ll/fqj0;->d(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public k(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v2, v1, [F

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    aput v4, v2, v3

    .line 15
    .line 16
    invoke-static {p1, v0, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v2, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 21
    .line 22
    new-array v5, v1, [F

    .line 23
    .line 24
    aput v4, v5, v3

    .line 25
    .line 26
    invoke-static {p1, v2, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 31
    .line 32
    new-array v1, v1, [F

    .line 33
    .line 34
    const/high16 v5, 0x3f800000    # 1.0f

    .line 35
    .line 36
    aput v5, v1, v3

    .line 37
    .line 38
    invoke-static {p1, v4, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    filled-new-array {v0, v2, v1}, [Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-wide/16 v1, 0xc8

    .line 47
    .line 48
    invoke-static {v1, v2, v0}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/fqj0;->d:Landroid/animation/Animator;

    .line 53
    .line 54
    new-instance v1, Ll/cqj0;

    .line 55
    .line 56
    invoke-direct {v1, p1}, Ll/cqj0;-><init>(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/fqj0;->d:Landroid/animation/Animator;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method
