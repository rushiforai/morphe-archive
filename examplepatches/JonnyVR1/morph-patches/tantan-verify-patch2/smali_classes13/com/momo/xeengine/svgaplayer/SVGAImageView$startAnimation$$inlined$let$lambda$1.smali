.class final Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


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
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Landroid/animation/ValueAnimator;",
        "onAnimationUpdate",
        "com/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$1$1"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field final synthetic $drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

.field final synthetic $range$inlined:Lcom/momo/xeengine/svgaplayer/SVGARange;

.field final synthetic $reverse$inlined:Z

.field final synthetic this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/SVGARange;Lcom/momo/xeengine/svgaplayer/SVGADrawable;Z)V
    .locals 0

    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$range$inlined:Lcom/momo/xeengine/svgaplayer/SVGARange;

    iput-object p3, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    iput-boolean p4, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$reverse$inlined:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$getAnimator$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    if-eqz v0, :cond_2

    .line 21
    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setCurrentFrame$gift_player_release(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getCurrentFrame()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getCurrentFrame()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    int-to-double v1, v1

    .line 54
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    int-to-double v3, p0

    .line 65
    div-double/2addr v1, v3

    .line 66
    invoke-interface {p1, v0, v1, v2}, Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;->onStep(ID)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void

    .line 70
    :cond_2
    const-string p0, "null cannot be cast to non-null type kotlin.Int"

    .line 71
    .line 72
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
