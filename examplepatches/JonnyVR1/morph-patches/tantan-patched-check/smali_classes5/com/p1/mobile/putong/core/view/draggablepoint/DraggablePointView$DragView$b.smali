.class public Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->k(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;->b:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;->b:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;->b:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;->a:Z

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$b;->b:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 33
    .line 34
    .line 35
    throw p1

    .line 36
    :cond_1
    :goto_0
    return-void
.end method
