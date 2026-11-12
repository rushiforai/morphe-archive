.class public final Ldz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbg1;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/api/Callback;B)V
    .registers 3

    iput-byte p2, p0, Ldz8;->a:B

    iput-object p1, p0, Ldz8;->b:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lmf3;Ljava/util/List;)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v0, v0, Ldz8;->b:Lcom/opera/api/Callback;

    check-cast v0, Lb94;

    move-object/from16 v1, p1

    iget v1, v1, Lmf3;->a:I

    sget-object v2, Lcbh;->a:Lcbh;

    if-nez v1, :cond_8e

    new-instance v1, Lyah;

    new-instance v3, Lbbh;

    const-string v4, "initialCapacity"

    const/4 v5, 0x4

    invoke-static {v5, v4}, Lscd;->q(ILjava/lang/String;)V

    new-array v4, v5, [Ljava/lang/Object;

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    :goto_1f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_80

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lvah;

    new-instance v8, Luah;

    iget-object v9, v7, Lvah;->c:Lorg/json/JSONObject;

    iget-object v10, v7, Lvah;->c:Lorg/json/JSONObject;

    const-string v11, "token"

    const-string v12, "purchaseToken"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v11, "orderId"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_4a

    const/4 v11, 0x0

    :cond_4a
    const-string v12, "developerPayload"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    move-object v13, v11

    move-object v11, v12

    iget-object v12, v7, Lvah;->b:Ljava/lang/String;

    invoke-virtual {v7}, Lvah;->a()Ljava/util/ArrayList;

    move-result-object v7

    invoke-static {v7}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v7

    const-string v14, "acknowledged"

    const/4 v15, 0x1

    invoke-virtual {v10, v14, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v14

    const-string v15, "purchaseTime"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v15

    move-object v10, v13

    move-object v13, v7

    invoke-direct/range {v8 .. v16}, Luah;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh1b;ZJ)V

    array-length v7, v4

    add-int/lit8 v9, v6, 0x1

    invoke-static {v7, v9}, Lw0b;->b(II)I

    move-result v7

    array-length v10, v4

    if-le v7, v10, :cond_7c

    invoke-static {v4, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    :cond_7c
    aput-object v8, v4, v6

    move v6, v9

    goto :goto_1f

    :cond_80
    invoke-static {v6, v4}, Lh1b;->o(I[Ljava/lang/Object;)Lcsh;

    move-result-object v4

    invoke-direct {v3, v4}, Lbbh;-><init>(Lcsh;)V

    invoke-direct {v1, v3, v2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lb94;->run(Ljava/lang/Object;)V

    return-void

    :cond_8e
    const/4 v3, -0x1

    if-ne v1, v3, :cond_a3

    new-instance v1, Lyah;

    new-instance v3, Lbbh;

    sget-object v4, Lh1b;->b:La1b;

    sget-object v4, Lcsh;->e:Lcsh;

    invoke-direct {v3, v4}, Lbbh;-><init>(Lcsh;)V

    invoke-direct {v1, v3, v2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lb94;->run(Ljava/lang/Object;)V

    return-void

    :cond_a3
    new-instance v1, Lyah;

    new-instance v2, Lzah;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sget-object v3, Lcbh;->b:Lcbh;

    invoke-direct {v1, v2, v3}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lb94;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Ldz8;->a:B

    packed-switch v0, :pswitch_data_58

    new-instance v0, Lc94;

    const/4 v1, 0x1

    iget-object p0, p0, Ldz8;->b:Lcom/opera/api/Callback;

    invoke-direct {v0, p0, p1, v1}, Lc94;-><init>(Lcom/opera/api/Callback;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_11
    check-cast p1, Lcf3;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lsxd;

    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p0, v2}, Lsxd;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v3, Lvr9;

    const/16 v1, 0x1c

    invoke-direct {v3, p1, p0, v1}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-nez v1, :cond_2e

    iget-object v1, p1, Lcf3;->e:Landroid/os/Handler;

    :goto_2c
    move-object v4, v1

    goto :goto_38

    :cond_2e
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    goto :goto_2c

    :goto_38
    invoke-virtual {p1}, Lcf3;->e()Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    const-wide/16 v1, 0x7530

    invoke-static/range {v0 .. v5}, Lcf3;->f(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Future;

    move-result-object v0

    if-nez v0, :cond_56

    invoke-virtual {p1}, Lcf3;->i()Lmf3;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/play_billing/zzjn;->zzy:Lcom/google/android/gms/internal/play_billing/zzjn;

    const/16 v2, 0x9

    invoke-virtual {p1, v2, v0, v1}, Lcf3;->y(ILmf3;Lcom/google/android/gms/internal/play_billing/zzjn;)V

    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzca;->zzk()Lcom/google/android/gms/internal/play_billing/zzca;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Ldz8;->a(Lmf3;Ljava/util/List;)V

    :cond_56
    return-void

    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
