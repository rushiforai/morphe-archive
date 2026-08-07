.class public Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->g(Landroid/view/View;IZZ)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;ZLandroid/view/View;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->d:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->b:Landroid/view/View;

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->b:Landroid/view/View;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f()[[F

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->c:I

    .line 12
    .line 13
    aget-object v0, v0, v1

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    aget v0, v0, v1

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->b:Landroid/view/View;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->f()[[F

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$b;->c:I

    .line 28
    .line 29
    aget-object p0, v0, p0

    .line 30
    .line 31
    aget p0, p0, v1

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
