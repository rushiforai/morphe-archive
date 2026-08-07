.class public final Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->m()Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Landroid/animation/Animator;",
        "animation",
        "",
        "onAnimationStart",
        "(Landroid/animation/Animator;)V",
        "onAnimationEnd",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

.field public final synthetic b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->b:Ljava/util/List;

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
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->f(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;)F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->g(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setY(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->d(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;)F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->e(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;)F

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->b:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Landroid/view/View;

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    .line 67
    .line 68
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->c(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;)Landroid/animation/AnimatorListenerAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    if-eqz p0, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout$b;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->c(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;)Landroid/animation/AnimatorListenerAdapter;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
