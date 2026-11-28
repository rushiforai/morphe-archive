.class final Le/e/a/ReorderMotion98$Listener;
.super Ljava/lang/Object;
.source "ReorderMotion98.java"

# interfaces
.implements Landroid/view/View$OnDragListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ReorderMotion98;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Listener"
.end annotation


# instance fields
.field final original:Landroid/view/View$OnDragListener;

.field final video:Z


# direct methods
.method constructor <init>(Landroid/view/View$OnDragListener;Z)V
    .registers 3

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ReorderMotion98$Listener;->original:Landroid/view/View$OnDragListener;

    iput-boolean p2, p0, Le/e/a/ReorderMotion98$Listener;->video:Z

    return-void
.end method


# virtual methods
.method public onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 6

    .line 31
    invoke-virtual {p2}, Landroid/view/DragEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x4

    if-eq v0, v1, :cond_0

    if-ne v0, v2, :cond_1

    :cond_0
    # invokes: Le/e/a/ReorderMotion98;->clear()V
    invoke-static {}, Le/e/a/ReorderMotion98;->access$000()V

    if-ne v0, v2, :cond_1

    # getter for: Le/e/a/ReorderMotion98;->source:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/ReorderMotion98;->access$100()Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    # getter for: Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/ReorderMotion98;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    const/4 v1, -0x1

    # setter for: Le/e/a/ReorderMotion98;->sourceIndex:I
    invoke-static {v1}, Le/e/a/ReorderMotion98;->access$302(I)I

    :cond_1
    iget-object v1, p0, Le/e/a/ReorderMotion98$Listener;->original:Landroid/view/View$OnDragListener;

    invoke-interface {v1, p1, p2}, Landroid/view/View$OnDragListener;->onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x5

    if-ne v0, v2, :cond_3

    :cond_2
    iget-boolean v0, p0, Le/e/a/ReorderMotion98$Listener;->video:Z

    # invokes: Le/e/a/ReorderMotion98;->preview(Landroid/view/View;Landroid/view/DragEvent;Z)V
    invoke-static {p1, p2, v0}, Le/e/a/ReorderMotion98;->access$400(Landroid/view/View;Landroid/view/DragEvent;Z)V

    :cond_3
    return v1
.end method
