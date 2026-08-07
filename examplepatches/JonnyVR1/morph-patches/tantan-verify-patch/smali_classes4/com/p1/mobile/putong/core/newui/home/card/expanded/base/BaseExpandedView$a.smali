.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f0(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->c:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->a:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->b:I

    .line 12
    .line 13
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
    float-to-int p1, p1

    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->C(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->a:I

    .line 22
    .line 23
    sub-int/2addr v0, p1

    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->b:I

    .line 25
    .line 26
    add-int/2addr v1, v0

    .line 27
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->b:I

    .line 28
    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->a:I

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

    .line 32
    .line 33
    neg-int p1, v0

    .line 34
    const-string v0, "auto-scroll-top"

    .line 35
    .line 36
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->J(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;ILjava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    return-void
.end method
