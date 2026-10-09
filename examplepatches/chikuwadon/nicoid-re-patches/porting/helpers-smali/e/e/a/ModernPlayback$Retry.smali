.class public final Le/e/a/ModernPlayback$Retry;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

.field public id:Ljava/lang/String;

.field public model:Le/e/a/d0;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Le/e/a/d0;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernPlayback$Retry;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iput-object p2, p0, Le/e/a/ModernPlayback$Retry;->model:Le/e/a/d0;

    iput-object p3, p0, Le/e/a/ModernPlayback$Retry;->id:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    :try_start_0
    iget-object v0, p0, Le/e/a/ModernPlayback$Retry;->model:Le/e/a/d0;

    iget-object v1, p0, Le/e/a/ModernPlayback$Retry;->id:Ljava/lang/String;

    if-eqz v1, :cond_18

    invoke-static {v0, v1}, Le/e/a/ModernPlayback;->stream(Le/e/a/d0;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_18

    iget-object v2, p0, Le/e/a/ModernPlayback$Retry;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y:Landroid/os/Handler;

    new-instance v4, Le/e/a/ModernPlayback$RetryUi;

    invoke-direct {v4, v2, v1}, Le/e/a/ModernPlayback$RetryUi;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_18
    return-void
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_19} :catch_19

    :catch_19
    move-exception v0

    const-string v1, "nicoid-modern"

    const-string v2, "low quality retry failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
