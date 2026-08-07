.class public Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$d;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

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
    check-cast p1, Landroid/graphics/PointF;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$d;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->a(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)Landroid/graphics/PointF;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p1, Landroid/graphics/PointF;->x:F

    .line 14
    .line 15
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$d;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
