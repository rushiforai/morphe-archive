.class public final Lr98;
.super Lwbh;
.source "SourceFile"


# instance fields
.field public final synthetic r:B


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;B)V
    .registers 7

    iput-byte p6, p0, Lr98;->r:B

    invoke-direct/range {p0 .. p5}, Lwbh;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)V

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/Boolean;
    .registers 1

    iget-byte p0, p0, Lr98;->r:B

    const/4 p0, 0x0

    return-object p0
.end method

.method public final i()Lzn0;
    .registers 1

    iget-byte p0, p0, Lr98;->r:B

    packed-switch p0, :pswitch_data_c

    sget-object p0, Lzn0;->k:Lzn0;

    return-object p0

    :pswitch_8
    sget-object p0, Lzn0;->o:Lzn0;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final l()Ljava/lang/String;
    .registers 1

    iget-byte p0, p0, Lr98;->r:B

    packed-switch p0, :pswitch_data_c

    const-string p0, "rewards"

    return-object p0

    :pswitch_8
    const-string p0, "esim"

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final o()Ljava/lang/String;
    .registers 1

    iget-byte p0, p0, Lr98;->r:B

    packed-switch p0, :pswitch_data_c

    const-string p0, "rewards"

    return-object p0

    :pswitch_8
    const-string p0, "esim"

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final p()I
    .registers 1

    iget-byte p0, p0, Lr98;->r:B

    packed-switch p0, :pswitch_data_a

    const/4 p0, 0x4

    return p0

    :pswitch_7
    const/4 p0, 0x5

    return p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method public final w()Z
    .registers 6

    iget-byte v0, p0, Lr98;->r:B

    const/4 v1, 0x0

    sget-object v2, Lvn0;->q:Lvn0;

    iget-object v3, p0, Lwbh;->a:Landroid/content/Context;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_6a

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk3i;

    invoke-virtual {v0}, Lk3i;->c()Z

    move-result v0

    if-nez v0, :cond_23

    :goto_21
    move v1, v4

    goto :goto_3f

    :cond_23
    const-string v0, "rewards"

    invoke-static {v3, v0}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2f

    invoke-virtual {p0, v2}, Lwbh;->t(Lvn0;)V

    goto :goto_21

    :cond_2f
    iget-object v0, p0, Lwbh;->d:Ls0f;

    if-eqz v0, :cond_3f

    invoke-virtual {v0, v3}, Ls0f;->g(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3f

    sget-object v0, Lvn0;->n:Lvn0;

    invoke-virtual {p0, v0}, Lwbh;->t(Lvn0;)V

    goto :goto_21

    :cond_3f
    :goto_3f
    return v1

    :pswitch_40
    const-string v0, "esim"

    invoke-static {v3, v0}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eq v0, v4, :cond_4d

    invoke-virtual {p0, v2}, Lwbh;->t(Lvn0;)V

    :goto_4b
    move v1, v4

    goto :goto_69

    :cond_4d
    new-instance v0, Lyf;

    const/16 v2, 0x15

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    sget-object v2, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {v2, v0}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_69

    sget-object v0, Lvn0;->s:Lvn0;

    invoke-virtual {p0, v0}, Lwbh;->t(Lvn0;)V

    goto :goto_4b

    :cond_69
    :goto_69
    return v1

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_40
    .end packed-switch
.end method
