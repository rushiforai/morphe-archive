.class public final Lbk5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljk5;

.field public final b:Lik5;

.field public final c:Lqb7;

.field public final d:Ljw1;

.field public final e:Ljava/lang/Runnable;

.field public final f:Lkze;

.field public g:Llh4;

.field public h:Lzj5;


# direct methods
.method public constructor <init>(Ljk5;Lik5;Lqb7;Ljw1;Ljava/lang/Runnable;)V
    .registers 8

    new-instance v0, Lkze;

    sget-object v1, Lak5;->a:Lak5;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbk5;->a:Ljk5;

    iput-object p2, p0, Lbk5;->b:Lik5;

    iput-object p3, p0, Lbk5;->c:Lqb7;

    iput-object p4, p0, Lbk5;->d:Ljw1;

    iput-object p5, p0, Lbk5;->e:Ljava/lang/Runnable;

    iput-object v0, p0, Lbk5;->f:Lkze;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 4

    iget-object p0, p0, Lbk5;->f:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lak5;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_1d

    const/4 v1, 0x1

    if-eq p0, v1, :cond_1c

    const/4 v2, 0x2

    if-eq p0, v2, :cond_1c

    const/4 v1, 0x3

    if-eq p0, v1, :cond_1d

    invoke-static {}, Lh9o;->p()V

    return v0

    :cond_1c
    return v1

    :cond_1d
    return v0
.end method

.method public final b(Lp58;)Z
    .registers 5

    invoke-virtual {p0}, Lbk5;->a()Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v1, p0, Lbk5;->h:Lzj5;

    if-eqz v1, :cond_16

    iget-object v2, v1, Lzj5;->a:Ljava/lang/String;

    iget-object v1, v1, Lzj5;->b:Lgk5;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, v2, v1, p1}, Lbk5;->c(Ljava/lang/String;Lgk5;Ljava/util/List;)V

    return v0

    :cond_16
    iget-object p1, p0, Lbk5;->g:Llh4;

    const/4 v1, 0x0

    if-eqz p1, :cond_1f

    iput-object v1, p1, Llh4;->b:Lcom/opera/api/Callback;

    iput-object v1, p0, Lbk5;->g:Llh4;

    :cond_1f
    iget-object p1, p0, Lbk5;->a:Ljk5;

    iget-object v2, p1, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_24
    iput-object v1, p1, Ljk5;->e:Ljava/lang/String;
    :try_end_26
    .catchall {:try_start_24 .. :try_end_26} :catchall_2f

    monitor-exit v2

    iput-object v1, p0, Lbk5;->h:Lzj5;

    sget-object p1, Lak5;->a:Lak5;

    invoke-virtual {p0, p1}, Lbk5;->d(Lak5;)V

    return v0

    :catchall_2f
    move-exception p0

    monitor-exit v2

    throw p0

    :cond_32
    return v0
.end method

.method public final c(Ljava/lang/String;Lgk5;Ljava/util/List;)V
    .registers 7

    iget-object v0, p0, Lbk5;->a:Ljk5;

    iget-object v1, v0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x0

    :try_start_6
    iput-object v2, v0, Ljk5;->e:Ljava/lang/String;
    :try_end_8
    .catchall {:try_start_6 .. :try_end_8} :catchall_2a

    monitor-exit v1

    new-instance v0, Lck5;

    invoke-direct {v0, p1, p2, p3}, Lck5;-><init>(Ljava/lang/String;Lgk5;Ljava/util/List;)V

    iget-object p1, p0, Lbk5;->g:Llh4;

    if-eqz p1, :cond_16

    iput-object v2, p1, Llh4;->b:Lcom/opera/api/Callback;

    iput-object v2, p0, Lbk5;->g:Llh4;

    :cond_16
    iput-object v2, p0, Lbk5;->h:Lzj5;

    iget-object p1, p0, Lbk5;->a:Ljk5;

    iget-object p1, p1, Ljk5;->b:Lode;

    new-instance p2, Leb8;

    invoke-direct {p2, v0}, Leb8;-><init>(Lek5;)V

    invoke-virtual {p1, p2}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p1, Lak5;->a:Lak5;

    invoke-virtual {p0, p1}, Lbk5;->d(Lak5;)V

    return-void

    :catchall_2a
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final d(Lak5;)V
    .registers 3

    iget-object p0, p0, Lbk5;->f:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_b

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_b
    return-void
.end method

.method public final e(Ljava/lang/String;Lgk5;)Z
    .registers 8

    iget-object v0, p0, Lbk5;->f:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lak5;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1c

    if-eq v0, v2, :cond_1b

    const/4 p0, 0x2

    if-eq v0, p0, :cond_1b

    const/4 p0, 0x3

    if-eq v0, p0, :cond_1b

    invoke-static {}, Lh9o;->p()V

    :cond_1b
    return v1

    :cond_1c
    iget-object v0, p0, Lbk5;->a:Ljk5;

    iget-object v3, v0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v3

    :try_start_21
    iget-object v4, v0, Ljk5;->e:Ljava/lang/String;
    :try_end_23
    .catchall {:try_start_21 .. :try_end_23} :catchall_75

    if-eqz v4, :cond_27

    monitor-exit v3

    return v1

    :cond_27
    :try_start_27
    iput-object p1, v0, Ljk5;->e:Ljava/lang/String;
    :try_end_29
    .catchall {:try_start_27 .. :try_end_29} :catchall_75

    monitor-exit v3

    new-instance v0, Lzj5;

    invoke-direct {v0, p1, p2}, Lzj5;-><init>(Ljava/lang/String;Lgk5;)V

    iput-object v0, p0, Lbk5;->h:Lzj5;

    sget-object v0, Lak5;->b:Lak5;

    invoke-virtual {p0, v0}, Lbk5;->d(Lak5;)V

    new-instance v0, Llh4;

    new-instance v3, Lsu;

    const/16 v4, 0x10

    invoke-direct {v3, p0, p2, p1, v4}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v3, v1}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object v0, p0, Lbk5;->g:Llh4;

    iget-object p0, p0, Lbk5;->b:Lik5;

    new-instance p2, Lhk5;

    iget-object v1, p0, Lik5;->a:Lumi;

    new-instance v3, Lki5;

    const/4 v4, 0x6

    invoke-direct {v3, v4}, Lki5;-><init>(B)V

    invoke-direct {p2, v1, v3, v0}, Lhk5;-><init>(Lumi;Lki5;Llh4;)V

    iget-object v0, p0, Lik5;->b:Llpe;

    iget-object v1, v0, Llpe;->B:Lks3;

    iget-object v3, v1, Lks3;->i:Ljava/lang/Object;

    check-cast v3, Ld3k;

    const/4 v4, 0x0

    if-eqz v3, :cond_61

    invoke-virtual {v3, v4}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_61
    iput-object v4, v1, Lks3;->i:Ljava/lang/Object;

    iget-object v1, v1, Lks3;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    new-instance v1, Lf9;

    const/16 v3, 0x17

    invoke-direct {v1, p2, p0, p1, v3}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Llpe;->a(Lkotlin/jvm/functions/Function1;)V

    return v2

    :catchall_75
    move-exception p0

    monitor-exit v3

    throw p0
.end method
