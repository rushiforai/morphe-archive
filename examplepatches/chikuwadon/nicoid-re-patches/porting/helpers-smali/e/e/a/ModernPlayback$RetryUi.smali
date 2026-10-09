.class public final Le/e/a/ModernPlayback$RetryUi;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernPlayback$RetryUi;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iput-object p2, p0, Le/e/a/ModernPlayback$RetryUi;->url:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    :try_start_0
    iget-object v0, p0, Le/e/a/ModernPlayback$RetryUi;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_35

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    if-eqz v2, :cond_35

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result v1

    if-nez v1, :cond_35

    iget-object v1, p0, Le/e/a/ModernPlayback$RetryUi;->url:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    const-string v0, "Low quality playlist sent to player"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/ModernPlayback$RetryUi;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y:Landroid/os/Handler;

    new-instance v2, Le/e/a/ModernPlayback$Stall;

    iget-object v3, p0, Le/e/a/ModernPlayback$RetryUi;->url:Ljava/lang/String;

    invoke-direct {v2, v0, v3}, Le/e/a/ModernPlayback$Stall;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/lang/String;)V

    const-wide/16 v3, 0x7530

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_35
    return-void
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_36} :catch_36

    :catch_36
    move-exception v0

    const-string v1, "nicoid-modern"

    const-string v2, "low quality playback restart failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
