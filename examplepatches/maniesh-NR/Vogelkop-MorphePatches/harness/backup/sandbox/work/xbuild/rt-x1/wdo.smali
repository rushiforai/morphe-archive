.class public final Lwdo;
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

    iput-object p1, p0, Lwdo;->a:Ljava/lang/String;

    iput-object p2, p0, Lwdo;->b:Lpna;

    iput-object p3, p0, Lwdo;->c:Lqe6;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p6

    instance-of v2, v0, Ludo;

    if-eqz v2, :cond_16

    move-object v2, v0

    check-cast v2, Ludo;

    iget v3, v2, Ludo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_16

    sub-int/2addr v3, v4

    iput v3, v2, Ludo;->v:I

    :goto_14
    move-object v8, v2

    goto :goto_1c

    :cond_16
    new-instance v2, Ludo;

    invoke-direct {v2, p0, v0}, Ludo;-><init>(Lwdo;Lnt5;)V

    goto :goto_14

    :goto_1c
    iget-object v0, v8, Ludo;->t:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget v2, v8, Ludo;->v:I

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

    new-instance v0, Ltdo;

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v0 .. v7}, Ltdo;-><init>(Lwdo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_49
    const-class v4, Ljava/lang/Object;

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

    iput v10, v8, Ludo;->v:I

    const-string v3, ""

    iget-object v4, p0, Lwdo;->c:Lqe6;

    iget-object v1, p0, Lwdo;->b:Lpna;

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

.method public final b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p6

    instance-of v2, v0, Lvdo;

    if-eqz v2, :cond_16

    move-object v2, v0

    check-cast v2, Lvdo;

    iget v3, v2, Lvdo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_16

    sub-int/2addr v3, v4

    iput v3, v2, Lvdo;->v:I

    :goto_14
    move-object v8, v2

    goto :goto_1c

    :cond_16
    new-instance v2, Lvdo;

    invoke-direct {v2, p0, v0}, Lvdo;-><init>(Lwdo;Lnt5;)V

    goto :goto_14

    :goto_1c
    iget-object v0, v8, Lvdo;->t:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget v2, v8, Lvdo;->v:I

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

    new-instance v0, Ltdo;

    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v0 .. v7}, Ltdo;-><init>(Lwdo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_49
    const-class v4, Ljava/lang/Object;

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

    iput v10, v8, Lvdo;->v:I

    const-string v3, ""

    iget-object v4, p0, Lwdo;->c:Lqe6;

    iget-object v1, p0, Lwdo;->b:Lpna;

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
