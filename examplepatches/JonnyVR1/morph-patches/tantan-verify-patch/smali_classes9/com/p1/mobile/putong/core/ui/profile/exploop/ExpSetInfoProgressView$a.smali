.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

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
    .locals 3

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->a(Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;)Landroid/graphics/RectF;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    int-to-float p1, p1

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->b(Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v2, v2, p1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 32
    .line 33
    .line 34
    return-void
.end method
