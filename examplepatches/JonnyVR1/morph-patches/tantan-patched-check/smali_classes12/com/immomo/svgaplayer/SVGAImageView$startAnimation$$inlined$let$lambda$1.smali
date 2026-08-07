.class final Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


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
        "\u0000\u0014\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Landroid/animation/ValueAnimator;",
        "kotlin.jvm.PlatformType",
        "onAnimationUpdate",
        "com/immomo/svgaplayer/SVGAImageView$startAnimation$1$1"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

.field final synthetic $range$inlined:Lcom/immomo/svgaplayer/SVGARange;

.field final synthetic $reverse$inlined:Z

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGAImageView;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAImageView;Lcom/immomo/svgaplayer/SVGARange;Lcom/immomo/svgaplayer/SVGADrawable;Z)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$range$inlined:Lcom/immomo/svgaplayer/SVGARange;

    iput-object p3, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    iput-boolean p4, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$reverse$inlined:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getAnimator$p(Lcom/immomo/svgaplayer/SVGAImageView;)Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    if-eqz v0, :cond_2

    .line 18
    .line 19
    check-cast v0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p1, v0}, Lcom/immomo/svgaplayer/SVGADrawable;->setCurrentFrame$svgalibrary_release(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->this$0:Lcom/immomo/svgaplayer/SVGAImageView;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->access$getCallback$p(Lcom/immomo/svgaplayer/SVGAImageView;)Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGADrawable;->getCurrentFrame()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/SVGADrawable;->getCurrentFrame()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    int-to-double v1, v1

    .line 51
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;->$drawable$inlined:Lcom/immomo/svgaplayer/SVGADrawable;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGADrawable;->getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    int-to-double v3, p0

    .line 62
    div-double/2addr v1, v3

    .line 63
    invoke-interface {p1, v0, v1, v2}, Lcom/immomo/svgaplayer/listener/SVGACallback;->onStep(ID)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void

    .line 67
    :cond_2
    const-string p0, "null cannot be cast to non-null type kotlin.Int"

    .line 68
    .line 69
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
