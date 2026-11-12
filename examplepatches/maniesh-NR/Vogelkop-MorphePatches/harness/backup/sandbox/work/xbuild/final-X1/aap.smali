.class public abstract Laap;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lzyk;

.field public static final b:Lzyk;

.field public static volatile c:Lz8p;

.field public static final d:Lpfe;

.field public static final e:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static f:J

.field public static g:Ld3k;

.field public static h:Ld3k;

.field public static final i:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lxvo;->n:Lxvo;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Laap;->a:Lzyk;

    sget-object v0, Lxvo;->o:Lxvo;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Laap;->b:Lzyk;

    new-instance v0, Lpfe;

    invoke-direct {v0}, Lpfe;-><init>()V

    sput-object v0, Laap;->d:Lpfe;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Laap;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-wide/16 v0, -0x1

    sput-wide v0, Laap;->f:J

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Laap;->i:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static final a(Landroid/app/Application;Lnt5;)Ljava/io/Serializable;
    .registers 14

    instance-of v0, p1, Li9p;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Li9p;

    iget v1, v0, Li9p;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Li9p;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Li9p;

    invoke-direct {v0, p1}, Lnt5;-><init>(Lmt5;)V

    :goto_18
    iget-object p1, v0, Li9p;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Li9p;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v9, 0x0

    if-eqz v2, :cond_3c

    if-eq v2, v4, :cond_32

    if-ne v2, v3, :cond_2b

    :try_start_27
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_82

    goto :goto_7d

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    iget-object p0, v0, Li9p;->u:Ljava/lang/String;

    iget-object v2, v0, Li9p;->t:Landroid/app/Application;

    :try_start_36
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_82

    move-object v6, p0

    move-object v8, v2

    goto :goto_5d

    :cond_3c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_3f
    sget-object p1, Lt0i;->b:Lp0i;

    invoke-static {}, Lynh;->c()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Ls6d;->a:Ld7a;

    new-instance v5, Ldno;

    invoke-direct {v5, p0, v9, v4}, Ldno;-><init>(Landroid/app/Application;Lmt5;B)V

    iput-object p0, v0, Li9p;->t:Landroid/app/Application;

    iput-object p1, v0, Li9p;->u:Ljava/lang/String;

    iput v4, v0, Li9p;->w:I

    invoke-static {v2, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_7c

    move-object v8, p0

    move-object v6, p1

    move-object p1, v2

    :goto_5d
    move-object v7, p1

    check-cast v7, Lp5p;

    sget-object p0, Laap;->a:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlin/coroutines/CoroutineContext;

    new-instance v5, Lk54;

    const/16 v10, 0xc

    const/4 v11, 0x0

    invoke-direct/range {v5 .. v11}, Lk54;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;BZ)V

    iput-object v9, v0, Li9p;->t:Landroid/app/Application;

    iput-object v9, v0, Li9p;->u:Ljava/lang/String;

    iput v3, v0, Li9p;->w:I

    invoke-static {p0, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_7d

    :cond_7c
    return-object v1

    :cond_7d
    :goto_7d
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object p1, Lt0i;->b:Lp0i;
    :try_end_81
    .catchall {:try_start_3f .. :try_end_81} :catchall_82

    goto :goto_8c

    :catchall_82
    move-exception v0

    move-object p0, v0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_8c
    invoke-static {p0}, Luyg;->h(Ljava/lang/Object;)V

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    instance-of v0, p0, Lq0i;

    if-eqz v0, :cond_96

    move-object p0, p1

    :cond_96
    return-object p0
.end method

.method public static final b(JZ)Ljava/lang/String;
    .registers 13

    if-nez p2, :cond_7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr p0, v0

    :cond_7
    const-wide/16 v0, 0x0

    cmp-long p2, p0, v0

    if-gez p2, :cond_e

    neg-long p0, p0

    :cond_e
    const-wide/16 v2, 0x3e8

    div-long/2addr p0, v2

    const-wide/32 v2, 0x15180

    div-long v4, p0, v2

    rem-long v2, p0, v2

    const-wide/16 v6, 0xe10

    div-long/2addr v2, v6

    rem-long v6, p0, v6

    const-wide/16 v8, 0x3c

    div-long/2addr v6, v8

    rem-long/2addr p0, v8

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    cmp-long v9, v4, v0

    if-lez v9, :cond_3e

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "d "

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3e
    cmp-long v4, v2, v0

    if-lez v4, :cond_56

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "h "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_56
    cmp-long v2, v6, v0

    if-lez v2, :cond_6e

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "m "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6e
    cmp-long v0, p0, v0

    if-gtz v0, :cond_78

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_8c

    :cond_78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x73

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_8c
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    if-gez p2, :cond_99

    const-string p1, " ago"

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_99
    const-string p1, "in "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final c(Landroid/content/Context;Ljava/lang/String;)V
    .registers 12

    if-eqz p1, :cond_69

    invoke-static {p1}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    move-object v8, p1

    goto :goto_c

    :cond_b
    move-object v8, v1

    :goto_c
    if-eqz v8, :cond_69

    sget-object p1, Lpn7;->b:Lon7;

    sget-object p1, Lcbp;->b:Landroid/app/Application;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sget-wide v4, Lcbp;->a:J

    sub-long/2addr v2, v4

    sget-object p1, Lun7;->d:Lun7;

    invoke-static {v2, v3, p1}, Lcs5;->y0(JLun7;)J

    move-result-wide v2

    sget-object p1, Lun7;->e:Lun7;

    invoke-static {v2, v3, p1}, Lpn7;->p(JLun7;)J

    move-result-wide v2

    const-wide/16 v4, 0x14

    cmp-long v0, v2, v4

    if-gez v0, :cond_3b

    sub-long/2addr v4, v2

    sget-object v0, Luih;->a:Ltih;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Luih;->b:Lk6;

    const-wide/16 v2, 0x28

    invoke-virtual {v0, v2, v3}, Luih;->n(J)J

    move-result-wide v2

    add-long/2addr v2, v4

    goto :goto_50

    :cond_3b
    const-wide/16 v4, 0x3c

    cmp-long v0, v2, v4

    if-gez v0, :cond_4e

    sget-object v0, Luih;->a:Ltih;

    sub-long/2addr v4, v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Luih;->b:Lk6;

    invoke-virtual {v0, v4, v5}, Luih;->n(J)J

    move-result-wide v2

    goto :goto_50

    :cond_4e
    const-wide/16 v2, 0x0

    :goto_50
    sget-object v0, La3p;->h0:Ljava/util/Map;

    invoke-static {v2, v3, p1}, Lcs5;->y0(JLun7;)J

    move-result-wide v3

    const/16 v0, 0x1e

    invoke-static {v0, p1}, Lcs5;->x0(ILun7;)J

    move-result-wide v5

    sget-object p1, Lw2p;->a:La64;

    new-instance v2, Li2p;

    const/4 v9, 0x0

    move-object v7, p0

    invoke-direct/range {v2 .. v9}, Li2p;-><init>(JJLandroid/content/Context;Ljava/lang/String;Lmt5;)V

    const/4 p0, 0x3

    invoke-static {p1, v1, v1, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_69
    return-void
.end method

.method public static final d(Landroid/app/Application;)V
    .registers 5

    invoke-static {}, Lpfp;->b()Z

    sget-object v0, Laap;->h:Ld3k;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lxob;->isActive()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    return-void

    :cond_f
    sget-object v0, Lw2p;->a:La64;

    new-instance v1, Lfno;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3, v2}, Lfno;-><init>(Landroid/app/Application;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p0

    sput-object p0, Laap;->h:Ld3k;

    return-void
.end method

.method public static final e(Landroid/app/Application;)V
    .registers 5

    invoke-static {}, Lpfp;->b()Z

    sget-object v0, Laap;->g:Ld3k;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lxob;->isActive()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    return-void

    :cond_f
    sget-object v0, Lw2p;->a:La64;

    new-instance v1, Lv9p;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3, v2}, Lv9p;-><init>(Landroid/app/Application;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p0

    sput-object p0, Laap;->g:Ld3k;

    return-void
.end method

.method public static final f()Lz8p;
    .registers 1

    sget-object v0, Laap;->c:Lz8p;

    if-nez v0, :cond_c

    sget-object v0, Laap;->b:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz8p;

    :cond_c
    return-object v0
.end method
