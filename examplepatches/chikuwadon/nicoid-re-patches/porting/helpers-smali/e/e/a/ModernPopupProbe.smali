.class public final Le/e/a/ModernPopupProbe;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final service:Lcom/sauzask/nicoid/NicoidPopupViewService;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernPopupProbe;->service:Lcom/sauzask/nicoid/NicoidPopupViewService;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    iget-object v0, p0, Le/e/a/ModernPopupProbe;->service:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_3e

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v2

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v0, "Popup after 2s: playing="

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " position(ms)="

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v2, "nicoid-popup"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v4, :cond_3e

    iget-object v0, p0, Le/e/a/ModernPopupProbe;->service:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0}, Le/e/a/PlaybackSession;->allowRetry(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    const-string v0, "Popup playback start retried"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    :cond_3e
    return-void
.end method
