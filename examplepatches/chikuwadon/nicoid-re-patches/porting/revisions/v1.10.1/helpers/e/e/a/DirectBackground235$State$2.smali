.class Le/e/a/DirectBackground235$State$2;
.super Ljava/lang/Object;
.source "DirectBackground235.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectBackground235$State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/DirectBackground235$State;


# direct methods
.method constructor <init>(Le/e/a/DirectBackground235$State;)V
    .registers 2

    .line 30
    iput-object p1, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 30
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    iget-object v1, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    if-ne v0, v1, :cond_39

    iget-object v0, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    if-eqz v0, :cond_39

    iget-object v0, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    if-nez v0, :cond_13

    goto :goto_39

    :cond_13
    iget-object v0, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->refresh()V

    iget-object v0, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    iget-boolean v0, v0, Le/e/a/DirectBackground235$State;->wantsExpand:Z

    if-eqz v0, :cond_32

    iget-object v0, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->ready()Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_32

    iget-object v0, p0, Le/e/a/DirectBackground235$State$2;->this$1:Le/e/a/DirectBackground235$State;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Le/e/a/DirectBackground235$State;->settle(Z)V

    :cond_32
    sget-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_39
    :goto_39
    return-void
.end method
