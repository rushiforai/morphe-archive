.class Le/e/a/MediaControls$1;
.super Landroid/media/session/MediaSession$Callback;
.source "MediaControls.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/MediaControls;->attach(Ljava/lang/Object;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$s:Le/e/a/MediaControls$State;


# direct methods
.method constructor <init>(Le/e/a/MediaControls$State;)V
    .registers 2

    .line 27
    iput-object p1, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    invoke-direct {p0}, Landroid/media/session/MediaSession$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onFastForward()V
    .registers 6

    .line 30
    iget-object v0, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    iget-object v1, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    invoke-static {v1}, Le/e/a/MediaControls;->position(Le/e/a/MediaControls$State;)J

    move-result-wide v1

    const-wide/16 v3, 0x2710

    add-long/2addr v1, v3

    invoke-static {v0, v1, v2}, Le/e/a/MediaControls;->seek(Le/e/a/MediaControls$State;J)V

    return-void
.end method

.method public onMediaButtonEvent(Landroid/content/Intent;)Z
    .registers 4

    .line 31
    const-string v0, "android.intent.extra.KEY_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/view/KeyEvent;

    const/4 v0, 0x0

    if-eqz p1, :cond_2f

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_12

    goto :goto_2f

    :cond_12
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/4 v1, 0x1

    sparse-switch p1, :sswitch_data_30

    .line 32
    return v0

    :sswitch_1b
    invoke-virtual {p0}, Le/e/a/MediaControls$1;->onPause()V

    return v1

    :sswitch_1f
    invoke-virtual {p0}, Le/e/a/MediaControls$1;->onPlay()V

    return v1

    :sswitch_23
    invoke-virtual {p0}, Le/e/a/MediaControls$1;->onStop()V

    return v1

    :sswitch_27
    iget-object p1, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    const-string v0, "toggle"

    invoke-static {p1, v0}, Le/e/a/MediaControls;->command(Le/e/a/MediaControls$State;Ljava/lang/String;)V

    return v1

    .line 31
    :cond_2f
    :goto_2f
    return v0

    :sswitch_data_30
    .sparse-switch
        0x55 -> :sswitch_27
        0x56 -> :sswitch_23
        0x7e -> :sswitch_1f
        0x7f -> :sswitch_1b
    .end sparse-switch
.end method

.method public onPause()V
    .registers 3

    .line 28
    iget-object v0, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    const-string v1, "pause"

    invoke-static {v0, v1}, Le/e/a/MediaControls;->command(Le/e/a/MediaControls$State;Ljava/lang/String;)V

    return-void
.end method

.method public onPlay()V
    .registers 3

    .line 28
    iget-object v0, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    const-string v1, "play"

    invoke-static {v0, v1}, Le/e/a/MediaControls;->command(Le/e/a/MediaControls$State;Ljava/lang/String;)V

    return-void
.end method

.method public onRewind()V
    .registers 6

    .line 30
    iget-object v0, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    iget-object v1, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    invoke-static {v1}, Le/e/a/MediaControls;->position(Le/e/a/MediaControls$State;)J

    move-result-wide v1

    const-wide/16 v3, 0x2710

    sub-long/2addr v1, v3

    invoke-static {v0, v1, v2}, Le/e/a/MediaControls;->seek(Le/e/a/MediaControls$State;J)V

    return-void
.end method

.method public onSeekTo(J)V
    .registers 4

    .line 29
    iget-object v0, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    invoke-static {v0, p1, p2}, Le/e/a/MediaControls;->seek(Le/e/a/MediaControls$State;J)V

    return-void
.end method

.method public onStop()V
    .registers 3

    .line 29
    iget-object v0, p0, Le/e/a/MediaControls$1;->val$s:Le/e/a/MediaControls$State;

    const-string v1, "stop"

    invoke-static {v0, v1}, Le/e/a/MediaControls;->command(Le/e/a/MediaControls$State;Ljava/lang/String;)V

    return-void
.end method
