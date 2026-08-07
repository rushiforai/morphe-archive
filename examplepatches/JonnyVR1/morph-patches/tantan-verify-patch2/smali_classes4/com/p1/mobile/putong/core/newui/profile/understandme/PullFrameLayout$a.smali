.class public Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->c:Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->c:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->a(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x2

    .line 31
    new-array v2, v2, [F

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    aput v1, v2, v3

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    const/4 v3, 0x1

    .line 38
    aput v1, v2, v3

    .line 39
    .line 40
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->c:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->c:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    const-wide/16 v1, 0x12c

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->c:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    sget-object v1, Lcom/sunshine/engine/base/InterpolatorType;->accelerateDecelerate:Lcom/sunshine/engine/base/InterpolatorType;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->c:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    new-instance v1, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a$a;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->c:Landroid/animation/ValueAnimator;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 85
    .line 86
    .line 87
    return-void
.end method
