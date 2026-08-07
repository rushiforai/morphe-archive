.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Landroid/animation/AnimatorSet;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->d()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->e()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dd60;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d()V
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

.method public final synthetic e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 6
    .line 7
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/civ;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/civ;->B()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->a:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->oa:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->b:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->g()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final g()V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    const/high16 v1, 0x42140000    # 37.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->a:Lv/VText;

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    const/4 v3, 0x2

    .line 15
    new-array v4, v3, [F

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    aput v0, v4, v5

    .line 19
    .line 20
    const/4 v6, 0x1

    .line 21
    aput v1, v4, v6

    .line 22
    .line 23
    sget-object v7, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 24
    .line 25
    invoke-static {v2, v7, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-wide/16 v8, 0x190

    .line 30
    .line 31
    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    const/16 v4, 0x7d0

    .line 35
    .line 36
    invoke-static {v4}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    iget-object v10, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->a:Lv/VText;

    .line 41
    .line 42
    new-array v11, v3, [F

    .line 43
    .line 44
    aput v1, v11, v5

    .line 45
    .line 46
    aput v0, v11, v6

    .line 47
    .line 48
    invoke-static {v10, v7, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->b:Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    const/4 v7, 0x3

    .line 63
    new-array v7, v7, [Landroid/animation/Animator;

    .line 64
    .line 65
    aput-object v2, v7, v5

    .line 66
    .line 67
    aput-object v4, v7, v6

    .line 68
    .line 69
    aput-object v0, v7, v3

    .line 70
    .line 71
    invoke-virtual {v1, v7}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->b:Landroid/animation/AnimatorSet;

    .line 75
    .line 76
    new-instance v1, Ll/bd60;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/bd60;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;)V

    .line 79
    .line 80
    .line 81
    new-instance v2, Ll/cd60;

    .line 82
    .line 83
    invoke-direct {v2, p0}, Ll/cd60;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->b:Landroid/animation/AnimatorSet;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftActionTipsView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
