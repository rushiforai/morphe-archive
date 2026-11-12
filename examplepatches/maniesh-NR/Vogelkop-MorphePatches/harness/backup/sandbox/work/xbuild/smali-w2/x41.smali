.class public final synthetic Lx41;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(J)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Lx41;->a:B

    sget-object v0, Lapc;->b:Lix5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lx41;->b:J

    return-void
.end method

.method public synthetic constructor <init>(JB)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lx41;->a:B

    iput-wide p1, p0, Lx41;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 54

    move-object/from16 v0, p0

    iget-byte v1, v0, Lx41;->a:B

    const/4 v2, 0x2

    const-string v3, "oscoreId"

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-wide v6, v0, Lx41;->b:J

    const/4 v8, 0x1

    packed-switch v1, :pswitch_data_66c

    const-string v0, "DELETE FROM activity WHERE lastAccess < ?"

    move-object/from16 v1, p1

    check-cast v1, Losk;

    invoke-virtual {v1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_19
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    invoke-virtual {v1}, Lwsk;->n()Z
    :try_end_1f
    .catchall {:try_start_19 .. :try_end_1f} :catchall_25

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_25
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_2a
    move-object/from16 v0, p1

    check-cast v0, Lwa1;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Lwa1;->x(ILjava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_38
    move-object/from16 v0, p1

    check-cast v0, Lyj0;

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Lyj0;->b:Lt56;

    const/16 v2, 0x14

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_58

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_58

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_65

    :cond_58
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v2, v8, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_65
    const-wide/16 v2, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v4, v1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_71
    move-object/from16 v1, p1

    check-cast v1, Lmk7;

    const/4 v6, 0x0

    const/16 v7, 0x7e

    iget-wide v2, v0, Lx41;->b:J

    const-wide/16 v4, 0x0

    invoke-static/range {v1 .. v7}, Lmk7;->z0(Lmk7;JJFI)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_82
    move-object/from16 v0, p1

    check-cast v0, Lr60;

    new-array v1, v8, [J

    aput-wide v6, v1, v5

    iget-object v0, v0, Lr60;->a:Lq60;

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_a0

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_a0

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, v5, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_ad

    :cond_a0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v5, v8, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, v5, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_ad
    new-instance v0, La82;

    invoke-direct {v0, v1, v8}, La82;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b8
    move-object/from16 v0, p1

    check-cast v0, Lr60;

    new-array v1, v8, [J

    aput-wide v6, v1, v5

    iget-object v0, v0, Lr60;->a:Lq60;

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_d6

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_d6

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_e3

    :cond_d6
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v8, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_e3
    new-instance v0, La82;

    invoke-direct {v0, v1, v8}, La82;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ee
    move-object/from16 v0, p1

    check-cast v0, Lr60;

    new-array v1, v8, [J

    aput-wide v6, v1, v5

    iget-object v0, v0, Lr60;->a:Lq60;

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_10c

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_10c

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, v8, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_119

    :cond_10c
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v8, v8, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, v8, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_119
    new-instance v0, La82;

    invoke-direct {v0, v1, v8}, La82;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_124
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM messages WHERE id = ?"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_12e
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    const-string v0, "id"

    invoke-static {v1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "received"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "created_by"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v5, "encrypted_metadata"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v6, "encrypted_content"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    const-string v7, "content_url"

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v7

    const-string v8, "iv_metadata"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    const-string v9, "iv"

    invoke-static {v1, v9}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v9

    const-string v10, "local_content"

    invoke-static {v1, v10}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v11

    if-eqz v11, :cond_1aa

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v13

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v15

    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v1, v5}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v1, v6}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v1, v7}, Lwsk;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_18a

    move-object/from16 v20, v4

    goto :goto_190

    :cond_18a
    invoke-virtual {v1, v7}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v20, v0

    :goto_190
    invoke-virtual {v1, v8}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v1, v9}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v22

    invoke-virtual {v1, v10}, Lwsk;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_1a2

    invoke-virtual {v1, v10}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v4

    :cond_1a2
    move-object/from16 v23, v4

    new-instance v12, Lfvd;

    invoke-direct/range {v12 .. v23}, Lfvd;-><init>(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1a9
    .catchall {:try_start_12e .. :try_end_1a9} :catchall_1ae

    move-object v4, v12

    :cond_1aa
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_1ae
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_1b3
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "DELETE FROM messages WHERE id = ?"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_1bd
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    invoke-virtual {v1}, Lwsk;->n()Z
    :try_end_1c3
    .catchall {:try_start_1bd .. :try_end_1c3} :catchall_1c7

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_1c7
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_1cc
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM event_odds where eventOscoreId = ?"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_1d6
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    const-string v0, "oddsId"

    invoke-static {v1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "oddsProvider"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "oddsType"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v5, "eventOscoreId"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v6, "name"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    const-string v7, "value"

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v7

    const-string v8, "delta"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    const-string v9, "jumpUrl"

    invoke-static {v1, v9}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v9

    const-string v10, "order"

    invoke-static {v1, v10}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v10

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    :goto_214
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v12

    if-eqz v12, :cond_277

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v2}, Lwsk;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_226

    move-object v15, v4

    goto :goto_22b

    :cond_226
    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v12

    move-object v15, v12

    :goto_22b
    invoke-virtual {v1, v3}, Lwsk;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_234

    move-object/from16 v16, v4

    goto :goto_23a

    :cond_234
    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v16, v12

    :goto_23a
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v17

    invoke-virtual {v1, v6}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v1, v7}, Lwsk;->getDouble(I)D

    move-result-wide v20

    invoke-virtual {v1, v8}, Lwsk;->getLong(I)J

    move-result-wide v12

    long-to-int v12, v12

    invoke-virtual {v1, v9}, Lwsk;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_258

    move-object/from16 v23, v4

    move-object/from16 v25, v23

    :goto_255
    move/from16 p0, v5

    goto :goto_261

    :cond_258
    invoke-virtual {v1, v9}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v25, v4

    move-object/from16 v23, v13

    goto :goto_255

    :goto_261
    invoke-virtual {v1, v10}, Lwsk;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    new-instance v13, Lvc8;

    move/from16 v24, v4

    move/from16 v22, v12

    invoke-direct/range {v13 .. v24}, Lvc8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;DILjava/lang/String;I)V

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_272
    .catchall {:try_start_1d6 .. :try_end_272} :catchall_27b

    move/from16 v5, p0

    move-object/from16 v4, v25

    goto :goto_214

    :cond_277
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v11

    :catchall_27b
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_280
    move-object/from16 v25, v4

    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM football_audio_commentary WHERE oscoreId = ? LIMIT 1"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_28c
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "url"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v3

    if-eqz v3, :cond_2ae

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lquc;

    invoke-direct {v2, v3, v4, v0}, Lquc;-><init>(JLjava/lang/String;)V
    :try_end_2ac
    .catchall {:try_start_28c .. :try_end_2ac} :catchall_2b4

    move-object v4, v2

    goto :goto_2b0

    :cond_2ae
    move-object/from16 v4, v25

    :goto_2b0
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_2b4
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_2b9
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "DELETE FROM football_events WHERE oscoreId = ?"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_2c3
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    invoke-virtual {v1}, Lwsk;->n()Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_2cb
    .catchall {:try_start_2c3 .. :try_end_2cb} :catchall_2cf

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v0

    :catchall_2cf
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_2d4
    move-object/from16 v25, v4

    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * from football_events  WHERE oscoreId = ? LIMIT 1"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_2e0
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "source"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "homeTeamName"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "homeTeamLogoUrl"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v5, "homeTeamScore"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v6, "homeTeamScorePenalties"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    const-string v7, "awayTeamName"

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v7

    const-string v8, "awayTeamLogoUrl"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    const-string v9, "awayTeamScore"

    invoke-static {v1, v9}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v9

    const-string v10, "awayTeamScorePenalties"

    invoke-static {v1, v10}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v10

    const-string v11, "eventStatus"

    invoke-static {v1, v11}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v11

    const-string v12, "statusDescription"

    invoke-static {v1, v12}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v12

    const-string v13, "finishType"

    invoke-static {v1, v13}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v13

    const-string v14, "startTimestamp"

    invoke-static {v1, v14}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v14

    const-string v15, "timeCurrent"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 p0, v15

    const-string v15, "timeFirstHalf"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 p1, v15

    const-string v15, "timeFirstHalfExtended"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 v16, v15

    const-string v15, "timeSecondHalf"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 v17, v15

    const-string v15, "timeSecondHalfExtended"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 v18, v15

    const-string v15, "timeFirstHalfExtra"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 v19, v15

    const-string v15, "timeFirstHalfExtraExtended"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 v20, v15

    const-string v15, "timeSecondHalfExtra"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    move/from16 v21, v15

    const-string v15, "timeSecondHalfExtraExtended"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v22

    if-eqz v22, :cond_4ee

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v27

    move v0, v14

    move/from16 v22, v15

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v14

    long-to-int v2, v14

    sget-object v14, Loi9;->b:Li06;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v14, Loi9;->h:Lh58;

    invoke-virtual {v14}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_398
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_3ae

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move/from16 v23, v0

    move-object v0, v15

    check-cast v0, Loi9;

    iget-short v0, v0, Loi9;->a:S

    if-eq v0, v2, :cond_3b2

    move/from16 v0, v23

    goto :goto_398

    :cond_3ae
    move/from16 v23, v0

    move-object/from16 v15, v25

    :cond_3b2
    move-object/from16 v29, v15

    check-cast v29, Loi9;

    if-eqz v29, :cond_4da

    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v30

    invoke-virtual {v1, v4}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v31

    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v2

    long-to-int v0, v2

    invoke-virtual {v1, v6}, Lwsk;->getLong(I)J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {v1, v7}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual {v1, v8}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual {v1, v9}, Lwsk;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {v1, v10}, Lwsk;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-virtual {v1, v11}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v38

    invoke-virtual {v1, v12}, Lwsk;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_3e9

    move-object/from16 v39, v25

    goto :goto_3ef

    :cond_3e9
    invoke-virtual {v1, v12}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v39, v5

    :goto_3ef
    invoke-virtual {v1, v13}, Lwsk;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_3fa

    move-object/from16 v40, v25

    :goto_3f7
    move/from16 v5, v23

    goto :goto_401

    :cond_3fa
    invoke-virtual {v1, v13}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v40, v5

    goto :goto_3f7

    :goto_401
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v41

    move/from16 v5, p0

    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_412

    move-object/from16 v43, v25

    :goto_40f
    move/from16 v5, p1

    goto :goto_41d

    :cond_412
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v43, v5

    goto :goto_40f

    :goto_41d
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_428

    move-object/from16 v44, v25

    :goto_425
    move/from16 v5, v16

    goto :goto_433

    :cond_428
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v44, v5

    goto :goto_425

    :goto_433
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_43e

    move-object/from16 v45, v25

    :goto_43b
    move/from16 v5, v17

    goto :goto_449

    :cond_43e
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v45, v5

    goto :goto_43b

    :goto_449
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_454

    move-object/from16 v46, v25

    :goto_451
    move/from16 v5, v18

    goto :goto_45f

    :cond_454
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v46, v5

    goto :goto_451

    :goto_45f
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_46a

    move-object/from16 v47, v25

    :goto_467
    move/from16 v5, v19

    goto :goto_475

    :cond_46a
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v47, v5

    goto :goto_467

    :goto_475
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_480

    move-object/from16 v48, v25

    :goto_47d
    move/from16 v5, v20

    goto :goto_48b

    :cond_480
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v48, v5

    goto :goto_47d

    :goto_48b
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_496

    move-object/from16 v49, v25

    :goto_493
    move/from16 v5, v21

    goto :goto_4a1

    :cond_496
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v49, v5

    goto :goto_493

    :goto_4a1
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4ac

    move-object/from16 v50, v25

    :goto_4a9
    move/from16 v5, v22

    goto :goto_4b7

    :cond_4ac
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v50, v5

    goto :goto_4a9

    :goto_4b7
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4c0

    move-object/from16 v51, v25

    goto :goto_4ca

    :cond_4c0
    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v51, v5

    :goto_4ca
    new-instance v26, Lruc;

    move/from16 v32, v0

    move/from16 v33, v2

    move/from16 v36, v3

    move/from16 v37, v4

    invoke-direct/range {v26 .. v51}, Lruc;-><init>(JLoi9;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V

    move-object/from16 v4, v26

    goto :goto_4f0

    :cond_4da
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unknown event source: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4ee
    .catchall {:try_start_2e0 .. :try_end_4ee} :catchall_4f4

    :cond_4ee
    move-object/from16 v4, v25

    :goto_4f0
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_4f4
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_4f9
    move-object/from16 v25, v4

    sget-object v0, Lapc;->b:Lix5;

    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM followed_matches where oscoreId = ? AND sport = ? LIMIT 1"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_507
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    const-wide/16 v4, 0x0

    invoke-virtual {v1, v2, v4, v5}, Lwsk;->T0(IJ)V

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "sport"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v3

    if-eqz v3, :cond_566

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v5

    long-to-int v0, v5

    sget-object v2, Lapc;->b:Lix5;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lapc;->f:Lh58;

    invoke-virtual {v2}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_533
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_545

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lapc;

    iget-boolean v6, v6, Lapc;->a:Z

    if-ne v6, v0, :cond_533

    goto :goto_547

    :cond_545
    move-object/from16 v5, v25

    :goto_547
    check-cast v5, Lapc;

    if-eqz v5, :cond_552

    new-instance v0, Lfh9;

    invoke-direct {v0, v3, v4, v5}, Lfh9;-><init>(JLapc;)V

    move-object v4, v0

    goto :goto_568

    :cond_552
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unknown sport id: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_566
    .catchall {:try_start_507 .. :try_end_566} :catchall_56c

    :cond_566
    move-object/from16 v4, v25

    :goto_568
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_56c
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_571
    move-object/from16 v25, v4

    move-object/from16 v0, p1

    check-cast v0, Llee;

    sget-object v1, Lr9a;->b:Lhsg;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    return-object v25

    :pswitch_581
    move-object/from16 v0, p1

    check-cast v0, Lwa1;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Lwa1;->x(ILjava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_58f
    move-object/from16 v25, v4

    const-string v0, "SELECT * FROM entry WHERE timeStamp < ?"

    move-object/from16 v1, p1

    check-cast v1, Losk;

    invoke-virtual {v1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_59b
    invoke-virtual {v1, v8, v6, v7}, Lwsk;->T0(IJ)V

    const-string v0, "pageUrl"

    invoke-static {v1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "imageUrl"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "timeStamp"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "flags"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    :goto_5bb
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v6

    if-eqz v6, :cond_5e5

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v2}, Lwsk;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_5ce

    move-object/from16 v10, v25

    goto :goto_5d3

    :cond_5ce
    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v6

    move-object v10, v6

    :goto_5d3
    invoke-virtual {v1, v3}, Lwsk;->getLong(I)J

    move-result-wide v11

    invoke-virtual {v1, v4}, Lwsk;->getLong(I)J

    move-result-wide v6

    long-to-int v9, v6

    new-instance v7, Lx4l;

    invoke-direct/range {v7 .. v12}, Lx4l;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5e4
    .catchall {:try_start_59b .. :try_end_5e4} :catchall_5e9

    goto :goto_5bb

    :cond_5e5
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v5

    :catchall_5e9
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_5ee
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lod7;

    iget-wide v0, v0, Lod7;->a:J

    cmp-long v0, v0, v6

    if-gtz v0, :cond_5ff

    move v5, v8

    :cond_5ff
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_604
    move-object/from16 v1, p1

    check-cast v1, Lq0j;

    sget-object v2, Lhzi;->a:Lp0j;

    new-instance v3, Lgzi;

    sget-object v4, Lx6a;->a:Lx6a;

    sget-object v7, Lfzi;->b:Lfzi;

    const/4 v8, 0x1

    iget-wide v5, v0, Lx41;->b:J

    invoke-direct/range {v3 .. v8}, Lgzi;-><init>(Lx6a;JLfzi;Z)V

    invoke-interface {v1, v2, v3}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_61c
    move-object/from16 v0, p1

    check-cast v0, Lat3;

    iget-object v1, v0, Lat3;->b:Lkotlin/jvm/functions/Function1;

    if-eqz v1, :cond_63f

    iget-object v2, v0, Lat3;->a:Lnh4;

    if-eqz v2, :cond_63f

    :try_start_628
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_632
    .catchall {:try_start_628 .. :try_end_632} :catchall_633

    goto :goto_63c

    :catchall_633
    move-exception v0

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    :goto_63c
    invoke-virtual {v2, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_63f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_642
    move-object/from16 v0, p1

    check-cast v0, Lg74;

    iget-object v1, v0, Lg74;->a:Le14;

    invoke-interface {v1}, Le14;->e()J

    move-result-wide v1

    const/16 v3, 0x20

    shr-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Lscd;->u(Lg74;F)Lj71;

    move-result-object v2

    new-instance v3, Lkh3;

    const/4 v4, 0x5

    invoke-direct {v3, v6, v7, v4}, Lkh3;-><init>(JI)V

    new-instance v4, Ly41;

    invoke-direct {v4, v1, v2, v3, v5}, Ly41;-><init>(FLjava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v4}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_66c
    .packed-switch 0x0
        :pswitch_642
        :pswitch_61c
        :pswitch_604
        :pswitch_5ee
        :pswitch_58f
        :pswitch_581
        :pswitch_571
        :pswitch_4f9
        :pswitch_2d4
        :pswitch_2b9
        :pswitch_280
        :pswitch_1cc
        :pswitch_1b3
        :pswitch_124
        :pswitch_ee
        :pswitch_b8
        :pswitch_82
        :pswitch_71
        :pswitch_38
        :pswitch_2a
    .end packed-switch
.end method
