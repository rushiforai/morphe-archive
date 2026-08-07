.class public Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->s(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;->c:Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;->c:Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->e(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;)[Lv/VDraweeView;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;->a:I

    .line 18
    .line 19
    aget-object v1, v1, v2

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->f(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Landroid/view/View;F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;->c:Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->e(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;)[Lv/VDraweeView;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;->b:I

    .line 31
    .line 32
    aget-object p0, v1, p0

    .line 33
    .line 34
    const/high16 v1, 0x3f800000    # 1.0f

    .line 35
    .line 36
    sub-float/2addr v1, p1

    .line 37
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->f(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Landroid/view/View;F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
