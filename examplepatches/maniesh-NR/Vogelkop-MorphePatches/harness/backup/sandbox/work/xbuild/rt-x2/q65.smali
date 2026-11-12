.class public final Lq65;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 4

    iput-byte p2, p0, Lq65;->c:B

    const/16 p2, 0x17

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Ln1;-><init>(BZ)V

    iput-object p1, p0, Lq65;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lq65;->c:B

    const/4 v1, 0x0

    iget-object p0, p0, Lq65;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_7e

    check-cast p0, Lsa4;

    iget-object v0, p0, Lsa4;->m:Ljava/lang/Object;

    check-cast v0, Lih4;

    if-eqz v0, :cond_15

    invoke-interface {v0}, Lih4;->cancel()V

    iput-object v1, p0, Lsa4;->m:Ljava/lang/Object;

    :cond_15
    invoke-virtual {p0}, Lsa4;->f()V

    return-void

    :pswitch_19
    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_1f
    check-cast p0, Ll2b;

    invoke-virtual {p0}, Ll2b;->K0()V

    return-void

    :pswitch_25
    check-cast p0, Lxb9;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lxb9;->j:J

    iget-object v0, p0, Lab2;->b:Lja2;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lxb9;->V(Lja2;Z)V

    return-void

    :pswitch_32
    check-cast p0, Lx65;

    iget-boolean v0, p0, Lx65;->z:Z

    if-eqz v0, :cond_5a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_5a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result v0

    if-nez v0, :cond_5a

    invoke-virtual {p0}, Lx65;->r0()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_55

    iget-object v1, p0, Lx65;->r:Lq65;

    invoke-virtual {v1}, Ln1;->S()V

    iput-object v0, p0, Lx65;->w:Landroid/view/View;

    invoke-virtual {p0}, Lx65;->l0()V

    goto :goto_5a

    :cond_55
    sget-object v0, Lyim;->e:Lyim;

    invoke-virtual {p0, v0}, Lx65;->n0(Lyim;)V

    :cond_5a
    :goto_5a
    return-void

    :pswitch_5b
    check-cast p0, Lr65;

    invoke-virtual {p0}, Lr65;->c()Z

    move-result v0

    if-nez v0, :cond_7c

    const/16 v0, 0x1f

    const-string v2, "Timed out before SDK initialization completed."

    invoke-virtual {p0, v0, v2}, Lr65;->j(ILjava/lang/String;)V

    sget-object v0, Lfwm;->Companion:Lewm;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lhwm;

    invoke-direct {v0, v2, v1}, Lhwm;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v2, Lfwm;

    invoke-direct {v2, v0}, Lfwm;-><init>(Lhwm;)V

    invoke-virtual {p0, v1, v1, v2}, Lr65;->i(Lcom/usercentrics/sdk/UsercentricsReadyStatus;Lcom/usercentrics/sdk/UsercentricsOptions;Lfwm;)V

    :cond_7c
    return-void

    nop

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_32
        :pswitch_25
        :pswitch_1f
        :pswitch_19
    .end packed-switch
.end method
