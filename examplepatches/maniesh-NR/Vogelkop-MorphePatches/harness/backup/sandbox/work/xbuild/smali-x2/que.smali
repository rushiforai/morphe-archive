.class public final Lque;
.super Lx1p;
.source "SourceFile"


# instance fields
.field public final synthetic p:B

.field public final synthetic q:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lque;->p:B

    iput-object p1, p0, Lque;->q:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final J(Landroidx/fragment/app/Fragment;)V
    .registers 2

    iget-byte p1, p0, Lque;->p:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lque;->q:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0}, Lshf;->O()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final K(Landroidx/fragment/app/Fragment;)V
    .registers 3

    iget-byte v0, p0, Lque;->p:B

    packed-switch v0, :pswitch_data_14

    return-void

    :pswitch_6
    instance-of p1, p1, Lkx8;

    if-eqz p1, :cond_13

    iget-object p0, p0, Lque;->q:Ljava/lang/Object;

    check-cast p0, Lvue;

    iget-object p0, p0, Liu8;->d:Lp12;

    invoke-virtual {p0}, Lp12;->x()V

    :cond_13
    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final M()V
    .registers 2

    iget-byte v0, p0, Lque;->p:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lque;->q:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0}, Lshf;->O()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final O()V
    .registers 2

    iget-byte v0, p0, Lque;->p:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lque;->q:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0}, Lshf;->O()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final P(Landroidx/fragment/app/Fragment;)V
    .registers 2

    iget-byte p1, p0, Lque;->p:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lque;->q:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0}, Lshf;->O()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final Q()V
    .registers 2

    iget-byte v0, p0, Lque;->p:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lque;->q:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0}, Lshf;->O()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
