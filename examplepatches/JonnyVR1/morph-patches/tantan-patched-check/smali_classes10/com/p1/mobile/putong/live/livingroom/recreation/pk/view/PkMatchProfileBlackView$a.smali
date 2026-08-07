.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)Lv/VDraweeView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->g(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-lt v0, v1, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    :goto_0
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->i(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 54
    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)Lv/VDraweeView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->f(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)Lv/VDraweeView;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 82
    .line 83
    .line 84
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    xor-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->h(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;

    .line 96
    .line 97
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;->b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileBlackView;)Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
