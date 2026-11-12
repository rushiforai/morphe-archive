.class public final synthetic Lg8c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lg8c;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lvrc;)V
    .registers 2

    const/16 p1, 0x17

    iput-byte p1, p0, Lg8c;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 56

    move-object/from16 v0, p0

    iget-byte v0, v0, Lg8c;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x2

    const-string v3, "Unknown sport id: "

    const-string v4, "sport"

    const/4 v5, 0x1

    const-string v6, "oscoreId"

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_63e

    move-object/from16 v0, p1

    check-cast v0, Lnh6;

    const/16 v1, 0x3a

    invoke-static {v0, v1}, Lf03;->i(Lqh6;C)V

    invoke-static {v0}, Lnh6;->i(Lnh6;)V

    new-instance v1, Luvc;

    invoke-direct {v1, v7}, Luvc;-><init>(B)V

    invoke-static {v0, v1}, Lf03;->Q(Lqh6;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_28
    move-object/from16 v0, p1

    check-cast v0, Lnh6;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2f
    move-object/from16 v0, p1

    check-cast v0, Lmh6;

    const/16 v1, 0x54

    invoke-static {v0, v1}, Lf03;->i(Lqh6;C)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3b
    move-object/from16 v0, p1

    check-cast v0, Lmh6;

    const/16 v1, 0x74

    invoke-static {v0, v1}, Lf03;->i(Lqh6;C)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_47
    move-object/from16 v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "live_scores_accessed_onboarding"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_56
    move-object/from16 v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "ga_usage_statistics"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_65
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    const-string v1, "#"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v0, v1, v7, v2}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v0

    const-string v1, "opera-livescore://ui/"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v5, :cond_97

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->encodedFragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_97
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :pswitch_9c
    move-object/from16 v0, p1

    check-cast v0, Lzmc;

    invoke-interface {v0}, Lzmc;->a()Llmc;

    move-result-object v0

    iget-wide v0, v0, Llmc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_ab
    move-object/from16 v0, p1

    check-cast v0, Lzmc;

    invoke-interface {v0}, Lzmc;->a()Llmc;

    move-result-object v0

    iget-object v0, v0, Llmc;->e:Lrmc;

    iget-wide v0, v0, Lrmc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_bc
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM followed_tournaments"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_c6
    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :goto_d3
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v5

    if-eqz v5, :cond_11f

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v9

    long-to-int v7, v9

    sget-object v9, Lapc;->b:Lix5;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, Lapc;->f:Lh58;

    invoke-virtual {v9}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_ed
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_ff

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Lapc;

    iget-boolean v11, v11, Lapc;->a:Z

    if-ne v11, v7, :cond_ed

    goto :goto_100

    :cond_ff
    const/4 v10, 0x0

    :goto_100
    check-cast v10, Lapc;

    if-eqz v10, :cond_10d

    new-instance v7, Lhh9;

    invoke-direct {v7, v5, v6, v10}, Lhh9;-><init>(JLapc;)V

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d3

    :cond_10d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_11f
    .catchall {:try_start_c6 .. :try_end_11f} :catchall_123

    :cond_11f
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_123
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_128
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM followed_teams"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_132
    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :goto_13f
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v5

    if-eqz v5, :cond_18b

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v9

    long-to-int v7, v9

    sget-object v9, Lapc;->b:Lix5;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, Lapc;->f:Lh58;

    invoke-virtual {v9}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_159
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_16b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Lapc;

    iget-boolean v11, v11, Lapc;->a:Z

    if-ne v11, v7, :cond_159

    goto :goto_16c

    :cond_16b
    const/4 v10, 0x0

    :goto_16c
    check-cast v10, Lapc;

    if-eqz v10, :cond_179

    new-instance v7, Lgh9;

    invoke-direct {v7, v5, v6, v10}, Lgh9;-><init>(JLapc;)V

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13f

    :cond_179
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_18b
    .catchall {:try_start_132 .. :try_end_18b} :catchall_18f

    :cond_18b
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_18f
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_194
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM followed_matches"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_19e
    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :goto_1ab
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v5

    if-eqz v5, :cond_1f7

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v9

    long-to-int v7, v9

    sget-object v9, Lapc;->b:Lix5;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, Lapc;->f:Lh58;

    invoke-virtual {v9}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1c5
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1d7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Lapc;

    iget-boolean v11, v11, Lapc;->a:Z

    if-ne v11, v7, :cond_1c5

    goto :goto_1d8

    :cond_1d7
    const/4 v10, 0x0

    :goto_1d8
    check-cast v10, Lapc;

    if-eqz v10, :cond_1e5

    new-instance v7, Lfh9;

    invoke-direct {v7, v5, v6, v10}, Lfh9;-><init>(JLapc;)V

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1ab

    :cond_1e5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1f7
    .catchall {:try_start_19e .. :try_end_1f7} :catchall_1fb

    :cond_1f7
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v4

    :catchall_1fb
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_200
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "DELETE FROM odds_provider_config"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_20a
    invoke-virtual {v1}, Lwsk;->n()Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_20f
    .catchall {:try_start_20a .. :try_end_20f} :catchall_213

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v0

    :catchall_213
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_218
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM odds_provider_config LIMIT 1"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_222
    const-string v0, "id"

    invoke-static {v1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "name"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "normalIcon"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "lightIcon"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v5, "smallIcon"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v6, "logoClickUrl"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v7

    if-eqz v7, :cond_298

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v2}, Lwsk;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_258

    const/4 v11, 0x0

    goto :goto_25d

    :cond_258
    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    :goto_25d
    invoke-virtual {v1, v3}, Lwsk;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_265

    const/4 v12, 0x0

    goto :goto_26a

    :cond_265
    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    move-object v12, v0

    :goto_26a
    invoke-virtual {v1, v4}, Lwsk;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_272

    const/4 v13, 0x0

    goto :goto_277

    :cond_272
    invoke-virtual {v1, v4}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    move-object v13, v0

    :goto_277
    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_27f

    const/4 v14, 0x0

    goto :goto_284

    :cond_27f
    invoke-virtual {v1, v5}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    move-object v14, v0

    :goto_284
    invoke-virtual {v1, v6}, Lwsk;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_28c

    const/4 v15, 0x0

    goto :goto_291

    :cond_28c
    invoke-virtual {v1, v6}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    move-object v15, v8

    :goto_291
    new-instance v9, Lo7f;

    invoke-direct/range {v9 .. v15}, Lo7f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_296
    .catchall {:try_start_222 .. :try_end_296} :catchall_29d

    move-object v8, v9

    goto :goto_299

    :cond_298
    const/4 v8, 0x0

    :goto_299
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v8

    :catchall_29d
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_2a2
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "DELETE FROM football_audio_commentary"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_2ac
    invoke-virtual {v1}, Lwsk;->n()Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_2b1
    .catchall {:try_start_2ac .. :try_end_2b1} :catchall_2b5

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v0

    :catchall_2b5
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_2ba
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "DELETE FROM event_odds"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_2c4
    invoke-virtual {v1}, Lwsk;->n()Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_2c9
    .catchall {:try_start_2c4 .. :try_end_2c9} :catchall_2cd

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v0

    :catchall_2cd
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_2d2
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * FROM notifications"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_2dc
    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v4, "ttlEndTimestamp"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v6, "subscribed"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    :goto_2f5
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v10

    if-eqz v10, :cond_351

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v12

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v10

    long-to-int v10, v10

    sget-object v11, Lapc;->b:Lix5;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, Lapc;->f:Lh58;

    invoke-virtual {v11}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_30f
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_321

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    move-object v15, v14

    check-cast v15, Lapc;

    iget-boolean v15, v15, Lapc;->a:Z

    if-ne v15, v10, :cond_30f

    goto :goto_322

    :cond_321
    const/4 v14, 0x0

    :goto_322
    check-cast v14, Lapc;

    if-eqz v14, :cond_33f

    invoke-virtual {v1, v4}, Lwsk;->getLong(I)J

    move-result-wide v15

    invoke-virtual {v1, v6}, Lwsk;->getLong(I)J

    move-result-wide v10

    long-to-int v10, v10

    if-eqz v10, :cond_334

    move/from16 v17, v5

    goto :goto_336

    :cond_334
    move/from16 v17, v7

    :goto_336
    new-instance v11, Lr0f;

    invoke-direct/range {v11 .. v17}, Lr0f;-><init>(JLapc;JZ)V

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f5

    :cond_33f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_351
    .catchall {:try_start_2dc .. :try_end_351} :catchall_355

    :cond_351
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v9

    :catchall_355
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_35a
    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * from football_events ORDER BY `startTimestamp` ASC"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_364
    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

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

    const-string v9, "awayTeamLogoUrl"

    invoke-static {v1, v9}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v9

    const-string v10, "awayTeamScore"

    invoke-static {v1, v10}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v10

    const-string v11, "awayTeamScorePenalties"

    invoke-static {v1, v11}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v11

    const-string v12, "eventStatus"

    invoke-static {v1, v12}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v12

    const-string v13, "statusDescription"

    invoke-static {v1, v13}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v13

    const-string v14, "finishType"

    invoke-static {v1, v14}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v14

    const-string v15, "startTimestamp"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    const-string v8, "timeCurrent"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 p1, v8

    const-string v8, "timeFirstHalf"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v16, v8

    const-string v8, "timeFirstHalfExtended"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v17, v8

    const-string v8, "timeSecondHalf"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v18, v8

    const-string v8, "timeSecondHalfExtended"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v19, v8

    const-string v8, "timeFirstHalfExtra"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v20, v8

    const-string v8, "timeFirstHalfExtraExtended"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v21, v8

    const-string v8, "timeSecondHalfExtra"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v22, v8

    const-string v8, "timeSecondHalfExtraExtended"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    move/from16 v23, v8

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    :goto_403
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v24

    if-eqz v24, :cond_59e

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v26

    move/from16 v24, v14

    move/from16 v51, v15

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v14

    long-to-int v14, v14

    sget-object v15, Loi9;->b:Li06;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, Loi9;->h:Lh58;

    invoke-virtual {v15}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_421
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_438

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    move/from16 v52, v0

    move-object/from16 v0, v25

    check-cast v0, Loi9;

    iget-short v0, v0, Loi9;->a:S

    if-eq v0, v14, :cond_43c

    move/from16 v0, v52

    goto :goto_421

    :cond_438
    move/from16 v52, v0

    const/16 v25, 0x0

    :cond_43c
    move-object/from16 v28, v25

    check-cast v28, Loi9;

    if-eqz v28, :cond_58a

    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v29

    invoke-virtual {v1, v4}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v30

    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v14

    long-to-int v0, v14

    invoke-virtual {v1, v6}, Lwsk;->getLong(I)J

    move-result-wide v14

    long-to-int v14, v14

    invoke-virtual {v1, v7}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v33

    invoke-virtual {v1, v9}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v34

    move v15, v2

    move/from16 v53, v3

    invoke-virtual {v1, v10}, Lwsk;->getLong(I)J

    move-result-wide v2

    long-to-int v2, v2

    move/from16 v35, v2

    invoke-virtual {v1, v11}, Lwsk;->getLong(I)J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {v1, v12}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v37

    invoke-virtual {v1, v13}, Lwsk;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_47a

    const/16 v38, 0x0

    :goto_477
    move/from16 v3, v24

    goto :goto_481

    :cond_47a
    invoke-virtual {v1, v13}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v38, v3

    goto :goto_477

    :goto_481
    invoke-virtual {v1, v3}, Lwsk;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_48e

    const/16 v39, 0x0

    :goto_489
    move/from16 v31, v0

    move/from16 v0, v51

    goto :goto_495

    :cond_48e
    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v39, v24

    goto :goto_489

    :goto_495
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v40

    move/from16 v51, v0

    move/from16 v0, p1

    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_4aa

    const/16 v42, 0x0

    :goto_4a5
    move/from16 p1, v0

    move/from16 v0, v16

    goto :goto_4b5

    :cond_4aa
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    move-object/from16 v42, v24

    goto :goto_4a5

    :goto_4b5
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v16

    if-eqz v16, :cond_4c2

    const/16 v43, 0x0

    :goto_4bd
    move/from16 v16, v0

    move/from16 v0, v17

    goto :goto_4cd

    :cond_4c2
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v43, v16

    goto :goto_4bd

    :goto_4cd
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v17

    if-eqz v17, :cond_4da

    const/16 v44, 0x0

    :goto_4d5
    move/from16 v17, v0

    move/from16 v0, v18

    goto :goto_4e5

    :cond_4da
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v44, v17

    goto :goto_4d5

    :goto_4e5
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_4f2

    const/16 v45, 0x0

    :goto_4ed
    move/from16 v18, v0

    move/from16 v0, v19

    goto :goto_4fd

    :cond_4f2
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v45, v18

    goto :goto_4ed

    :goto_4fd
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v19

    if-eqz v19, :cond_50a

    const/16 v46, 0x0

    :goto_505
    move/from16 v19, v0

    move/from16 v0, v20

    goto :goto_515

    :cond_50a
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v46, v19

    goto :goto_505

    :goto_515
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_522

    const/16 v47, 0x0

    :goto_51d
    move/from16 v20, v0

    move/from16 v0, v21

    goto :goto_52d

    :cond_522
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v47, v20

    goto :goto_51d

    :goto_52d
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_53a

    const/16 v48, 0x0

    :goto_535
    move/from16 v21, v0

    move/from16 v0, v22

    goto :goto_545

    :cond_53a
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v48, v21

    goto :goto_535

    :goto_545
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_552

    const/16 v49, 0x0

    :goto_54d
    move/from16 v22, v0

    move/from16 v0, v23

    goto :goto_55d

    :cond_552
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    move-object/from16 v49, v22

    goto :goto_54d

    :goto_55d
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v23

    if-eqz v23, :cond_566

    const/16 v50, 0x0

    goto :goto_570

    :cond_566
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v50, v23

    :goto_570
    new-instance v25, Lruc;

    move/from16 v36, v2

    move/from16 v32, v14

    invoke-direct/range {v25 .. v50}, Lruc;-><init>(JLoi9;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V

    move-object/from16 v2, v25

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v23, v0

    move v14, v3

    move v2, v15

    move/from16 v15, v51

    move/from16 v0, v52

    move/from16 v3, v53

    goto/16 :goto_403

    :cond_58a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown event source: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_59e
    .catchall {:try_start_364 .. :try_end_59e} :catchall_5a2

    :cond_59e
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v8

    :catchall_5a2
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_5a7
    move-object/from16 v0, p1

    check-cast v0, Ltw7;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5ae
    move-object/from16 v0, p1

    check-cast v0, Lq0j;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5b5
    move-object/from16 v0, p1

    check-cast v0, Lndc;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5bc
    move-object/from16 v0, p1

    check-cast v0, Lndc;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5c3
    move-object/from16 v0, p1

    check-cast v0, Lndc;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5ca
    move-object/from16 v0, p1

    check-cast v0, Lndc;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5d1
    move-object/from16 v0, p1

    check-cast v0, Lh0b;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5d8
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5df
    move-object/from16 v0, p1

    check-cast v0, Lmil;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5e6
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    const-string v1, "leaderboard"

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "leaderboard_requirements"

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "leaderboard_tiers"

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5fc
    sget-object v0, Lo8c;->a:Lo8c;

    move-object/from16 v3, p1

    check-cast v3, Lt41;

    invoke-virtual {v3, v7}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v5}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v5

    move-object v6, v4

    invoke-virtual {v3, v2}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v4

    move-object v2, v5

    invoke-virtual {v3, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v5

    const/4 v1, 0x4

    invoke-virtual {v3, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v1

    move-object v3, v2

    move-object v2, v6

    move-object v6, v1

    move-object v1, v0

    invoke-virtual/range {v1 .. v6}, Lo8c;->m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_622
    sget-object v0, Lm8c;->a:Lm8c;

    move-object/from16 v3, p1

    check-cast v3, Lt41;

    invoke-virtual {v3, v7}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v5}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v2}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v1}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v4, v5, v2, v1}, Lm8c;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_63e
    .packed-switch 0x0
        :pswitch_622
        :pswitch_5fc
        :pswitch_5e6
        :pswitch_5df
        :pswitch_5d8
        :pswitch_5d1
        :pswitch_5ca
        :pswitch_5c3
        :pswitch_5bc
        :pswitch_5b5
        :pswitch_5ae
        :pswitch_5a7
        :pswitch_35a
        :pswitch_2d2
        :pswitch_2ba
        :pswitch_2a2
        :pswitch_218
        :pswitch_200
        :pswitch_194
        :pswitch_128
        :pswitch_bc
        :pswitch_ab
        :pswitch_9c
        :pswitch_65
        :pswitch_56
        :pswitch_47
        :pswitch_3b
        :pswitch_2f
        :pswitch_28
    .end packed-switch
.end method
