.class public final Le/e/a/ModernControls$Switch;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

.field public model:Le/e/a/d0;

.field public position:J

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Le/e/a/d0;J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernControls$Switch;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iput-object p2, p0, Le/e/a/ModernControls$Switch;->model:Le/e/a/d0;

    iput-wide p3, p0, Le/e/a/ModernControls$Switch;->position:J

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    :try_start_0
    iget-object v0, p0, Le/e/a/ModernControls$Switch;->model:Le/e/a/d0;

    iget-object v1, p0, Le/e/a/ModernControls$Switch;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v2, v1, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    if-eqz v2, :cond_1a

    invoke-static {v0, v2}, Le/e/a/ModernPlayback;->stream(Le/e/a/d0;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1a

    iput-object v2, p0, Le/e/a/ModernControls$Switch;->url:Ljava/lang/String;

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y:Landroid/os/Handler;

    new-instance v2, Le/e/a/ModernControls$Apply;

    invoke-direct {v2, p0}, Le/e/a/ModernControls$Apply;-><init>(Le/e/a/ModernControls$Switch;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1a
    return-void
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1b

    :catch_1b
    move-exception v0

    const-string v1, "nicoid-modern"

    const-string v2, "quality change failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
