.class public final Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGAImageView;->startAnimation(Lcom/immomo/svgaplayer/SVGARange;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000+\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0008\u0004\n\u0002\u0008\u0004\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016J\u0012\u0010\u0007\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016J\u0012\u0010\u0008\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016J\u0012\u0010\t\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016\u00a8\u0006\n\u00b8\u0006\u0000"
    }
    d2 = {
        "com/immomo/svgaplayer/SVGAImageView$startAnimation$1$2",
        "Landroid/animation/Animator$AnimatorListener;",
        "(Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$1;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;)V",
        "onAnimationCancel",
        "",
        "animation",
        "Landroid/animation/Animator;",
        "onAnimationEnd",
        "onAnimationRepeat",
        "onAnimationStart",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

.field final synthetic $endFrame:Lkotlin/jvm/internal/Ref$IntRef;

.field final synthetic $range$inlined:Lcom/immomo/svgaplayer/SVGARange;

.field final synthetic $reverse$inlined:Z

.field final synthetic $startFrame:Lkotlin/jvm/internal/Ref$IntRef;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGAImageView;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lcom/immomo/svgaplayer/SVGAImageView;Lcom/immomo/svgaplayer/SVGARange;Lcom/immomo/svgaplayer/SVGADrawable;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$startFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$endFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$range$inlined:Lcom/immomo/svgaplayer/SVGARange;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$reverse$inlined:Z

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
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$setAnimating$p(Lcom/immomo/svgaplayer/SVGAImageView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->setMStartFrame(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->setMEndFrame(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->access$setAnimating$p(Lcom/immomo/svgaplayer/SVGAImageView;Z)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAThreadAdapter()Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getTaskTag(Lcom/immomo/svgaplayer/SVGAImageView;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {p1, v1}, Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;->cancelTaskByTag(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getAnimator$p(Lcom/immomo/svgaplayer/SVGAImageView;)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getAnimator$p(Lcom/immomo/svgaplayer/SVGAImageView;)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    :cond_3
    if-eqz p1, :cond_4

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lcom/immomo/svgaplayer/SVGADrawable;->setCleared$svgalibrary_release(Z)V

    .line 64
    .line 65
    .line 66
    :cond_4
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/immomo/svgaplayer/SVGAImageView;)Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    invoke-interface {p1}, Lcom/immomo/svgaplayer/listener/SVGACallback;->onFinished()V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$isPause$p(Lcom/immomo/svgaplayer/SVGAImageView;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_7

    .line 84
    .line 85
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->getClearsAfterStop()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_7

    .line 92
    .line 93
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->getFillMode()Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    sget-object v0, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Backward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 100
    .line 101
    if-ne p1, v0, :cond_6

    .line 102
    .line 103
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$startFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 106
    .line 107
    iget p0, p0, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 108
    .line 109
    invoke-virtual {p1, p0}, Lcom/immomo/svgaplayer/SVGADrawable;->setCurrentFrame$svgalibrary_release(I)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_6
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->getFillMode()Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    sget-object v0, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 120
    .line 121
    if-ne p1, v0, :cond_7

    .line 122
    .line 123
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->$endFrame:Lkotlin/jvm/internal/Ref$IntRef;

    .line 126
    .line 127
    iget p0, p0, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 128
    .line 129
    invoke-virtual {p1, p0}, Lcom/immomo/svgaplayer/SVGADrawable;->setCurrentFrame$svgalibrary_release(I)V

    .line 130
    .line 131
    .line 132
    :cond_7
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/immomo/svgaplayer/SVGAImageView;)Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/immomo/svgaplayer/listener/SVGACallback;->onRepeat()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->access$setPause$p(Lcom/immomo/svgaplayer/SVGAImageView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/immomo/svgaplayer/SVGAImageView;)Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Lcom/immomo/svgaplayer/listener/SVGACallback;->onStart()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-static {p0, p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$setAnimating$p(Lcom/immomo/svgaplayer/SVGAImageView;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
