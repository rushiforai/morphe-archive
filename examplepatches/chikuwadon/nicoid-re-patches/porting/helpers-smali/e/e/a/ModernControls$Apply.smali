.class public final Le/e/a/ModernControls$Apply;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public task:Le/e/a/ModernControls$Switch;


# direct methods
.method public constructor <init>(Le/e/a/ModernControls$Switch;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernControls$Apply;->task:Le/e/a/ModernControls$Switch;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    iget-object v0, p0, Le/e/a/ModernControls$Apply;->task:Le/e/a/ModernControls$Switch;

    iget-object v1, v0, Le/e/a/ModernControls$Switch;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_26

    iget-object v2, v0, Le/e/a/ModernControls$Switch;->url:Ljava/lang/String;

    invoke-static {v2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    iget-wide v2, v0, Le/e/a/ModernControls$Switch;->position:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_1c

    invoke-virtual {v1, v2, v3}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->seekTo(J)V

    :cond_1c
    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    iget-object v0, p0, Le/e/a/ModernControls$Apply;->task:Le/e/a/ModernControls$Switch;

    iget-object v0, v0, Le/e/a/ModernControls$Switch;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-static {v0}, Le/e/a/ModernControls;->update(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    :cond_26
    return-void
.end method
