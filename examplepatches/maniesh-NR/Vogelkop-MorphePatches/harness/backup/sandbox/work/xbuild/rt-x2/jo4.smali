.class public final synthetic Ljo4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxo4;
.implements Ldid;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(IIILjava/lang/Object;)V
    .registers 5

    iput-object p4, p0, Ljo4;->d:Ljava/lang/Object;

    iput p1, p0, Ljo4;->a:I

    iput p2, p0, Ljo4;->b:I

    iput p3, p0, Ljo4;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Lssa;I)V
    .registers 10

    iget-object v0, p0, Ljo4;->d:Ljava/lang/Object;

    check-cast v0, Lgid;

    iget v6, p0, Ljo4;->c:I

    iget-object v2, v0, Lgid;->c:Llid;

    iget v4, p0, Ljo4;->a:I

    iget v5, p0, Ljo4;->b:I

    move-object v1, p1

    move v3, p2

    invoke-interface/range {v1 .. v6}, Lssa;->U(Lksa;IIII)V

    return-void
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 9

    iget-object v0, p0, Ljo4;->d:Ljava/lang/Object;

    check-cast v0, Lzo4;

    iget-object v1, v0, Lzo4;->l:[I

    array-length v1, v1

    iget v2, p0, Ljo4;->a:I

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v2, v0, Lzo4;->l:[I

    array-length v2, v2

    iget v3, p0, Ljo4;->b:I

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x0

    if-nez v2, :cond_1b

    return-object v3

    :cond_1b
    const/4 v4, 0x1

    iget p0, p0, Ljo4;->c:I

    if-ne v2, v4, :cond_29

    iget-object v0, v0, Lzo4;->l:[I

    aget v0, v0, v1

    invoke-virtual {p1, v0, p0, v3}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueMoveItemToNewIndex(IILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :cond_29
    new-array v4, v2, [I

    iget-object v5, v0, Lzo4;->l:[I

    const/4 v6, 0x0

    invoke-static {v5, v1, v4, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v0, v0, Lzo4;->l:[I

    if-ge p0, v1, :cond_38

    aget v6, v0, p0

    goto :goto_3e

    :cond_38
    array-length v1, v0

    if-ge p0, v1, :cond_3e

    add-int/2addr p0, v2

    aget v6, v0, p0

    :cond_3e
    :goto_3e
    invoke-virtual {p1, v4, v6, v3}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueReorderItems([IILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0
.end method
