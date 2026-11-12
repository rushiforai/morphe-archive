.class public final synthetic Lzv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqp5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lx5f;B)V
    .registers 3

    iput-byte p2, p0, Lzv8;->a:B

    iput-object p1, p0, Lzv8;->b:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 9

    iget-byte v0, p0, Lzv8;->a:B

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/16 v3, 0x98b

    iget-object p0, p0, Lzv8;->b:Lx5f;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_e2

    check-cast p1, Lvb0;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_52

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v6

    invoke-virtual {v6, v0}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v0

    new-instance v6, Lom0;

    invoke-direct {v6, v3, v2, v4}, Ljf0;-><init>(III)V

    if-nez p1, :cond_29

    move v2, v1

    goto :goto_2a

    :cond_29
    move v2, v4

    :goto_2a
    invoke-virtual {v6, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x19

    invoke-virtual {v0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_43

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_43

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, p1, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4c

    :cond_43
    invoke-static {v0, p1, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, p1, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4c
    invoke-virtual {v2, v6}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_52
    return-void

    :pswitch_53
    check-cast p1, Lj90;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_99

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v6

    invoke-virtual {v6, v0}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v0

    new-instance v6, Lnj0;

    invoke-direct {v6, v3, v2, v4}, Ljf0;-><init>(III)V

    if-nez p1, :cond_70

    move v2, v1

    goto :goto_71

    :cond_70
    move v2, v4

    :goto_71
    invoke-virtual {v6, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x21

    invoke-virtual {v0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_8a

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_8a

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, p1, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_93

    :cond_8a
    invoke-static {v0, p1, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, p1, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_93
    invoke-virtual {v2, v6}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_99
    return-void

    :pswitch_9a
    check-cast p1, Lvb0;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_e0

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v6

    invoke-virtual {v6, v0}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v0

    new-instance v6, Ldh0;

    invoke-direct {v6, v3, v2, v4}, Ljf0;-><init>(III)V

    if-nez p1, :cond_b7

    move v2, v1

    goto :goto_b8

    :cond_b7
    move v2, v4

    :goto_b8
    invoke-virtual {v6, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x18

    invoke-virtual {v0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_d1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d1

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, p1, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_da

    :cond_d1
    invoke-static {v0, p1, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, p1, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_da
    invoke-virtual {v2, v6}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_e0
    return-void

    nop

    :pswitch_data_e2
    .packed-switch 0x0
        :pswitch_9a
        :pswitch_53
    .end packed-switch
.end method
