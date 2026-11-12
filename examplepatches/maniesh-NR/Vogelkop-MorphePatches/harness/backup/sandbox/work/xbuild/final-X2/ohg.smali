.class public final Lohg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkpo;

.field public final b:Lpfe;

.field public c:Lcqo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-class v0, Ljpo;

    monitor-enter v0

    :try_start_a
    sget-object v1, Ljpo;->a:Luko;

    if-nez v1, :cond_1c

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_15

    move-object p1, v1

    :cond_15
    new-instance v1, Luko;

    invoke-direct {v1, p1}, Luko;-><init>(Landroid/content/Context;)V

    sput-object v1, Ljpo;->a:Luko;
    :try_end_1c
    .catchall {:try_start_a .. :try_end_1c} :catchall_31

    :cond_1c
    monitor-exit v0

    iget-object p1, v1, Luko;->a:Lvlo;

    invoke-virtual {p1}, Lvlo;->a()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkpo;

    iput-object p1, p0, Lohg;->a:Lkpo;

    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    iput-object p1, p0, Lohg;->b:Lpfe;

    return-void

    :goto_2f
    :try_start_2f
    monitor-exit v0
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_31

    throw p0

    :catchall_31
    move-exception p0

    goto :goto_2f
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p1, Llhg;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Llhg;

    iget v1, v0, Llhg;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Llhg;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Llhg;

    invoke-direct {v0, p0, p1}, Llhg;-><init>(Lohg;Lnt5;)V

    :goto_18
    iget-object p1, v0, Llhg;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Llhg;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    return-object p1

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lc9p;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lohg;->a:Lkpo;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p0, Lkpo;->a:Lypo;

    const-wide v5, 0x2286724cafL

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    iget-object v6, v2, Lypo;->a:Ligp;

    const-string v7, "warmUpIntegrityToken(%s)"

    invoke-virtual {v6, v7, v5}, Ligp;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v5, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    new-instance v6, Lppo;

    invoke-direct {v6, v2, v5, v5}, Lppo;-><init>(Lypo;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    iget-object v2, v2, Lypo;->f:Lvko;

    invoke-virtual {v2, v6, v5}, Lvko;->c(Ldip;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    new-instance v5, Ltvk;

    invoke-direct {v5, p0, p1}, Ltvk;-><init>(Lkpo;Lc9p;)V

    invoke-virtual {v2, v5}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    iput v4, v0, Llhg;->v:I

    invoke-static {p0, v3, v0}, La4h;->b(Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/tasks/CancellationTokenSource;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_76

    return-object v1

    :cond_76
    return-object p0
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lmhg;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lmhg;

    iget v1, v0, Lmhg;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lmhg;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lmhg;

    invoke-direct {v0, p0, p2}, Lmhg;-><init>(Lohg;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lmhg;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lmhg;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    return-object p2

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p2, Lbb7;->a:Lcv6;

    sget-object p2, Ls6d;->a:Ld7a;

    iget-object p2, p2, Ld7a;->e:Ld7a;

    new-instance v2, Lqa6;

    const/4 v5, 0x5

    invoke-direct {v2, p1, p0, v3, v5}, Lqa6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lmhg;->v:I

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_46

    return-object v1

    :cond_46
    return-object p0
.end method

.method public final c(Lccp;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lnhg;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lnhg;

    iget v1, v0, Lnhg;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lnhg;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lnhg;

    invoke-direct {v0, p0, p2}, Lnhg;-><init>(Lohg;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lnhg;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lnhg;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    return-object p2

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p2, Lbb7;->a:Lcv6;

    sget-object p2, Ls6d;->a:Ld7a;

    iget-object p2, p2, Ld7a;->e:Ld7a;

    new-instance v2, Lqmb;

    const/16 v5, 0x19

    invoke-direct {v2, p0, p1, v3, v5}, Lqmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lnhg;->v:I

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_47

    return-object v1

    :cond_47
    return-object p0
.end method
