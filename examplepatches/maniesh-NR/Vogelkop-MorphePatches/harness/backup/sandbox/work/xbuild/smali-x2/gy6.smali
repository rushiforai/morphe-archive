.class public final Lgy6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lcy6;


# instance fields
.field public final a:Lz4k;

.field public final b:Ljg8;

.field public final c:Lcrb;

.field public final d:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcy6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lgy6;->e:Lcy6;

    return-void
.end method

.method public constructor <init>(Lii;Lz4k;Luu1;Ljg8;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lgy6;->a:Lz4k;

    iput-object p4, p0, Lgy6;->b:Ljg8;

    new-instance p2, Ltb6;

    const/16 p4, 0x1a

    invoke-direct {p2, p4}, Ltb6;-><init>(B)V

    sget-object p4, Lrpb;->d:Lqpb;

    invoke-static {p4, p2}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object p2

    iput-object p2, p0, Lgy6;->c:Lcrb;

    new-instance p2, Lgb3;

    const/16 p4, 0x16

    invoke-direct {p2, p1, p3, p4}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lgy6;->d:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLnt5;)Ljava/lang/Object;
    .registers 30

    move-object/from16 v0, p0

    move-object/from16 v1, p10

    instance-of v2, v1, Ldy6;

    if-eqz v2, :cond_17

    move-object v2, v1

    check-cast v2, Ldy6;

    iget v3, v2, Ldy6;->K:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_17

    sub-int/2addr v3, v4

    iput v3, v2, Ldy6;->K:I

    goto :goto_1c

    :cond_17
    new-instance v2, Ldy6;

    invoke-direct {v2, v0, v1}, Ldy6;-><init>(Lgy6;Lnt5;)V

    :goto_1c
    iget-object v1, v2, Ldy6;->I:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget v4, v2, Ldy6;->K:I

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v4, :cond_9b

    if-eq v4, v7, :cond_5d

    if-eq v4, v6, :cond_4a

    if-ne v4, v5, :cond_44

    iget-object v0, v2, Ldy6;->C:Lcy6;

    check-cast v0, Lpzh;

    iget-object v0, v2, Ldy6;->B:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/io/Closeable;

    iget-object v0, v2, Ldy6;->A:Lcy6;

    check-cast v0, Lkvh;

    iget-object v0, v2, Ldy6;->z:Lcy6;

    check-cast v0, Lhra;

    :try_start_3f
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_1dd

    goto/16 :goto_1d6

    :cond_44
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_4a
    iget-boolean v4, v2, Ldy6;->H:Z

    iget-boolean v6, v2, Ldy6;->G:Z

    iget-boolean v7, v2, Ldy6;->F:Z

    iget-object v9, v2, Ldy6;->A:Lcy6;

    check-cast v9, Lkvh;

    iget-object v9, v2, Ldy6;->z:Lcy6;

    check-cast v9, Lhra;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_19e

    :cond_5d
    iget-boolean v4, v2, Ldy6;->H:Z

    iget-boolean v7, v2, Ldy6;->G:Z

    iget-boolean v9, v2, Ldy6;->F:Z

    iget-object v10, v2, Ldy6;->E:Lwu5;

    iget-object v11, v2, Ldy6;->D:Lcy6;

    iget-object v12, v2, Ldy6;->C:Lcy6;

    iget-object v13, v2, Ldy6;->B:Ljava/lang/Object;

    check-cast v13, Lcy6;

    iget-object v14, v2, Ldy6;->A:Lcy6;

    iget-object v15, v2, Ldy6;->z:Lcy6;

    iget-object v5, v2, Ldy6;->y:Ljava/lang/String;

    iget-object v6, v2, Ldy6;->x:Ljava/lang/String;

    iget-object v8, v2, Ldy6;->w:Ljava/lang/String;

    move-object/from16 v16, v1

    iget-object v1, v2, Ldy6;->v:Ljava/lang/String;

    move-object/from16 p1, v1

    iget-object v1, v2, Ldy6;->u:Ljava/lang/String;

    move-object/from16 p2, v1

    iget-object v1, v2, Ldy6;->t:Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v17, v8

    move-object v8, v6

    move-object/from16 v6, v17

    move-object/from16 v17, v14

    move-object/from16 v18, v15

    move v14, v4

    move-object v15, v13

    move-object/from16 v4, p2

    move-object v13, v12

    move v12, v9

    move-object v9, v5

    move-object/from16 v5, p1

    :goto_98
    move-object/from16 p1, v10

    goto :goto_e9

    :cond_9b
    move-object/from16 v16, v1

    invoke-static/range {v16 .. v16}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v1, p1

    iput-object v1, v2, Ldy6;->t:Ljava/lang/String;

    move-object/from16 v4, p2

    iput-object v4, v2, Ldy6;->u:Ljava/lang/String;

    move-object/from16 v5, p3

    iput-object v5, v2, Ldy6;->v:Ljava/lang/String;

    move-object/from16 v6, p4

    iput-object v6, v2, Ldy6;->w:Ljava/lang/String;

    move-object/from16 v8, p5

    iput-object v8, v2, Ldy6;->x:Ljava/lang/String;

    move-object/from16 v9, p6

    iput-object v9, v2, Ldy6;->y:Ljava/lang/String;

    sget-object v11, Lgy6;->e:Lcy6;

    iput-object v11, v2, Ldy6;->z:Lcy6;

    iput-object v11, v2, Ldy6;->A:Lcy6;

    iput-object v11, v2, Ldy6;->B:Ljava/lang/Object;

    iput-object v11, v2, Ldy6;->C:Lcy6;

    iput-object v11, v2, Ldy6;->D:Lcy6;

    sget-object v10, Lhra;->i:Lwu5;

    iput-object v10, v2, Ldy6;->E:Lwu5;

    move/from16 v12, p7

    iput-boolean v12, v2, Ldy6;->F:Z

    move/from16 v13, p8

    iput-boolean v13, v2, Ldy6;->G:Z

    move/from16 v14, p9

    iput-boolean v14, v2, Ldy6;->H:Z

    iput v7, v2, Ldy6;->K:I

    iget-object v7, v0, Lgy6;->a:Lz4k;

    invoke-virtual {v7, v2}, Lz4k;->e(Lnt5;)Ljava/lang/Object;

    move-result-object v7

    if-eq v7, v3, :cond_1d3

    move-object/from16 v16, v7

    move-object v15, v11

    move-object/from16 v17, v15

    move-object/from16 v18, v17

    move v7, v13

    move-object/from16 v13, v18

    goto :goto_98

    :goto_e9
    move-object/from16 v10, v16

    check-cast v10, Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 p1, v11

    new-instance v11, Lrma;

    move-object/from16 p2, v13

    const/4 v13, 0x4

    invoke-direct {v11, v13}, Lrma;-><init>(B)V

    const/4 v13, 0x0

    invoke-virtual {v11, v10, v13}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v11}, Lrma;->d()Lhra;

    move-result-object v10

    invoke-virtual {v10}, Lhra;->g()Lrma;

    move-result-object v10

    const-string v11, "/v2/widget/current-conditions"

    invoke-virtual {v10, v11}, Lrma;->j(Ljava/lang/String;)V

    const-string v11, "product_id"

    invoke-virtual {v10, v11, v1}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "leanplum_id"

    invoke-virtual {v10, v1, v4}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "huid"

    invoke-virtual {v10, v1, v5}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "temperature_unit"

    invoke-virtual {v10, v1, v6}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v8, :cond_129

    const-string v1, "id"

    invoke-virtual {v10, v1, v8}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_129
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v9, :cond_139

    const-string v1, "country"

    invoke-virtual {v10, v1, v9}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_139
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "caps[forecastNotification]"

    invoke-static {v7}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v1, v4}, Lrma;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "caps[alertNotification]"

    invoke-static {v14}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v1, v4}, Lrma;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v12, :cond_157

    const-string v1, "notification_debug"

    const-string v4, "true"

    invoke-virtual {v10, v1, v4}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_157
    invoke-virtual {v10}, Lrma;->d()Lhra;

    move-result-object v1

    new-instance v4, Lfvh;

    invoke-direct {v4}, Lfvh;-><init>()V

    iput-object v1, v4, Lfvh;->a:Lhra;

    new-instance v1, Lkvh;

    invoke-direct {v1, v4}, Lkvh;-><init>(Lfvh;)V

    iget-object v4, v0, Lgy6;->d:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lt9f;

    invoke-virtual {v4, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v1

    const/4 v13, 0x0

    iput-object v13, v2, Ldy6;->t:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->u:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->v:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->w:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->x:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->y:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->z:Lcy6;

    iput-object v13, v2, Ldy6;->A:Lcy6;

    iput-object v13, v2, Ldy6;->B:Ljava/lang/Object;

    iput-object v13, v2, Ldy6;->C:Lcy6;

    iput-object v13, v2, Ldy6;->D:Lcy6;

    iput-object v13, v2, Ldy6;->E:Lwu5;

    iput-boolean v12, v2, Ldy6;->F:Z

    iput-boolean v7, v2, Ldy6;->G:Z

    iput-boolean v14, v2, Ldy6;->H:Z

    const/4 v4, 0x2

    iput v4, v2, Ldy6;->K:I

    invoke-static {v1, v2}, Lf03;->o(Lv84;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v3, :cond_1d3

    move v6, v7

    move v7, v12

    move v4, v14

    :goto_19e
    check-cast v1, Ljava/io/Closeable;

    :try_start_1a0
    move-object v5, v1

    check-cast v5, Lpzh;

    iget-boolean v8, v5, Lpzh;->q:Z

    if-eqz v8, :cond_1e0

    iget-object v8, v0, Lgy6;->b:Ljg8;

    new-instance v9, Ley6;

    const/4 v10, 0x0

    const/4 v13, 0x0

    invoke-direct {v9, v0, v5, v13, v10}, Ley6;-><init>(Lgy6;Lpzh;Lmt5;B)V

    iput-object v13, v2, Ldy6;->t:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->u:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->v:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->w:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->x:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->y:Ljava/lang/String;

    iput-object v13, v2, Ldy6;->z:Lcy6;

    iput-object v13, v2, Ldy6;->A:Lcy6;

    iput-object v1, v2, Ldy6;->B:Ljava/lang/Object;

    iput-object v13, v2, Ldy6;->C:Lcy6;

    iput-boolean v7, v2, Ldy6;->F:Z

    iput-boolean v6, v2, Ldy6;->G:Z

    iput-boolean v4, v2, Ldy6;->H:Z

    const/4 v0, 0x3

    iput v0, v2, Ldy6;->K:I

    invoke-static {v8, v9, v2}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1d1
    .catchall {:try_start_1a0 .. :try_end_1d1} :catchall_1e5

    if-ne v0, v3, :cond_1d4

    :cond_1d3
    return-object v3

    :cond_1d4
    move-object v3, v1

    move-object v1, v0

    :goto_1d6
    :try_start_1d6
    check-cast v1, Ldoe;
    :try_end_1d8
    .catchall {:try_start_1d6 .. :try_end_1d8} :catchall_1dd

    const/4 v13, 0x0

    invoke-static {v3, v13}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v1

    :catchall_1dd
    move-exception v0

    :goto_1de
    move-object v1, v0

    goto :goto_1e8

    :cond_1e0
    :try_start_1e0
    invoke-static {v5}, Lphj;->x0(Lpzh;)Lmoa;

    move-result-object v0

    throw v0
    :try_end_1e5
    .catchall {:try_start_1e0 .. :try_end_1e5} :catchall_1e5

    :catchall_1e5
    move-exception v0

    move-object v3, v1

    goto :goto_1de

    :goto_1e8
    :try_start_1e8
    throw v1
    :try_end_1e9
    .catchall {:try_start_1e8 .. :try_end_1e9} :catchall_1e9

    :catchall_1e9
    move-exception v0

    invoke-static {v3, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Lnt5;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    instance-of v2, v1, Lfy6;

    if-eqz v2, :cond_17

    move-object v2, v1

    check-cast v2, Lfy6;

    iget v3, v2, Lfy6;->D:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_17

    sub-int/2addr v3, v4

    iput v3, v2, Lfy6;->D:I

    goto :goto_1c

    :cond_17
    new-instance v2, Lfy6;

    invoke-direct {v2, v0, v1}, Lfy6;-><init>(Lgy6;Lnt5;)V

    :goto_1c
    iget-object v1, v2, Lfy6;->B:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget v4, v2, Lfy6;->D:I

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v4, :cond_6d

    if-eq v4, v7, :cond_57

    if-eq v4, v6, :cond_4a

    if-ne v4, v5, :cond_44

    iget-object v0, v2, Lfy6;->z:Lcy6;

    check-cast v0, Lpzh;

    iget-object v0, v2, Lfy6;->y:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/io/Closeable;

    iget-object v0, v2, Lfy6;->x:Lcy6;

    check-cast v0, Lkvh;

    iget-object v0, v2, Lfy6;->w:Lcy6;

    check-cast v0, Lhra;

    :try_start_3f
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_152

    goto/16 :goto_14c

    :cond_44
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_4a
    iget-object v4, v2, Lfy6;->x:Lcy6;

    check-cast v4, Lkvh;

    iget-object v4, v2, Lfy6;->w:Lcy6;

    check-cast v4, Lhra;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_122

    :cond_57
    iget-object v4, v2, Lfy6;->A:Lwu5;

    iget-object v9, v2, Lfy6;->z:Lcy6;

    iget-object v10, v2, Lfy6;->y:Ljava/lang/Object;

    check-cast v10, Lcy6;

    iget-object v11, v2, Lfy6;->x:Lcy6;

    iget-object v12, v2, Lfy6;->w:Lcy6;

    iget-object v13, v2, Lfy6;->v:Ljava/lang/Double;

    iget-object v14, v2, Lfy6;->u:Ljava/lang/Double;

    iget-object v15, v2, Lfy6;->t:Ljava/lang/String;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9c

    :cond_6d
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v1, p1

    iput-object v1, v2, Lfy6;->t:Ljava/lang/String;

    move-object/from16 v4, p2

    iput-object v4, v2, Lfy6;->u:Ljava/lang/Double;

    move-object/from16 v9, p3

    iput-object v9, v2, Lfy6;->v:Ljava/lang/Double;

    sget-object v10, Lgy6;->e:Lcy6;

    iput-object v10, v2, Lfy6;->w:Lcy6;

    iput-object v10, v2, Lfy6;->x:Lcy6;

    iput-object v10, v2, Lfy6;->y:Ljava/lang/Object;

    iput-object v10, v2, Lfy6;->z:Lcy6;

    sget-object v11, Lhra;->i:Lwu5;

    iput-object v11, v2, Lfy6;->A:Lwu5;

    iput v7, v2, Lfy6;->D:I

    iget-object v12, v0, Lgy6;->a:Lz4k;

    invoke-virtual {v12, v2}, Lz4k;->e(Lnt5;)Ljava/lang/Object;

    move-result-object v12

    if-eq v12, v3, :cond_149

    move-object v15, v1

    move-object v14, v4

    move-object v13, v9

    move-object v9, v10

    move-object v4, v11

    move-object v1, v12

    move-object v11, v9

    move-object v12, v11

    :goto_9c
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lrma;

    const/4 v5, 0x4

    invoke-direct {v4, v5}, Lrma;-><init>(B)V

    invoke-virtual {v4, v1, v8}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v4}, Lrma;->d()Lhra;

    move-result-object v1

    invoke-virtual {v1}, Lhra;->g()Lrma;

    move-result-object v1

    const-string v4, "/v2/widget/location-lookup"

    invoke-virtual {v1, v4}, Lrma;->j(Ljava/lang/String;)V

    const-string v4, "product_id"

    invoke-virtual {v1, v4, v15}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v14, :cond_c7

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    goto :goto_c8

    :cond_c7
    move-object v4, v8

    :goto_c8
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v4, :cond_d2

    const-string v5, "latitude"

    invoke-virtual {v1, v5, v4}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d2
    if-eqz v13, :cond_dd

    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    goto :goto_de

    :cond_dd
    move-object v4, v8

    :goto_de
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v4, :cond_e8

    const-string v5, "longitude"

    invoke-virtual {v1, v5, v4}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_e8
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lrma;->d()Lhra;

    move-result-object v1

    new-instance v4, Lfvh;

    invoke-direct {v4}, Lfvh;-><init>()V

    iput-object v1, v4, Lfvh;->a:Lhra;

    new-instance v1, Lkvh;

    invoke-direct {v1, v4}, Lkvh;-><init>(Lfvh;)V

    iget-object v4, v0, Lgy6;->d:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lt9f;

    invoke-virtual {v4, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v1

    iput-object v8, v2, Lfy6;->t:Ljava/lang/String;

    iput-object v8, v2, Lfy6;->u:Ljava/lang/Double;

    iput-object v8, v2, Lfy6;->v:Ljava/lang/Double;

    iput-object v8, v2, Lfy6;->w:Lcy6;

    iput-object v8, v2, Lfy6;->x:Lcy6;

    iput-object v8, v2, Lfy6;->y:Ljava/lang/Object;

    iput-object v8, v2, Lfy6;->z:Lcy6;

    iput-object v8, v2, Lfy6;->A:Lwu5;

    iput v6, v2, Lfy6;->D:I

    invoke-static {v1, v2}, Lf03;->o(Lv84;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v3, :cond_149

    :goto_122
    check-cast v1, Ljava/io/Closeable;

    :try_start_124
    move-object v4, v1

    check-cast v4, Lpzh;

    iget-boolean v5, v4, Lpzh;->q:Z

    if-eqz v5, :cond_155

    iget-object v5, v0, Lgy6;->b:Ljg8;

    new-instance v6, Ley6;

    invoke-direct {v6, v0, v4, v8, v7}, Ley6;-><init>(Lgy6;Lpzh;Lmt5;B)V

    iput-object v8, v2, Lfy6;->t:Ljava/lang/String;

    iput-object v8, v2, Lfy6;->u:Ljava/lang/Double;

    iput-object v8, v2, Lfy6;->v:Ljava/lang/Double;

    iput-object v8, v2, Lfy6;->w:Lcy6;

    iput-object v8, v2, Lfy6;->x:Lcy6;

    iput-object v1, v2, Lfy6;->y:Ljava/lang/Object;

    iput-object v8, v2, Lfy6;->z:Lcy6;

    const/4 v0, 0x3

    iput v0, v2, Lfy6;->D:I

    invoke-static {v5, v6, v2}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0
    :try_end_147
    .catchall {:try_start_124 .. :try_end_147} :catchall_15a

    if-ne v0, v3, :cond_14a

    :cond_149
    return-object v3

    :cond_14a
    move-object v3, v1

    move-object v1, v0

    :goto_14c
    :try_start_14c
    check-cast v1, Lvne;
    :try_end_14e
    .catchall {:try_start_14c .. :try_end_14e} :catchall_152

    invoke-static {v3, v8}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v1

    :catchall_152
    move-exception v0

    :goto_153
    move-object v1, v0

    goto :goto_15d

    :cond_155
    :try_start_155
    invoke-static {v4}, Lphj;->x0(Lpzh;)Lmoa;

    move-result-object v0

    throw v0
    :try_end_15a
    .catchall {:try_start_155 .. :try_end_15a} :catchall_15a

    :catchall_15a
    move-exception v0

    move-object v3, v1

    goto :goto_153

    :goto_15d
    :try_start_15d
    throw v1
    :try_end_15e
    .catchall {:try_start_15d .. :try_end_15e} :catchall_15e

    :catchall_15e
    move-exception v0

    invoke-static {v3, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method
