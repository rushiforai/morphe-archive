.class public Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$e;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$e;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->c(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$e;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView$e;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->r:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;

    .line 26
    .line 27
    .line 28
    throw p1
.end method
