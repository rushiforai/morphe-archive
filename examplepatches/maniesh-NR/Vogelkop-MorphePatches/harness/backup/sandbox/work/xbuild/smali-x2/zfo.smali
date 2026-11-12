.class public final Lzfo;
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

    iput-object p1, p0, Lzfo;->a:Ljava/lang/String;

    iput-object p2, p0, Lzfo;->b:Lpna;

    iput-object p3, p0, Lzfo;->c:Lqe6;

    return-void
.end method


# virtual methods
.method public final a(JLnt5;Ljava/lang/String;)Ljava/lang/Object;
    .registers 15

    instance-of v2, p3, Lwfo;

    if-eqz v2, :cond_14

    move-object v2, p3

    check-cast v2, Lwfo;

    iget v3, v2, Lwfo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_14

    sub-int/2addr v3, v4

    iput v3, v2, Lwfo;->v:I

    :goto_12
    move-object v8, v2

    goto :goto_1a

    :cond_14
    new-instance v2, Lwfo;

    invoke-direct {v2, p0, p3}, Lwfo;-><init>(Lzfo;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object v0, v8, Lwfo;->t:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget v2, v8, Lwfo;->v:I

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v2, :cond_30

    if-ne v2, v6, :cond_2a

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6b

    :cond_2a
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :cond_30
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Lo02;

    const/4 v5, 0x6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lo02;-><init>(Ljava/lang/Object;JLjava/lang/Object;B)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_42
    const-class v4, Lcne;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    sget-object v5, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {v2, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object v7
    :try_end_55
    .catchall {:try_start_42 .. :try_end_55} :catchall_55

    :catchall_55
    new-instance v2, Lx9m;

    invoke-direct {v2, v3, v7}, Lx9m;-><init>(Litb;Lcam;)V

    iput v6, v8, Lwfo;->v:I

    const-string v7, ""

    iget-object v3, p0, Lzfo;->c:Lqe6;

    iget-object v4, p0, Lzfo;->b:Lpna;

    move-object v5, v0

    move-object v6, v2

    invoke-virtual/range {v3 .. v8}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v9, :cond_6b

    return-object v9

    :cond_6b
    :goto_6b
    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p3, Lxfo;

    if-eqz v0, :cond_14

    move-object v0, p3

    check-cast v0, Lxfo;

    iget v1, v0, Lxfo;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lxfo;->v:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lxfo;

    invoke-direct {v0, p0, p3}, Lxfo;-><init>(Lzfo;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p3, v6, Lxfo;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lxfo;->v:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_30

    if-ne v1, v2, :cond_2a

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6a

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    move-object p3, v3

    new-instance v3, Ltmi;

    const/16 v1, 0x15

    invoke-direct {v3, p0, p1, p2, v1}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-class p1, Lt0i;

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p2

    :try_start_41
    const-class v1, Lhne;

    invoke-static {v1}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v1

    sget-object v4, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v1

    invoke-static {p1, v1}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object p1
    :try_end_54
    .catchall {:try_start_41 .. :try_end_54} :catchall_55

    goto :goto_56

    :catchall_55
    move-object p1, p3

    :goto_56
    new-instance v4, Lx9m;

    invoke-direct {v4, p2, p1}, Lx9m;-><init>(Litb;Lcam;)V

    iput v2, v6, Lxfo;->v:I

    const-string v5, ""

    iget-object v1, p0, Lzfo;->c:Lqe6;

    iget-object v2, p0, Lzfo;->b:Lpna;

    invoke-virtual/range {v1 .. v6}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v0, :cond_6a

    return-object v0

    :cond_6a
    :goto_6a
    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public final c(JLjava/lang/String;JJLnt5;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p8

    instance-of v2, v0, Lyfo;

    if-eqz v2, :cond_16

    move-object v2, v0

    check-cast v2, Lyfo;

    iget v3, v2, Lyfo;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_16

    sub-int/2addr v3, v4

    iput v3, v2, Lyfo;->v:I

    :goto_14
    move-object v9, v2

    goto :goto_1c

    :cond_16
    new-instance v2, Lyfo;

    invoke-direct {v2, p0, v0}, Lyfo;-><init>(Lzfo;Lnt5;)V

    goto :goto_14

    :goto_1c
    iget-object v0, v9, Lyfo;->t:Ljava/lang/Object;

    sget-object v10, Lpx5;->a:Lpx5;

    iget v2, v9, Lyfo;->v:I

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v11, :cond_2c

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_78

    :cond_2c
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :cond_32
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Lvfo;

    move-object v1, p0

    move-wide v2, p1

    move-object/from16 v4, p3

    move-wide/from16 v5, p4

    move-wide/from16 v7, p6

    invoke-direct/range {v0 .. v8}, Lvfo;-><init>(Lzfo;JLjava/lang/String;JJ)V

    const-class v2, Lt0i;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_48
    const-class v4, Lkne;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    sget-object v5, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {v2, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object v12
    :try_end_5b
    .catchall {:try_start_48 .. :try_end_5b} :catchall_5b

    :catchall_5b
    new-instance v2, Lx9m;

    invoke-direct {v2, v3, v12}, Lx9m;-><init>(Litb;Lcam;)V

    iput v11, v9, Lyfo;->v:I

    const-string v3, ""

    iget-object v4, p0, Lzfo;->c:Lqe6;

    iget-object v1, p0, Lzfo;->b:Lpna;

    move-object p2, v0

    move-object p1, v1

    move-object/from16 p3, v2

    move-object/from16 p4, v3

    move-object p0, v4

    move-object/from16 p5, v9

    invoke-virtual/range {p0 .. p5}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v10, :cond_78

    return-object v10

    :cond_78
    :goto_78
    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object v0
.end method
