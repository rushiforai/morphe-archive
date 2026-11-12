.class public final Lzwh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrsf;


# instance fields
.field public final a:Lyqa;

.field public final b:Lw56;


# direct methods
.method public constructor <init>(Lyqa;Lw56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzwh;->a:Lyqa;

    iput-object p2, p0, Lzwh;->b:Lw56;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b(JZ)V
    .registers 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const/4 p3, -0x1

    iget-object p0, p0, Lzwh;->b:Lw56;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p3, p1, p2}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final c()V
    .registers 5

    const/16 v0, 0x9

    const/4 v1, 0x1

    iget-object p0, p0, Lzwh;->b:Lw56;

    const-wide/16 v2, 0x3c9

    invoke-virtual {p0, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final d(Lrsf;)V
    .registers 19

    move-object/from16 v0, p1

    check-cast v0, Lzwh;

    iget-object v0, v0, Lzwh;->b:Lw56;

    move-object/from16 v1, p0

    iget-object v1, v1, Lzwh;->b:Lw56;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, -0x1

    if-eqz v3, :cond_1b

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v0, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1b
    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    const/16 v6, 0x97f

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/4 v9, 0x3

    const/4 v10, 0x6

    const/4 v15, 0x7

    const/4 v13, 0x1

    if-eqz v5, :cond_2ff

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqa0;

    new-instance v12, Lqa0;

    const/16 v11, 0xf

    invoke-direct {v12, v6, v13, v11}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_46

    invoke-virtual {v5, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Boolean;

    invoke-virtual {v12, v7, v4, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_46
    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_89

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ln70;

    new-instance v4, Ln70;

    invoke-direct {v4, v6, v13, v9}, Ljf0;-><init>(III)V

    invoke-virtual {v11, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_68

    invoke-virtual {v11, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v14, v16

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v4, v7, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_68
    invoke-virtual {v11, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_77

    invoke-virtual {v11, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v4, v13, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_77
    invoke-virtual {v11, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_86

    invoke-virtual {v11, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v4, v8, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_86
    invoke-virtual {v12, v13, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_89
    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_e8

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lh90;

    new-instance v11, Lh90;

    invoke-direct {v11, v6, v13, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v4, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_a9

    invoke-virtual {v4, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v7, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a9
    invoke-virtual {v4, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_b8

    invoke-virtual {v4, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v13, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b8
    invoke-virtual {v4, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_c7

    invoke-virtual {v4, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v8, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c7
    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_d6

    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v9, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d6
    invoke-virtual {v4, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_e5

    invoke-virtual {v4, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v11, v2, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_e5
    invoke-virtual {v12, v8, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_e8
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_fc

    new-instance v4, Ljava/util/HashMap;

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map;

    invoke-direct {v4, v11}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v12, v9, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_fc
    invoke-virtual {v5, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_10b

    invoke-virtual {v5, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v2, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_10b
    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_11a

    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v12, v3, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_11a
    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_179

    invoke-virtual {v5, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfh0;

    new-instance v11, Lfh0;

    invoke-direct {v11, v6, v13, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v4, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_13a

    invoke-virtual {v4, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v7, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_13a
    invoke-virtual {v4, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_149

    invoke-virtual {v4, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v13, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_149
    invoke-virtual {v4, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_158

    invoke-virtual {v4, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v8, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_158
    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_167

    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v11, v9, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_167
    invoke-virtual {v4, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_176

    invoke-virtual {v4, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v11, v2, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_176
    invoke-virtual {v12, v10, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_179
    invoke-virtual {v5, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_188

    invoke-virtual {v5, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lba0;

    invoke-virtual {v12, v15, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_188
    const/16 v4, 0x8

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_199

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v12, v4, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_199
    const/16 v4, 0x9

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_1aa

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v12, v4, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1aa
    const/16 v4, 0xa

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_1bb

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v12, v4, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1bb
    const/16 v4, 0xb

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_20f

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Loo0;

    new-instance v4, Loo0;

    invoke-direct {v4, v6, v13, v2}, Ljf0;-><init>(III)V

    invoke-virtual {v11, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_1dd

    invoke-virtual {v11, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v4, v7, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1dd
    invoke-virtual {v11, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_1ec

    invoke-virtual {v11, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v4, v13, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1ec
    invoke-virtual {v11, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_1fb

    invoke-virtual {v11, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v4, v8, v13, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1fb
    invoke-virtual {v11, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_20a

    invoke-virtual {v11, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v4, v9, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_20a
    const/16 v11, 0xb

    invoke-virtual {v12, v11, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_20f
    const/16 v4, 0xc

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_266

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lfp0;

    new-instance v4, Lfp0;

    invoke-direct {v4, v6, v13, v2}, Ljf0;-><init>(III)V

    invoke-virtual {v11, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_233

    invoke-virtual {v11, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Float;

    const/4 v10, -0x1

    invoke-virtual {v4, v7, v10, v14}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_234

    :cond_233
    const/4 v10, -0x1

    :goto_234
    invoke-virtual {v11, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_243

    invoke-virtual {v11, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v4, v13, v10, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_243
    invoke-virtual {v11, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_252

    invoke-virtual {v11, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v4, v8, v10, v14}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_252
    invoke-virtual {v11, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_261

    invoke-virtual {v11, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lne0;

    invoke-virtual {v4, v9, v13, v10}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_261
    const/16 v10, 0xc

    invoke-virtual {v12, v10, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_266
    const/16 v4, 0xd

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_277

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v12, v4, v13, v10}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_277
    const/16 v4, 0xe

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_2fc

    invoke-virtual {v5, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lpb0;

    new-instance v10, Lpb0;

    invoke-direct {v10, v6, v13, v15}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_299

    invoke-virtual {v5, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v10, v7, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_299
    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_2a8

    invoke-virtual {v5, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v10, v13, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2a8
    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_2bc

    new-instance v11, Ljava/util/ArrayList;

    invoke-virtual {v5, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    invoke-direct {v11, v14}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v10, v8, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2bc
    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_2cb

    invoke-virtual {v5, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Boolean;

    invoke-virtual {v10, v9, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2cb
    invoke-virtual {v5, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_2da

    invoke-virtual {v5, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v10, v2, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2da
    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_2e9

    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v10, v3, v13, v11}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2e9
    const/4 v11, 0x6

    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_2f9

    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v10, v11, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2f9
    invoke-virtual {v12, v4, v13, v10}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2fc
    invoke-virtual {v0, v3, v13, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2ff
    invoke-virtual {v1, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_30e

    invoke-virtual {v1, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v15, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_30e
    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_320

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    const/4 v10, -0x1

    invoke-virtual {v0, v4, v10, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_320
    const/16 v4, 0xa

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_331

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v0, v4, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_331
    const/16 v4, 0xb

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_342

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v0, v4, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_342
    const/16 v4, 0xc

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3f7

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrn0;

    new-instance v4, Lrn0;

    const/16 v5, 0xa

    invoke-direct {v4, v6, v13, v5}, Ljf0;-><init>(III)V

    invoke-virtual {v1, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_366

    invoke-virtual {v1, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v7, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_366
    invoke-virtual {v1, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_375

    invoke-virtual {v1, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v4, v13, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_375
    invoke-virtual {v1, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_384

    invoke-virtual {v1, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v8, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_384
    invoke-virtual {v1, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_393

    invoke-virtual {v1, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v9, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_393
    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3a2

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v2, v13, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3a2
    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3b1

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v3, v13, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3b1
    const/4 v11, 0x6

    invoke-virtual {v1, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3c1

    invoke-virtual {v1, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v11, v13, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3c1
    invoke-virtual {v1, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3d0

    invoke-virtual {v1, v15}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lln0;

    invoke-virtual {v4, v15, v13, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3d0
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3e1

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v4, v2, v13, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3e1
    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3f2

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v2, v13, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3f2
    const/16 v10, 0xc

    invoke-virtual {v0, v10, v13, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3f7
    return-void
.end method

.method public final e(Lrsf;)Lrsf;
    .registers 4

    new-instance v0, Lzwh;

    check-cast p1, Lzwh;

    iget-object p1, p1, Lzwh;->b:Lw56;

    iget-object v1, p0, Lzwh;->b:Lw56;

    invoke-virtual {v1, p1}, Lw56;->m(Ljf0;)Ljf0;

    iget-object p0, p0, Lzwh;->a:Lyqa;

    invoke-direct {v0, p0, v1}, Lzwh;-><init>(Lyqa;Lw56;)V

    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lzwh;->b:Lw56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final g(III)V
    .registers 4

    return-void
.end method

.method public final h(Ljava/io/ByteArrayOutputStream;J)V
    .registers 4

    iget-object p0, p0, Lzwh;->b:Lw56;

    invoke-virtual {p0, p1, p2, p3}, Ljf0;->t(Ljava/io/ByteArrayOutputStream;J)V

    return-void
.end method

.method public final i(IZ)V
    .registers 12

    iget-object p1, p0, Lzwh;->a:Lyqa;

    iget-object p1, p1, Lyqa;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p0, Lzwh;->b:Lw56;

    const/4 p2, 0x3

    const/4 v2, -0x1

    invoke-virtual {p0, p2, v2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->o(III)V

    sget-object v3, Lwu5;->a:Lhr5;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v3, 0x3c9

    const/16 v5, 0x8

    invoke-virtual {p0, v5, v2, v3, v4}, Ljf0;->p(IIJ)V

    sget-object v2, Lwu5;->a:Lhr5;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0xa

    const/4 v3, 0x1

    const-wide/16 v6, 0x68

    invoke-virtual {p0, v2, v3, v6, v7}, Ljf0;->p(IIJ)V

    sget-object v4, Lwu5;->a:Lhr5;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v6, 0x0

    const/16 v4, 0xb

    invoke-virtual {p0, v4, v3, v6, v7}, Ljf0;->p(IIJ)V

    const/4 v4, 0x5

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqa0;

    const/16 v7, 0x97f

    if-nez v6, :cond_57

    new-instance v6, Lqa0;

    const/16 v8, 0xf

    invoke-direct {v6, v7, v3, v8}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v4, v3, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lqa0;

    :cond_57
    const/16 v4, 0x9

    const-string v8, "Android"

    invoke-virtual {v6, v4, v8}, Lqa0;->x(ILjava/lang/String;)V

    sget-object v4, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v6, v2, v4}, Lqa0;->x(ILjava/lang/String;)V

    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ln70;

    if-nez v4, :cond_7a

    new-instance v4, Ln70;

    invoke-direct {v4, v7, v3, p2}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v3, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Ln70;

    :cond_7a
    const-string p2, "Opera for Android"

    invoke-virtual {v4, v1, p2}, Ln70;->x(ILjava/lang/String;)V

    invoke-static {p1}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v4, v3, p1}, Ln70;->x(ILjava/lang/String;)V

    const/4 p2, 0x2

    invoke-static {p1}, Lr9n;->v(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p2, p1}, Ln70;->x(ILjava/lang/String;)V

    const/16 p1, 0xc

    invoke-virtual {p0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lrn0;

    if-nez p2, :cond_a9

    new-instance p2, Lrn0;

    invoke-direct {p2, v7, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, p1, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object p2, p0

    check-cast p2, Lrn0;

    :cond_a9
    sget-object p0, Lwu5;->a:Lhr5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2, v3, v3, v3}, Ljf0;->r(IIZ)V

    sget-object p0, Lwu5;->a:Lhr5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2, v5, v3, v3}, Ljf0;->r(IIZ)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Lsfe;->b0(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, v0, p0}, Lrn0;->x(ILjava/lang/String;)V

    sget-object p0, Lln0;->b:Lln0;

    const/4 p1, 0x7

    invoke-virtual {p2, p1, v3, p0}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method

.method public final isEmpty()Z
    .registers 3

    const/16 v0, 0xd

    iget-object p0, p0, Lzwh;->b:Lw56;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_13

    :cond_12
    move-object v0, v1

    :goto_13
    if-eqz v0, :cond_1b

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_1b
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_2a

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_2b

    :cond_2a
    move-object v0, v1

    :goto_2b
    if-eqz v0, :cond_33

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_33
    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_42

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_43

    :cond_42
    move-object v0, v1

    :goto_43
    if-eqz v0, :cond_4b

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_4b
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_5a

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_5b

    :cond_5a
    move-object v0, v1

    :goto_5b
    if-eqz v0, :cond_63

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_63
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_72

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_73

    :cond_72
    move-object v0, v1

    :goto_73
    if-eqz v0, :cond_7b

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_7b
    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_89

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    :cond_89
    if-eqz v1, :cond_93

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_93

    :cond_91
    const/4 p0, 0x0

    return p0

    :cond_93
    const/4 p0, 0x1

    return p0
.end method

.method public final j(Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_5

    move v1, v0

    goto :goto_6

    :cond_5
    const/4 v1, 0x1

    :goto_6
    iget-object p0, p0, Lzwh;->b:Lw56;

    invoke-virtual {p0, v0, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method
