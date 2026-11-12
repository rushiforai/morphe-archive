.class public final Lsfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lpna;

.field public final c:Lqe6;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lpna;Lqe6;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsfo;->a:Ljava/lang/String;

    iput-object p2, p0, Lsfo;->b:Lpna;

    iput-object p3, p0, Lsfo;->c:Lqe6;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p2, Lnfo;

    if-eqz v0, :cond_14

    move-object v0, p2

    check-cast v0, Lnfo;

    iget v1, v0, Lnfo;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lnfo;->v:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lnfo;

    invoke-direct {v0, p0, p2}, Lnfo;-><init>(Lsfo;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p2, v6, Lnfo;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lnfo;->v:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_30

    if-ne v1, v2, :cond_2a

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7a

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object p2, v3

    new-instance v3, Lceo;

    const/16 v1, 0x8

    invoke-direct {v3, p0, p1, v1}, Lceo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-class p1, Lt0i;

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    :try_start_41
    const-class v4, Ljava/lang/String;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v5

    sget-object v7, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v5

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {v5, v4}, Luqh;->g(Lkotlin/reflect/KTypeProjection;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object v4

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {p1, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object p1
    :try_end_64
    .catchall {:try_start_41 .. :try_end_64} :catchall_65

    goto :goto_66

    :catchall_65
    move-object p1, p2

    :goto_66
    new-instance v4, Lx9m;

    invoke-direct {v4, v1, p1}, Lx9m;-><init>(Litb;Lcam;)V

    iput v2, v6, Lnfo;->v:I

    const-string v5, ""

    iget-object v1, p0, Lsfo;->c:Lqe6;

    iget-object v2, p0, Lsfo;->b:Lpna;

    invoke-virtual/range {v1 .. v6}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v0, :cond_7a

    return-object v0

    :cond_7a
    :goto_7a
    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v2, p5, Lofo;

    if-eqz v2, :cond_14

    move-object v2, p5

    check-cast v2, Lofo;

    iget v3, v2, Lofo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_14

    sub-int/2addr v3, v4

    iput v3, v2, Lofo;->v:I

    :goto_12
    move-object v6, v2

    goto :goto_1a

    :cond_14
    new-instance v2, Lofo;

    invoke-direct {v2, p0, p5}, Lofo;-><init>(Lsfo;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object v0, v6, Lofo;->t:Ljava/lang/Object;

    sget-object v7, Lpx5;->a:Lpx5;

    iget v2, v6, Lofo;->v:I

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v2, :cond_30

    if-ne v2, v8, :cond_2a

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_70

    :cond_2a
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v9

    :cond_30
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Lai;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lai;-><init>(Lsfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_43
    const-class v4, Lld3;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    sget-object v5, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {v2, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object v9
    :try_end_56
    .catchall {:try_start_43 .. :try_end_56} :catchall_56

    :catchall_56
    new-instance v2, Lx9m;

    invoke-direct {v2, v3, v9}, Lx9m;-><init>(Litb;Lcam;)V

    iput v8, v6, Lofo;->v:I

    const-string v3, ""

    iget-object v4, p0, Lsfo;->c:Lqe6;

    iget-object v1, p0, Lsfo;->b:Lpna;

    move-object p2, v0

    move-object p1, v1

    move-object p3, v2

    move-object p4, v3

    move-object p0, v4

    move-object p5, v6

    invoke-virtual/range {p0 .. p5}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v7, :cond_70

    return-object v7

    :cond_70
    :goto_70
    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p6

    instance-of v2, v0, Lpfo;

    if-eqz v2, :cond_16

    move-object v2, v0

    check-cast v2, Lpfo;

    iget v3, v2, Lpfo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_16

    sub-int/2addr v3, v4

    iput v3, v2, Lpfo;->v:I

    :goto_14
    move-object v8, v2

    goto :goto_1c

    :cond_16
    new-instance v2, Lpfo;

    invoke-direct {v2, p0, v0}, Lpfo;-><init>(Lsfo;Lnt5;)V

    goto :goto_14

    :goto_1c
    iget-object v0, v8, Lpfo;->t:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget v2, v8, Lpfo;->v:I

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v10, :cond_2c

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_78

    :cond_2c
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v11

    :cond_32
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Lpr3;

    const/4 v7, 0x4

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v0 .. v7}, Lpr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;B)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_49
    const-class v4, Lcd3;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    sget-object v5, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {v2, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object v11
    :try_end_5c
    .catchall {:try_start_49 .. :try_end_5c} :catchall_5c

    :catchall_5c
    new-instance v2, Lx9m;

    invoke-direct {v2, v3, v11}, Lx9m;-><init>(Litb;Lcam;)V

    iput v10, v8, Lpfo;->v:I

    const-string v3, ""

    iget-object v4, p0, Lsfo;->c:Lqe6;

    iget-object v1, p0, Lsfo;->b:Lpna;

    move-object p2, v0

    move-object p1, v1

    move-object p3, v2

    move-object/from16 p4, v3

    move-object p0, v4

    move-object/from16 p5, v8

    invoke-virtual/range {p0 .. p5}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v9, :cond_78

    return-object v9

    :cond_78
    :goto_78
    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p7

    instance-of v2, v0, Lqfo;

    if-eqz v2, :cond_16

    move-object v2, v0

    check-cast v2, Lqfo;

    iget v3, v2, Lqfo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_16

    sub-int/2addr v3, v4

    iput v3, v2, Lqfo;->v:I

    :goto_14
    move-object v9, v2

    goto :goto_1c

    :cond_16
    new-instance v2, Lqfo;

    invoke-direct {v2, p0, v0}, Lqfo;-><init>(Lsfo;Lnt5;)V

    goto :goto_14

    :goto_1c
    iget-object v0, v9, Lqfo;->t:Ljava/lang/Object;

    sget-object v10, Lpx5;->a:Lpx5;

    iget v2, v9, Lqfo;->v:I

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v11, :cond_2c

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7c

    :cond_2c
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :cond_32
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Llfo;

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v0 .. v8}, Llfo;-><init>(Lsfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_4c
    const-class v4, Ljava/lang/Object;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    sget-object v5, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {v2, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object v12
    :try_end_5f
    .catchall {:try_start_4c .. :try_end_5f} :catchall_5f

    :catchall_5f
    new-instance v2, Lx9m;

    invoke-direct {v2, v3, v12}, Lx9m;-><init>(Litb;Lcam;)V

    iput v11, v9, Lqfo;->v:I

    const-string v3, ""

    iget-object v4, p0, Lsfo;->c:Lqe6;

    iget-object v1, p0, Lsfo;->b:Lpna;

    move-object p2, v0

    move-object p1, v1

    move-object/from16 p3, v2

    move-object/from16 p4, v3

    move-object p0, v4

    move-object/from16 p5, v9

    invoke-virtual/range {p0 .. p5}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v10, :cond_7c

    return-object v10

    :cond_7c
    :goto_7c
    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p7

    instance-of v2, v0, Lrfo;

    if-eqz v2, :cond_16

    move-object v2, v0

    check-cast v2, Lrfo;

    iget v3, v2, Lrfo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_16

    sub-int/2addr v3, v4

    iput v3, v2, Lrfo;->v:I

    :goto_14
    move-object v9, v2

    goto :goto_1c

    :cond_16
    new-instance v2, Lrfo;

    invoke-direct {v2, p0, v0}, Lrfo;-><init>(Lsfo;Lnt5;)V

    goto :goto_14

    :goto_1c
    iget-object v0, v9, Lrfo;->t:Ljava/lang/Object;

    sget-object v10, Lpx5;->a:Lpx5;

    iget v2, v9, Lrfo;->v:I

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v11, :cond_2c

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7c

    :cond_2c
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :cond_32
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Llfo;

    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v0 .. v8}, Llfo;-><init>(Lsfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_4c
    const-class v4, Ljava/lang/Object;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    sget-object v5, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {v2, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object v12
    :try_end_5f
    .catchall {:try_start_4c .. :try_end_5f} :catchall_5f

    :catchall_5f
    new-instance v2, Lx9m;

    invoke-direct {v2, v3, v12}, Lx9m;-><init>(Litb;Lcam;)V

    iput v11, v9, Lrfo;->v:I

    const-string v3, ""

    iget-object v4, p0, Lsfo;->c:Lqe6;

    iget-object v1, p0, Lsfo;->b:Lpna;

    move-object p2, v0

    move-object p1, v1

    move-object/from16 p3, v2

    move-object/from16 p4, v3

    move-object p0, v4

    move-object/from16 p5, v9

    invoke-virtual/range {p0 .. p5}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v10, :cond_7c

    return-object v10

    :cond_7c
    :goto_7c
    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object v0
.end method
