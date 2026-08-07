.class public final Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xeengine/svgaplayer/SVGAImageView;->startAnimation(Lcom/momo/xeengine/svgaplayer/SVGARange;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0008\u0004\n\u0002\u0008\u0004\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\t\u00b8\u0006\u0000"
    }
    d2 = {
        "com/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$1$2",
        "Landroid/animation/Animator$AnimatorListener;",
        "onAnimationCancel",
        "",
        "animation",
        "Landroid/animation/Animator;",
        "onAnimationEnd",
        "onAnimationRepeat",
        "onAnimationStart",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field final synthetic $drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

.field final synthetic $endFrame:Lkotlin/jvm/internal/Ref$IntRef;

.field final synthetic $range$inlined:Lcom/momo/xeengine/svgaplayer/SVGARange;

.field final synthetic $reverse$inlined:Z

.field final synthetic $startFrame:Lkotlin/jvm/internal/Ref$IntRef;

.field final synthetic this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/SVGARange;Lcom/momo/xeengine/svgaplayer/SVGADrawable;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$startFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$endFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$range$inlined:Lcom/momo/xeengine/svgaplayer/SVGARange;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$reverse$inlined:Z

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-static {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$setAnimating$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->setMStartFrame(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->setMEndFrame(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 16
    .line 17
    invoke-static {p1, v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$setAnimating$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-interface {p1}, Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;->onFinished()V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->getClearsAfterStop()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->getFillMode()Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Backward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 51
    .line 52
    if-ne p1, v0, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$startFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 57
    .line 58
    iget p0, p0, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setCurrentFrame$gift_player_release(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->getFillMode()Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget-object v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 71
    .line 72
    if-ne p1, v0, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$endFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 77
    .line 78
    iget p0, p0, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setCurrentFrame$gift_player_release(I)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;->onRepeat()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;->onStart()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$setAnimating$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
