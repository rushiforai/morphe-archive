.class Le/e/a/MiniSession225$Session$1;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MiniSession225$Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MiniSession225$Session;


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$Session;)V
    .registers 2

    .line 127
    iput-object p1, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 127
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_6c

    iget-object v0, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    iget-boolean v0, v0, Le/e/a/MiniSession225$Session;->openingDirect:Z

    if-nez v0, :cond_f

    goto :goto_6c

    :cond_f
    iget-object v0, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->directDestination:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_17

    const/4 v0, 0x0

    goto :goto_21

    :cond_17
    iget-object v0, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->directDestination:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    :goto_21
    const/4 v1, 0x1

    if-eqz v0, :cond_67

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_67

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_31

    goto :goto_67

    :cond_31
    :try_start_31
    iget-object v2, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v2, v2, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-static {v2, v0}, Le/e/a/PlaybackNavigation114;->browseIntent(Landroid/app/Activity;Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v2, 0x20070000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v2, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v2, v2, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v2, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v2, v2, Le/e/a/MiniSession225$Session;->launchTimeout:Ljava/lang/Runnable;

    const-wide/16 v3, 0x708

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_5a} :catch_5b

    goto :goto_66

    :catch_5b
    move-exception v0

    const-string v2, "Cannot show direct mini host"

    invoke-static {v2, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$Session;->close(Z)V

    :goto_66
    return-void

    :cond_67
    :goto_67
    iget-object v0, p0, Le/e/a/MiniSession225$Session$1;->this$1:Le/e/a/MiniSession225$Session;

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_6c
    :goto_6c
    return-void
.end method
