.class public final Lo84;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkkd;
.implements La93;


# instance fields
.field public a:Likd;

.field public final b:Lc93;

.field public final synthetic c:B


# direct methods
.method public constructor <init>(Lc93;B)V
    .registers 3

    iput-byte p2, p0, Lo84;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo84;->b:Lc93;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lo84;->b:Lc93;

    invoke-virtual {p0}, Lc93;->g()Z

    move-result p0

    if-nez p0, :cond_9

    return-void

    :cond_9
    invoke-static {}, Lc93;->c()V

    return-void
.end method

.method public final b(I)V
    .registers 2

    return-void
.end method

.method public final c()I
    .registers 1

    iget-byte p0, p0, Lo84;->c:B

    packed-switch p0, :pswitch_data_18

    sget-object p0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const p0, 0x7f0a082a

    return p0

    :pswitch_e
    sget-object p0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const p0, 0x7f0a07bf

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Lo84;->b:Lc93;

    invoke-virtual {p0}, Lc93;->g()Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Lc93;->e()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {p0}, Lc93;->e()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->pause()Lcom/google/android/gms/common/api/PendingResult;

    return-void
.end method

.method public final e()V
    .registers 4

    new-instance v0, Lorg/chromium/services/media_session/MediaMetadata;

    const-string v1, "Chromecast"

    const-string v2, ""

    invoke-direct {v0, v1, v2, v2}, Lorg/chromium/services/media_session/MediaMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lo84;->a:Likd;

    iput-object v0, v1, Likd;->a:Lorg/chromium/services/media_session/MediaMetadata;

    iget-object p0, p0, Lo84;->b:Lc93;

    invoke-virtual {p0}, Lc93;->g()Z

    move-result v1

    if-eqz v1, :cond_67

    iget-object v1, p0, Lc93;->a:Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v1}, Lcom/google/android/gms/cast/framework/CastSession;->getCastDevice()Lcom/google/android/gms/cast/CastDevice;

    move-result-object v1

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Lcom/google/android/gms/cast/CastDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2b

    iput-object v1, v0, Lorg/chromium/services/media_session/MediaMetadata;->a:Ljava/lang/String;

    :cond_2b
    invoke-virtual {p0}, Lc93;->e()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object p0

    if-eqz p0, :cond_67

    invoke-virtual {p0}, Lcom/google/android/gms/cast/MediaInfo;->getMetadata()Lcom/google/android/gms/cast/MediaMetadata;

    move-result-object p0

    if-eqz p0, :cond_67

    const-string v1, "com.google.android.gms.cast.metadata.TITLE"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4b

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4b

    iput-object v1, v0, Lorg/chromium/services/media_session/MediaMetadata;->a:Ljava/lang/String;

    :cond_4b
    const-string v1, "com.google.android.gms.cast.metadata.ARTIST"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_59

    const-string v1, "com.google.android.gms.cast.metadata.ALBUM_ARTIST"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_59
    if-eqz v1, :cond_5d

    iput-object v1, v0, Lorg/chromium/services/media_session/MediaMetadata;->b:Ljava/lang/String;

    :cond_5d
    const-string v1, "com.google.android.gms.cast.metadata.ALBUM_TITLE"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/cast/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_67

    iput-object p0, v0, Lorg/chromium/services/media_session/MediaMetadata;->c:Ljava/lang/String;

    :cond_67
    return-void
.end method

.method public final f()V
    .registers 5

    new-instance v0, Likd;

    invoke-direct {v0}, Likd;-><init>()V

    const/4 v1, 0x0

    iput-boolean v1, v0, Likd;->b:Z

    iget-object v1, p0, Lo84;->b:Lc93;

    iget-object v2, v1, Lc93;->c:Lvz5;

    iget-object v3, v2, Lvz5;->g:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iput-object v3, v0, Likd;->c:Ljava/lang/String;

    iget v3, v2, Lvz5;->a:I

    iput v3, v0, Likd;->d:I

    iget-boolean v2, v2, Lvz5;->c:Z

    iput-boolean v2, v0, Likd;->e:Z

    const/4 v2, 0x2

    iput-byte v2, v0, Likd;->i:B

    iget-byte v2, p0, Lo84;->c:B

    packed-switch v2, :pswitch_data_68

    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lt8;->a:Landroid/content/Context;

    const-class v3, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_47

    :pswitch_2c
    sget-object v2, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    iget-object v1, v1, Lc93;->c:Lvz5;

    iget v1, v1, Lvz5;->a:I

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lt8;->a:Landroid/content/Context;

    invoke-static {v2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.opera.android.action.ACTIVATE_TAB"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "tabId"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    :goto_47
    iput-object v1, v0, Likd;->k:Landroid/content/Intent;

    const v1, 0x7f0806d4

    iput v1, v0, Likd;->f:I

    invoke-virtual {p0}, Lo84;->c()I

    move-result v1

    iput v1, v0, Likd;->j:I

    iput-object p0, v0, Likd;->l:Lkkd;

    iput-object v0, p0, Lo84;->a:Likd;

    invoke-virtual {p0}, Lo84;->e()V

    sget-object v0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    iget-object p0, p0, Lo84;->a:Likd;

    invoke-virtual {p0}, Likd;->a()Ljkd;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a(Ljkd;)V

    return-void

    nop

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method

.method public final i(J)V
    .registers 3

    return-void
.end method

.method public final k()V
    .registers 2

    invoke-virtual {p0}, Lo84;->c()I

    move-result v0

    invoke-static {v0}, Llkd;->a(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lo84;->a:Likd;

    return-void
.end method

.method public final l()V
    .registers 2

    iget-object p0, p0, Lo84;->b:Lc93;

    invoke-virtual {p0}, Lc93;->g()Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Lc93;->e()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {p0}, Lc93;->e()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->play()Lcom/google/android/gms/common/api/PendingResult;

    return-void
.end method

.method public final onMetadataUpdated()V
    .registers 2

    iget-object v0, p0, Lo84;->a:Likd;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lo84;->e()V

    sget-object v0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    iget-object p0, p0, Lo84;->a:Likd;

    invoke-virtual {p0}, Likd;->a()Ljkd;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a(Ljkd;)V

    return-void
.end method

.method public final onStatusUpdated()V
    .registers 4

    iget-object v0, p0, Lo84;->a:Likd;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lo84;->b:Lc93;

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-virtual {v0}, Lc93;->e()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {v0}, Lc93;->e()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaStatus()Lcom/google/android/gms/cast/MediaStatus;

    move-result-object v0

    if-nez v0, :cond_1a

    :cond_19
    return-void

    :cond_1a
    invoke-virtual {v0}, Lcom/google/android/gms/cast/MediaStatus;->getPlayerState()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x2

    if-eq v0, v1, :cond_29

    if-eq v0, v2, :cond_29

    iget-object p0, p0, Lo84;->a:Likd;

    iput-byte v2, p0, Likd;->i:B

    goto :goto_34

    :cond_29
    iget-object p0, p0, Lo84;->a:Likd;

    if-eq v0, v2, :cond_2f

    const/4 v0, 0x1

    goto :goto_30

    :cond_2f
    const/4 v0, 0x0

    :goto_30
    iput-boolean v0, p0, Likd;->b:Z

    iput-byte v1, p0, Likd;->i:B

    :goto_34
    sget-object v0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    invoke-virtual {p0}, Likd;->a()Ljkd;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a(Ljkd;)V

    return-void
.end method
