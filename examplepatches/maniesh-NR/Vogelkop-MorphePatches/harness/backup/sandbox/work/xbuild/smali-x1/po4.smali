.class public final synthetic Lpo4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# instance fields
.field public final synthetic a:Lzo4;


# direct methods
.method public synthetic constructor <init>(Lzo4;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpo4;->a:Lzo4;

    return-void
.end method


# virtual methods
.method public final onResult(Lcom/google/android/gms/common/api/Result;)V
    .registers 4

    check-cast p1, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$MediaChannelResult;

    iget-object p0, p0, Lpo4;->a:Lzo4;

    iget-object v0, p0, Lzo4;->q:Lwo4;

    if-eqz v0, :cond_6f

    iget-byte v0, v0, Lwo4;->a:B

    const/4 v1, 0x3

    if-ne v0, v1, :cond_20

    invoke-interface {p1}, Lcom/google/android/gms/common/api/Result;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_20

    invoke-interface {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$MediaChannelResult;->getMediaError()Lcom/google/android/gms/cast/MediaError;

    move-result-object p1

    if-eqz p1, :cond_20

    invoke-virtual {p0, p1}, Lzo4;->C0(Lcom/google/android/gms/cast/MediaError;)V

    :cond_20
    iget-object p1, p0, Lzo4;->q:Lwo4;

    iget-byte p1, p1, Lwo4;->a:B

    const/16 v0, 0xb

    if-ne p1, v0, :cond_2b

    const/4 p1, 0x1

    iput-boolean p1, p0, Lzo4;->L:Z

    :cond_2b
    const/4 p1, 0x0

    iput-object p1, p0, Lzo4;->q:Lwo4;

    iget-object p1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz p1, :cond_6f

    :cond_32
    iget-object p1, p0, Lzo4;->n:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyo4;

    if-eqz p1, :cond_57

    iget-byte v0, p1, Lyo4;->a:B

    iget-object p1, p1, Lyo4;->b:Lxo4;

    iget-object v1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-interface {p1, v1}, Lxo4;->m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p1

    if-eqz p1, :cond_32

    new-instance v1, Lwo4;

    invoke-direct {v1, v0, p1}, Lwo4;-><init>(ILcom/google/android/gms/common/api/PendingResult;)V

    iput-object v1, p0, Lzo4;->q:Lwo4;

    new-instance v0, Lpo4;

    invoke-direct {v0, p0}, Lpo4;-><init>(Lzo4;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    :cond_57
    invoke-virtual {p0}, Lzo4;->N0()Z

    move-result p1

    if-eqz p1, :cond_61

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lzo4;->Q0(Z)V

    :cond_61
    iget-object p1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaStatus()Lcom/google/android/gms/cast/MediaStatus;

    move-result-object p1

    if-eqz p1, :cond_6f

    invoke-virtual {p0, p1}, Lzo4;->M0(Lcom/google/android/gms/cast/MediaStatus;)V

    invoke-virtual {p0, p1}, Lzo4;->O0(Lcom/google/android/gms/cast/MediaStatus;)V

    :cond_6f
    return-void
.end method
