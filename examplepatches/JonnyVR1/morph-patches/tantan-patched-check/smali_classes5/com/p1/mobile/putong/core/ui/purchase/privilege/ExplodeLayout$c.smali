.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/animation/AnimatorSet;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->b:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->a:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->a:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->b:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 7
    .line 8
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->h:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/16 v2, 0x96

    .line 11
    .line 12
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->d(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/view/View;I)Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->b:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 17
    .line 18
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->j:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    const/16 v3, 0xc8

    .line 21
    .line 22
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->d(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/view/View;I)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->b:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 27
    .line 28
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    const/16 v4, 0x32

    .line 31
    .line 32
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->d(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/view/View;I)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->b:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 37
    .line 38
    iget-object v4, v3, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->n:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    const/16 v5, 0x64

    .line 41
    .line 42
    invoke-static {v3, v4, v5}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->d(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/view/View;I)Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const/4 v4, 0x4

    .line 47
    new-array v4, v4, [Landroid/animation/Animator;

    .line 48
    .line 49
    const/4 v5, 0x0

    .line 50
    aput-object v0, v4, v5

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    aput-object v1, v4, v0

    .line 54
    .line 55
    const/4 v0, 0x2

    .line 56
    aput-object v2, v4, v0

    .line 57
    .line 58
    const/4 v0, 0x3

    .line 59
    aput-object v3, v4, v0

    .line 60
    .line 61
    invoke-virtual {p1, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->a:Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    const-wide/16 v0, 0x96

    .line 67
    .line 68
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->a:Landroid/animation/AnimatorSet;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;->b:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
