.class public final Luo4;
.super Lcom/google/android/gms/cast/framework/media/MediaQueue$Callback;
.source "SourceFile"


# instance fields
.field public a:[I

.field public final synthetic b:Lzo4;


# direct methods
.method public constructor <init>(Lzo4;)V
    .registers 2

    iput-object p1, p0, Luo4;->b:Lzo4;

    invoke-direct {p0}, Lcom/google/android/gms/cast/framework/media/MediaQueue$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public final itemsInsertedInRange(II)V
    .registers 3

    return-void
.end method

.method public final itemsReloaded()V
    .registers 1

    return-void
.end method

.method public final itemsRemovedAtIndexes([I)V
    .registers 3

    iget-object v0, p0, Luo4;->a:[I

    if-nez v0, :cond_7

    iput-object p1, p0, Luo4;->a:[I

    return-void

    :cond_7
    filled-new-array {v0, p1}, [[I

    move-result-object p1

    invoke-static {p1}, Lsgb;->p([[I)[I

    move-result-object p1

    iput-object p1, p0, Luo4;->a:[I

    return-void
.end method

.method public final itemsUpdatedAtIndexes([I)V
    .registers 2

    return-void
.end method

.method public final mediaQueueChanged()V
    .registers 7

    iget-object v0, p0, Luo4;->b:Lzo4;

    iget-object v1, v0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    invoke-virtual {v1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaQueue()Lcom/google/android/gms/cast/framework/media/MediaQueue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/cast/framework/media/MediaQueue;->getItemIds()[I

    move-result-object v1

    iput-object v1, v0, Lzo4;->l:[I

    invoke-virtual {v0}, Lzo4;->N0()Z

    move-result v1

    if-nez v1, :cond_26

    iget-object v1, p0, Luo4;->a:[I

    if-eqz v1, :cond_26

    array-length v2, v1

    const/4 v3, 0x0

    :goto_1a
    if-ge v3, v2, :cond_26

    aget v4, v1, v3

    iget-object v5, v0, Lzo4;->m:Landroid/util/SparseArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->delete(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_26
    const/4 v1, 0x0

    iput-object v1, p0, Luo4;->a:[I

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Lzo4;->Q0(Z)V

    return-void
.end method

.method public final mediaQueueWillChange()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Luo4;->a:[I

    return-void
.end method
