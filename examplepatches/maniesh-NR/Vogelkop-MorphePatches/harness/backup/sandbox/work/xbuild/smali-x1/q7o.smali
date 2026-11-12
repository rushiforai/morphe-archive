.class public final Lq7o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lj4c;

.field public final b:Lt1;

.field public final c:Ljg8;

.field public final d:Lcrb;


# direct methods
.method public constructor <init>(Lj4c;Lt1;Ljg8;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq7o;->a:Lj4c;

    iput-object p2, p0, Lq7o;->b:Lt1;

    iput-object p3, p0, Lq7o;->c:Ljg8;

    new-instance p1, Lq0n;

    const/16 p2, 0x18

    invoke-direct {p1, p2}, Lq0n;-><init>(B)V

    sget-object p2, Lrpb;->d:Lqpb;

    invoke-static {p2, p1}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object p1

    iput-object p1, p0, Lq7o;->d:Lcrb;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lo7o;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lo7o;

    iget v1, v0, Lo7o;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lo7o;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lo7o;

    invoke-direct {v0, p0, p2}, Lo7o;-><init>(Lq7o;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lo7o;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lo7o;->v:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Ludj;

    const/16 v2, 0xb

    invoke-direct {p2, p0, p1, v4, v2}, Ludj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v3, v0, Lo7o;->v:I

    iget-object p0, p0, Lq7o;->c:Ljg8;

    invoke-static {p0, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    check-cast p2, Lhra;

    if-eqz p2, :cond_54

    new-instance p0, Lfvh;

    invoke-direct {p0}, Lfvh;-><init>()V

    iput-object p2, p0, Lfvh;->a:Lhra;

    new-instance p1, Lkvh;

    invoke-direct {p1, p0}, Lkvh;-><init>(Lfvh;)V

    return-object p1

    :cond_54
    return-object v4
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p2, Lp7o;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lp7o;

    iget v1, v0, Lp7o;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lp7o;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lp7o;

    invoke-direct {v0, p0, p2}, Lp7o;-><init>(Lq7o;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lp7o;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lp7o;->w:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_42

    if-eq v2, v5, :cond_3e

    if-eq v2, v4, :cond_36

    if-ne v2, v3, :cond_30

    iget-object p0, v0, Lp7o;->t:Lpzh;

    :try_start_2c
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2c .. :try_end_2f} :catch_97
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2f} :catch_93
    .catchall {:try_start_2c .. :try_end_2f} :catchall_9d

    goto :goto_8f

    :cond_30
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_36
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p1, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_68

    :cond_3e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4d

    :cond_42
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput v5, v0, Lp7o;->w:I

    invoke-virtual {p0, p1, v0}, Lq7o;->a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_8d

    :goto_4d
    check-cast p2, Lkvh;

    if-nez p2, :cond_54

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :cond_54
    iget-object p1, p0, Lq7o;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lt9f;

    invoke-virtual {p1, p2}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p1

    iput v4, v0, Lp7o;->w:I

    invoke-static {p1, v0}, Lvtp;->p(Lokhttp3/internal/connection/RealCall;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_8d

    :goto_68
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p2

    if-nez p2, :cond_a9

    check-cast p1, Lpzh;

    :try_start_70
    iget-boolean p2, p1, Lpzh;->q:Z

    if-nez p2, :cond_7a

    sget-object p0, Ll08;->a:Ll08;
    :try_end_76
    .catchall {:try_start_70 .. :try_end_76} :catchall_9f

    invoke-virtual {p1}, Lpzh;->close()V

    return-object p0

    :cond_7a
    :try_start_7a
    iget-object p2, p0, Lq7o;->c:Ljg8;

    new-instance v2, Ludj;

    const/16 v4, 0xc

    invoke-direct {v2, p0, p1, v6, v4}, Ludj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object p1, v0, Lp7o;->t:Lpzh;

    iput v3, v0, Lp7o;->w:I

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2
    :try_end_8b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7a .. :try_end_8b} :catch_96
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_8b} :catch_92
    .catchall {:try_start_7a .. :try_end_8b} :catchall_9f

    if-ne p2, v1, :cond_8e

    :cond_8d
    return-object v1

    :cond_8e
    move-object p0, p1

    :goto_8f
    :try_start_8f
    check-cast p2, Ljava/util/List;
    :try_end_91
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8f .. :try_end_91} :catch_97
    .catch Ljava/io/IOException; {:try_start_8f .. :try_end_91} :catch_93
    .catchall {:try_start_8f .. :try_end_91} :catchall_9d

    goto :goto_99

    :catch_92
    move-object p0, p1

    :catch_93
    :try_start_93
    sget-object p2, Ll08;->a:Ll08;

    goto :goto_99

    :catch_96
    move-object p0, p1

    :catch_97
    sget-object p2, Ll08;->a:Ll08;
    :try_end_99
    .catchall {:try_start_93 .. :try_end_99} :catchall_9d

    :goto_99
    invoke-static {p0, v6}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object p2

    :catchall_9d
    move-exception p1

    goto :goto_a3

    :catchall_9f
    move-exception p0

    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :goto_a3
    :try_start_a3
    throw p1
    :try_end_a4
    .catchall {:try_start_a3 .. :try_end_a4} :catchall_a4

    :catchall_a4
    move-exception p2

    invoke-static {p0, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2

    :cond_a9
    sget-object p0, Ll08;->a:Ll08;

    return-object p0
.end method
