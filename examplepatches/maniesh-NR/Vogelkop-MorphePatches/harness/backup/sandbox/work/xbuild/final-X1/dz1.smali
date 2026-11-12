.class public final Ldz1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:J

.field public static final synthetic i:I


# instance fields
.field public final a:Lj4c;

.field public final b:Ldx5;

.field public final c:Lzyk;

.field public final d:La64;

.field public final e:La64;

.field public final f:Lnak;

.field public final g:Lrlh;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x14

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Ldz1;->h:J

    return-void
.end method

.method public constructor <init>(Lj4c;Lii;Ldx5;Ljg8;)V
    .registers 6

    sget-object v0, Law3;->a:Law3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldz1;->a:Lj4c;

    iput-object p3, p0, Ldz1;->b:Ldx5;

    new-instance p1, Lry1;

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Lry1;-><init>(Lii;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ldz1;->c:Lzyk;

    invoke-static {p3}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p1

    iput-object p1, p0, Ldz1;->d:La64;

    invoke-static {p4}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p1

    iput-object p1, p0, Ldz1;->e:La64;

    sget-object p1, Ln08;->a:Ln08;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Ldz1;->f:Lnak;

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Ldz1;->g:Lrlh;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/io/File;JLesd;Lbfj;Lnt5;)Ljava/lang/Object;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    sget-object v6, Lsy1;->a:Lsy1;

    instance-of v7, v5, Lxy1;

    if-eqz v7, :cond_21

    move-object v7, v5

    check-cast v7, Lxy1;

    iget v8, v7, Lxy1;->B:I

    const/high16 v9, -0x80000000

    and-int v10, v8, v9

    if-eqz v10, :cond_21

    sub-int/2addr v8, v9

    iput v8, v7, Lxy1;->B:I

    goto :goto_26

    :cond_21
    new-instance v7, Lxy1;

    invoke-direct {v7, v0, v5}, Lxy1;-><init>(Ldz1;Lnt5;)V

    :goto_26
    iget-object v5, v7, Lxy1;->z:Ljava/lang/Object;

    sget-object v8, Lpx5;->a:Lpx5;

    iget v9, v7, Lxy1;->B:I

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    packed-switch v9, :pswitch_data_1d6

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :pswitch_38
    invoke-static {v5}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1d3

    :pswitch_3d
    invoke-static {v5}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v5, Lt0i;

    iget-object v0, v5, Lt0i;->a:Ljava/lang/Object;

    goto/16 :goto_1d3

    :pswitch_46
    iget-wide v1, v7, Lxy1;->y:J

    iget-object v3, v7, Lxy1;->v:Lesd;

    invoke-static {v5}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1b7

    :pswitch_4f
    iget-wide v1, v7, Lxy1;->y:J

    iget-object v3, v7, Lxy1;->v:Lesd;

    iget-object v4, v7, Lxy1;->t:Ljava/lang/String;

    :try_start_55
    invoke-static {v5}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_5e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_55 .. :try_end_58} :catch_5a

    goto/16 :goto_1d3

    :catch_5a
    move-wide v13, v1

    move-object v1, v4

    goto/16 :goto_189

    :catch_5e
    move-wide v13, v1

    move-object v1, v4

    goto/16 :goto_1a1

    :pswitch_62
    iget-wide v1, v7, Lxy1;->y:J

    iget-object v3, v7, Lxy1;->w:Lbfj;

    iget-object v4, v7, Lxy1;->v:Lesd;

    iget-object v9, v7, Lxy1;->u:Ljava/io/File;

    iget-object v10, v7, Lxy1;->t:Ljava/lang/String;

    :try_start_6c
    invoke-static {v5}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_6f} :catch_73
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6c .. :try_end_6f} :catch_16b

    move-object v13, v9

    move-object v9, v4

    goto/16 :goto_13c

    :catch_73
    move-wide v13, v1

    move-object v3, v4

    :goto_75
    move-object v1, v10

    goto/16 :goto_1a1

    :pswitch_78
    iget-wide v1, v7, Lxy1;->y:J

    iget-object v3, v7, Lxy1;->x:Lokhttp3/internal/connection/RealCall;

    iget-object v4, v7, Lxy1;->w:Lbfj;

    iget-object v9, v7, Lxy1;->v:Lesd;

    iget-object v13, v7, Lxy1;->u:Ljava/io/File;

    iget-object v14, v7, Lxy1;->t:Ljava/lang/String;

    :try_start_84
    invoke-static {v5}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_87} :catch_180
    .catch Ljava/lang/IllegalArgumentException; {:try_start_84 .. :try_end_87} :catch_17a

    goto/16 :goto_107

    :pswitch_89
    invoke-static {v5}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_8c
    new-instance v5, Lfvh;

    invoke-direct {v5}, Lfvh;-><init>()V

    iget-object v9, v4, Lbfj;->b:Ljava/lang/String;

    invoke-virtual {v5, v9}, Lfvh;->h(Ljava/lang/String;)V

    sget-object v9, Lrvh;->Companion:Lqvh;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lmvh;

    invoke-direct {v9, v3, v2, v10}, Lmvh;-><init>(Lesd;Ljava/lang/Object;B)V

    const-string v13, "PUT"

    invoke-virtual {v5, v13, v9}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    iget-object v9, v4, Lbfj;->c:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_af
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_cb

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map$Entry;

    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v5, v14, v13}, Lfvh;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_af

    :cond_cb
    iget-object v9, v0, Ldz1;->c:Lzyk;

    invoke-virtual {v9}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lt9f;

    new-instance v13, Lkvh;

    invoke-direct {v13, v5}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v9, v13}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v5

    new-instance v9, Luy1;

    iget-object v13, v4, Lbfj;->a:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    iget-object v15, v3, Lesd;->a:Ljava/lang/String;

    invoke-direct {v9, v13, v14, v15}, Luy1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, v7, Lxy1;->t:Ljava/lang/String;

    iput-object v2, v7, Lxy1;->u:Ljava/io/File;

    iput-object v3, v7, Lxy1;->v:Lesd;

    iput-object v4, v7, Lxy1;->w:Lbfj;

    iput-object v5, v7, Lxy1;->x:Lokhttp3/internal/connection/RealCall;
    :try_end_f3
    .catch Ljava/io/IOException; {:try_start_8c .. :try_end_f3} :catch_19f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8c .. :try_end_f3} :catch_187

    move-wide/from16 v13, p3

    :try_start_f5
    iput-wide v13, v7, Lxy1;->y:J

    iput v11, v7, Lxy1;->B:I

    invoke-virtual {v0, v1, v9}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v9
    :try_end_fd
    .catch Ljava/io/IOException; {:try_start_f5 .. :try_end_fd} :catch_1a1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f5 .. :try_end_fd} :catch_189

    if-eq v9, v8, :cond_1d2

    move-object v9, v3

    move-object v3, v5

    move-wide/from16 v16, v13

    move-object v14, v1

    move-object v13, v2

    move-wide/from16 v1, v16

    :goto_107
    :try_start_107
    iput-object v14, v7, Lxy1;->t:Ljava/lang/String;

    iput-object v13, v7, Lxy1;->u:Ljava/io/File;

    iput-object v9, v7, Lxy1;->v:Lesd;

    iput-object v4, v7, Lxy1;->w:Lbfj;

    iput-object v3, v7, Lxy1;->x:Lokhttp3/internal/connection/RealCall;

    iput-wide v1, v7, Lxy1;->y:J

    const/4 v5, 0x2

    iput v5, v7, Lxy1;->B:I

    new-instance v5, Lnh4;

    invoke-static {v7}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v15

    invoke-direct {v5, v11, v15}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {v5}, Lnh4;->s()V

    new-instance v11, Lyy1;

    invoke-direct {v11, v3, v10}, Lyy1;-><init>(Lokhttp3/internal/connection/RealCall;B)V

    invoke-virtual {v5, v11}, Lnh4;->u(Lkotlin/jvm/functions/Function1;)V

    new-instance v10, Leme;

    invoke-direct {v10, v5}, Leme;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, v10}, Lv84;->enqueue(Lf94;)V

    invoke-virtual {v5}, Lnh4;->q()Ljava/lang/Object;

    move-result-object v3

    sget-object v5, Lpx5;->a:Lpx5;
    :try_end_138
    .catch Ljava/io/IOException; {:try_start_107 .. :try_end_138} :catch_180
    .catch Ljava/lang/IllegalArgumentException; {:try_start_107 .. :try_end_138} :catch_17a

    if-eq v3, v8, :cond_1d2

    move-object v3, v4

    move-object v10, v14

    :goto_13c
    :try_start_13c
    iget-object v3, v3, Lbfj;->a:Ljava/lang/String;

    invoke-virtual {v13}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    iput-object v10, v7, Lxy1;->t:Ljava/lang/String;

    iput-object v12, v7, Lxy1;->u:Ljava/io/File;

    iput-object v9, v7, Lxy1;->v:Lesd;

    iput-object v12, v7, Lxy1;->w:Lbfj;

    iput-object v12, v7, Lxy1;->x:Lokhttp3/internal/connection/RealCall;

    iput-wide v1, v7, Lxy1;->y:J

    const/4 v5, 0x3

    iput v5, v7, Lxy1;->B:I
    :try_end_151
    .catch Ljava/io/IOException; {:try_start_13c .. :try_end_151} :catch_176
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13c .. :try_end_151} :catch_16b

    move-object/from16 p1, v0

    move-object/from16 p3, v3

    move-object/from16 p4, v4

    move-object/from16 p6, v7

    move-object/from16 p5, v9

    move-object/from16 p2, v10

    :try_start_15d
    invoke-virtual/range {p1 .. p6}, Ldz1;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lesd;Lnt5;)Ljava/lang/Object;

    move-result-object v0
    :try_end_161
    .catch Ljava/io/IOException; {:try_start_15d .. :try_end_161} :catch_16e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_15d .. :try_end_161} :catch_165

    if-ne v0, v8, :cond_1d3

    goto/16 :goto_1d2

    :catch_165
    move-object/from16 v0, p1

    move-object/from16 v10, p2

    move-object/from16 v7, p6

    :catch_16b
    move-wide v13, v1

    move-object v1, v10

    goto :goto_189

    :catch_16e
    move-object/from16 v0, p1

    move-object/from16 v10, p2

    move-object/from16 v9, p5

    move-object/from16 v7, p6

    :catch_176
    move-wide v13, v1

    move-object v3, v9

    goto/16 :goto_75

    :catch_17a
    move-wide/from16 v16, v1

    move-object v1, v14

    move-wide/from16 v13, v16

    goto :goto_189

    :catch_180
    move-wide/from16 v16, v1

    move-object v1, v14

    move-wide/from16 v13, v16

    move-object v3, v9

    goto :goto_1a1

    :catch_187
    move-wide/from16 v13, p3

    :catch_189
    :goto_189
    iput-object v12, v7, Lxy1;->t:Ljava/lang/String;

    iput-object v12, v7, Lxy1;->u:Ljava/io/File;

    iput-object v12, v7, Lxy1;->v:Lesd;

    iput-object v12, v7, Lxy1;->w:Lbfj;

    iput-object v12, v7, Lxy1;->x:Lokhttp3/internal/connection/RealCall;

    iput-wide v13, v7, Lxy1;->y:J

    const/4 v2, 0x6

    iput v2, v7, Lxy1;->B:I

    invoke-virtual {v0, v1, v6}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-ne v0, v8, :cond_1d3

    goto :goto_1d2

    :catch_19f
    move-wide/from16 v13, p3

    :catch_1a1
    :goto_1a1
    iput-object v12, v7, Lxy1;->t:Ljava/lang/String;

    iput-object v12, v7, Lxy1;->u:Ljava/io/File;

    iput-object v3, v7, Lxy1;->v:Lesd;

    iput-object v12, v7, Lxy1;->w:Lbfj;

    iput-object v12, v7, Lxy1;->x:Lokhttp3/internal/connection/RealCall;

    iput-wide v13, v7, Lxy1;->y:J

    const/4 v2, 0x4

    iput v2, v7, Lxy1;->B:I

    invoke-virtual {v0, v1, v6}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v1

    if-eq v1, v8, :cond_1d2

    move-wide v1, v13

    :goto_1b7
    iget-object v0, v0, Ldz1;->a:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Legj;

    iput-object v12, v7, Lxy1;->t:Ljava/lang/String;

    iput-object v12, v7, Lxy1;->u:Ljava/io/File;

    iput-object v12, v7, Lxy1;->v:Lesd;

    iput-object v12, v7, Lxy1;->w:Lbfj;

    iput-wide v1, v7, Lxy1;->y:J

    const/4 v4, 0x5

    iput v4, v7, Lxy1;->B:I

    invoke-virtual {v0, v1, v2, v3, v7}, Legj;->h(JLesd;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v8, :cond_1d3

    :cond_1d2
    :goto_1d2
    return-object v8

    :cond_1d3
    :goto_1d3
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_1d6
    .packed-switch 0x0
        :pswitch_89
        :pswitch_78
        :pswitch_62
        :pswitch_4f
        :pswitch_46
        :pswitch_3d
        :pswitch_38
    .end packed-switch
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lesd;Lnt5;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    sget-object v2, Lsy1;->a:Lsy1;

    instance-of v3, v1, Lzy1;

    if-eqz v3, :cond_19

    move-object v3, v1

    check-cast v3, Lzy1;

    iget v4, v3, Lzy1;->C:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_19

    sub-int/2addr v4, v5

    iput v4, v3, Lzy1;->C:I

    goto :goto_1e

    :cond_19
    new-instance v3, Lzy1;

    invoke-direct {v3, v0, v1}, Lzy1;-><init>(Ldz1;Lnt5;)V

    :goto_1e
    iget-object v1, v3, Lzy1;->A:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v5, v3, Lzy1;->C:I

    const/4 v6, 0x1

    const/4 v7, 0x0

    packed-switch v5, :pswitch_data_1a4

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :pswitch_2f
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1a1

    :pswitch_34
    iget v5, v3, Lzy1;->y:I

    iget v8, v3, Lzy1;->x:I

    iget-object v9, v3, Lzy1;->w:Lesd;

    iget-object v10, v3, Lzy1;->v:Ljava/lang/String;

    iget-object v11, v3, Lzy1;->u:Ljava/lang/String;

    iget-object v12, v3, Lzy1;->t:Ljava/lang/String;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v1, v11

    move-object v11, v3

    move-object v3, v1

    move-object v1, v9

    move v9, v8

    move-object v8, v1

    move-object v1, v12

    goto/16 :goto_185

    :pswitch_4c
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_160

    :pswitch_51
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_f0

    :pswitch_56
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_108

    :pswitch_5b
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_127

    :pswitch_60
    iget v5, v3, Lzy1;->z:I

    iget v8, v3, Lzy1;->y:I

    iget v9, v3, Lzy1;->x:I

    iget-object v10, v3, Lzy1;->w:Lesd;

    iget-object v11, v3, Lzy1;->v:Ljava/lang/String;

    iget-object v12, v3, Lzy1;->u:Ljava/lang/String;

    iget-object v13, v3, Lzy1;->t:Ljava/lang/String;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_163

    :pswitch_73
    iget v5, v3, Lzy1;->z:I

    iget v8, v3, Lzy1;->y:I

    iget v9, v3, Lzy1;->x:I

    iget-object v10, v3, Lzy1;->w:Lesd;

    iget-object v11, v3, Lzy1;->v:Ljava/lang/String;

    iget-object v12, v3, Lzy1;->u:Ljava/lang/String;

    iget-object v13, v3, Lzy1;->t:Ljava/lang/String;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_c2

    :pswitch_89
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    const/16 v1, 0x1e

    const/4 v5, 0x0

    move-object/from16 v8, p4

    move v9, v1

    move-object v10, v3

    move v11, v5

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    move-object/from16 v5, p3

    :goto_9a
    if-ge v11, v9, :cond_18e

    iget-object v12, v0, Ldz1;->a:Lj4c;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Legj;

    iput-object v1, v10, Lzy1;->t:Ljava/lang/String;

    iput-object v3, v10, Lzy1;->u:Ljava/lang/String;

    iput-object v5, v10, Lzy1;->v:Ljava/lang/String;

    iput-object v8, v10, Lzy1;->w:Lesd;

    iput v9, v10, Lzy1;->x:I

    iput v11, v10, Lzy1;->y:I

    iput v11, v10, Lzy1;->z:I

    iput v6, v10, Lzy1;->C:I

    invoke-virtual {v12, v3, v10}, Legj;->f(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object v12

    if-eq v12, v4, :cond_1a0

    move-object v13, v1

    move-object v1, v12

    move-object v12, v3

    move-object v3, v10

    move-object v10, v8

    move v8, v11

    move-object v11, v5

    move v5, v8

    :goto_c2
    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v14

    if-nez v14, :cond_149

    check-cast v1, Lwej;

    iget-object v14, v1, Lwej;->a:Ldfj;

    sget-object v15, Lwy1;->a:[I

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v14

    aget v14, v15, v14

    packed-switch v14, :pswitch_data_1ba

    invoke-static {}, Lh9o;->p()V

    return-object v7

    :pswitch_db
    sget-object v1, Lsy1;->d:Lsy1;

    iput-object v7, v3, Lzy1;->t:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->u:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->v:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->w:Lesd;

    iput v5, v3, Lzy1;->x:I

    const/4 v2, 0x5

    iput v2, v3, Lzy1;->C:I

    invoke-virtual {v0, v13, v1}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-eq v0, v4, :cond_1a0

    :goto_f0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f3
    sget-object v1, Lsy1;->b:Lsy1;

    iput-object v7, v3, Lzy1;->t:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->u:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->v:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->w:Lesd;

    iput v5, v3, Lzy1;->x:I

    const/4 v2, 0x4

    iput v2, v3, Lzy1;->C:I

    invoke-virtual {v0, v13, v1}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-eq v0, v4, :cond_1a0

    :goto_108
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_10b
    new-instance v2, Lty1;

    iget-object v6, v10, Lesd;->a:Ljava/lang/String;

    iget-object v1, v1, Lwej;->b:Ljava/lang/String;

    invoke-direct {v2, v12, v11, v6, v1}, Lty1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v7, v3, Lzy1;->t:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->u:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->v:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->w:Lesd;

    iput v5, v3, Lzy1;->x:I

    const/4 v1, 0x3

    iput v1, v3, Lzy1;->C:I

    invoke-virtual {v0, v13, v2}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-eq v0, v4, :cond_1a0

    :goto_127
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_12a
    new-instance v1, Luy1;

    iget-object v14, v10, Lesd;->a:Ljava/lang/String;

    invoke-direct {v1, v12, v11, v14}, Luy1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v13, v3, Lzy1;->t:Ljava/lang/String;

    iput-object v12, v3, Lzy1;->u:Ljava/lang/String;

    iput-object v11, v3, Lzy1;->v:Ljava/lang/String;

    iput-object v10, v3, Lzy1;->w:Lesd;

    iput v9, v3, Lzy1;->x:I

    iput v8, v3, Lzy1;->y:I

    iput v5, v3, Lzy1;->z:I

    const/4 v14, 0x2

    iput v14, v3, Lzy1;->C:I

    invoke-virtual {v0, v13, v1}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v1

    if-ne v1, v4, :cond_163

    goto :goto_1a0

    :cond_149
    instance-of v1, v14, Ljava/io/IOException;

    if-nez v1, :cond_163

    iput-object v7, v3, Lzy1;->t:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->u:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->v:Ljava/lang/String;

    iput-object v7, v3, Lzy1;->w:Lesd;

    iput v5, v3, Lzy1;->x:I

    const/4 v1, 0x6

    iput v1, v3, Lzy1;->C:I

    invoke-virtual {v0, v13, v2}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-eq v0, v4, :cond_1a0

    :goto_160
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_163
    :goto_163
    move v1, v5

    move v5, v8

    move v8, v9

    iput-object v13, v3, Lzy1;->t:Ljava/lang/String;

    iput-object v12, v3, Lzy1;->u:Ljava/lang/String;

    iput-object v11, v3, Lzy1;->v:Ljava/lang/String;

    iput-object v10, v3, Lzy1;->w:Lesd;

    iput v8, v3, Lzy1;->x:I

    iput v5, v3, Lzy1;->y:I

    iput v1, v3, Lzy1;->z:I

    const/4 v1, 0x7

    iput v1, v3, Lzy1;->C:I

    const-wide/16 v14, 0x3e8

    invoke-static {v14, v15, v3}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v4, :cond_1a0

    move v9, v8

    move-object v8, v10

    move-object v10, v11

    move-object v1, v13

    move-object v11, v3

    move-object v3, v12

    :goto_185
    add-int/2addr v5, v6

    move-object/from16 v16, v11

    move v11, v5

    move-object v5, v10

    move-object/from16 v10, v16

    goto/16 :goto_9a

    :cond_18e
    iput-object v7, v10, Lzy1;->t:Ljava/lang/String;

    iput-object v7, v10, Lzy1;->u:Ljava/lang/String;

    iput-object v7, v10, Lzy1;->v:Ljava/lang/String;

    iput-object v7, v10, Lzy1;->w:Lesd;

    const/16 v3, 0x8

    iput v3, v10, Lzy1;->C:I

    invoke-virtual {v0, v1, v2}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-ne v0, v4, :cond_1a1

    :cond_1a0
    :goto_1a0
    return-object v4

    :cond_1a1
    :goto_1a1
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_1a4
    .packed-switch 0x0
        :pswitch_89
        :pswitch_73
        :pswitch_60
        :pswitch_5b
        :pswitch_56
        :pswitch_51
        :pswitch_4c
        :pswitch_34
        :pswitch_2f
    .end packed-switch

    :pswitch_data_1ba
    .packed-switch 0x1
        :pswitch_12a
        :pswitch_10b
        :pswitch_f3
        :pswitch_f3
        :pswitch_f3
        :pswitch_db
    .end packed-switch
.end method

.method public final c(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    sget-object v8, Lsy1;->b:Lsy1;

    sget-object v9, Lsy1;->a:Lsy1;

    instance-of v3, v2, Laz1;

    if-eqz v3, :cond_1e

    move-object v3, v2

    check-cast v3, Laz1;

    iget v4, v3, Laz1;->B:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_1e

    sub-int/2addr v4, v5

    iput v4, v3, Laz1;->B:I

    :goto_1c
    move-object v7, v3

    goto :goto_24

    :cond_1e
    new-instance v3, Laz1;

    invoke-direct {v3, v0, v2}, Laz1;-><init>(Ldz1;Lnt5;)V

    goto :goto_1c

    :goto_24
    iget-object v2, v7, Laz1;->z:Ljava/lang/Object;

    sget-object v10, Lpx5;->a:Lpx5;

    iget v3, v7, Laz1;->B:I

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v11, 0x0

    packed-switch v3, :pswitch_data_1b0

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v11

    :pswitch_37
    iget-object v0, v7, Laz1;->w:Lesd;

    check-cast v0, Ljava/lang/IllegalArgumentException;

    :goto_3b
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1ad

    :pswitch_40
    iget-object v0, v7, Laz1;->w:Lesd;

    check-cast v0, Ljava/io/IOException;

    goto :goto_3b

    :pswitch_45
    iget-boolean v1, v7, Laz1;->x:Z

    iget-object v3, v7, Laz1;->t:Ljava/lang/String;

    :try_start_49
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_198
    .catch Ljava/lang/IllegalArgumentException; {:try_start_49 .. :try_end_4c} :catch_182

    goto/16 :goto_1ad

    :pswitch_4e
    iget-wide v12, v7, Laz1;->y:J

    iget-boolean v1, v7, Laz1;->x:Z

    iget-object v3, v7, Laz1;->w:Lesd;

    iget-object v14, v7, Laz1;->u:Ljava/io/File;

    iget-object v15, v7, Laz1;->t:Ljava/lang/String;

    :try_start_58
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v2, Lt0i;

    iget-object v2, v2, Lt0i;->a:Ljava/lang/Object;
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_5f} :catch_6a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_58 .. :try_end_5f} :catch_67

    move-wide/from16 v16, v12

    move v12, v1

    move-object v1, v14

    move-wide/from16 v13, v16

    goto/16 :goto_103

    :catch_67
    move-object v3, v15

    goto/16 :goto_182

    :catch_6a
    move-object v3, v15

    goto/16 :goto_198

    :pswitch_6d
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_d3

    :pswitch_71
    iget-object v1, v7, Laz1;->v:Ljava/lang/String;

    iget-object v3, v7, Laz1;->u:Ljava/io/File;

    iget-object v12, v7, Laz1;->t:Ljava/lang/String;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    :cond_7a
    move-object v14, v3

    move-object v3, v12

    goto :goto_bb

    :pswitch_7d
    iget-object v1, v7, Laz1;->v:Ljava/lang/String;

    iget-object v3, v7, Laz1;->u:Ljava/io/File;

    iget-object v12, v7, Laz1;->t:Ljava/lang/String;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a3

    :pswitch_87
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lsy1;->e:Lsy1;

    iput-object v1, v7, Laz1;->t:Ljava/lang/String;

    move-object/from16 v3, p2

    iput-object v3, v7, Laz1;->u:Ljava/io/File;

    move-object/from16 v12, p3

    iput-object v12, v7, Laz1;->v:Ljava/lang/String;

    iput v6, v7, Laz1;->B:I

    invoke-virtual {v0, v1, v2}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v2

    if-eq v2, v10, :cond_1ac

    move-object/from16 v16, v12

    move-object v12, v1

    move-object/from16 v1, v16

    :goto_a3
    new-instance v2, Lbz1;

    const/4 v13, 0x0

    invoke-direct {v2, v13, v11, v0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object v12, v7, Laz1;->t:Ljava/lang/String;

    iput-object v3, v7, Laz1;->u:Ljava/io/File;

    iput-object v1, v7, Laz1;->v:Ljava/lang/String;

    iput v5, v7, Laz1;->B:I

    iget-object v13, v0, Ldz1;->b:Ldx5;

    invoke-static {v13, v2, v7}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v10, :cond_7a

    goto/16 :goto_1ac

    :goto_bb
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_d6

    iput-object v11, v7, Laz1;->t:Ljava/lang/String;

    iput-object v11, v7, Laz1;->u:Ljava/io/File;

    iput-object v11, v7, Laz1;->v:Ljava/lang/String;

    iput-boolean v2, v7, Laz1;->x:Z

    iput v4, v7, Laz1;->B:I

    invoke-virtual {v0, v3, v9}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-eq v0, v10, :cond_1ac

    :goto_d3
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_d6
    :try_start_d6
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v12

    sget-object v15, Lesd;->e:Lkotlin/text/Regex;

    invoke-static {v1}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v1

    iget-object v15, v0, Ldz1;->a:Lj4c;

    invoke-virtual {v15}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Legj;

    iput-object v3, v7, Laz1;->t:Ljava/lang/String;

    iput-object v14, v7, Laz1;->u:Ljava/io/File;

    iput-object v11, v7, Laz1;->v:Ljava/lang/String;

    iput-object v1, v7, Laz1;->w:Lesd;

    iput-boolean v2, v7, Laz1;->x:Z

    iput-wide v12, v7, Laz1;->y:J

    const/4 v4, 0x4

    iput v4, v7, Laz1;->B:I

    invoke-virtual {v15, v12, v13, v1, v7}, Legj;->g(JLesd;Lnt5;)Ljava/lang/Object;

    move-result-object v4
    :try_end_fb
    .catch Ljava/io/IOException; {:try_start_d6 .. :try_end_fb} :catch_197
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d6 .. :try_end_fb} :catch_181

    if-eq v4, v10, :cond_1ac

    move-object v15, v3

    move-object v3, v1

    move-object v1, v14

    move-wide v13, v12

    move v12, v2

    move-object v2, v4

    :goto_103
    :try_start_103
    invoke-static {v2}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    if-nez v4, :cond_127

    move-object v6, v2

    check-cast v6, Lbfj;

    iput-object v15, v7, Laz1;->t:Ljava/lang/String;

    iput-object v11, v7, Laz1;->u:Ljava/io/File;

    iput-object v11, v7, Laz1;->v:Ljava/lang/String;

    iput-object v11, v7, Laz1;->w:Lesd;

    iput-boolean v12, v7, Laz1;->x:Z

    iput-wide v13, v7, Laz1;->y:J

    const/4 v2, 0x5

    iput v2, v7, Laz1;->B:I
    :try_end_11b
    .catch Ljava/io/IOException; {:try_start_103 .. :try_end_11b} :catch_17f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_103 .. :try_end_11b} :catch_17d

    move-object v2, v1

    move-object v5, v3

    move-wide v3, v13

    move-object v1, v15

    :try_start_11f
    invoke-virtual/range {v0 .. v7}, Ldz1;->a(Ljava/lang/String;Ljava/io/File;JLesd;Lbfj;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v10, :cond_1ad

    goto/16 :goto_1ac

    :cond_127
    move-wide v2, v13

    move-object v1, v15

    instance-of v13, v4, Lyej;

    if-eqz v13, :cond_161

    check-cast v4, Lyej;

    iget-object v4, v4, Lyej;->a:Lxej;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_149

    if-eq v4, v6, :cond_147

    if-eq v4, v5, :cond_147

    const/4 v5, 0x3

    if-ne v4, v5, :cond_141

    sget-object v4, Lsy1;->c:Lsy1;

    goto :goto_14b

    :cond_141
    new-instance v2, Loye;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    throw v2

    :cond_147
    move-object v4, v8

    goto :goto_14b

    :cond_149
    sget-object v4, Lsy1;->d:Lsy1;

    :goto_14b
    iput-object v1, v7, Laz1;->t:Ljava/lang/String;

    iput-object v11, v7, Laz1;->u:Ljava/io/File;

    iput-object v11, v7, Laz1;->v:Ljava/lang/String;

    iput-object v11, v7, Laz1;->w:Lesd;

    iput-boolean v12, v7, Laz1;->x:Z

    iput-wide v2, v7, Laz1;->y:J

    const/4 v2, 0x6

    iput v2, v7, Laz1;->B:I

    invoke-virtual {v0, v1, v4}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-ne v0, v10, :cond_1ad

    goto :goto_1ac

    :cond_161
    iput-object v1, v7, Laz1;->t:Ljava/lang/String;

    iput-object v11, v7, Laz1;->u:Ljava/io/File;

    iput-object v11, v7, Laz1;->v:Ljava/lang/String;

    iput-object v11, v7, Laz1;->w:Lesd;

    iput-boolean v12, v7, Laz1;->x:Z

    iput-wide v2, v7, Laz1;->y:J

    const/4 v2, 0x7

    iput v2, v7, Laz1;->B:I

    invoke-virtual {v0, v1, v9}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0
    :try_end_174
    .catch Ljava/io/IOException; {:try_start_11f .. :try_end_174} :catch_17a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_11f .. :try_end_174} :catch_177

    if-ne v0, v10, :cond_1ad

    goto :goto_1ac

    :catch_177
    :goto_177
    move-object v3, v1

    move v1, v12

    goto :goto_182

    :catch_17a
    :goto_17a
    move-object v3, v1

    move v1, v12

    goto :goto_198

    :catch_17d
    move-object v1, v15

    goto :goto_177

    :catch_17f
    move-object v1, v15

    goto :goto_17a

    :catch_181
    move v1, v2

    :catch_182
    :goto_182
    iput-object v11, v7, Laz1;->t:Ljava/lang/String;

    iput-object v11, v7, Laz1;->u:Ljava/io/File;

    iput-object v11, v7, Laz1;->v:Ljava/lang/String;

    iput-object v11, v7, Laz1;->w:Lesd;

    iput-boolean v1, v7, Laz1;->x:Z

    const/16 v1, 0x9

    iput v1, v7, Laz1;->B:I

    invoke-virtual {v0, v3, v8}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-ne v0, v10, :cond_1ad

    goto :goto_1ac

    :catch_197
    move v1, v2

    :catch_198
    :goto_198
    iput-object v11, v7, Laz1;->t:Ljava/lang/String;

    iput-object v11, v7, Laz1;->u:Ljava/io/File;

    iput-object v11, v7, Laz1;->v:Ljava/lang/String;

    iput-object v11, v7, Laz1;->w:Lesd;

    iput-boolean v1, v7, Laz1;->x:Z

    const/16 v1, 0x8

    iput v1, v7, Laz1;->B:I

    invoke-virtual {v0, v3, v9}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-ne v0, v10, :cond_1ad

    :cond_1ac
    :goto_1ac
    return-object v10

    :cond_1ad
    :goto_1ad
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_1b0
    .packed-switch 0x0
        :pswitch_87
        :pswitch_7d
        :pswitch_71
        :pswitch_6d
        :pswitch_4e
        :pswitch_45
        :pswitch_45
        :pswitch_45
        :pswitch_40
        :pswitch_37
    .end packed-switch
.end method

.method public final d(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p6

    sget-object v3, Lsy1;->a:Lsy1;

    instance-of v4, v2, Lcz1;

    if-eqz v4, :cond_1b

    move-object v4, v2

    check-cast v4, Lcz1;

    iget v5, v4, Lcz1;->B:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1b

    sub-int/2addr v5, v6

    iput v5, v4, Lcz1;->B:I

    goto :goto_20

    :cond_1b
    new-instance v4, Lcz1;

    invoke-direct {v4, v0, v2}, Lcz1;-><init>(Ldz1;Lnt5;)V

    :goto_20
    iget-object v2, v4, Lcz1;->z:Ljava/lang/Object;

    sget-object v5, Lpx5;->a:Lpx5;

    iget v6, v4, Lcz1;->B:I

    const/4 v7, 0x5

    const/4 v8, 0x4

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v6, :cond_65

    if-eq v6, v11, :cond_56

    if-eq v6, v10, :cond_52

    if-eq v6, v9, :cond_43

    if-eq v6, v8, :cond_3e

    if-eq v6, v7, :cond_3e

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :cond_3e
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_12b

    :cond_43
    iget-boolean v1, v4, Lcz1;->y:Z

    iget-object v6, v4, Lcz1;->u:Landroid/net/Uri;

    iget-object v9, v4, Lcz1;->t:Ljava/lang/String;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v2, Lt0i;

    iget-object v2, v2, Lt0i;->a:Ljava/lang/Object;

    goto/16 :goto_ec

    :cond_52
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_aa

    :cond_56
    iget-object v1, v4, Lcz1;->x:Ljava/lang/String;

    iget-object v6, v4, Lcz1;->w:Ljava/lang/String;

    iget-object v11, v4, Lcz1;->v:Ljava/lang/String;

    iget-object v13, v4, Lcz1;->u:Landroid/net/Uri;

    iget-object v14, v4, Lcz1;->t:Ljava/lang/String;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move-object v15, v1

    goto :goto_88

    :cond_65
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lsy1;->e:Lsy1;

    iput-object v1, v4, Lcz1;->t:Ljava/lang/String;

    move-object/from16 v6, p2

    iput-object v6, v4, Lcz1;->u:Landroid/net/Uri;

    move-object/from16 v13, p3

    iput-object v13, v4, Lcz1;->v:Ljava/lang/String;

    move-object/from16 v14, p4

    iput-object v14, v4, Lcz1;->w:Ljava/lang/String;

    move-object/from16 v15, p5

    iput-object v15, v4, Lcz1;->x:Ljava/lang/String;

    iput v11, v4, Lcz1;->B:I

    invoke-virtual {v0, v1, v2}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v2

    if-eq v2, v5, :cond_12a

    move-object v11, v13

    move-object v13, v6

    move-object v6, v14

    move-object v14, v1

    :goto_88
    sget-object v1, Law3;->a:Law3;

    invoke-virtual {v1}, Law3;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_ad

    iput-object v12, v4, Lcz1;->t:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->u:Landroid/net/Uri;

    iput-object v12, v4, Lcz1;->v:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->w:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->x:Ljava/lang/String;

    iput-boolean v1, v4, Lcz1;->y:Z

    iput v10, v4, Lcz1;->B:I

    invoke-virtual {v0, v14, v3}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-eq v0, v5, :cond_12a

    :goto_aa
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_ad
    invoke-virtual {v13}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v10, 0x3e8

    invoke-static {v10, v2}, Lu0h;->q(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v10, v11}, Lu0h;->q(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const v11, 0x493e0

    invoke-static {v11, v6}, Lu0h;->q(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v11, v0, Ldz1;->a:Lj4c;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Legj;

    iput-object v14, v4, Lcz1;->t:Ljava/lang/String;

    iput-object v13, v4, Lcz1;->u:Landroid/net/Uri;

    iput-object v12, v4, Lcz1;->v:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->w:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->x:Ljava/lang/String;

    iput-boolean v1, v4, Lcz1;->y:Z

    iput v9, v4, Lcz1;->B:I

    move-object/from16 p2, v2

    move-object/from16 p6, v4

    move-object/from16 p4, v6

    move-object/from16 p3, v10

    move-object/from16 p1, v11

    move-object/from16 p5, v15

    invoke-virtual/range {p1 .. p6}, Legj;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v5, :cond_12a

    move-object v6, v13

    move-object v9, v14

    :goto_ec
    invoke-static {v2}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v10

    if-nez v10, :cond_116

    check-cast v2, Lgfj;

    new-instance v3, Lty1;

    iget-object v2, v2, Lgfj;->a:Ljava/lang/String;

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "application/vnd.opera.x-page-context"

    invoke-direct {v3, v2, v6, v7, v12}, Lty1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v12, v4, Lcz1;->t:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->u:Landroid/net/Uri;

    iput-object v12, v4, Lcz1;->v:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->w:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->x:Ljava/lang/String;

    iput-boolean v1, v4, Lcz1;->y:Z

    iput v8, v4, Lcz1;->B:I

    invoke-virtual {v0, v9, v3}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-ne v0, v5, :cond_12b

    goto :goto_12a

    :cond_116
    iput-object v12, v4, Lcz1;->t:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->u:Landroid/net/Uri;

    iput-object v12, v4, Lcz1;->v:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->w:Ljava/lang/String;

    iput-object v12, v4, Lcz1;->x:Ljava/lang/String;

    iput-boolean v1, v4, Lcz1;->y:Z

    iput v7, v4, Lcz1;->B:I

    invoke-virtual {v0, v9, v3}, Ldz1;->e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;

    move-result-object v0

    if-ne v0, v5, :cond_12b

    :cond_12a
    :goto_12a
    return-object v5

    :cond_12b
    :goto_12b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method

.method public final e(Ljava/lang/String;Lvy1;)Lkotlin/Unit;
    .registers 7

    :cond_0
    iget-object v0, p0, Ldz1;->f:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/util/Map;

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
