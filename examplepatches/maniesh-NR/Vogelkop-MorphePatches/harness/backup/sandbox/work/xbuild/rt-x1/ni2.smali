.class public final synthetic Lni2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;JLjava/lang/Object;B)V
    .registers 6

    iput-byte p5, p0, Lni2;->a:B

    iput-object p1, p0, Lni2;->c:Ljava/lang/Object;

    iput-wide p2, p0, Lni2;->b:J

    iput-object p4, p0, Lni2;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;JB)V
    .registers 6

    .line 12
    iput-byte p5, p0, Lni2;->a:B

    iput-object p1, p0, Lni2;->c:Ljava/lang/Object;

    iput-object p2, p0, Lni2;->d:Ljava/lang/Object;

    iput-wide p3, p0, Lni2;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lni2;->a:B

    const/4 v1, 0x0

    iget-wide v2, p0, Lni2;->b:J

    iget-object v4, p0, Lni2;->d:Ljava/lang/Object;

    iget-object v5, p0, Lni2;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_10c

    check-cast v5, Liuh;

    iget-object p0, v5, Liuh;->c:Ljava/lang/Object;

    check-cast p0, Lmi8;

    sget-object v0, Ltym;->a:Ljava/lang/String;

    iget-object p0, p0, Lmi8;->a:Lqi8;

    iget-object v0, p0, Lqi8;->t:Lel6;

    invoke-virtual {v0}, Lel6;->U()Ld11;

    move-result-object v1

    new-instance v5, Lid5;

    invoke-direct {v5, v1, v4, v2, v3}, Lid5;-><init>(Ld11;Ljava/lang/Object;J)V

    const/16 v2, 0x1a

    invoke-virtual {v0, v1, v2, v5}, Lel6;->V(Ld11;ILfjc;)V

    iget-object v0, p0, Lqi8;->U:Ljava/lang/Object;

    if-ne v0, v4, :cond_36

    iget-object p0, p0, Lqi8;->n:Lijc;

    new-instance v0, Lyt7;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lyt7;-><init>(B)V

    invoke-virtual {p0, v2, v0}, Lijc;->i(ILfjc;)V

    :cond_36
    return-void

    :pswitch_37
    check-cast v5, Lglh;

    check-cast v4, Ljava/lang/Runnable;

    invoke-virtual {v5, v2, v3, v1}, Lglh;->g(JZ)V

    iget-object p0, v5, Lglh;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_44
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_54

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lclh;

    invoke-interface {v0, v2, v3}, Lclh;->e(J)V

    goto :goto_44

    :cond_54
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_58
    check-cast v5, Lj4c;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbf9;

    invoke-virtual {v0}, Lbf9;->r()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_8b

    invoke-virtual {v0}, Lbf9;->q()Lpc9;

    move-result-object v1

    if-eqz v1, :cond_8b

    iget-object v6, v0, Lbf9;->e:Lle9;

    new-instance v9, Lre9;

    iget-wide v7, p0, Lni2;->b:J

    invoke-direct {v9, v7, v8, v4, v1}, Lre9;-><init>(JLjava/lang/String;Lpc9;)V

    new-instance v10, Lvk2;

    const/16 p0, 0xd

    invoke-direct {v10, p0}, Lvk2;-><init>(B)V

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lyx;

    const/4 v11, 0x4

    invoke-direct/range {v5 .. v11}, Lyx;-><init>(Lle9;JLjava/lang/Object;Lvk2;B)V

    invoke-static {v5, v10}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    :cond_8b
    return-void

    :pswitch_8c
    check-cast v5, Lnv6;

    check-cast v4, Ljava/lang/String;

    iget-object p0, v5, Lnv6;->a:Ljava/lang/Object;

    check-cast p0, Lpd7;

    iget-object v0, p0, Lpd7;->n:Ljava/util/Map;

    if-nez v0, :cond_9d

    invoke-virtual {p0}, Lldk;->i()V

    iget-object v0, p0, Lpd7;->n:Ljava/util/Map;

    :cond_9d
    new-instance v1, Lod7;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    add-long/2addr v2, v5

    invoke-direct {v1, v2, v3}, Lod7;-><init>(J)V

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lrbd;->i(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    return-void

    :pswitch_b6
    check-cast v5, Livh;

    check-cast v4, Lowh;

    invoke-interface {v5, v4, v2, v3}, Livh;->p(Lowh;J)V

    return-void

    :pswitch_be
    check-cast v5, Llg4;

    check-cast v4, Landroid/hardware/camera2/CameraCaptureSession;

    iget-object p0, v5, Llg4;->a:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    const/4 v0, -0x1

    invoke-virtual {p0, v4, v0, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V

    return-void

    :pswitch_c9
    check-cast v5, Lpi2;

    check-cast v4, Lei2;

    iget-boolean p0, v4, Lei2;->b:Z

    if-eqz p0, :cond_fc

    new-instance p0, Loi2;

    invoke-direct {p0, v5, v2, v3, v1}, Loi2;-><init>(Ljava/lang/Object;JB)V

    new-instance v0, Lmi2;

    const/4 v1, 0x3

    invoke-direct {v0, v5, v2, v3, v1}, Lmi2;-><init>(Lpi2;JB)V

    iget-object v1, v5, Lhi2;->a:Lmyk;

    iget-object v1, v1, Lmyk;->b:Ldb;

    invoke-virtual {v1}, Ldb;->f()Z

    move-result v2

    if-eqz v2, :cond_f2

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p0, v0}, Ldb;->g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;

    move-result-object p0

    new-instance v0, Lcrk;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    goto :goto_f9

    :cond_f2
    const-string p0, "Not signed in"

    invoke-virtual {v0, p0}, Lmi2;->run(Ljava/lang/Object;)V

    sget-object v0, Lbf9;->A:Lbxl;

    :goto_f9
    iput-object v0, v5, Lpi2;->h:Lih4;

    goto :goto_10a

    :cond_fc
    new-instance p0, Lab;

    const/16 v0, 0x16

    invoke-direct {p0, v5, v0}, Lab;-><init>(Ljava/lang/Object;B)V

    const/4 v0, 0x0

    invoke-virtual {v5, v2, v3, v0, p0}, Lhi2;->k(JLorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p0

    iput-object p0, v5, Lpi2;->h:Lih4;

    :goto_10a
    return-void

    nop

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_c9
        :pswitch_be
        :pswitch_b6
        :pswitch_8c
        :pswitch_58
        :pswitch_37
    .end packed-switch
.end method
