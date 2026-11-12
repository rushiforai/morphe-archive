.class public final Lg11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrsf;


# instance fields
.field public final a:Ls9i;

.field public final b:Lx56;


# direct methods
.method public constructor <init>(Ls9i;Lx56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg11;->a:Ls9i;

    iput-object p2, p0, Lg11;->b:Lx56;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 4

    iget-object p0, p0, Lg11;->b:Lx56;

    const/16 v0, 0x23

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq56;

    const/4 v0, 0x0

    if-nez p0, :cond_e

    return v0

    :cond_e
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ln56;

    if-nez p0, :cond_18

    return v0

    :cond_18
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_26

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    goto :goto_27

    :cond_26
    const/4 p0, 0x0

    :goto_27
    if-eqz p0, :cond_42

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_42

    invoke-static {v1, p0}, Lam2;->l(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lql0;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lul0;

    sget-object v2, Lul0;->c:Lul0;

    if-ne p0, v2, :cond_41

    return v0

    :cond_41
    return v1

    :cond_42
    return v0
.end method

.method public final b(JZ)V
    .registers 10

    iget-object v0, p0, Lg11;->a:Ls9i;

    iget-object v0, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lzpa;

    const-wide/16 v1, 0x1

    and-long/2addr p1, v1

    const-wide/16 v1, 0x0

    cmp-long p1, p1, v1

    const/4 p2, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_13

    move p1, v1

    goto :goto_14

    :cond_13
    move p1, p2

    :goto_14
    const/16 v2, 0xc

    iget-object p0, p0, Lg11;->b:Lx56;

    invoke-virtual {p0, v2, v1, p1}, Ljf0;->r(IIZ)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/4 v4, -0x1

    const/4 v5, 0x3

    invoke-virtual {p0, v5, v4, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v0}, Lx56;->x(Lzpa;)Lea0;

    move-result-object v2

    invoke-virtual {v2, p2, v1, p1}, Ljf0;->r(IIZ)V

    if-eqz p3, :cond_30

    sget-object p1, Lsl0;->b:Lsl0;

    goto :goto_32

    :cond_30
    sget-object p1, Lsl0;->c:Lsl0;

    :goto_32
    const/16 p3, 0x24

    invoke-virtual {p0, p3, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object p0

    iget-object p1, p0, Ljf0;->d:[Ldf0;

    const/4 p3, 0x2

    aget-object p1, p1, p3

    if-eqz p1, :cond_43

    return-void

    :cond_43
    invoke-virtual {p0, p3, v1, p2}, Ljf0;->r(IIZ)V

    return-void
.end method

.method public final c()V
    .registers 5

    const/16 v0, 0x9

    const/4 v1, 0x1

    iget-object p0, p0, Lg11;->b:Lx56;

    const-wide/16 v2, 0x3c9

    invoke-virtual {p0, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final d(Lrsf;)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lg11;

    iget-object v1, v1, Lg11;->b:Lx56;

    iget-object v2, v0, Lg11;->a:Ls9i;

    iget-object v2, v2, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Lzpa;

    iget-object v0, v0, Lg11;->b:Lx56;

    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    const/4 v5, -0x1

    if-eqz v4, :cond_21

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v1, v3, v5, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_21
    const/4 v4, 0x5

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    const/16 v7, 0x98b

    const/16 v8, 0xf

    const/4 v10, 0x2

    const/4 v11, 0x3

    const/4 v13, 0x0

    const/4 v14, 0x6

    const/4 v9, 0x1

    if-eqz v6, :cond_30d

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lra0;

    new-instance v12, Lra0;

    invoke-direct {v12, v7, v9, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v17

    if-eqz v17, :cond_4d

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v8, v17

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v12, v13, v5, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4d
    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_90

    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lo70;

    new-instance v5, Lo70;

    invoke-direct {v5, v7, v9, v11}, Ljf0;-><init>(III)V

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v18

    if-eqz v18, :cond_6f

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v15, v18

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v5, v13, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6f
    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_7e

    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v5, v9, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7e
    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_8d

    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v5, v10, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8d
    invoke-virtual {v12, v9, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_90
    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_ef

    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Li90;

    new-instance v8, Li90;

    invoke-direct {v8, v7, v9, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_b0

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v13, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b0
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_bf

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v9, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_bf
    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_ce

    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v10, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ce
    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_dd

    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v11, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_dd
    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_ec

    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v8, v3, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ec
    invoke-virtual {v12, v10, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ef
    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_103

    new-instance v5, Ljava/util/HashMap;

    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    invoke-direct {v5, v8}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v12, v11, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_103
    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_112

    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v3, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_112
    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_121

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_121
    invoke-virtual {v6, v14}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_180

    invoke-virtual {v6, v14}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgh0;

    new-instance v8, Lgh0;

    invoke-direct {v8, v7, v9, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_141

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v13, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_141
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_150

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v9, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_150
    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_15f

    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v10, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_15f
    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_16e

    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v11, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_16e
    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_17d

    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v8, v3, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_17d
    invoke-virtual {v12, v14, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_180
    const/4 v5, 0x7

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_190

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lca0;

    invoke-virtual {v12, v5, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_190
    const/16 v5, 0x8

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1a1

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v5, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1a1
    const/16 v5, 0x9

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1b2

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v5, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1b2
    const/16 v5, 0xa

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1c3

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v5, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1c3
    const/16 v5, 0xb

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_217

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lpo0;

    new-instance v5, Lpo0;

    invoke-direct {v5, v7, v9, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_1e5

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v5, v13, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1e5
    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_1f4

    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v5, v9, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1f4
    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_203

    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v5, v10, v9, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_203
    invoke-virtual {v8, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_212

    invoke-virtual {v8, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v5, v11, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_212
    const/16 v8, 0xb

    invoke-virtual {v12, v8, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_217
    const/16 v5, 0xc

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_26e

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lgp0;

    new-instance v5, Lgp0;

    invoke-direct {v5, v7, v9, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_23b

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Float;

    const/4 v14, -0x1

    invoke-virtual {v5, v13, v14, v15}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_23c

    :cond_23b
    const/4 v14, -0x1

    :goto_23c
    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_24b

    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    invoke-virtual {v5, v9, v14, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_24b
    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_25a

    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    invoke-virtual {v5, v10, v14, v15}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_25a
    invoke-virtual {v8, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_269

    invoke-virtual {v8, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Loe0;

    invoke-virtual {v5, v11, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_269
    const/16 v8, 0xc

    invoke-virtual {v12, v8, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_26e
    const/16 v5, 0xd

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_27f

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v5, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_27f
    const/16 v5, 0xe

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_308

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqb0;

    new-instance v5, Lqb0;

    const/4 v8, 0x7

    invoke-direct {v5, v7, v9, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2a2

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v5, v13, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2a2
    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2b1

    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v5, v9, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2b1
    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2c5

    new-instance v8, Ljava/util/ArrayList;

    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    invoke-direct {v8, v14}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5, v10, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2c5
    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2d4

    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v5, v11, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2d4
    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2e3

    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v5, v3, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2e3
    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2f2

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v5, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2f2
    const/4 v8, 0x6

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_302

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v5, v8, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_302
    const/16 v6, 0xe

    invoke-virtual {v12, v6, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_309

    :cond_308
    const/4 v8, 0x6

    :goto_309
    invoke-virtual {v1, v4, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_30e

    :cond_30d
    move v8, v14

    :goto_30e
    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3e3

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ltf0;

    new-instance v6, Ltf0;

    const/16 v8, 0xc

    invoke-direct {v6, v7, v9, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_330

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v13, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_330
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_33f

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v9, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_33f
    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_34e

    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v10, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_34e
    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_35d

    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v11, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_35d
    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_36c

    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v3, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_36c
    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_37b

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_37b
    const/4 v8, 0x6

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_38b

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v6, v8, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_38b
    const/4 v8, 0x7

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_39b

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v6, v8, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_39b
    const/16 v8, 0x8

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_3ac

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v6, v8, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3ac
    const/16 v8, 0x9

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_3bd

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v6, v8, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3bd
    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_3ce

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v6, v8, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3ce
    const/16 v8, 0xb

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_3df

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v8, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3df
    const/4 v8, 0x6

    invoke-virtual {v1, v8, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3e3
    const/4 v8, 0x7

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3f3

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v8, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3f3
    const/16 v5, 0x8

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_405

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    const/4 v14, -0x1

    invoke-virtual {v1, v5, v14, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_405
    const/16 v5, 0xa

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_416

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v1, v5, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_416
    const/16 v8, 0xb

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_427

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v1, v8, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_427
    const/16 v8, 0xc

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_438

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v1, v8, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_438
    const/16 v5, 0xd

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    const/16 v5, 0x10

    const/16 v14, 0x11

    const/16 v15, 0x12

    if-eqz v6, :cond_825

    const/16 v6, 0xd

    invoke-virtual {v0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v6, v19

    check-cast v6, Lin0;

    new-instance v12, Lin0;

    const/16 v8, 0x37

    invoke-direct {v12, v7, v9, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_466

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v13, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_466
    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_475

    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v9, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_475
    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_484

    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v10, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_484
    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_493

    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v11, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_493
    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_4a2

    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v3, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4a2
    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_4b1

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4b1
    const/4 v8, 0x6

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v18

    if-eqz v18, :cond_4c3

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v4, v18

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4c3
    const/4 v8, 0x7

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_4d3

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4d3
    const/16 v8, 0x8

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_4e4

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4e4
    const/16 v8, 0x9

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_4f5

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4f5
    const/16 v8, 0xa

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_506

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_506
    const/16 v8, 0xb

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_517

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_517
    const/16 v8, 0xc

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_528

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_528
    const/16 v4, 0xd

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_539

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_539
    const/16 v4, 0xe

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_54a

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_54a
    const/16 v4, 0xf

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_55b

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lhg0;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_55b
    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_56a

    invoke-virtual {v6, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v12, v5, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_56a
    invoke-virtual {v6, v14}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_579

    invoke-virtual {v6, v14}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v14, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_579
    invoke-virtual {v6, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_588

    invoke-virtual {v6, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v15, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_588
    const/16 v4, 0x13

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_599

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_599
    const/16 v4, 0x14

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_5aa

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5aa
    const/16 v4, 0x15

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_5bb

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5bb
    const/16 v4, 0x16

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_5cc

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5cc
    const/16 v4, 0x17

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_5dd

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5dd
    const/16 v4, 0x18

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_5ee

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5ee
    const/16 v4, 0x19

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_5ff

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5ff
    const/16 v4, 0x1a

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_610

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_610
    const/16 v4, 0x1b

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_621

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_621
    const/16 v4, 0x1c

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_632

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_632
    const/16 v4, 0x1d

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_643

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_643
    const/16 v4, 0x1e

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_654

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_654
    const/16 v4, 0x1f

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_6aa

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lri0;

    new-instance v4, Lri0;

    invoke-direct {v4, v7, v9, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_678

    invoke-virtual {v8, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v5, v20

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v13, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_678
    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_687

    invoke-virtual {v8, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v9, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_687
    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_696

    invoke-virtual {v8, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v10, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_696
    invoke-virtual {v8, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6a5

    invoke-virtual {v8, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v11, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6a5
    const/16 v5, 0x1f

    invoke-virtual {v12, v5, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6aa
    const/16 v4, 0x20

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6bb

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6bb
    const/16 v4, 0x21

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6cc

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6cc
    const/16 v4, 0x22

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6dd

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6dd
    const/16 v4, 0x23

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6ee

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6ee
    const/16 v4, 0x24

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6ff

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6ff
    const/16 v4, 0x25

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_710

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_710
    const/16 v4, 0x26

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_721

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_721
    const/16 v4, 0x27

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_732

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_732
    const/16 v4, 0x28

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_743

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_743
    const/16 v4, 0x29

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_754

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_754
    const/16 v4, 0x2a

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_765

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_765
    const/16 v4, 0x2b

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_776

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_776
    const/16 v4, 0x2c

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_787

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_787
    const/16 v4, 0x2d

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_798

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_798
    const/16 v4, 0x2e

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_7a9

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7a9
    const/16 v4, 0x2f

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_7ba

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7ba
    const/16 v4, 0x31

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_7cb

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7cb
    const/16 v4, 0x32

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_7dc

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7dc
    const/16 v4, 0x33

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_7ed

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7ed
    const/16 v4, 0x34

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_7fe

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7fe
    const/16 v4, 0x35

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_80f

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_80f
    const/16 v4, 0x36

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_820

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lig0;

    invoke-virtual {v12, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_820
    const/16 v5, 0xd

    invoke-virtual {v1, v5, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_825
    const/16 v4, 0xe

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_840

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrr0;

    new-instance v6, Lrr0;

    const/16 v8, 0x19

    invoke-direct {v6, v7, v9, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v6}, Lrr0;->x(Lrr0;)V

    invoke-virtual {v1, v4, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_840
    const/16 v5, 0xf

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_97f

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lsn0;

    new-instance v5, Lsn0;

    invoke-direct {v5, v7, v9, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_862

    invoke-virtual {v6, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v5, v13, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_862
    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_871

    invoke-virtual {v6, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llb0;

    invoke-virtual {v5, v9, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_871
    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_880

    invoke-virtual {v6, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v5, v10, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_880
    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_88f

    invoke-virtual {v6, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v5, v11, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_88f
    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_89e

    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v5, v3, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_89e
    const/4 v4, 0x5

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_8ae

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v5, v4, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8ae
    const/4 v8, 0x6

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8be

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v5, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8be
    const/4 v8, 0x7

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8ce

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v5, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8ce
    const/16 v8, 0x8

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8df

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v5, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8df
    const/16 v8, 0x9

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8f0

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v5, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8f0
    const/16 v8, 0xa

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_901

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v5, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_901
    const/16 v8, 0xb

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_912

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v5, v8, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_912
    const/16 v8, 0xc

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_969

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    new-instance v8, Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v12

    invoke-direct {v8, v12}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_931
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_964

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    new-instance v15, Lqj0;

    const/4 v3, -0x1

    invoke-direct {v15, v7, v3, v9}, Ljf0;-><init>(III)V

    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljf0;

    check-cast v12, Lqj0;

    invoke-virtual {v12, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_960

    invoke-virtual {v12, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lvd0;

    invoke-virtual {v15, v13, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_960
    invoke-virtual {v8, v3, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_931

    :cond_964
    const/16 v3, 0xc

    invoke-virtual {v5, v3, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_969
    const/16 v4, 0xd

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_97a

    invoke-virtual {v6, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v5, v4, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_97a
    const/16 v4, 0xf

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_97f
    invoke-virtual {v0, v14}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_a55

    invoke-virtual {v0, v14}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lls0;

    new-instance v4, Lls0;

    const/16 v8, 0x9

    invoke-direct {v4, v7, v9, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_9a1

    invoke-virtual {v3, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v13, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9a1
    invoke-virtual {v3, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_9b0

    invoke-virtual {v3, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v9, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9b0
    invoke-virtual {v3, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_9bf

    invoke-virtual {v3, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v10, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9bf
    invoke-virtual {v3, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_9ce

    invoke-virtual {v3, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v11, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9ce
    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_9de

    invoke-virtual {v3, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v5, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9de
    const/4 v5, 0x5

    invoke-virtual {v3, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_9ee

    invoke-virtual {v3, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v5, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9ee
    const/4 v8, 0x6

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a31

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lao0;

    new-instance v6, Lao0;

    invoke-direct {v6, v7, v9, v11}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_a0f

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v6, v13, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a0f
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_a1e

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v6, v9, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a1e
    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_a2d

    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lf80;

    invoke-virtual {v6, v10, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a2d
    const/4 v8, 0x6

    invoke-virtual {v4, v8, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a31
    const/4 v8, 0x7

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a41

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v4, v8, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a41
    const/16 v8, 0x8

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a52

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v4, v8, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a52
    invoke-virtual {v1, v14, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a55
    const/16 v3, 0x12

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_aaa

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzu0;

    new-instance v3, Lzu0;

    const/4 v5, 0x4

    invoke-direct {v3, v7, v9, v5}, Ljf0;-><init>(III)V

    invoke-virtual {v4, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a78

    invoke-virtual {v4, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v13, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a78
    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a87

    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v9, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a87
    invoke-virtual {v4, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a96

    invoke-virtual {v4, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v10, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a96
    invoke-virtual {v4, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_aa5

    invoke-virtual {v4, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v11, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_aa5
    const/16 v4, 0x12

    invoke-virtual {v1, v4, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_aaa
    const/16 v4, 0x16

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_ad1

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc66;

    new-instance v5, Lc66;

    const/4 v8, 0x7

    invoke-direct {v5, v7, v9, v8}, Ljf0;-><init>(III)V

    const/4 v8, 0x6

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_ace

    invoke-virtual {v3, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwr0;

    invoke-virtual {v5, v8, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ace
    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ad1
    const/16 v4, 0x1a

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_af6

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lhm0;

    new-instance v5, Lhm0;

    invoke-direct {v5, v7, v9, v10}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_af3

    invoke-virtual {v3, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le80;

    invoke-virtual {v5, v9, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_af3
    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_af6
    const/16 v4, 0x1b

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_b11

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb66;

    new-instance v5, Lb66;

    const/16 v6, 0x59

    invoke-direct {v5, v7, v9, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v5, v2}, Lb66;->x(Lb66;Lzpa;)V

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b11
    const/16 v4, 0x1c

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_b77

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    new-instance v4, Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_b30
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b72

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    new-instance v6, Lds0;

    const/4 v14, -0x1

    invoke-direct {v6, v7, v14, v10}, Ljf0;-><init>(III)V

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljf0;

    check-cast v5, Lds0;

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_b5f

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lvd0;

    invoke-virtual {v6, v13, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b5f
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_b6e

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lop0;

    invoke-virtual {v6, v9, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b6e
    invoke-virtual {v4, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b30

    :cond_b72
    const/16 v5, 0x1c

    invoke-virtual {v1, v5, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b77
    const/16 v4, 0x1d

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_bdd

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    new-instance v4, Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_b96
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_bd8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    new-instance v6, Lct0;

    const/4 v14, -0x1

    invoke-direct {v6, v7, v14, v10}, Ljf0;-><init>(III)V

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljf0;

    check-cast v5, Lct0;

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_bc5

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lvd0;

    invoke-virtual {v6, v13, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_bc5
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_bd4

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lop0;

    invoke-virtual {v6, v9, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_bd4
    invoke-virtual {v4, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b96

    :cond_bd8
    const/16 v5, 0x1d

    invoke-virtual {v1, v5, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_bdd
    const/16 v4, 0x1e

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_bf8

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ls70;

    new-instance v5, Ls70;

    const/16 v6, 0x10

    invoke-direct {v5, v7, v9, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v5}, Ls70;->x(Ls70;)V

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_bf8
    const/16 v4, 0x22

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c09

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v4, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c09
    const/16 v3, 0x23

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_c22

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lq56;

    new-instance v6, Lq56;

    invoke-direct {v6, v7, v9, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v6}, Lq56;->x(Lq56;)V

    invoke-virtual {v1, v3, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c22
    const/16 v4, 0x27

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c33

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v1, v4, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c33
    const/16 v4, 0x28

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c4e

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lea0;

    new-instance v5, Lea0;

    const/16 v8, 0xc

    invoke-direct {v5, v7, v9, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v5}, Lea0;->x(Lea0;)V

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c4e
    const/16 v4, 0x29

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c68

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lxt0;

    new-instance v5, Lxt0;

    const/4 v6, 0x5

    invoke-direct {v5, v7, v9, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v5, v2}, Lxt0;->x(Lxt0;Lzpa;)V

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c68
    const/16 v4, 0x2b

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c83

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le66;

    new-instance v5, Le66;

    const/16 v6, 0x1f

    invoke-direct {v5, v7, v9, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v5}, Le66;->x(Le66;)V

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c83
    const/16 v4, 0x2c

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c9e

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzs0;

    new-instance v5, Lzs0;

    const/16 v6, 0xf

    invoke-direct {v5, v7, v9, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v5}, Lzs0;->x(Lzs0;)V

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c9e
    const/16 v3, 0x30

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_cb7

    invoke-virtual {v0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmd0;

    new-instance v5, Lmd0;

    invoke-direct {v5, v7, v9, v11}, Ljf0;-><init>(III)V

    invoke-virtual {v4, v5, v2}, Lmd0;->x(Lmd0;Lzpa;)V

    invoke-virtual {v1, v3, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_cb7
    const/16 v4, 0x31

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_cf7

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ls56;

    new-instance v2, Ls56;

    invoke-direct {v2, v7, v9, v10}, Ljf0;-><init>(III)V

    invoke-virtual {v0, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_cde

    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v0, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, v13, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_cde
    invoke-virtual {v0, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_cf2

    new-instance v3, Ljava/util/HashMap;

    invoke-virtual {v0, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-direct {v3, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2, v9, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_cf2
    const/16 v4, 0x31

    invoke-virtual {v1, v4, v9, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_cf7
    return-void
.end method

.method public final e(Lrsf;)Lrsf;
    .registers 4

    new-instance v0, Lg11;

    check-cast p1, Lg11;

    iget-object p1, p1, Lg11;->b:Lx56;

    iget-object v1, p0, Lg11;->b:Lx56;

    invoke-virtual {v1, p1}, Lx56;->m(Ljf0;)Ljf0;

    iget-object p0, p0, Lg11;->a:Ls9i;

    invoke-direct {v0, p0, v1}, Lg11;-><init>(Ls9i;Lx56;)V

    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lg11;->b:Lx56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final g(III)V
    .registers 12

    iget-object v0, p0, Lg11;->a:Ls9i;

    iget-object v1, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Lzpa;

    new-instance v2, Lrl0;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x5

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v2, v6, v7, v3, v4}, Ljf0;->p(IIJ)V

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    if-eqz p2, :cond_23

    if-ne p2, v7, :cond_23

    sget-object p2, Lul0;->c:Lul0;

    goto :goto_25

    :cond_23
    sget-object p2, Lul0;->b:Lul0;

    :goto_25
    invoke-virtual {v2, v7, v7, p2}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p2, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast p2, Landroid/content/Context;

    invoke-static {}, Lzpa;->D()Lbj0;

    move-result-object v0

    invoke-static {p2, v0}, Lui6;->u(Landroid/content/Context;Lbj0;)Lbj0;

    const/4 p2, 0x2

    invoke-virtual {v2, p2, v7, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {p1}, Lvep;->A(I)I

    move-result v0

    const/4 v3, 0x4

    const/4 v4, 0x3

    if-eq v0, p2, :cond_57

    if-eq v0, v4, :cond_54

    if-eq v0, v3, :cond_51

    if-eq v0, v5, :cond_4e

    const/4 p2, 0x6

    if-eq v0, p2, :cond_4b

    sget-object p2, Ltl0;->b:Ltl0;

    goto :goto_59

    :cond_4b
    sget-object p2, Ltl0;->f:Ltl0;

    goto :goto_59

    :cond_4e
    sget-object p2, Ltl0;->g:Ltl0;

    goto :goto_59

    :cond_51
    sget-object p2, Ltl0;->e:Ltl0;

    goto :goto_59

    :cond_54
    sget-object p2, Ltl0;->d:Ltl0;

    goto :goto_59

    :cond_57
    sget-object p2, Ltl0;->c:Ltl0;

    :goto_59
    invoke-virtual {v2, v4, v7, p2}, Ljf0;->q(IILjava/lang/Object;)V

    if-ne p1, v4, :cond_61

    invoke-virtual {v2, v3, v7, p3}, Ljf0;->o(III)V

    :cond_61
    iget-object p0, p0, Lg11;->b:Lx56;

    invoke-virtual {p0, v1}, Lx56;->z(Lzpa;)Lq56;

    move-result-object p0

    invoke-virtual {p0, v1}, Lq56;->y(Lzpa;)Ln56;

    move-result-object p0

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_7f

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_7f

    new-instance p2, Lhf0;

    invoke-direct {p2, p0, v5, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_8c

    :cond_7f
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, v5, v7, p1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance p2, Lhf0;

    invoke-direct {p2, p0, v5, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_8c
    invoke-virtual {p2, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final h(Ljava/io/ByteArrayOutputStream;J)V
    .registers 4

    iget-object p0, p0, Lg11;->b:Lx56;

    invoke-virtual {p0, p1, p2, p3}, Ljf0;->t(Ljava/io/ByteArrayOutputStream;J)V

    return-void
.end method

.method public final i(IZ)V
    .registers 25

    move-object/from16 v0, p0

    move/from16 v1, p2

    iget-object v2, v0, Lg11;->a:Ls9i;

    iget-object v3, v2, Ls9i;->c:Ljava/lang/Object;

    check-cast v3, Lzpa;

    new-instance v4, Lql0;

    const/16 v5, 0x98b

    const/4 v6, -0x1

    const/4 v7, 0x4

    invoke-direct {v4, v5, v6, v7}, Ljf0;-><init>(III)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-virtual {v4, v10, v11, v8, v9}, Ljf0;->p(IIJ)V

    iget-object v8, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast v8, Landroid/content/Context;

    invoke-static {}, Lzpa;->D()Lbj0;

    move-result-object v9

    invoke-static {v8, v9}, Lui6;->u(Landroid/content/Context;Lbj0;)Lbj0;

    const/4 v12, 0x3

    invoke-virtual {v4, v12, v11, v9}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v4, v11, v11, v1}, Ljf0;->r(IIZ)V

    invoke-static {v11}, Lvep;->A(I)I

    move-result v9

    if-eqz v9, :cond_39

    if-ne v9, v11, :cond_39

    sget-object v9, Lul0;->c:Lul0;

    goto :goto_3b

    :cond_39
    sget-object v9, Lul0;->b:Lul0;

    :goto_3b
    const/4 v13, 0x2

    invoke-virtual {v4, v13, v11, v9}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v0, v0, Lg11;->b:Lx56;

    invoke-virtual {v0, v3}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v9

    invoke-virtual {v9, v3}, Lq56;->y(Lzpa;)Ln56;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    if-eqz v14, :cond_5d

    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_5d

    new-instance v15, Lhf0;

    invoke-direct {v15, v9, v7, v14}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_6a

    :cond_5d
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v9, v7, v11, v14}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v15, Lhf0;

    invoke-direct {v15, v9, v7, v14}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_6a
    invoke-virtual {v15, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    iget-object v2, v2, Ls9i;->e:Ljava/lang/Object;

    check-cast v2, La5f;

    iget-object v4, v2, La5f;->a:Landroid/app/ActivityManager;

    iget-object v2, v2, La5f;->b:Lzpa;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-virtual {v0, v12, v6, v14, v15}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v7, v6, v10}, Ljf0;->o(III)V

    sget-object v9, La5f;->d:Lc30;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v14, 0x3c9

    const/16 v9, 0x8

    invoke-virtual {v0, v9, v6, v14, v15}, Ljf0;->p(IIJ)V

    sget-object v14, La5f;->d:Lc30;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v14, 0x68

    const/16 v6, 0xa

    invoke-virtual {v0, v6, v11, v14, v15}, Ljf0;->p(IIJ)V

    sget-object v14, La5f;->d:Lc30;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v14, 0xb

    const-wide/16 v12, 0x0

    invoke-virtual {v0, v14, v11, v12, v13}, Ljf0;->p(IIJ)V

    const-string v15, "connectivity"

    invoke-virtual {v8, v15}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/net/ConnectivityManager;

    invoke-virtual {v15}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v15

    const/16 v14, 0xf

    if-eqz v15, :cond_f2

    invoke-virtual {v15}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v16

    if-eqz v16, :cond_f2

    invoke-virtual {v15}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    if-ne v7, v11, :cond_c2

    const-string v7, "wifi"

    goto :goto_f4

    :cond_c2
    if-nez v7, :cond_ed

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v12, "mobile/"

    invoke-direct {v7, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v12

    if-ne v12, v14, :cond_d4

    const-string v12, "hspap"

    goto :goto_e5

    :cond_d4
    invoke-static {v12}, Laik;->l(I)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_e1

    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v13, v12}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    goto :goto_e5

    :cond_e1
    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    :goto_e5
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_f4

    :cond_ed
    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_f4

    :cond_f2
    const-string v7, "N/A"

    :goto_f4
    const/16 v12, 0x20

    invoke-virtual {v0, v12, v7}, Lx56;->V(ILjava/lang/String;)V

    invoke-virtual {v0, v2}, Lx56;->D(Lzpa;)Ltf0;

    move-result-object v7

    invoke-static {v8}, Lzi4;->A(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v11, v12}, Ltf0;->x(ILjava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v7

    invoke-virtual {v7, v8}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v7

    if-nez v7, :cond_113

    :try_start_10e
    invoke-static {v8}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v7
    :try_end_112
    .catch Ljava/io/IOException; {:try_start_10e .. :try_end_112} :catch_113
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_10e .. :try_end_112} :catch_113
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_10e .. :try_end_112} :catch_113
    .catch Ljava/lang/SecurityException; {:try_start_10e .. :try_end_112} :catch_113

    goto :goto_114

    :catch_113
    :cond_113
    const/4 v7, 0x0

    :goto_114
    if-eqz v7, :cond_137

    invoke-virtual {v7}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_12b

    invoke-virtual {v0, v2}, Lx56;->D(Lzpa;)Ltf0;

    move-result-object v13

    invoke-virtual {v7}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v10, v15}, Ltf0;->x(ILjava/lang/String;)V

    :cond_12b
    invoke-virtual {v0, v2}, Lx56;->x(Lzpa;)Lea0;

    move-result-object v13

    invoke-virtual {v7}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v7

    xor-int/2addr v7, v11

    invoke-virtual {v13, v9, v11, v7}, Ljf0;->r(IIZ)V

    :cond_137
    invoke-virtual {v0, v2}, Lx56;->y(Lzpa;)Lra0;

    move-result-object v7

    const-string v13, "Android"

    const/16 v15, 0x9

    invoke-virtual {v7, v15, v13}, Lra0;->y(ILjava/lang/String;)V

    sget-object v13, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v7, v6, v13}, Lra0;->y(ILjava/lang/String;)V

    invoke-static {v8}, Lpyn;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    const/16 v12, 0xd

    invoke-virtual {v7, v12, v13}, Lra0;->y(ILjava/lang/String;)V

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lo70;

    if-nez v13, :cond_167

    new-instance v13, Lo70;

    const/4 v15, 0x3

    invoke-direct {v13, v5, v11, v15}, Ljf0;-><init>(III)V

    invoke-virtual {v7, v11, v11, v13}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lo70;

    :cond_167
    const-string v14, "Opera for Android"

    invoke-virtual {v13, v10, v14}, Lo70;->x(ILjava/lang/String;)V

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    const-wide/16 v5, 0x0

    invoke-static {v8, v14, v5, v6}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v14

    iget-object v5, v14, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v13, v11, v5}, Lo70;->x(ILjava/lang/String;)V

    invoke-static {v5}, Lr9n;->v(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {v13, v6, v5}, Lo70;->x(ILjava/lang/String;)V

    invoke-virtual {v7, v2}, Lra0;->x(Lzpa;)Lqb0;

    move-result-object v5

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v6, :cond_190

    move v7, v10

    goto :goto_191

    :cond_190
    move v7, v11

    :goto_191
    const/4 v13, 0x6

    invoke-virtual {v5, v13, v7, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v6}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    invoke-virtual {v4, v6}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    iget-wide v6, v6, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    invoke-virtual {v5, v10, v11, v6, v7}, Ljf0;->p(IIJ)V

    sget-object v6, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    if-nez v6, :cond_1ad

    move v7, v10

    :goto_1ab
    const/4 v14, 0x2

    goto :goto_1af

    :cond_1ad
    move v7, v11

    goto :goto_1ab

    :goto_1af
    invoke-virtual {v5, v14, v7, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v17

    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v19

    mul-long v13, v19, v17

    const/4 v7, 0x5

    invoke-virtual {v5, v7, v11, v13, v14}, Ljf0;->p(IIJ)V

    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v13

    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockCountLong()J

    move-result-wide v18

    mul-long v13, v13, v18

    const/4 v6, 0x4

    invoke-virtual {v5, v6, v11, v13, v14}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v2}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v5

    sget-object v6, La5f;->d:Lc30;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v6, "beta"

    invoke-virtual {v5, v10, v6}, Lin0;->x(ILjava/lang/String;)V

    sget-object v6, La5f;->d:Lc30;

    iget-object v6, v6, Lc30;->b:Ljava/lang/String;

    invoke-virtual {v5, v11, v6}, Lin0;->x(ILjava/lang/String;)V

    sget-object v6, La5f;->d:Lc30;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v6, "Beta"

    const/4 v14, 0x2

    invoke-virtual {v5, v14, v6}, Lin0;->x(ILjava/lang/String;)V

    sget-object v6, La5f;->d:Lc30;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v6, "armeabi-v7a"

    const/16 v13, 0x27

    invoke-virtual {v5, v13, v11, v6}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 v6, 0x28

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v6, v13}, Lin0;->x(ILjava/lang/String;)V

    sget-object v6, La5f;->d:Lc30;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/32 v13, 0x71de74d2

    const/16 v6, 0x29

    invoke-virtual {v5, v6, v11, v13, v14}, Ljf0;->p(IIJ)V

    const/16 v6, 0x2a

    invoke-static {v8}, Lr9n;->F(Landroid/content/Context;)Z

    move-result v13

    invoke-virtual {v5, v6, v11, v13}, Ljf0;->r(IIZ)V

    sget-object v6, La5f;->d:Lc30;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v6, 0x2b

    invoke-virtual {v5, v6, v11, v11}, Ljf0;->r(IIZ)V

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/16 v13, 0x2c

    invoke-virtual {v5, v13, v6}, Lin0;->x(ILjava/lang/String;)V

    new-instance v6, Ljava/util/TreeSet;

    invoke-direct {v6}, Ljava/util/TreeSet;-><init>()V

    invoke-static {v8}, Lr9n;->s(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_257

    invoke-virtual {v6, v13}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    :cond_257
    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_270

    invoke-virtual {v6, v13}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    :cond_270
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x1e

    if-lt v13, v14, :cond_290

    invoke-static {v8}, Lr9n;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_283

    invoke-virtual {v6, v13}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    :cond_283
    invoke-static {v8}, Lr9n;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_290

    invoke-virtual {v6, v13}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    :cond_290
    invoke-virtual {v6}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_298

    const/4 v6, 0x0

    goto :goto_29e

    :cond_298
    const-string v13, ","

    invoke-static {v13, v6}, Ljava/lang/String;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    :goto_29e
    const/16 v13, 0x2d

    invoke-virtual {v5, v13, v6}, Lin0;->x(ILjava/lang/String;)V

    sget-object v6, Ldtg;->a:Ljava/util/concurrent/atomic/AtomicReference;

    const-string v6, "com.opera.preinstall"

    const-wide/16 v12, 0x0

    invoke-static {v8, v6, v12, v13}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v19

    if-nez v19, :cond_2b1

    const/4 v12, 0x0

    goto :goto_2c2

    :cond_2b1
    new-instance v12, Lunk;

    invoke-static {v8}, Ldtg;->c(Landroid/content/Context;)Z

    move-result v13

    invoke-virtual/range {v19 .. v19}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v14

    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    iput-boolean v13, v12, Lunk;->a:Z

    iput-wide v14, v12, Lunk;->b:J

    :goto_2c2
    const/16 v13, 0x2e

    if-eqz v12, :cond_2d2

    iget-boolean v14, v12, Lunk;->a:Z

    invoke-virtual {v5, v13, v11, v14}, Ljf0;->r(IIZ)V

    const/16 v14, 0x2f

    iget-wide v9, v12, Lunk;->b:J

    invoke-virtual {v5, v14, v11, v9, v10}, Ljf0;->p(IIJ)V

    :cond_2d2
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lxf8;->O(Landroid/content/Context;Ljava/lang/String;)Lovf;

    move-result-object v9

    if-nez v9, :cond_2df

    sget-object v9, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_2fe

    :cond_2df
    iget-object v9, v9, Lovf;->b:[Landroid/content/pm/Signature;

    new-instance v10, Ljava/util/ArrayList;

    array-length v12, v9

    invoke-direct {v10, v12}, Ljava/util/ArrayList;-><init>(I)V

    array-length v12, v9

    const/4 v14, 0x0

    :goto_2e9
    if-ge v14, v12, :cond_2fd

    aget-object v21, v9, v14

    sget-object v15, Lf8a;->d:Lf8a;

    invoke-virtual/range {v21 .. v21}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v13

    invoke-virtual {v15, v13}, Lf8a;->b([B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v14, v14, 0x1

    goto :goto_2e9

    :cond_2fd
    move-object v9, v10

    :goto_2fe
    if-nez v9, :cond_302

    const/4 v15, 0x0

    goto :goto_303

    :cond_302
    move v15, v11

    :goto_303
    const/16 v10, 0x30

    invoke-virtual {v5, v10, v15, v9}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v8}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    const-string v10, "/data/"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_319

    sget-object v9, Lig0;->b:Lig0;

    goto :goto_32c

    :cond_319
    invoke-virtual {v8}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    const-string v10, "/mnt/"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_32a

    sget-object v9, Lig0;->c:Lig0;

    goto :goto_32c

    :cond_32a
    sget-object v9, Lig0;->d:Lig0;

    :goto_32c
    const/16 v10, 0x36

    invoke-virtual {v5, v10, v11, v9}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object v5

    sget-object v9, La5f;->c:Ljava/util/Locale;

    invoke-virtual {v9}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x8

    invoke-virtual {v5, v10, v9}, Lrr0;->y(ILjava/lang/String;)V

    sget-object v9, La5f;->c:Ljava/util/Locale;

    invoke-virtual {v9}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v9

    const/16 v15, 0x9

    invoke-virtual {v5, v15, v9}, Lrr0;->y(ILjava/lang/String;)V

    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v15, 0x0

    invoke-virtual {v5, v15, v11, v9}, Ljf0;->o(III)V

    new-instance v9, Ll2f;

    invoke-direct {v9, v8}, Ll2f;-><init>(Landroid/content/Context;)V

    iget-object v9, v9, Ll2f;->b:Landroid/app/NotificationManager;

    invoke-virtual {v9}, Landroid/app/NotificationManager;->areNotificationsEnabled()Z

    move-result v9

    const/16 v10, 0xa

    invoke-virtual {v5, v10, v11, v9}, Ljf0;->r(IIZ)V

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v9

    if-nez v9, :cond_36f

    move v9, v11

    :goto_36c
    const/16 v10, 0xb

    goto :goto_371

    :cond_36f
    const/4 v9, 0x0

    goto :goto_36c

    :goto_371
    invoke-virtual {v5, v10, v11, v9}, Ljf0;->r(IIZ)V

    sget-object v9, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v5, v11, v9}, Lrr0;->y(ILjava/lang/String;)V

    sget-object v9, Lpyn;->a:Ljava/util/HashSet;

    invoke-static {}, Landroid/webkit/WebView;->getCurrentWebViewPackage()Landroid/content/pm/PackageInfo;

    move-result-object v9

    const/16 v10, 0xc

    if-eqz v9, :cond_38f

    iget-object v12, v9, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v10, v12}, Lrr0;->y(ILjava/lang/String;)V

    iget-object v9, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    const/16 v12, 0xd

    invoke-virtual {v5, v12, v9}, Lrr0;->y(ILjava/lang/String;)V

    :cond_38f
    const-string v9, "activity"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/ActivityManager;

    invoke-virtual {v9}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result v9

    const/16 v12, 0x12

    invoke-virtual {v5, v12, v11, v9}, Ljf0;->r(IIZ)V

    const/16 v5, 0x1e

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ls70;

    if-nez v9, :cond_3bc

    new-instance v9, Ls70;

    const/16 v12, 0x10

    const/16 v13, 0x98b

    invoke-direct {v9, v13, v11, v12}, Ljf0;-><init>(III)V

    invoke-virtual {v0, v5, v11, v9}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ls70;

    :cond_3bc
    const-string v5, "com.facebook.katana"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    const/4 v15, 0x0

    invoke-virtual {v9, v15, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.facebook.lite"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v9, v11, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.vkontakte.android"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    const/4 v14, 0x2

    invoke-virtual {v9, v14, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.twitter.android"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    const/4 v12, 0x3

    invoke-virtual {v9, v12, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.opera.mini.native"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    const/4 v13, 0x4

    invoke-virtual {v9, v13, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.opera.mini.android"

    const-wide/16 v12, 0x0

    invoke-static {v8, v5, v12, v13}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v5

    const/16 v12, 0x15

    const/4 v13, 0x7

    const/4 v15, 0x0

    if-nez v5, :cond_404

    invoke-virtual {v9, v7, v11, v15}, Ljf0;->r(IIZ)V

    const/4 v5, 0x6

    invoke-virtual {v9, v5, v11, v15}, Ljf0;->r(IIZ)V

    move v10, v5

    goto :goto_42c

    :cond_404
    iget-object v14, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    const/16 v10, 0x2e

    invoke-virtual {v14, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    if-lez v10, :cond_42b

    :try_start_40e
    iget-object v5, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v5, v15, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    if-gt v5, v13, :cond_41c

    move v10, v11

    goto :goto_41d

    :cond_41c
    const/4 v10, 0x0

    :goto_41d
    invoke-virtual {v9, v7, v11, v10}, Ljf0;->r(IIZ)V
    :try_end_420
    .catch Ljava/lang/NumberFormatException; {:try_start_40e .. :try_end_420} :catch_42b

    if-lt v5, v12, :cond_425

    move v5, v11

    :goto_423
    const/4 v10, 0x6

    goto :goto_427

    :cond_425
    const/4 v5, 0x0

    goto :goto_423

    :goto_427
    :try_start_427
    invoke-virtual {v9, v10, v11, v5}, Ljf0;->r(IIZ)V
    :try_end_42a
    .catch Ljava/lang/NumberFormatException; {:try_start_427 .. :try_end_42a} :catch_42c

    goto :goto_42c

    :catch_42b
    :cond_42b
    const/4 v10, 0x6

    :catch_42c
    :goto_42c
    const-string v5, "com.opera.browser"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v9, v13, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.opera.browser.beta"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    const/16 v13, 0x8

    invoke-virtual {v9, v13, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.opera.browser.classic"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    const/16 v13, 0x9

    invoke-virtual {v9, v13, v11, v5}, Ljf0;->r(IIZ)V

    const-string v5, "com.android.vending"

    invoke-static {v8, v5}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v13

    const/16 v14, 0xa

    invoke-virtual {v9, v14, v11, v13}, Ljf0;->r(IIZ)V

    const-string v13, "com.google.android.youtube"

    invoke-static {v8, v13}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v13

    const/16 v14, 0xb

    invoke-virtual {v9, v14, v11, v13}, Ljf0;->r(IIZ)V

    invoke-static {v8, v6}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v6

    const/16 v13, 0xc

    invoke-virtual {v9, v13, v11, v6}, Ljf0;->r(IIZ)V

    const-string v6, "com.opera.app.news"

    invoke-static {v8, v6}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v6

    const/16 v13, 0xe

    invoke-virtual {v9, v13, v11, v6}, Ljf0;->r(IIZ)V

    const-string v6, "com.booking"

    invoke-static {v8, v6}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v6

    const/16 v13, 0xf

    invoke-virtual {v9, v13, v11, v6}, Ljf0;->r(IIZ)V

    invoke-virtual {v0, v2}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v6

    invoke-virtual {v4}, Landroid/app/ActivityManager;->isBackgroundRestricted()Z

    move-result v9

    const/4 v13, 0x4

    invoke-virtual {v6, v13, v11, v9}, Ljf0;->r(IIZ)V

    const-class v9, Landroid/app/usage/UsageStatsManager;

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/usage/UsageStatsManager;

    if-nez v9, :cond_498

    const/4 v9, -0x1

    goto :goto_49c

    :cond_498
    invoke-virtual {v9}, Landroid/app/usage/UsageStatsManager;->getAppStandbyBucket()I

    move-result v9

    :goto_49c
    invoke-virtual {v6, v7, v11, v9}, Ljf0;->o(III)V

    invoke-virtual {v6, v12}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le70;

    if-nez v9, :cond_4b7

    new-instance v9, Le70;

    const/16 v14, 0x98b

    invoke-direct {v9, v14, v11, v11}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v12, v11, v9}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v12}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le70;

    :cond_4b7
    invoke-virtual {v8}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v12

    iget-object v12, v12, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v12, :cond_4c5

    const/4 v15, 0x0

    :goto_4c3
    const/4 v14, 0x0

    goto :goto_4c7

    :cond_4c5
    move v15, v11

    goto :goto_4c3

    :goto_4c7
    invoke-virtual {v9, v14, v15, v12}, Ljf0;->q(IILjava/lang/Object;)V

    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x1e

    if-lt v9, v12, :cond_4d3

    invoke-static {v8, v4, v6}, Luh8;->a(Landroid/content/Context;Landroid/app/ActivityManager;Lq56;)V

    :cond_4d3
    invoke-virtual {v0, v2}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v2

    :try_start_4d7
    const-string v4, "keyguard"

    invoke-virtual {v8, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/KeyguardManager;

    invoke-virtual {v4}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v4

    const/4 v15, 0x0

    invoke-virtual {v2, v15, v11, v4}, Ljf0;->r(IIZ)V
    :try_end_4e7
    .catch Ljava/lang/Exception; {:try_start_4d7 .. :try_end_4e7} :catch_4e7

    :catch_4e7
    invoke-static {v8}, Lr9n;->l(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4f1

    sget-object v4, Llb0;->b:Llb0;

    goto/16 :goto_557

    :cond_4f1
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_570

    goto :goto_53a

    :sswitch_4f9
    const-string v5, "com.vivo.appstore"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53a

    move v7, v10

    goto :goto_53d

    :sswitch_503
    const-string v5, "com.oppo.market"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_53d

    goto :goto_53a

    :sswitch_50c
    const-string v5, "com.xiaomi.mipicks"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53a

    move v7, v13

    goto :goto_53d

    :sswitch_516
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53a

    const/4 v7, 0x3

    goto :goto_53d

    :sswitch_51e
    const-string v5, "com.heytap.market"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53a

    const/4 v7, 0x2

    goto :goto_53d

    :sswitch_528
    const-string v5, "com.sec.android.app.samsungapps"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53a

    move v7, v11

    goto :goto_53d

    :sswitch_532
    const-string v5, "com.huawei.appmarket"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_53c

    :cond_53a
    :goto_53a
    const/4 v7, -0x1

    goto :goto_53d

    :cond_53c
    const/4 v7, 0x0

    :cond_53d
    :goto_53d
    packed-switch v7, :pswitch_data_58e

    sget-object v4, Llb0;->j:Llb0;

    goto :goto_557

    :pswitch_543
    sget-object v4, Llb0;->d:Llb0;

    goto :goto_557

    :pswitch_546
    sget-object v4, Llb0;->e:Llb0;

    goto :goto_557

    :pswitch_549
    sget-object v4, Llb0;->h:Llb0;

    goto :goto_557

    :pswitch_54c
    sget-object v4, Llb0;->c:Llb0;

    goto :goto_557

    :pswitch_54f
    sget-object v4, Llb0;->f:Llb0;

    goto :goto_557

    :pswitch_552
    sget-object v4, Llb0;->i:Llb0;

    goto :goto_557

    :pswitch_555
    sget-object v4, Llb0;->g:Llb0;

    :goto_557
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v11, v11, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v3}, Lx56;->y(Lzpa;)Lra0;

    move-result-object v2

    const/4 v4, -0x1

    const/4 v15, 0x0

    invoke-virtual {v2, v15, v4, v1}, Ljf0;->r(IIZ)V

    invoke-virtual {v0, v3}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object v0

    move/from16 v1, p1

    invoke-virtual {v0, v15, v11, v1}, Ljf0;->o(III)V

    return-void

    :sswitch_data_570
    .sparse-switch
        -0x619d58dd -> :sswitch_532
        -0x490565ea -> :sswitch_528
        -0x46bbecaa -> :sswitch_51e
        -0x3e676dcf -> :sswitch_516
        0x1923f630 -> :sswitch_50c
        0x37833d5d -> :sswitch_503
        0x68bc68b5 -> :sswitch_4f9
    .end sparse-switch

    :pswitch_data_58e
    .packed-switch 0x0
        :pswitch_555
        :pswitch_552
        :pswitch_54f
        :pswitch_54c
        :pswitch_549
        :pswitch_546
        :pswitch_543
    .end packed-switch
.end method

.method public final isEmpty()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final j(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lg11;->b:Lx56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lx56;->V(ILjava/lang/String;)V

    return-void
.end method
