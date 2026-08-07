.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->s(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

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
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    sub-float/2addr v1, p1

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->q:Lv/VLinear;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
