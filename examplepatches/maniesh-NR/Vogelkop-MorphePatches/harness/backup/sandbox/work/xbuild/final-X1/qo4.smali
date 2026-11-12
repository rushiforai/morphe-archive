.class public final synthetic Lqo4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxo4;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lop5;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 12
    iput-object p1, p0, Lqo4;->b:Ljava/lang/Object;

    iput p2, p0, Lqo4;->a:I

    iput-object p3, p0, Lqo4;->c:Ljava/lang/Object;

    iput-object p4, p0, Lqo4;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lro9;Lbsc;Ltjd;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqo4;->b:Ljava/lang/Object;

    iput-object p2, p0, Lqo4;->c:Ljava/lang/Object;

    iput-object p3, p0, Lqo4;->d:Ljava/lang/Object;

    iput p4, p0, Lqo4;->a:I

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 10

    iget-object v0, p0, Lqo4;->b:Ljava/lang/Object;

    check-cast v0, Lro9;

    iget-object v1, p0, Lqo4;->c:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Lbsc;

    iget-object v1, p0, Lqo4;->d:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Ltjd;

    move-object v2, p1

    check-cast v2, Lprd;

    iget v3, v0, Lro9;->b:I

    iget-object p1, v0, Lro9;->c:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljrd;

    iget v7, p0, Lqo4;->a:I

    invoke-interface/range {v2 .. v7}, Lprd;->t(ILjrd;Lbsc;Ltjd;I)V

    return-void
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 11

    iget-object v0, p0, Lqo4;->b:Ljava/lang/Object;

    check-cast v0, Lzo4;

    iget-object v1, p0, Lqo4;->c:Ljava/lang/Object;

    check-cast v1, [I

    iget-object v2, p0, Lqo4;->d:Ljava/lang/Object;

    check-cast v2, [I

    iget p0, p0, Lqo4;->a:I

    new-array v3, p0, [I

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([II)V

    move v5, v4

    :goto_15
    if-ge v5, p0, :cond_31

    array-length v6, v1

    invoke-static {v5, v4, v6, v1}, Lsgb;->L(III[I)I

    move-result v6

    iget-object v7, v0, Lzo4;->l:[I

    array-length v7, v7

    if-ge v6, v7, :cond_2e

    array-length v7, v2

    invoke-static {v5, v4, v7, v2}, Lsgb;->L(III[I)I

    move-result v7

    if-ge v7, p0, :cond_2e

    iget-object v8, v0, Lzo4;->l:[I

    aget v6, v8, v6

    aput v6, v3, v7

    :cond_2e
    add-int/lit8 v5, v5, 0x1

    goto :goto_15

    :cond_31
    move v1, v4

    :goto_32
    if-ge v1, p0, :cond_53

    aget v2, v3, v1

    if-nez v2, :cond_50

    const/4 v2, 0x1

    add-int/2addr v1, v2

    :goto_3a
    if-ge v1, p0, :cond_4a

    aget v5, v3, v1

    if-nez v5, :cond_43

    add-int/lit8 v2, v2, 0x1

    goto :goto_47

    :cond_43
    sub-int v6, v1, v2

    aput v5, v3, v6

    :goto_47
    add-int/lit8 v1, v1, 0x1

    goto :goto_3a

    :cond_4a
    sub-int/2addr p0, v2

    invoke-static {v3, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v3

    goto :goto_53

    :cond_50
    add-int/lit8 v1, v1, 0x1

    goto :goto_32

    :cond_53
    :goto_53
    iget-object p0, v0, Lzo4;->l:[I

    invoke-static {p0, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_5d

    return-object v0

    :cond_5d
    invoke-virtual {p1, v3, v4, v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueReorderItems([IILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 13

    iget-object v0, p0, Lqo4;->b:Ljava/lang/Object;

    check-cast v0, Lzzb;

    iget-object v1, p0, Lqo4;->c:Ljava/lang/Object;

    check-cast v1, Ltzb;

    iget-object v2, p0, Lqo4;->d:Ljava/lang/Object;

    move-object v4, v2

    check-cast v4, Lr0k;

    check-cast p1, Ljava/lang/Integer;

    iget v2, v0, Lzzb;->d:I

    iget-object v7, v0, Lzzb;->e:La0c;

    iget p0, p0, Lqo4;->a:I

    if-eq v2, p0, :cond_18

    return-void

    :cond_18
    iget-object v2, v1, Ltzb;->a:Ljava/lang/String;

    iput-object v2, v7, La0c;->u:Ljava/lang/String;

    invoke-virtual {v7}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget v8, v7, La0c;->s:I

    new-instance v9, Lzr9;

    const/16 p1, 0x10

    invoke-direct {v9, v0, v1, p1}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v10, Llt2;

    const/4 p1, 0x3

    invoke-direct {v10, v0, p0, v1, p1}, Llt2;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    new-instance v6, Lz8e;

    const/4 p0, 0x1

    invoke-direct {v6, v7, p0}, Lz8e;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static/range {v3 .. v10}, Lu85;->d(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)Lu85;

    move-result-object p0

    iput-object p0, v7, La0c;->t:Lu85;

    return-void
.end method
