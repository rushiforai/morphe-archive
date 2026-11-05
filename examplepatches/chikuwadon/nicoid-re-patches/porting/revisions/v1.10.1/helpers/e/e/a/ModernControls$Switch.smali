.class public final Le/e/a/ModernControls$Switch;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

.field public model:Le/e/a/d0;

.field public player:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

.field public position:J

.field public url:Ljava/lang/String;

.field public videoId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Le/e/a/d0;J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernControls$Switch;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iput-object p2, p0, Le/e/a/ModernControls$Switch;->model:Le/e/a/d0;

    iput-wide p3, p0, Le/e/a/ModernControls$Switch;->position:J

    if-eqz p1, :cond_13

    iget-object p2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/ModernControls$Switch;->videoId:Ljava/lang/String;

    iget-object p2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    iput-object p2, p0, Le/e/a/ModernControls$Switch;->player:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    :cond_13
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    :try_start_0
    iget-object v0, p0, Le/e/a/ModernControls$Switch;->model:Le/e/a/d0;

    iget-object v1, p0, Le/e/a/ModernControls$Switch;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    if-eqz v1, :cond_20

    if-eqz v0, :cond_20

    iget-object v2, p0, Le/e/a/ModernControls$Switch;->videoId:Ljava/lang/String;

    if-eqz v2, :cond_20

    invoke-static {v0, v2}, Le/e/a/ModernPlayback;->stream(Le/e/a/d0;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_20

    iput-object v2, p0, Le/e/a/ModernControls$Switch;->url:Ljava/lang/String;

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y:Landroid/os/Handler;

    if-eqz v0, :cond_20

    new-instance v2, Le/e/a/ModernControls$Apply;

    invoke-direct {v2, p0}, Le/e/a/ModernControls$Apply;-><init>(Le/e/a/ModernControls$Switch;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_20
    return-void
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_21

    :catch_21
    move-exception v0

    const-string v1, "nicoid-modern"

    const-string v2, "quality change failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
