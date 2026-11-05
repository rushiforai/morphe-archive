.class Le/e/a/DirectBackground235$State$1;
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

    .line 29
    iput-object p1, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 29
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    iget-object v1, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    if-ne v0, v1, :cond_62

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-boolean v0, v0, Le/e/a/DirectBackground235$State;->closing:Z

    if-nez v0, :cond_62

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-boolean v0, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    if-nez v0, :cond_62

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-nez v0, :cond_19

    goto :goto_62

    :cond_19
    :try_start_19
    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    const-string v1, "e"

    invoke-static {v0, v1}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_36

    iget-object v1, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v1, v1, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eq v0, v1, :cond_36

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    invoke-static {v0}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_34} :catch_35

    goto :goto_36

    :catch_35
    move-exception v0

    :cond_36
    :goto_36
    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->refresh()V

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-boolean v0, v0, Le/e/a/DirectBackground235$State;->wantsExpand:Z

    if-eqz v0, :cond_4f

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->ready()Z

    move-result v0

    if-eqz v0, :cond_4f

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Le/e/a/DirectBackground235$State;->settle(Z)V

    :cond_4f
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    iget-object v1, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    if-ne v0, v1, :cond_62

    iget-object v0, p0, Le/e/a/DirectBackground235$State$1;->this$1:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-nez v0, :cond_62

    sget-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_62
    :goto_62
    return-void
.end method
