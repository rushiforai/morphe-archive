.class public final Le/e/a/ModernPlayback$Stall;
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

    iput-object p1, p0, Le/e/a/ModernPlayback$Stall;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iput-object p2, p0, Le/e/a/ModernPlayback$Stall;->url:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    :try_start_0
    iget-object v0, p0, Le/e/a/ModernPlayback$Stall;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_63

    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    if-eqz v2, :cond_63

    iget-object v2, v2, Le/e/a/v;->d:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/ModernPlayback$Stall;->url:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_63

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1f

    return-void

    :cond_1f
    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result v1

    if-nez v1, :cond_63

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    if-eqz v1, :cond_63

    iget-boolean v2, v1, Le/e/a/d0;->modernFallbackTried:Z

    if-nez v2, :cond_48

    const-string v2, "Playback stalled at 00:00; trying low quality"

    invoke-static {v2}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const/4 v2, 0x1

    iput-boolean v2, v1, Le/e/a/d0;->modernFallbackTried:Z

    const/4 v2, 0x3

    iput v2, v1, Le/e/a/d0;->e:I

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Le/e/a/ModernPlayback$Retry;

    iget-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    invoke-direct {v3, v0, v1, v4}, Le/e/a/ModernPlayback$Retry;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Le/e/a/d0;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto :goto_63

    :cond_48
    const-string v2, "Playback stalled after low quality retry"

    invoke-static {v2}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v1, 0x7f0800ea

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_63

    const-string v1, "\u52d5\u753b\u306e\u8aad\u307f\u8fbc\u307f\u304c\u9032\u307f\u307e\u305b\u3093\u3002\u518d\u751f\u3092\u3084\u308a\u76f4\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_63
    :goto_63
    return-void
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_64} :catch_64

    :catch_64
    move-exception v0

    const-string v1, "nicoid-modern"

    const-string v2, "playback stall watchdog failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
