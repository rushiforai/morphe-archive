.class public Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Z)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x0

    .line 4
    const-wide/16 v3, 0x78

    .line 5
    .line 6
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 7
    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/high16 v6, 0x3f800000    # 1.0f

    .line 15
    .line 16
    cmpl-float p1, p1, v6

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;->a:Landroid/animation/Animator;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;->a:Landroid/animation/Animator;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    new-array v1, v1, [F

    .line 40
    .line 41
    aput p1, v1, v2

    .line 42
    .line 43
    aput v6, v1, v0

    .line 44
    .line 45
    invoke-static {p0, v5, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 54
    .line 55
    .line 56
    :cond_1
    invoke-super {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;->a:Landroid/animation/Animator;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;->a:Landroid/animation/Animator;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 73
    .line 74
    .line 75
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    const/4 v6, 0x0

    .line 80
    cmpl-float p1, p1, v6

    .line 81
    .line 82
    if-nez p1, :cond_4

    .line 83
    .line 84
    const/16 p1, 0x8

    .line 85
    .line 86
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    new-array v1, v1, [F

    .line 95
    .line 96
    aput p1, v1, v2

    .line 97
    .line 98
    aput v6, v1, v0

    .line 99
    .line 100
    invoke-static {p0, v5, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;->a:Landroid/animation/Animator;

    .line 109
    .line 110
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView$a;

    .line 111
    .line 112
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;->a:Landroid/animation/Animator;

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eq v0, p1, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardStackShadowView;->b(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
