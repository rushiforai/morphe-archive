.class public final Lw10;
.super Laqi;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final u:Lcie;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lcie;Lp00;Li3j;Lap;)V
    .registers 27

    const-string v5, ""

    sget-object v10, Lyo;->c:Lyo;

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v0 .. v13}, Laqi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lbp;Li3j;Lap;)V

    move-object/from16 p1, p9

    iput-object p1, p0, Lw10;->u:Lcie;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Lx10;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lmq;-><init>(Lyz;Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)V

    return-object v0
.end method

.method public final c()V
    .registers 2

    invoke-super {p0}, Laqi;->c()V

    iget-object p0, p0, Lw10;->u:Lcie;

    iget-boolean v0, p0, Lcie;->U:Z

    if-nez v0, :cond_c

    invoke-virtual {p0}, Lcie;->unregister()V

    :cond_c
    iget-object v0, p0, Lcie;->w0:Laoo;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Laoo;->o()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcie;->w0:Laoo;

    :cond_16
    sget-object v0, Lrbe;->B:Lrbe;

    iput-object v0, p0, Lbzo;->b:Lbn;

    return-void
.end method

.method public final d(Liq;)Z
    .registers 4

    iget-object v0, p0, Lw10;->u:Lcie;

    iget-object v0, v0, Lbzo;->d:Lw06;

    sget-object v1, Lw06;->g:Ln06;

    if-ne v0, v1, :cond_10

    sget-object p0, Liq;->c:Liq;

    if-ne p1, p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0

    :cond_10
    invoke-super {p0, p1}, Lyz;->d(Liq;)Z

    move-result p0

    return p0
.end method

.method public final e()Lv50;
    .registers 1

    iget-object p0, p0, Lw10;->u:Lcie;

    iget-object p0, p0, Lbzo;->d:Lw06;

    invoke-static {p0}, Ls00;->p(Lw06;)Lv50;

    move-result-object p0

    return-object p0
.end method

.method public final i()Lvz;
    .registers 3

    iget-object p0, p0, Lw10;->u:Lcie;

    iget-object v0, p0, Lcie;->u0:Ljava/lang/String;

    iget-object p0, p0, Lcie;->v0:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_18

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_18

    new-instance v1, Lvz;

    invoke-direct {v1, v0, p0}, Lvz;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_18
    const/4 p0, 0x0

    return-object p0
.end method

.method public final k()Ljava/util/List;
    .registers 10

    iget-object p0, p0, Lw10;->u:Lcie;

    iget-object v0, p0, Lbzo;->j:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_d
    new-instance v0, Lv10;

    sget-object v1, Lwz;->a:Lwz;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, p0}, Lv10;-><init>(Lwz;ILcie;)V

    new-instance v1, Lv10;

    sget-object v3, Lwz;->d:Lwz;

    const/4 v4, 0x2

    invoke-direct {v1, v3, v4, p0}, Lv10;-><init>(Lwz;ILcie;)V

    new-instance v3, Lv10;

    sget-object v5, Lwz;->b:Lwz;

    const/4 v6, 0x3

    invoke-direct {v3, v5, v6, p0}, Lv10;-><init>(Lwz;ILcie;)V

    new-instance v5, Lv10;

    sget-object v7, Lwz;->c:Lwz;

    const/4 v8, 0x4

    invoke-direct {v5, v7, v8, p0}, Lv10;-><init>(Lwz;ILcie;)V

    new-array p0, v8, [Lxz;

    const/4 v7, 0x0

    aput-object v0, p0, v7

    aput-object v1, p0, v2

    aput-object v3, p0, v4

    aput-object v5, p0, v6

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final v()Z
    .registers 2

    iget-object p0, p0, Lw10;->u:Lcie;

    iget-object p0, p0, Lbzo;->d:Lw06;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/16 v0, 0x8

    if-eq p0, v0, :cond_15

    const/16 v0, 0xf

    if-eq p0, v0, :cond_15

    packed-switch p0, :pswitch_data_18

    const/4 p0, 0x0

    return p0

    :cond_15
    :pswitch_15
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x13
        :pswitch_15
        :pswitch_15
        :pswitch_15
    .end packed-switch
.end method
