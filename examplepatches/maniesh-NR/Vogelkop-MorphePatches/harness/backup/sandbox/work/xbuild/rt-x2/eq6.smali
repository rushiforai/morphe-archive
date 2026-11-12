.class public final Leq6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lssf;
.implements Lwn8;
.implements Lkc9;
.implements Lkkm;
.implements Lkm3;
.implements Liv5;
.implements Lqo3;
.implements Lxan;


# instance fields
.field public a:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    sparse-switch p1, :sswitch_data_26

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Leq6;->a:Ljava/lang/Object;

    return-void

    :sswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Leq6;->a:Ljava/lang/Object;

    return-void

    :sswitch_15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ly55;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lxq0;

    invoke-direct {v0, p1}, Lxq0;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Leq6;->a:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_26
    .sparse-switch
        0x7 -> :sswitch_15
        0x10 -> :sswitch_e
    .end sparse-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 41
    iput-object p1, p0, Leq6;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/net/CookieManager;)V
    .registers 3

    .line 38
    new-instance v0, Lvmb;

    invoke-direct {v0, p1}, Lvmb;-><init>(Ljava/net/CookieManager;)V

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object v0, p0, Leq6;->a:Ljava/lang/Object;

    return-void
.end method

.method public static M(Leq6;I)Lt5c;
    .registers 12

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lu6c;

    invoke-static {}, Lbwg;->t()Lttj;

    move-result-object v1

    if-eqz v1, :cond_10

    invoke-virtual {v1}, Lttj;->e()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    :goto_e
    move-object v2, v0

    goto :goto_12

    :cond_10
    const/4 v0, 0x0

    goto :goto_e

    :goto_12
    invoke-static {v1}, Lbwg;->x(Lttj;)Lttj;

    move-result-object v3

    :try_start_16
    iget-object v0, p0, Lu6c;->f:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm6c;
    :try_end_1e
    .catchall {:try_start_16 .. :try_end_1e} :catchall_32

    invoke-static {v1, v3, v2}, Lbwg;->A(Lttj;Lttj;Lkotlin/jvm/functions/Function1;)V

    iget-object v4, p0, Lu6c;->q:Lu5c;

    iget-wide v6, v0, Lm6c;->j:J

    iget-boolean v8, p0, Lu6c;->d:Z

    new-instance v9, Lgbb;

    invoke-direct {v9, p1, v0}, Lgbb;-><init>(ILm6c;)V

    move v5, p1

    invoke-virtual/range {v4 .. v9}, Lu5c;->a(IJZLkotlin/jvm/functions/Function1;)Lt5c;

    move-result-object p0

    return-object p0

    :catchall_32
    move-exception v0

    move-object p0, v0

    invoke-static {v1, v3, v2}, Lbwg;->A(Lttj;Lttj;Lkotlin/jvm/functions/Function1;)V

    throw p0
.end method


# virtual methods
.method public final A(Lzc7;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final B(Lf75;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final C(Lkvj;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final D(Liva;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final E()Ljava/io/InputStream;
    .registers 2

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, [B

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public final F(Lk66;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final G(Lnj3;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final H(Ljava/io/ByteArrayOutputStream;Lrsf;)V
    .registers 3

    check-cast p2, Lae7;

    iget-object p0, p2, Lae7;->b:Lu56;

    sget p2, Lxq0;->d:I

    new-instance p2, Ljava/io/DataOutputStream;

    invoke-direct {p2, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 p1, 0x2

    :try_start_c
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {p2, p0}, Lxq0;->d4(Ljava/io/DataOutputStream;Lu56;)V
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_16

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void

    :catchall_16
    move-exception p0

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    throw p0
.end method

.method public final I()Liak;
    .registers 5

    invoke-static {}, Lxx7;->a()Lxx7;

    move-result-object v0

    invoke-virtual {v0}, Lxx7;->c()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_11

    new-instance p0, Lu0b;

    invoke-direct {p0, v2}, Lu0b;-><init>(Z)V

    return-object p0

    :cond_11
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v1

    new-instance v2, Lkr6;

    const/4 v3, 0x0

    invoke-direct {v2, v1, p0, v3}, Lkr6;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lxx7;->l(Lwxe;)V

    return-object v1
.end method

.method public final J(Ljava/util/Map;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lov6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lov6;

    iget v1, v0, Lov6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lov6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lov6;

    invoke-direct {v0, p0, p2}, Lov6;-><init>(Leq6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lov6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lov6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lu11;

    const/16 v2, 0xb

    invoke-direct {p2, p0, p1, v3, v2}, Lu11;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lov6;->v:I

    invoke-static {p2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_45

    return-object v1

    :cond_45
    return-object p0
.end method

.method public final K()V
    .registers 5

    iget-object v0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lbpd;

    iget-object v1, v0, Lbpd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    const/4 v2, 0x0

    :goto_9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_31

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lem8;

    iget-object v3, v3, Lem8;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p0, :cond_2e

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_31

    iget-object p0, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lqim;

    invoke-virtual {p0}, Lqim;->a()V

    return-void

    :cond_2e
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_31
    return-void
.end method

.method public final L(Lrnd;Lbnd;Ljava/util/ArrayList;)V
    .registers 13

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lez9;

    iget-object p0, v0, Lez9;->z:Lrnd;

    if-ne p1, p0, :cond_39

    if-eqz p2, :cond_39

    iget-object p0, v0, Lez9;->y:Lcod;

    iget-object p0, p0, Lcod;->a:Lbod;

    invoke-virtual {p2}, Lbnd;->d()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lez9;->b(Lbod;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lynd;

    invoke-direct {v2, p0, p1, v1}, Lynd;-><init>(Lbod;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Lcod;->i(Lbnd;)I

    iget-object p0, v0, Lez9;->d:Lcod;

    if-eq p0, v2, :cond_50

    iget-object v3, v0, Lez9;->z:Lrnd;

    iget v5, v0, Lez9;->A:I

    const/4 v6, 0x1

    iget-object v7, v0, Lez9;->y:Lcod;

    const/4 v4, 0x3

    move-object v1, v0

    move-object v8, p3

    invoke-virtual/range {v0 .. v8}, Lez9;->k(Lez9;Lcod;Lsnd;IIZLcod;Ljava/util/ArrayList;)V

    const/4 p0, 0x0

    iput-object p0, v0, Lez9;->y:Lcod;

    iput-object p0, v0, Lez9;->z:Lrnd;

    const/4 p0, 0x0

    iput p0, v0, Lez9;->A:I

    return-void

    :cond_39
    move-object v8, p3

    iget-object p0, v0, Lez9;->e:Lsnd;

    if-ne p1, p0, :cond_50

    if-eqz p2, :cond_45

    iget-object p0, v0, Lez9;->d:Lcod;

    invoke-virtual {v0, p0, p2}, Lez9;->q(Lcod;Lbnd;)I

    :cond_45
    iget-object p0, v0, Lez9;->d:Lcod;

    invoke-virtual {p0}, Lcod;->a()Lynd;

    move-result-object p0

    if-eqz p0, :cond_50

    invoke-virtual {p0, v8}, Lynd;->p(Ljava/util/ArrayList;)V

    :cond_50
    return-void
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 5

    check-cast p1, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {p1, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    new-instance v1, Lguh;

    const/4 v2, -0x1

    invoke-direct {v1, v0, v2}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2f
    new-instance p1, Le5d;

    sget-object v0, Ll08;->a:Ll08;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v0, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final P()V
    .registers 4

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lewa;

    iget-object v0, p0, Lewa;->t:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v0

    :try_start_7
    iget-object v1, p0, Lewa;->t:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_14

    monitor-exit v0

    return-void

    :cond_14
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0}, Lewa;->K()I

    move-result v2

    if-eq v1, v2, :cond_21

    invoke-virtual {p0}, Lewa;->N()V

    :cond_21
    monitor-exit v0

    return-void

    :goto_23
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_7 .. :try_end_24} :catchall_25

    throw p0

    :catchall_25
    move-exception p0

    goto :goto_23
.end method

.method public final Q(Lks3;)V
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lhvj;

    invoke-direct {v1, p1}, Lhvj;-><init>(Lks3;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_5d

    :try_start_6
    new-instance p1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_14
    .catchall {:try_start_6 .. :try_end_14} :catchall_5b

    :try_start_14
    invoke-static {p1}, Lfsp;->F(Ljava/io/BufferedInputStream;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_4f

    iput-object p0, v1, Lhvj;->b:Ljava/lang/String;

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "--"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v1, Lhvj;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\r\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lhvj;->c:Ljava/lang/String;

    new-instance p0, Ljava/net/URL;

    const-string v0, "https://crashstats-collector.opera.com/collector/submit"

    invoke-direct {p0, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Lhvj;->h(Ljava/net/URL;)V

    invoke-virtual {v1}, Lhvj;->l()V

    iget-object p0, v1, Lhvj;->e:Ljava/util/zip/GZIPOutputStream;

    invoke-static {p1, p0}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v1}, Lhvj;->l()V
    :try_end_48
    .catchall {:try_start_14 .. :try_end_48} :catchall_59

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v1}, Lhvj;->close()V

    return-void

    :cond_4f
    :try_start_4f
    new-instance p0, Lf13;

    const-string v0, "Bad MIME boundary"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_57
    .catchall {:try_start_4f .. :try_end_57} :catchall_59

    :goto_57
    move-object v0, p1

    goto :goto_5f

    :catchall_59
    move-exception p0

    goto :goto_57

    :catchall_5b
    move-exception p0

    goto :goto_5f

    :catchall_5d
    move-exception p0

    move-object v1, v0

    :goto_5f
    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    if-eqz v1, :cond_67

    invoke-virtual {v1}, Lhvj;->close()V

    :cond_67
    throw p0
.end method

.method public final R(Lk73;)V
    .registers 3

    iget-object p1, p1, Lk73;->c:Ljava/lang/Object;

    check-cast p1, Lk73;

    :goto_4
    if-eqz p1, :cond_f

    iget-object v0, p1, Lk73;->f:Ljava/lang/Object;

    check-cast v0, Lk73;

    invoke-virtual {p1, p0}, Lk73;->a(Lxan;)V

    move-object p1, v0

    goto :goto_4

    :cond_f
    return-void
.end method

.method public final a(I)V
    .registers 3

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lh2b;

    sget-object v0, Lnl3;->b:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lulp;->C(I)Lnl3;

    const-string p1, ""

    invoke-virtual {p0, p1}, Lh2b;->f(Ljava/lang/String;)V

    return-void
.end method

.method public final b()Lrsf;
    .registers 3

    new-instance v0, Lae7;

    invoke-static {}, Ly55;->w()Lu56;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lae7;-><init>(Leq6;Lu56;)V

    return-object v0
.end method

.method public final c(Lnel;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final d(Lbsf;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final e(J)V
    .registers 13

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lh2b;

    iget-object v0, p0, Lh2b;->c:Lorm;

    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    const/4 v2, 0x1

    if-lez v1, :cond_f

    move v1, v2

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    if-eqz v1, :cond_1d

    const/16 v3, 0x10

    move-object v4, v0

    check-cast v4, Lx5f;

    invoke-virtual {v4, v3}, Lx5f;->S(I)V

    sget-object v3, Lz80;->g:Lz80;

    goto :goto_1f

    :cond_1d
    sget-object v3, Lz80;->h:Lz80;

    :goto_1f
    move-object v4, v0

    check-cast v4, Lx5f;

    invoke-virtual {v4, v3}, Lx5f;->X(Lz80;)V

    iget-object p0, p0, Lh2b;->d:Lskm;

    check-cast p0, Lx5f;

    iget-object v3, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object v3

    const/4 v5, 0x5

    invoke-virtual {v3, v5, v2, v1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v4}, Lx5f;->U0(Lx56;)V

    sget-object p0, Lw2b;->c:Lw2b;

    sget-object v2, Lc3b;->b:Lc3b;

    sget-object v3, Lv2b;->b:Lv2b;

    if-eqz v1, :cond_45

    sget-object v1, Leb0;->b:Leb0;

    goto :goto_47

    :cond_45
    sget-object v1, Leb0;->d:Leb0;

    :goto_47
    check-cast v0, Lx5f;

    invoke-virtual {v0, p0, v2, v3, v1}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    new-instance v4, Lk3b;

    const/4 v8, 0x0

    const/16 v9, 0xc

    const/4 v5, 0x1

    move-wide v6, p1

    invoke-direct/range {v4 .. v9}, Lk3b;-><init>(IJLjava/lang/String;I)V

    invoke-static {v4}, Lac8;->b(Ljava/lang/Object;)V

    return-void
.end method

.method public final f()Ljava/lang/Object;
    .registers 9

    new-instance v0, Lr38;

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lami;

    iget-object v1, p0, Lami;->b:Ljava/lang/Object;

    check-cast v1, Lwy9;

    iget-object v2, p0, Lami;->c:Ljava/lang/Object;

    check-cast v2, Lwy9;

    iget-object v3, p0, Lami;->d:Ljava/lang/Object;

    check-cast v3, Lwy9;

    iget-object v4, p0, Lami;->e:Ljava/lang/Object;

    check-cast v4, Lwy9;

    iget-object v5, p0, Lami;->f:Ljava/lang/Object;

    check-cast v5, Lf38;

    iget-object v6, p0, Lami;->g:Ljava/lang/Object;

    check-cast v6, Lf38;

    iget-object p0, p0, Lami;->h:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Lua7;

    invoke-direct/range {v0 .. v7}, Lr38;-><init>(Lwy9;Lwy9;Lwy9;Lwy9;Lf38;Lf38;Lua7;)V

    return-object v0
.end method

.method public final g(Lk9a;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final h(Lmma;)V
    .registers 13

    iget-object v0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lks3;

    iget-object v1, v0, Lks3;->f:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lks3;->e:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, p1, Lk73;->c:Ljava/lang/Object;

    check-cast v3, Lk73;

    if-nez v3, :cond_8f

    iget-object v3, p1, Lmma;->g:Ljava/lang/String;

    const/4 v4, 0x6

    const/4 v5, 0x0

    invoke-static {v3, v2, v5, v5, v4}, Lkotlin/text/StringsKt;->L(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v4

    const/4 v6, -0x1

    if-le v4, v6, :cond_47

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    move v8, v5

    :goto_27
    if-ge v2, v7, :cond_3f

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x22

    if-eq v9, v10, :cond_3a

    const/16 v10, 0x3e

    if-ne v9, v10, :cond_3c

    if-nez v8, :cond_3c

    add-int/lit8 v2, v2, 0x1

    goto :goto_40

    :cond_3a
    xor-int/lit8 v8, v8, 0x1

    :cond_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    :cond_3f
    move v2, v6

    :goto_40
    if-le v2, v6, :cond_47

    invoke-static {v4, v2}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v2

    goto :goto_4e

    :cond_47
    sget-object v2, Lkotlin/ranges/IntRange;->e:Lbcb;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lkotlin/ranges/IntRange;->f:Lkotlin/ranges/IntRange;

    :goto_4e
    invoke-virtual {v2}, Lkotlin/ranges/IntRange;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8f

    iget-object v3, p1, Lmma;->g:Ljava/lang/String;

    iget v4, v2, Lkotlin/ranges/a;->a:I

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_8f

    iget-object p0, p1, Lmma;->g:Ljava/lang/String;

    iget v3, v2, Lkotlin/ranges/a;->b:I

    add-int/lit8 v3, v3, 0x1

    const/4 v4, 0x4

    invoke-static {p0, v1, v3, v5, v4}, Lkotlin/text/StringsKt;->L(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result p0

    if-le p0, v6, :cond_84

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, p0

    invoke-static {p0, v1}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object p0

    invoke-virtual {v0, p1, v2, p0}, Lks3;->y(Lmma;Lkotlin/ranges/IntRange;Lkotlin/ranges/IntRange;)V

    return-void

    :cond_84
    sget-object p0, Lkotlin/ranges/IntRange;->e:Lbcb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lkotlin/ranges/IntRange;->f:Lkotlin/ranges/IntRange;

    invoke-virtual {v0, p1, v2, p0}, Lks3;->y(Lmma;Lkotlin/ranges/IntRange;Lkotlin/ranges/IntRange;)V

    return-void

    :cond_8f
    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final i(Lhra;Ljava/util/List;)V
    .registers 3

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lvmb;

    invoke-virtual {p0, p1, p2}, Lvmb;->i(Lhra;Ljava/util/List;)V

    return-void
.end method

.method public final j(Ltik;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final k(Lbll;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final l(Lxy8;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final length()J
    .registers 3

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, [B

    if-nez p0, :cond_9

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_9
    array-length p0, p0

    int-to-long v0, p0

    return-wide v0
.end method

.method public final m()Llak;
    .registers 1

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lrlh;

    return-object p0
.end method

.method public final n(Lqz7;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final o(Lkal;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final p(Ll7a;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final q(Lszf;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final r(Lmfc;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final s(Lphc;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final t(Le5d;)V
    .registers 4

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Ldda;

    iget-object p0, p0, Ldda;->A:Lztn;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_10
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v1, p0, Lztn;->f:Ljava/util/HashSet;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_24
    invoke-virtual {p0}, Lztn;->M()V

    return-void
.end method

.method public final u(Lxfc;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final v(Ljava/io/ByteArrayInputStream;)Lrsf;
    .registers 5

    invoke-static {}, Ly55;->w()Lu56;

    move-result-object v0

    iget-object v1, p0, Leq6;->a:Ljava/lang/Object;

    check-cast v1, Lxq0;

    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_d
    invoke-virtual {v1, v2}, Lxq0;->K2(Ljava/io/DataInputStream;)V

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readShort()S

    move-result p1

    invoke-virtual {v1, v2, v0, p1}, Lxq0;->Y0(Ljava/io/DataInputStream;Lu56;I)V
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_20

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    new-instance p1, Lae7;

    invoke-direct {p1, p0, v0}, Lae7;-><init>(Leq6;Lu56;)V

    return-object p1

    :catchall_20
    move-exception p0

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw p0
.end method

.method public final w(Lhra;)Ljava/util/List;
    .registers 2

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lvmb;

    invoke-virtual {p0, p1}, Lvmb;->w(Lhra;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final x(Lh14;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final y(Lyma;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method

.method public final z(Lu5b;)V
    .registers 2

    invoke-virtual {p0, p1}, Leq6;->R(Lk73;)V

    return-void
.end method
