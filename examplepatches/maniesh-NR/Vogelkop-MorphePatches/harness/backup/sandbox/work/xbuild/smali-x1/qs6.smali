.class public final Lqs6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lup9;

.field public final c:Lcg1;

.field public final d:Ligi;

.field public final e:Ljze;

.field public f:Lup6;

.field public g:Ljava/util/Set;

.field public final h:Lh42;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lfs6;Ldse;Lx0f;Lode;Lonc;Lode;Lb59;Lup9;Lcg1;)V
    .registers 23

    move-object/from16 v0, p5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqs6;->a:Landroid/content/Context;

    move-object/from16 v1, p10

    iput-object v1, p0, Lqs6;->b:Lup9;

    move-object/from16 v1, p11

    iput-object v1, p0, Lqs6;->c:Lcg1;

    new-instance v1, Ligi;

    iget-object v2, p4, Ldse;->a:Lwnm;

    invoke-static {p1}, Lbml;->u(Landroid/content/Context;)Lbml;

    move-result-object v3

    const-string p1, "news"

    invoke-virtual {v0, p1}, Lx0f;->a(Ljava/lang/String;)Lode;

    move-result-object v4

    const-string p1, "livescore"

    invoke-virtual {v0, p1}, Lx0f;->a(Ljava/lang/String;)Lode;

    move-result-object v5

    new-instance v9, Lbl6;

    const/4 p1, 0x6

    invoke-direct {v9, p0, p1}, Lbl6;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v10, p9

    move-object v0, v1

    move-object v1, p2

    invoke-direct/range {v0 .. v10}, Ligi;-><init>(Lumi;Likc;Lbml;Lode;Lode;Lode;Lonc;Lode;Lbl6;Lb59;)V

    iput-object v0, p0, Lqs6;->d:Ligi;

    iget-object p1, p3, Lfs6;->d:Ljze;

    iput-object p1, p0, Lqs6;->e:Ljze;

    iget-object p1, p3, Lfs6;->g:Lode;

    new-instance p2, Ltb6;

    const/16 v0, 0x16

    invoke-direct {p2, v0}, Ltb6;-><init>(B)V

    invoke-static {p1, p2}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p1

    invoke-static {p1}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p1

    iput-object p1, p0, Lqs6;->h:Lh42;

    iget-object p1, p3, Lfs6;->d:Ljze;

    new-instance p2, Lks6;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p3, Lms6;

    if-eqz v0, :cond_14

    move-object v0, p3

    check-cast v0, Lms6;

    iget v1, v0, Lms6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lms6;->v:I

    :goto_12
    move-object v7, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lms6;

    invoke-direct {v0, p0, p3}, Lms6;-><init>(Lqs6;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p3, v7, Lms6;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v7, Lms6;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_34

    if-ne v1, v2, :cond_2d

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    goto :goto_59

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lqs6;->c:Lcg1;

    iget-object p0, p0, Lcg1;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lwdo;

    iget-object v3, p1, Lls6;->a:Ljava/lang/String;

    iget-object v4, p1, Lls6;->b:Ljava/lang/String;

    iget-object v5, p1, Lls6;->c:Ljava/lang/String;

    iget-wide p0, p2, Ljoc;->a:J

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    iput v2, v7, Lms6;->v:I

    const-string v2, "opera"

    invoke-virtual/range {v1 .. v7}, Lwdo;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_59

    return-object v0

    :cond_59
    :goto_59
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-nez p0, :cond_62

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_62
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final b(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p3, Lns6;

    if-eqz v0, :cond_14

    move-object v0, p3

    check-cast v0, Lns6;

    iget v1, v0, Lns6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lns6;->v:I

    :goto_12
    move-object v7, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lns6;

    invoke-direct {v0, p0, p3}, Lns6;-><init>(Lqs6;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p3, v7, Lns6;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v7, Lns6;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_34

    if-ne v1, v2, :cond_2d

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    goto :goto_59

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lqs6;->c:Lcg1;

    iget-object p0, p0, Lcg1;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lwdo;

    iget-object v3, p1, Lls6;->a:Ljava/lang/String;

    iget-object v4, p1, Lls6;->b:Ljava/lang/String;

    iget-object v5, p1, Lls6;->c:Ljava/lang/String;

    iget-wide p0, p2, Ljoc;->a:J

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    iput v2, v7, Lns6;->v:I

    const-string v2, "opera"

    invoke-virtual/range {v1 .. v7}, Lwdo;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_59

    return-object v0

    :cond_59
    :goto_59
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-nez p0, :cond_62

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_62
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final c(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p3, Los6;

    if-eqz v0, :cond_14

    move-object v0, p3

    check-cast v0, Los6;

    iget v1, v0, Los6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Los6;->v:I

    :goto_12
    move-object v8, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Los6;

    invoke-direct {v0, p0, p3}, Los6;-><init>(Lqs6;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p3, v8, Los6;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v8, Los6;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_34

    if-ne v1, v2, :cond_2d

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    goto :goto_5b

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lqs6;->b:Lup9;

    iget-object p0, p0, Lup9;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lsfo;

    iget-object v3, p1, Lls6;->a:Ljava/lang/String;

    iget-object v4, p1, Lls6;->b:Ljava/lang/String;

    iget-object v5, p1, Lls6;->c:Ljava/lang/String;

    iget-wide p0, p2, Ljoc;->a:J

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    iput v2, v8, Los6;->v:I

    const-string v2, "ofa"

    const-string v6, "match"

    invoke-virtual/range {v1 .. v8}, Lsfo;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5b

    return-object v0

    :cond_5b
    :goto_5b
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-nez p0, :cond_64

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_64
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final d(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p3, Lps6;

    if-eqz v0, :cond_14

    move-object v0, p3

    check-cast v0, Lps6;

    iget v1, v0, Lps6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lps6;->v:I

    :goto_12
    move-object v8, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lps6;

    invoke-direct {v0, p0, p3}, Lps6;-><init>(Lqs6;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p3, v8, Lps6;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v8, Lps6;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_34

    if-ne v1, v2, :cond_2d

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    goto :goto_5b

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lqs6;->b:Lup9;

    iget-object p0, p0, Lup9;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lsfo;

    iget-object v3, p1, Lls6;->a:Ljava/lang/String;

    iget-object v4, p1, Lls6;->b:Ljava/lang/String;

    iget-object v5, p1, Lls6;->c:Ljava/lang/String;

    iget-wide p0, p2, Ljoc;->a:J

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    iput v2, v8, Lps6;->v:I

    const-string v2, "ofa"

    const-string v6, "match"

    invoke-virtual/range {v1 .. v8}, Lsfo;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5b

    return-object v0

    :cond_5b
    :goto_5b
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-nez p0, :cond_64

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_64
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final e(Ljoc;Lnt5;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Lqs6;->d:Ligi;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ligi;->j:Ljava/lang/Object;

    monitor-enter v1

    :try_start_8
    iget-object v0, v0, Ligi;->g:Ljava/lang/Object;

    check-cast v0, Lls6;

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_2e

    if-nez v0, :cond_12

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_12
    iget-object v1, p1, Ljoc;->b:Lapc;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_27

    const/4 v2, 0x1

    if-ne v1, v2, :cond_22

    invoke-virtual {p0, v0, p1, p2}, Lqs6;->a(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_22
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_27
    invoke-virtual {p0, v0, p1, p2}, Lqs6;->c(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :goto_2c
    :try_start_2c
    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2e

    throw p0

    :catchall_2e
    move-exception p0

    goto :goto_2c
.end method

.method public final f(Ljoc;Lnt5;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Lqs6;->d:Ligi;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ligi;->j:Ljava/lang/Object;

    monitor-enter v1

    :try_start_8
    iget-object v0, v0, Ligi;->g:Ljava/lang/Object;

    check-cast v0, Lls6;

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_2e

    if-nez v0, :cond_12

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_12
    iget-object v1, p1, Ljoc;->b:Lapc;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_27

    const/4 v2, 0x1

    if-ne v1, v2, :cond_22

    invoke-virtual {p0, v0, p1, p2}, Lqs6;->b(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_22
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_27
    invoke-virtual {p0, v0, p1, p2}, Lqs6;->d(Lls6;Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :goto_2c
    :try_start_2c
    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2e

    throw p0

    :catchall_2e
    move-exception p0

    goto :goto_2c
.end method
