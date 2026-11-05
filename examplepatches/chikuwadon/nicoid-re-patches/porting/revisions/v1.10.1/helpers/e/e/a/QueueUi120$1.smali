.class Le/e/a/QueueUi120$1;
.super Ljava/lang/Object;
.source "QueueUi120.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/QueueUi120;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/QueueUi120;


# direct methods
.method constructor <init>(Le/e/a/QueueUi120;)V
    .registers 2

    .line 9
    iput-object p1, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 9
    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    iget-boolean v0, v0, Le/e/a/QueueUi120;->closed:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    iget-object v0, v0, Le/e/a/QueueUi120;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_3b

    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    iget-object v0, v0, Le/e/a/QueueUi120;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_1c

    goto :goto_3b

    :cond_1c
    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    iget-object v0, v0, Le/e/a/QueueUi120;->drag:Le/e/a/DragRows120;

    iget-boolean v0, v0, Le/e/a/DragRows120;->dragging:Z

    if-nez v0, :cond_31

    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    invoke-virtual {v0}, Le/e/a/QueueUi120;->current()Z

    move-result v0

    if-nez v0, :cond_31

    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    invoke-virtual {v0}, Le/e/a/QueueUi120;->render()V

    :cond_31
    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    iget-object v0, v0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/widget/ScrollView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_3b
    :goto_3b
    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/QueueUi120;->closed:Z

    iget-object v0, p0, Le/e/a/QueueUi120$1;->this$0:Le/e/a/QueueUi120;

    iget-object v0, v0, Le/e/a/QueueUi120;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method
