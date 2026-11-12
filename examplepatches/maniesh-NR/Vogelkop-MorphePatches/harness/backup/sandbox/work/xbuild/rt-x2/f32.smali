.class public final synthetic Lf32;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lf32;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lf32;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 32

    move-object/from16 v0, p0

    iget-byte v0, v0, Lf32;->a:B

    const-string v1, "result"

    const-string v2, "error"

    const-string v3, "code"

    const-string v4, "message"

    const-string v5, "ga_usage_statistics"

    const-string v6, "banners"

    const-string v7, "checksum"

    const-string v8, "name"

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x3

    const/4 v12, 0x1

    const/4 v13, 0x0

    packed-switch v0, :pswitch_data_3b6

    move-object/from16 v0, p1

    check-cast v0, Lz42;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23
    move-object/from16 v0, p1

    check-cast v0, Ln6j;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2a
    move-object/from16 v0, p1

    check-cast v0, Lo3c;

    invoke-virtual {v0}, Lo3c;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_34
    move-object/from16 v0, p1

    check-cast v0, Lk45;

    sget-object v1, Ln9a;->b:Ln9a;

    new-instance v2, Luk3;

    invoke-direct {v2, v11, v9, v13}, Luk3;-><init>(ILmt5;B)V

    invoke-virtual {v0, v1, v2}, Lk45;->a(Lf45;Lkuk;)V

    sget-object v1, Lqs7;->b:Lqs7;

    new-instance v2, Lxf;

    invoke-direct {v2, v10, v9, v11}, Lxf;-><init>(ILmt5;B)V

    invoke-virtual {v0, v1, v2}, Lk45;->a(Lf45;Lkuk;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4f
    move-object/from16 v0, p1

    check-cast v0, Ljava/io/IOException;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v0, Lt0i;

    invoke-direct {v0, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object v0

    :pswitch_5e
    move-object/from16 v0, p1

    check-cast v0, Lui3;

    if-eqz v0, :cond_66

    iget-object v9, v0, Lui3;->a:Landroid/net/Uri;

    :cond_66
    return-object v9

    :pswitch_67
    move-object/from16 v0, p1

    check-cast v0, Lt0i;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6e
    move-object/from16 v0, p1

    check-cast v0, Ldj3;

    new-instance v1, Lyj3;

    iget-boolean v2, v0, Ldj3;->g:Z

    iget-object v3, v0, Ldj3;->a:Ljava/lang/String;

    new-instance v4, Lwj3;

    iget-object v5, v0, Ldj3;->b:Lsj3;

    iget-object v0, v0, Ldj3;->c:Ljava/lang/String;

    invoke-direct {v4, v5, v0}, Lwj3;-><init>(Lsj3;Ljava/lang/String;)V

    new-instance v0, Lxj3;

    invoke-direct {v0, v4, v3}, Lxj3;-><init>(Lwj3;Ljava/lang/String;)V

    invoke-direct {v1, v2, v0}, Lyj3;-><init>(ZLxj3;)V

    return-object v1

    :pswitch_8a
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Lf32;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lf32;-><init>(B)V

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Lf32;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_a0

    :cond_b2
    return-object v2

    :pswitch_b3
    const-string v0, "SELECT * FROM active_block_lists"

    move-object/from16 v1, p1

    check-cast v1, Losk;

    invoke-virtual {v1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_bd
    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "kind"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "addedTimestampMillis"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v5, "ttlMillis"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v6, "version"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    const-string v7, "active"

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v7

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    :goto_e8
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v9

    if-eqz v9, :cond_122

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lmi3;->b(Ljava/lang/String;)Lsj3;

    move-result-object v16

    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v1, v4}, Lwsk;->getLong(I)J

    move-result-wide v18

    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v20

    invoke-virtual {v1, v6}, Lwsk;->getLong(I)J

    move-result-wide v9

    long-to-int v9, v9

    invoke-virtual {v1, v7}, Lwsk;->getLong(I)J

    move-result-wide v10

    long-to-int v10, v10

    if-eqz v10, :cond_115

    move/from16 v23, v12

    goto :goto_117

    :cond_115
    move/from16 v23, v13

    :goto_117
    new-instance v14, Ldj3;

    move/from16 v22, v9

    invoke-direct/range {v14 .. v23}, Ldj3;-><init>(Ljava/lang/String;Lsj3;Ljava/lang/String;JJIZ)V

    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_121
    .catchall {:try_start_bd .. :try_end_121} :catchall_126

    goto :goto_e8

    :cond_122
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v8

    :catchall_126
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_12b
    const-string v0, "SELECT name, checksum FROM active_block_lists GROUP BY checksum"

    move-object/from16 v1, p1

    check-cast v1, Losk;

    invoke-virtual {v1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_135
    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    :cond_142
    :goto_142
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v4

    if-eqz v4, :cond_172

    invoke-virtual {v1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2}, Lwsk;->isNull(I)Z

    move-result v5

    if-nez v5, :cond_16a

    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lc8a;

    invoke-direct {v6, v4}, Lc8a;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_142

    new-instance v6, Lc8a;

    invoke-direct {v6, v4}, Lc8a;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_142

    :cond_16a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "The column(s) of the map value object of type \'[@MapColumn(\"name\")] String\' are NULL but the map\'s value type argument expect it to be NON-NULL"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_172
    .catchall {:try_start_135 .. :try_end_172} :catchall_176

    :cond_172
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v3

    :catchall_176
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_17b
    move-object/from16 v0, p1

    check-cast v0, Litb;

    invoke-static {v0}, Ljtb;->a(Litb;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_184
    move-object/from16 v0, p1

    check-cast v0, Lnjl;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_18b
    move-object/from16 v0, p1

    check-cast v0, Li8e;

    new-instance v4, Lq92;

    invoke-direct {v4, v10}, Lq92;-><init>(B)V

    sget-object v7, Lc37;->d:Lrhk;

    sget-object v5, Lxwb;->a:Lxwb;

    sget-object v6, Ll08;->a:Ll08;

    new-instance v1, Lqc3;

    const-class v8, Lnx5;

    invoke-static {v8}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct/range {v1 .. v6}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    invoke-static {v1, v0}, Lj7c;->m(Lqc3;Li8e;)Ltlj;

    move-result-object v2

    invoke-static {v8}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {v1, v3}, Lqc3;->a(Litb;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljtb;->a(Litb;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x3a

    const-string v4, ""

    invoke-static {v1, v3, v4, v3, v7}, Lj7c;->p(Ljava/lang/StringBuilder;CLjava/lang/String;CLrhk;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Li8e;->b(Ljava/lang/String;Lvab;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c8
    move-object/from16 v0, p1

    check-cast v0, Laqb;

    iput-boolean v13, v0, Laqb;->b:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1d1
    sget-object v0, Le33;->a:Le33;

    move-object/from16 v0, p1

    check-cast v0, Lt41;

    invoke-virtual {v0, v13}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v12}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual {v0, v10}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v0, v11}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v18

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v19

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v20

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v21

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v22

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v23

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v24

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v25

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v26

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v27

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v28

    new-instance v14, Lb33;

    invoke-direct/range {v14 .. v29}, Lb33;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-object v14

    :pswitch_229
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_233
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23d
    move-object/from16 v0, p1

    check-cast v0, Ld13;

    invoke-virtual {v0}, Ld13;->V0()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_247
    move-object/from16 v0, p1

    check-cast v0, Ld13;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lc26;->y(Llk7;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_254
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Class;

    const-class v1, Lryl;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_266

    const-class v1, Landroidx/fragment/app/i;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v13

    :cond_266
    new-instance v0, Lcjm;

    const v1, 0x7f0a062b

    invoke-direct {v0, v1, v13}, Lcjm;-><init>(IZ)V

    return-object v0

    :pswitch_26f
    move-object/from16 v0, p1

    check-cast v0, Lnd2;

    return-object v0

    :pswitch_274
    move-object/from16 v1, p1

    check-cast v1, Ln6j;

    sget-object v0, Llc2;->a:[Llc2;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x1

    const v3, 0x7f140110

    const v4, 0x7f0a09be

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const v0, 0x7f1401dd

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const/16 v7, 0x18

    const/4 v2, 0x4

    const v3, 0x7f140f43

    const v4, 0x7f0a09a8

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x6

    const v3, 0x7f140926

    const v4, 0x7f0a09d1

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x7

    const v3, 0x7f1400f0

    const v4, 0x7f0a09a1

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0x9

    const v3, 0x7f140fdc

    const v4, 0x7f0a09c1

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const v0, 0x7f140028

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const/16 v7, 0x18

    const/16 v2, 0xb

    const v3, 0x7f1401d5

    const v4, 0x7f0a010f

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2dc
    move-object/from16 v0, p1

    check-cast v0, Laqb;

    iput-boolean v12, v0, Laqb;->c:Z

    iput-boolean v13, v0, Laqb;->n:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2e7
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_2f4
    move-object/from16 v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_301
    move-object/from16 v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_30e
    move-object/from16 v0, p1

    check-cast v0, Lorb;

    iget-object v5, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_327

    invoke-virtual {v0, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v1, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_35b

    :cond_327
    invoke-virtual {v0, v1}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v0

    if-eqz v0, :cond_35b

    invoke-virtual {v0, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v1, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lokk;->values()[Lokk;

    move-result-object v3

    array-length v4, v3

    :goto_340
    if-ge v13, v4, :cond_359

    aget-object v5, v3, v13

    sget-object v6, Lokk;->c:Lokk;

    if-eq v5, v6, :cond_356

    iget-wide v6, v5, Lokk;->a:J

    cmp-long v6, v1, v6

    if-nez v6, :cond_356

    iget-object v5, v5, Lokk;->b:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_35b

    :cond_356
    add-int/lit8 v13, v13, 0x1

    goto :goto_340

    :cond_359
    sget-object v0, Lokk;->c:Lokk;

    :cond_35b
    :goto_35b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_35e
    move-object/from16 v0, p1

    check-cast v0, Lorb;

    iget-object v5, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_377

    invoke-virtual {v0, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v1, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3ab

    :cond_377
    invoke-virtual {v0, v1}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v0

    if-eqz v0, :cond_3ab

    invoke-virtual {v0, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v1, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lz17;->values()[Lz17;

    move-result-object v3

    array-length v4, v3

    :goto_390
    if-ge v13, v4, :cond_3a9

    aget-object v5, v3, v13

    sget-object v6, Lz17;->c:Lz17;

    if-eq v5, v6, :cond_3a6

    iget-wide v6, v5, Lz17;->a:J

    cmp-long v6, v1, v6

    if-nez v6, :cond_3a6

    iget-object v5, v5, Lz17;->b:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3ab

    :cond_3a6
    add-int/lit8 v13, v13, 0x1

    goto :goto_390

    :cond_3a9
    sget-object v0, Lz17;->c:Lz17;

    :cond_3ab
    :goto_3ab
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3ae
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/Map;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_3b6
    .packed-switch 0x0
        :pswitch_3ae
        :pswitch_35e
        :pswitch_30e
        :pswitch_301
        :pswitch_2f4
        :pswitch_2e7
        :pswitch_2dc
        :pswitch_274
        :pswitch_26f
        :pswitch_254
        :pswitch_247
        :pswitch_23d
        :pswitch_233
        :pswitch_229
        :pswitch_1d1
        :pswitch_1c8
        :pswitch_18b
        :pswitch_184
        :pswitch_17b
        :pswitch_12b
        :pswitch_b3
        :pswitch_8a
        :pswitch_6e
        :pswitch_67
        :pswitch_5e
        :pswitch_4f
        :pswitch_34
        :pswitch_2a
        :pswitch_23
    .end packed-switch
.end method
