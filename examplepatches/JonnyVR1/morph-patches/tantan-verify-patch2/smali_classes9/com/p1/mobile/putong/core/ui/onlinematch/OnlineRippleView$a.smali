.class public Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->g(Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->f(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->c(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    sub-int/2addr v1, p1

    .line 23
    mul-int/lit8 v1, v1, 0x64

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->b(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    div-int/2addr v1, p1

    .line 32
    mul-int/lit8 v1, v1, 0x4c

    .line 33
    .line 34
    div-int/lit8 v1, v1, 0x64

    .line 35
    .line 36
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->e(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->d(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)Landroid/graphics/Paint;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 57
    .line 58
    .line 59
    return-void
.end method
