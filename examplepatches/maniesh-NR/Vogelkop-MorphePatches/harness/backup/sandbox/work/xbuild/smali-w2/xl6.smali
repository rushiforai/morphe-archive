.class public final synthetic Lxl6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;
.implements Lcy1;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lx5f;B)V
    .registers 3

    iput-byte p2, p0, Lxl6;->a:B

    iput-object p1, p0, Lxl6;->b:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 3

    const/16 v0, 0xc

    const/4 v1, 0x0

    iget-object p0, p0, Lxl6;->b:Lx5f;

    invoke-virtual {p0, v0, v1}, Lx5f;->R(ILjava/lang/String;)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lxl6;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lxl6;->b:Lx5f;

    packed-switch v0, :pswitch_data_aa

    check-cast p1, Lfxd;

    iget-object v0, p1, Lfxd;->a:Ljava/lang/String;

    iget-object v4, p1, Lfxd;->b:Ljava/lang/String;

    iget-object v5, p1, Lfxd;->c:Ljava/lang/String;

    iget-object v6, p1, Lfxd;->d:Ljava/lang/String;

    iget-object v7, p0, Lx5f;->d:Lzpa;

    if-nez v0, :cond_1e

    if-nez v4, :cond_1e

    if-nez v5, :cond_1e

    if-eqz v6, :cond_5b

    :cond_1e
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v8

    invoke-virtual {v8, v7}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v9

    const/16 v10, 0x1f

    invoke-virtual {v9, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lri0;

    if-nez v11, :cond_42

    new-instance v11, Lri0;

    const/16 v12, 0x98b

    const/4 v13, 0x4

    invoke-direct {v11, v12, v3, v13}, Ljf0;-><init>(III)V

    invoke-virtual {v9, v10, v3, v11}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v9, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    move-object v11, v9

    check-cast v11, Lri0;

    :cond_42
    if-eqz v0, :cond_47

    invoke-virtual {v11, v2, v0}, Lri0;->x(ILjava/lang/String;)V

    :cond_47
    if-eqz v4, :cond_4c

    invoke-virtual {v11, v3, v4}, Lri0;->x(ILjava/lang/String;)V

    :cond_4c
    if-eqz v5, :cond_52

    const/4 v0, 0x2

    invoke-virtual {v11, v0, v5}, Lri0;->x(ILjava/lang/String;)V

    :cond_52
    if-eqz v6, :cond_58

    const/4 v0, 0x3

    invoke-virtual {v11, v0, v6}, Lri0;->x(ILjava/lang/String;)V

    :cond_58
    invoke-virtual {p0, v8}, Lx5f;->U0(Lx56;)V

    :cond_5b
    iget-object p1, p1, Lfxd;->e:Lei0;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, v7}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_6b

    move v2, v3

    :cond_6b
    const/16 v3, 0x18

    invoke-virtual {v4, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-object v1

    :pswitch_74
    check-cast p1, Landroid/util/Pair;

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lkg0;

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_a9

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, p1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v0, :cond_96

    move v2, v3

    :cond_96
    const/16 v7, 0x22

    invoke-virtual {p1, v7, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    const-wide/16 v7, 0x0

    cmp-long v0, v4, v7

    if-ltz v0, :cond_a6

    const/16 v0, 0x23

    invoke-virtual {p1, v0, v3, v4, v5}, Ljf0;->p(IIJ)V

    :cond_a6
    invoke-virtual {p0, v6}, Lx5f;->U0(Lx56;)V

    :cond_a9
    return-object v1

    :pswitch_data_aa
    .packed-switch 0x0
        :pswitch_74
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/lang/String;

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p1, :cond_8

    const-string p1, ""

    :cond_8
    iget-object p0, p0, Lxl6;->b:Lx5f;

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->D(Lzpa;)Ltf0;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2, p1}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
