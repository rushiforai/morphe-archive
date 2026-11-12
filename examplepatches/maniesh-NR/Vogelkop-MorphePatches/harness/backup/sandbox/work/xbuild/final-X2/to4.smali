.class public final Lto4;
.super Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$Callback;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lzo4;


# direct methods
.method public constructor <init>(Lzo4;)V
    .registers 2

    iput-object p1, p0, Lto4;->a:Lzo4;

    invoke-direct {p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAdBreakStatusUpdated()V
    .registers 1

    return-void
.end method

.method public final onMediaError(Lcom/google/android/gms/cast/MediaError;)V
    .registers 2

    iget-object p0, p0, Lto4;->a:Lzo4;

    invoke-virtual {p0, p1}, Lzo4;->C0(Lcom/google/android/gms/cast/MediaError;)V

    return-void
.end method

.method public final onMetadataUpdated()V
    .registers 1

    return-void
.end method

.method public final onPreloadStatusUpdated()V
    .registers 1

    return-void
.end method

.method public final onQueueStatusUpdated()V
    .registers 1

    return-void
.end method

.method public final onSendingRemoteMediaRequest()V
    .registers 1

    return-void
.end method

.method public final onStatusUpdated()V
    .registers 6

    const/4 v0, 0x0

    iget-object p0, p0, Lto4;->a:Lzo4;

    iput-boolean v0, p0, Lzo4;->L:Z

    iget-object v0, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaStatus()Lcom/google/android/gms/cast/MediaStatus;

    move-result-object v0

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Lcom/google/android/gms/cast/MediaStatus;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object v1

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Lcom/google/android/gms/cast/MediaInfo;->getStreamDuration()J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    if-eqz v3, :cond_23

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-gez v3, :cond_28

    :cond_23
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    :cond_28
    iput-wide v1, p0, Lzo4;->E:J

    invoke-virtual {p0, v0}, Lzo4;->M0(Lcom/google/android/gms/cast/MediaStatus;)V

    invoke-virtual {p0, v0}, Lzo4;->O0(Lcom/google/android/gms/cast/MediaStatus;)V

    :cond_30
    return-void
.end method
