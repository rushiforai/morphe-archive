.class public final Lujc;
.super Lgk9;
.source "SourceFile"


# instance fields
.field public final synthetic d:B


# direct methods
.method public synthetic constructor <init>(Lgig;B)V
    .registers 3

    iput-byte p2, p0, Lujc;->d:B

    invoke-direct {p0, p1}, Lgk9;-><init>(Lgig;)V

    return-void
.end method


# virtual methods
.method public final P()Lcig;
    .registers 2

    iget-byte v0, p0, Lujc;->d:B

    packed-switch v0, :pswitch_data_46

    invoke-super {p0}, Lgk9;->P()Lcig;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lgk9;->b:Lgig;

    invoke-interface {p0}, Lgig;->P()Lcig;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Leme;

    invoke-direct {v0, p0}, Leme;-><init>(Lcig;)V

    const/4 p0, 0x5

    invoke-virtual {v0, p0}, Leme;->v0(I)V

    const/16 p0, 0xb

    invoke-virtual {v0, p0}, Leme;->v0(I)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0}, Leme;->v0(I)V

    const/16 p0, 0x9

    invoke-virtual {v0, p0}, Leme;->v0(I)V

    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Leme;->v0(I)V

    const/4 p0, 0x7

    invoke-virtual {v0, p0}, Leme;->v0(I)V

    const/4 p0, 0x6

    invoke-virtual {v0, p0}, Leme;->v0(I)V

    new-instance p0, Lcig;

    iget-object v0, v0, Leme;->a:Ljava/lang/Object;

    check-cast v0, Lnrl;

    invoke-virtual {v0}, Lnrl;->j()Lw69;

    move-result-object v0

    invoke-direct {p0, v0}, Lcig;-><init>(Lw69;)V

    return-object p0

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final stop()V
    .registers 2

    iget-byte v0, p0, Lujc;->d:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0}, Lgk9;->stop()V

    return-void

    :pswitch_9
    invoke-super {p0}, Lgk9;->stop()V

    iget-object v0, p0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->getCurrentTimeline()Lgql;

    move-result-object v0

    invoke-virtual {v0}, Lgql;->p()Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-virtual {p0}, Lgk9;->seekToDefaultPosition()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lgk9;->setPlayWhenReady(Z)V

    :cond_1f
    return-void

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
