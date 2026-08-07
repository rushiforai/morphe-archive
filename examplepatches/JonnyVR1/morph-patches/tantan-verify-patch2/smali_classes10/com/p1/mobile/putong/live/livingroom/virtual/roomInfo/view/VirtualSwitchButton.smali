.class public Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Landroid/animation/Animator;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c(Z)V

    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic c(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget v1, Ll/obc0;->l7:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget v1, Ll/obc0;->k7:I

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->b:Landroid/view/View;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    sget p1, Ll/obc0;->j7:I

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    sget p1, Ll/obc0;->i7:I

    .line 21
    .line 22
    :goto_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public d(ZZ)V
    .locals 6

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->d:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c:Landroid/animation/Animator;

    .line 4
    .line 5
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->a:Landroid/view/View;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x2

    .line 16
    const/high16 v4, 0x41800000    # 16.0f

    .line 17
    .line 18
    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    int-to-float v4, v4

    .line 27
    new-array v3, v3, [F

    .line 28
    .line 29
    aput v0, v3, v2

    .line 30
    .line 31
    aput v4, v3, v1

    .line 32
    .line 33
    invoke-static {p2, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c:Landroid/animation/Animator;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    int-to-float v4, v4

    .line 45
    new-array v3, v3, [F

    .line 46
    .line 47
    aput v4, v3, v2

    .line 48
    .line 49
    aput v0, v3, v1

    .line 50
    .line 51
    invoke-static {p2, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c:Landroid/animation/Animator;

    .line 56
    .line 57
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c:Landroid/animation/Animator;

    .line 58
    .line 59
    const-wide/16 v0, 0xc8

    .line 60
    .line 61
    invoke-virtual {p2, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c:Landroid/animation/Animator;

    .line 65
    .line 66
    new-instance v0, Ll/j4m0;

    .line 67
    .line 68
    invoke-direct {v0, p0, p1}, Ll/j4m0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;Z)V

    .line 69
    .line 70
    .line 71
    invoke-static {p2, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c:Landroid/animation/Animator;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->a:Landroid/view/View;

    .line 81
    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    sget v0, Ll/qa00;->m:I

    .line 85
    .line 86
    int-to-float v0, v0

    .line 87
    :cond_2
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 88
    .line 89
    .line 90
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->a:Landroid/view/View;

    .line 91
    .line 92
    if-eqz p1, :cond_3

    .line 93
    .line 94
    sget v0, Ll/obc0;->l7:I

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    sget v0, Ll/obc0;->k7:I

    .line 98
    .line 99
    :goto_1
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->b:Landroid/view/View;

    .line 103
    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    sget p1, Ll/obc0;->j7:I

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    sget p1, Ll/obc0;->i7:I

    .line 110
    .line 111
    :goto_2
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->c:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-static {p0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->b:Landroid/view/View;

    .line 14
    .line 15
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    const/high16 v1, 0x42380000    # 46.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sget v2, Ll/qa00;->t:I

    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->b:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->a:Landroid/view/View;

    .line 43
    .line 44
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 45
    .line 46
    const/high16 v1, 0x41b00000    # 22.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-direct {v0, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 57
    .line 58
    .line 59
    const/high16 v1, 0x40800000    # 4.0f

    .line 60
    .line 61
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 66
    .line 67
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 72
    .line 73
    const/16 v1, 0x10

    .line 74
    .line 75
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->a:Landroid/view/View;

    .line 78
    .line 79
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    const/4 v0, 0x0

    .line 83
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->d(ZZ)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public setCheckedWithoutAnim(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->d(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
