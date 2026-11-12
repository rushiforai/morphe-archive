.class public final Lgmc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lj4c;

.field public final b:Lnx5;

.field public final c:Ldx5;

.field public final d:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final e:Ljava/util/LinkedHashMap;

.field public final f:Lpfe;

.field public final g:Lnak;

.field public final h:Lnak;

.field public final i:Lnak;

.field public final j:Lnak;

.field public final k:Lnak;

.field public final l:Lnak;

.field public final m:Lnak;

.field public final n:Lnak;

.field public final o:Lrlh;

.field public final p:Lrlh;

.field public final q:Lrlh;

.field public final r:Lrlh;

.field public final s:Lrlh;

.field public final t:Lrlh;

.field public final u:Lrlh;

.field public final v:Lrlh;


# direct methods
.method public constructor <init>(Lj4c;Ljg8;Lnx5;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgmc;->a:Lj4c;

    iput-object p3, p0, Lgmc;->b:Lnx5;

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Ldx5;->K(ILjava/lang/String;)Ldx5;

    move-result-object p1

    iput-object p1, p0, Lgmc;->c:Ldx5;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Lgmc;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lgmc;->e:Ljava/util/LinkedHashMap;

    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    iput-object p1, p0, Lgmc;->f:Lpfe;

    sget-object p1, Ll08;->a:Ll08;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p2

    iput-object p2, p0, Lgmc;->g:Lnak;

    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v1

    iput-object v1, p0, Lgmc;->h:Lnak;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v2

    iput-object v2, p0, Lgmc;->i:Lnak;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v3

    iput-object v3, p0, Lgmc;->j:Lnak;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v4

    iput-object v4, p0, Lgmc;->k:Lnak;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v5

    iput-object v5, p0, Lgmc;->l:Lnak;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lgmc;->m:Lnak;

    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v6

    iput-object v6, p0, Lgmc;->n:Lnak;

    invoke-static {p2}, La26;->j(Lnak;)Lrlh;

    move-result-object p2

    iput-object p2, p0, Lgmc;->o:Lrlh;

    invoke-static {v1}, La26;->j(Lnak;)Lrlh;

    move-result-object p2

    iput-object p2, p0, Lgmc;->p:Lrlh;

    invoke-static {v2}, La26;->j(Lnak;)Lrlh;

    move-result-object p2

    iput-object p2, p0, Lgmc;->q:Lrlh;

    invoke-static {v3}, La26;->j(Lnak;)Lrlh;

    move-result-object p2

    iput-object p2, p0, Lgmc;->r:Lrlh;

    invoke-static {v4}, La26;->j(Lnak;)Lrlh;

    move-result-object p2

    iput-object p2, p0, Lgmc;->s:Lrlh;

    invoke-static {v5}, La26;->j(Lnak;)Lrlh;

    move-result-object p2

    iput-object p2, p0, Lgmc;->t:Lrlh;

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lgmc;->u:Lrlh;

    invoke-static {v6}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lgmc;->v:Lrlh;

    new-instance p1, Lagb;

    const/4 p2, 0x3

    invoke-direct {p1, p2, v0, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p3, v0, v0, p1, p2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p2, Lylc;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lylc;

    iget v1, v0, Lylc;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lylc;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lylc;

    invoke-direct {v0, p0, p2}, Lylc;-><init>(Lgmc;Lmt5;)V

    :goto_18
    iget-object p2, v0, Lylc;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lylc;->w:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_3e

    if-eq v2, v5, :cond_3a

    if-eq v2, v4, :cond_36

    if-eq v2, v3, :cond_30

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_30
    iget-object p0, v0, Lylc;->t:Ljava/lang/Throwable;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6d

    :cond_36
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5d

    :cond_3a
    :try_start_3a
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_3d
    .catchall {:try_start_3a .. :try_end_3d} :catchall_60

    goto :goto_55

    :cond_3e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Lgmc;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    :try_start_46
    iget-object p2, p0, Lgmc;->c:Ldx5;

    new-instance v2, Lwc2;

    invoke-direct {v2, p1, v6, v5}, Lwc2;-><init>(Lkotlin/jvm/functions/Function1;Lmt5;B)V

    iput v5, v0, Lylc;->w:I

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1
    :try_end_53
    .catchall {:try_start_46 .. :try_end_53} :catchall_60

    if-eq p1, v1, :cond_6b

    :goto_55
    iput v4, v0, Lylc;->w:I

    invoke-virtual {p0, v0}, Lgmc;->b(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_6b

    :goto_5d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_60
    move-exception p1

    iput-object p1, v0, Lylc;->t:Ljava/lang/Throwable;

    iput v3, v0, Lylc;->w:I

    invoke-virtual {p0, v0}, Lgmc;->b(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6c

    :cond_6b
    return-object v1

    :cond_6c
    move-object p0, p1

    :goto_6d
    throw p0
.end method

.method public final b(Lmt5;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lgmc;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_20

    new-instance v0, Lfmc;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfmc;-><init>(Lgmc;Lmt5;)V

    iget-object p0, p0, Lgmc;->c:Ldx5;

    invoke-static {p0, v0, p1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-eq p0, p1, :cond_1a

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_1a
    if-ne p0, p1, :cond_1d

    return-object p0

    :cond_1d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_20
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final c(JLoi9;Lkuk;)Ljava/lang/Object;
    .registers 11

    new-instance v0, Lamc;

    const/4 v5, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lamc;-><init>(Lgmc;JLoi9;Lmt5;)V

    invoke-virtual {v1, v0, p4}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_12

    return-object p0

    :cond_12
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final d(Lkotlin/jvm/functions/Function1;)V
    .registers 5

    iget-object v0, p0, Lgmc;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    new-instance v0, Lhz1;

    const/16 v1, 0x10

    const/4 v2, 0x0

    invoke-direct {v0, p1, p0, v2, v1}, Lhz1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    iget-object p0, p0, Lgmc;->b:Lnx5;

    invoke-static {p0, v2, v2, v0, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final e(Lruc;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lcmc;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lcmc;

    iget v1, v0, Lcmc;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lcmc;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lcmc;

    invoke-direct {v0, p0, p2}, Lcmc;-><init>(Lgmc;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lcmc;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lcmc;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2f

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_65

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2f
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p1, Lruc;->k:Ljava/lang/String;

    const-string v2, "in progress"

    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_49

    iget-object p2, p1, Lruc;->k:Ljava/lang/String;

    const-string v2, "not started"

    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_49

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_49
    iget-object p0, p0, Lgmc;->a:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwlc;

    iget-wide p1, p1, Lruc;->a:J

    iput v4, v0, Lcmc;->v:I

    iget-object p0, p0, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v2, Lx41;

    const/16 v5, 0xa

    invoke-direct {v2, p1, p2, v5}, Lx41;-><init>(JB)V

    invoke-static {v0, p0, v4, v3, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_65

    return-object v1

    :cond_65
    :goto_65
    if-eqz p2, :cond_68

    move v3, v4

    :cond_68
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final f(Ljava/util/Map;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p2, Ldmc;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ldmc;

    iget v1, v0, Ldmc;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ldmc;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Ldmc;

    invoke-direct {v0, p0, p2}, Ldmc;-><init>(Lgmc;Lnt5;)V

    :goto_18
    iget-object p2, v0, Ldmc;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ldmc;->x:I

    const/4 v3, 0x0

    iget-object p0, p0, Lgmc;->a:Lj4c;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_42

    if-eq v2, v6, :cond_3a

    if-ne v2, v4, :cond_34

    iget-object p1, v0, Ldmc;->u:Ljava/util/Iterator;

    iget-object v2, v0, Ldmc;->t:Ljava/util/Map;

    check-cast v2, Ljava/util/Map;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_69

    :cond_34
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_3a
    iget-object p1, v0, Ldmc;->t:Ljava/util/Map;

    check-cast p1, Ljava/util/Map;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_61

    :cond_42
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lwlc;

    move-object v2, p1

    check-cast v2, Ljava/util/Map;

    iput-object v2, v0, Ldmc;->t:Ljava/util/Map;

    iput v6, v0, Ldmc;->x:I

    iget-object p2, p2, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v2, Lg8c;

    const/16 v7, 0xe

    invoke-direct {v2, v7}, Lg8c;-><init>(B)V

    invoke-static {v0, p2, v3, v6, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_a0

    :goto_61
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_69
    :goto_69
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_a1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    iput-object v5, v0, Ldmc;->t:Ljava/util/Map;

    iput-object p1, v0, Ldmc;->u:Ljava/util/Iterator;

    iput v4, v0, Ldmc;->x:I

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwlc;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v2, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v8, Lvlc;

    invoke-direct {v8, v2, p2, v6}, Lvlc;-><init>(Lwlc;Ljava/util/List;B)V

    invoke-static {v0, v7, v3, v6, v8}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p2

    sget-object v2, Lpx5;->a:Lpx5;

    if-eq p2, v2, :cond_9e

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_9e
    if-ne p2, v1, :cond_69

    :cond_a0
    return-object v1

    :cond_a1
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final g(Ljava/util/List;Lkuk;)Ljava/lang/Object;
    .registers 6

    new-instance v0, Lu11;

    const/4 v1, 0x0

    const/16 v2, 0x12

    invoke-direct {v0, p0, p1, v1, v2}, Lu11;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-virtual {p0, v0, p2}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_11

    return-object p0

    :cond_11
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
