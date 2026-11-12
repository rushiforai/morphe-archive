.class public final Lonn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lni6;

.field public final b:Lb59;

.field public final c:Lmgh;

.field public final d:Lx5f;

.field public final e:Lx5f;

.field public final f:Lcom/opera/android/settings/SettingsManager;

.field public g:Lmnn;

.field public h:Lnnn;


# direct methods
.method public constructor <init>(Lb59;Lni6;Lb59;Lmgh;Lx5f;Lx5f;Lcom/opera/android/settings/SettingsManager;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lonn;->a:Lni6;

    iput-object p3, p0, Lonn;->b:Lb59;

    iput-object p4, p0, Lonn;->c:Lmgh;

    iput-object p5, p0, Lonn;->d:Lx5f;

    iput-object p6, p0, Lonn;->e:Lx5f;

    iput-object p7, p0, Lonn;->f:Lcom/opera/android/settings/SettingsManager;

    new-instance p2, La00;

    const/16 p3, 0xa

    invoke-direct {p2, p0, p3}, La00;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/Lazy;->a(Lbg1;)V

    const-string p1, "wallpaper_rotation_enabled"

    invoke-virtual {p7, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    iget-object p3, p7, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p3, p1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {p0, p2, p1}, Lonn;->d(ZZ)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lonn;->a:Lni6;

    invoke-virtual {v2, v0, v1}, Lni6;->b(J)V

    invoke-virtual {v2, v0, v1}, Lni6;->a(J)I

    move-result v0

    int-to-long v0, v0

    iget-object p0, p0, Lonn;->e:Lx5f;

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object v2

    const/4 v4, 0x3

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5, v0, v1}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 11

    iget-object v0, p0, Lonn;->h:Lnnn;

    if-eqz v0, :cond_9a

    iget-object v1, v0, Lnnn;->a:Lwln;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_b4

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_11
    sget-object v1, Lmu0;->i:Lmu0;

    goto :goto_28

    :pswitch_14
    sget-object v1, Lmu0;->h:Lmu0;

    goto :goto_28

    :pswitch_17
    sget-object v1, Lmu0;->g:Lmu0;

    goto :goto_28

    :pswitch_1a
    sget-object v1, Lmu0;->f:Lmu0;

    goto :goto_28

    :pswitch_1d
    sget-object v1, Lmu0;->e:Lmu0;

    goto :goto_28

    :pswitch_20
    sget-object v1, Lmu0;->d:Lmu0;

    goto :goto_28

    :pswitch_23
    sget-object v1, Lmu0;->c:Lmu0;

    goto :goto_28

    :pswitch_26
    sget-object v1, Lmu0;->b:Lmu0;

    :goto_28
    iget-object v2, v0, Lnnn;->c:Laln;

    if-eqz v2, :cond_2f

    sget-object v2, Lvb0;->b:Lvb0;

    goto :goto_31

    :cond_2f
    sget-object v2, Lvb0;->c:Lvb0;

    :goto_31
    iget-boolean v0, v0, Lnnn;->b:Z

    const-string v3, "FILE_storefront_wallpaper_"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3e

    const-string p1, "store-wallpaper"

    goto :goto_48

    :cond_3e
    const-string v3, "FILE_user_wallpaper_"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_48

    const-string p1, "user-wallpaper"

    :cond_48
    :goto_48
    iget-object v3, p0, Lonn;->d:Lx5f;

    iget-boolean v4, v3, Lx5f;->h:Z

    if-eqz v4, :cond_9a

    iget-object v4, v3, Lx5f;->d:Lzpa;

    new-instance v5, Llu0;

    const/4 v6, -0x1

    const/4 v7, 0x4

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    const/4 v6, 0x1

    invoke-virtual {v5, v6, v6, v1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {v5, v1, v6, v2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v1, 0x3

    invoke-virtual {v5, v1, v6, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x2

    invoke-virtual {v5, p1, v6, v0}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v4}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v0

    invoke-virtual {v0, v4}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v0

    const/16 v1, 0x2a

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_8b

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8b

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_94

    :cond_8b
    invoke-static {v0, v1, v6}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_94
    invoke-virtual {v4, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3, p1}, Lx5f;->U0(Lx56;)V

    :cond_9a
    iget-object p1, p0, Lonn;->h:Lnnn;

    if-eqz p1, :cond_af

    iget-object p1, p1, Lnnn;->a:Lwln;

    if-eqz p1, :cond_af

    sget-object v0, Lwln;->a:Lwln;

    if-eq p1, v0, :cond_ae

    sget-object v0, Lwln;->e:Lwln;

    if-eq p1, v0, :cond_ae

    sget-object v0, Lwln;->f:Lwln;

    if-ne p1, v0, :cond_af

    :cond_ae
    return-void

    :cond_af
    const/4 p1, 0x0

    iput-object p1, p0, Lonn;->h:Lnnn;

    return-void

    nop

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
    .end packed-switch
.end method

.method public final c(Laln;ILiu0;)V
    .registers 13

    if-eqz p1, :cond_10d

    if-eqz p3, :cond_10d

    invoke-interface {p1}, Laln;->getType()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_19

    if-eq v0, v3, :cond_16

    if-eq v0, v2, :cond_13

    move-object v0, v1

    goto :goto_1b

    :cond_13
    sget-object v0, Luu0;->d:Luu0;

    goto :goto_1b

    :cond_16
    sget-object v0, Luu0;->c:Luu0;

    goto :goto_1b

    :cond_19
    sget-object v0, Luu0;->b:Luu0;

    :goto_1b
    packed-switch p2, :pswitch_data_10e

    goto :goto_4e

    :pswitch_1f
    sget-object v1, Lpu0;->q:Lpu0;

    goto :goto_4e

    :pswitch_22
    sget-object v1, Lpu0;->p:Lpu0;

    goto :goto_4e

    :pswitch_25
    sget-object v1, Lpu0;->o:Lpu0;

    goto :goto_4e

    :pswitch_28
    sget-object v1, Lpu0;->n:Lpu0;

    goto :goto_4e

    :pswitch_2b
    sget-object v1, Lpu0;->m:Lpu0;

    goto :goto_4e

    :pswitch_2e
    sget-object v1, Lpu0;->l:Lpu0;

    goto :goto_4e

    :pswitch_31
    sget-object v1, Lpu0;->k:Lpu0;

    goto :goto_4e

    :pswitch_34
    sget-object v1, Lpu0;->j:Lpu0;

    goto :goto_4e

    :pswitch_37
    sget-object v1, Lpu0;->i:Lpu0;

    goto :goto_4e

    :pswitch_3a
    sget-object v1, Lpu0;->h:Lpu0;

    goto :goto_4e

    :pswitch_3d
    sget-object v1, Lpu0;->g:Lpu0;

    goto :goto_4e

    :pswitch_40
    sget-object v1, Lpu0;->f:Lpu0;

    goto :goto_4e

    :pswitch_43
    sget-object v1, Lpu0;->e:Lpu0;

    goto :goto_4e

    :pswitch_46
    sget-object v1, Lpu0;->d:Lpu0;

    goto :goto_4e

    :pswitch_49
    sget-object v1, Lpu0;->c:Lpu0;

    goto :goto_4e

    :pswitch_4c
    sget-object v1, Lpu0;->b:Lpu0;

    :goto_4e
    if-eqz v0, :cond_10d

    if-eqz v1, :cond_10d

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p2

    const-string v4, "FILE_storefront_wallpaper_"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_61

    const-string p2, "store-wallpaper"

    goto :goto_6b

    :cond_61
    const-string v4, "FILE_user_wallpaper_"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6b

    const-string p2, "user-wallpaper"

    :cond_6b
    :goto_6b
    invoke-interface {p1}, Laln;->f()I

    move-result p1

    invoke-static {p1}, Lam2;->c(I)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lonn;->d:Lx5f;

    iget-boolean v4, p0, Lx5f;->h:Z

    if-eqz v4, :cond_10d

    iget-object v4, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v4}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v6

    sget-object v7, Liu0;->b:Liu0;

    if-eq p3, v7, :cond_b2

    sget-object v7, Liu0;->d:Liu0;

    if-eq p3, v7, :cond_aa

    sget-object v7, Liu0;->c:Liu0;

    if-eq p3, v7, :cond_a2

    sget-object v7, Liu0;->e:Liu0;

    if-ne p3, v7, :cond_cd

    invoke-virtual {v6}, Lb66;->z()Lqu0;

    move-result-object v7

    invoke-static {v7, v0, p2, p1, v1}, Lx5f;->W0(Lqu0;Luu0;Ljava/lang/String;Ljava/lang/String;Lpu0;)V

    invoke-virtual {v6}, Lb66;->A()Lqu0;

    move-result-object v6

    invoke-static {v6, v0, p2, p1, v1}, Lx5f;->W0(Lqu0;Luu0;Ljava/lang/String;Ljava/lang/String;Lpu0;)V

    goto :goto_cd

    :cond_a2
    invoke-virtual {v6}, Lb66;->A()Lqu0;

    move-result-object v6

    invoke-static {v6, v0, p2, p1, v1}, Lx5f;->W0(Lqu0;Luu0;Ljava/lang/String;Ljava/lang/String;Lpu0;)V

    goto :goto_cd

    :cond_aa
    invoke-virtual {v6}, Lb66;->z()Lqu0;

    move-result-object v6

    invoke-static {v6, v0, p2, p1, v1}, Lx5f;->W0(Lqu0;Luu0;Ljava/lang/String;Ljava/lang/String;Lpu0;)V

    goto :goto_cd

    :cond_b2
    const/16 v7, 0x40

    invoke-virtual {v6, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lqu0;

    if-nez v8, :cond_ca

    invoke-static {}, Lzpa;->N()Lqu0;

    move-result-object v8

    invoke-virtual {v6, v7, v3, v8}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Lqu0;

    :cond_ca
    invoke-static {v8, v0, p2, p1, v1}, Lx5f;->W0(Lqu0;Luu0;Ljava/lang/String;Ljava/lang/String;Lpu0;)V

    :cond_cd
    :goto_cd
    new-instance v0, Lnp0;

    const/4 v6, -0x1

    const/4 v7, 0x4

    const/16 v8, 0x98b

    invoke-direct {v0, v8, v6, v7}, Ljf0;-><init>(III)V

    const/4 v6, 0x0

    invoke-virtual {v0, v6, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v3, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x3

    invoke-virtual {v0, p1, v3, p3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v4}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 p2, 0x33

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/List;

    if-eqz p3, :cond_fe

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_fe

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, p2, p3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_107

    :cond_fe
    invoke-static {p1, p2, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object p3

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, p2, p3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_107
    invoke-virtual {v1, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_10d
    return-void

    :pswitch_data_10e
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_49
        :pswitch_46
        :pswitch_43
        :pswitch_40
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_34
        :pswitch_31
        :pswitch_2e
        :pswitch_2b
        :pswitch_28
        :pswitch_25
        :pswitch_22
        :pswitch_1f
    .end packed-switch
.end method

.method public final d(ZZ)V
    .registers 5

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    new-instance v0, Lkotlin/Pair;

    invoke-direct {v0, p1, p2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-instance p2, Lkotlin/Pair;

    invoke-direct {p2, p1, p1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p2}, Lkotlin/Pair;->equals(Ljava/lang/Object;)Z

    move-result p2

    iget-object p0, p0, Lonn;->d:Lx5f;

    if-eqz p2, :cond_22

    sget-object p1, Lou0;->b:Lou0;

    invoke-virtual {p0, p1}, Lx5f;->R0(Lou0;)V

    return-void

    :cond_22
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    new-instance v1, Lkotlin/Pair;

    invoke-direct {v1, p2, p1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lkotlin/Pair;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    sget-object p1, Lou0;->c:Lou0;

    invoke-virtual {p0, p1}, Lx5f;->R0(Lou0;)V

    return-void

    :cond_35
    new-instance v1, Lkotlin/Pair;

    invoke-direct {v1, p1, p2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lkotlin/Pair;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_46

    sget-object p1, Lou0;->e:Lou0;

    invoke-virtual {p0, p1}, Lx5f;->R0(Lou0;)V

    return-void

    :cond_46
    new-instance p1, Lkotlin/Pair;

    invoke-direct {p1, p2, p2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lkotlin/Pair;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_56

    sget-object p1, Lou0;->d:Lou0;

    invoke-virtual {p0, p1}, Lx5f;->R0(Lou0;)V

    :cond_56
    return-void
.end method
