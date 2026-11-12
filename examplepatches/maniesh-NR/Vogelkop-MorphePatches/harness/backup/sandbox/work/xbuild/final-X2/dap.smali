.class public final Ldap;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ldap;

.field public static final b:J

.field public static volatile c:Lt9f;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldap;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ldap;->a:Ldap;

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->f:Lun7;

    const/4 v1, 0x5

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sput-wide v0, Ldap;->b:J

    return-void
.end method

.method public static a(Landroid/content/Context;)Lt9f;
    .registers 10

    invoke-static {}, Lpfp;->b()Z

    new-instance v0, Ls9f;

    invoke-direct {v0}, Ls9f;-><init>()V

    new-instance v1, Lsa7;

    invoke-direct {v1}, Lsa7;-><init>()V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Lsa7;->d(I)V

    iput-object v1, v0, Ls9f;->a:Lsa7;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "okhttp.T3Jo36nuHr4ikyZzT2Fokw"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_2d

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_2d

    move-object v1, v3

    :cond_2d
    if-eqz v1, :cond_7d

    :try_start_2f
    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Landroid/os/StatFs;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v4

    invoke-virtual {v2}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v6

    mul-long/2addr v4, v6

    const-wide/16 v6, 0x64

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2
    :try_end_4e
    .catchall {:try_start_2f .. :try_end_4e} :catchall_4f

    goto :goto_58

    :catchall_4f
    move-exception v2

    sget-object v4, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, v2}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v2, v4

    :goto_58
    const-wide/32 v4, 0x500000

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    instance-of v7, v2, Lq0i;

    if-eqz v7, :cond_64

    move-object v2, v6

    :cond_64
    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    new-instance v2, La74;

    cmp-long v8, v6, v4

    if-ltz v8, :cond_78

    const-wide/32 v4, 0x3200000

    cmp-long v8, v6, v4

    if-gtz v8, :cond_78

    move-wide v4, v6

    :cond_78
    invoke-direct {v2, v1, v4, v5}, La74;-><init>(Ljava/io/File;J)V

    iput-object v2, v0, Ls9f;->l:La74;

    :cond_7d
    new-instance v1, Lx7;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lx7;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Ls9f;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-string v1, "timeout"

    sget-wide v4, Ldap;->b:J

    invoke-static {v1, v4, v5, p0}, Lokhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p0

    iput p0, v0, Ls9f;->x:I

    new-instance p0, Ll9p;

    invoke-direct {p0}, Ljava/net/ProxySelector;-><init>()V

    iget-object v1, v0, Ls9f;->n:Ljava/net/ProxySelector;

    if-eq p0, v1, :cond_9f

    iput-object v3, v0, Ls9f;->D:Lokhttp3/internal/connection/RouteDatabase;

    :cond_9f
    iput-object p0, v0, Ls9f;->n:Ljava/net/ProxySelector;

    new-instance p0, Lt9f;

    invoke-direct {p0, v0}, Lt9f;-><init>(Ls9f;)V

    return-object p0
.end method

.method public static final b(Licp;Lvjo;)Lf8p;
    .registers 11

    new-instance v2, Lf8p;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcfn;

    const/4 v6, 0x0

    const/16 v7, 0x16

    const/4 v1, 0x0

    const-class v3, Lf8p;

    const-string v4, "isCanceled"

    const-string v5, "isCanceled()Z"

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v3, Lky;

    const/4 v5, 0x0

    const/4 v8, 0x0

    move-object v7, p0

    move-object v6, v0

    invoke-direct/range {v3 .. v8}, Lky;-><init>(Ljava/lang/Object;Le9a;Lkotlin/jvm/functions/Function0;Licp;I)V

    invoke-static {v3}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-object v2
.end method

.method public static c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Licp;)Lq8p;
    .registers 7

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lrma;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lrma;-><init>(B)V

    invoke-virtual {v1, p0, v0}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v1}, Lrma;->d()Lhra;

    move-result-object v1
    :try_end_e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_e} :catch_f

    goto :goto_10

    :catch_f
    move-object v1, v0

    :goto_10
    if-nez v1, :cond_24

    new-instance p1, Lvjo;

    const-string p2, "Invalid url: "

    invoke-static {p2, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p2, 0x238c

    invoke-direct {p1, p2, p0}, Lvjo;-><init>(ILjava/lang/String;)V

    invoke-static {p3, p1}, Ldap;->b(Licp;Lvjo;)Lf8p;

    move-result-object p0

    return-object p0

    :cond_24
    sget-object p0, Ldap;->c:Lt9f;

    if-nez p0, :cond_34

    new-instance p0, Lvjo;

    const/16 p1, 0x2390

    invoke-direct {p0, p1, v0}, Lvjo;-><init>(ILjava/lang/String;)V

    invoke-static {p3, p0}, Ldap;->b(Licp;Lvjo;)Lf8p;

    move-result-object p0

    return-object p0

    :cond_34
    invoke-static {p0, v1, p1, p2}, Ldap;->e(Lt9f;Lhra;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    new-instance p1, Lu7k;

    invoke-direct {p1, p3}, Lu7k;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, p1}, Lv84;->enqueue(Lf94;)V

    new-instance p0, Ldpj;

    const/16 p1, 0xe

    invoke-direct {p0, p1}, Ldpj;-><init>(B)V

    return-object p0
.end method

.method public static d(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lcdp;)Lkotlin/Pair;
    .registers 8

    sget-object v0, Ldap;->c:Lt9f;

    const/4 v1, 0x0

    if-eqz v0, :cond_3c

    new-instance v2, Lrma;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lrma;-><init>(B)V

    invoke-virtual {v2, p0, v1}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v2}, Lrma;->d()Lhra;

    move-result-object p0

    invoke-static {v0, p0, p1, p2}, Ldap;->e(Lt9f;Lhra;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    invoke-interface {p0}, Lv84;->execute()Lpzh;

    move-result-object p0

    :try_start_1a
    iget-boolean p1, p0, Lpzh;->q:Z

    if-eqz p1, :cond_2d

    iget-object p1, p0, Lpzh;->f:Le9a;

    invoke-interface {p3, p0}, Lcdp;->s(Lpzh;)Ljava/lang/Object;

    move-result-object p2

    new-instance p3, Lkotlin/Pair;

    invoke-direct {p3, p1, p2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_29
    .catchall {:try_start_1a .. :try_end_29} :catchall_35

    invoke-virtual {p0}, Lpzh;->close()V

    return-object p3

    :cond_2d
    :try_start_2d
    new-instance p1, Lvjo;

    const/16 p2, 0x64

    invoke-direct {p1, p2, v1}, Lvjo;-><init>(ILjava/lang/String;)V

    throw p1
    :try_end_35
    .catchall {:try_start_2d .. :try_end_35} :catchall_35

    :catchall_35
    move-exception p1

    :try_start_36
    throw p1
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_37

    :catchall_37
    move-exception p2

    invoke-static {p0, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2

    :cond_3c
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method

.method public static e(Lt9f;Lhra;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)Lokhttp3/internal/connection/RealCall;
    .registers 5

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    iput-object p1, v0, Lfvh;->a:Lhra;

    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lkvh;

    invoke-direct {p1, v0}, Lkvh;-><init>(Lfvh;)V

    if-eqz p3, :cond_1e

    invoke-virtual {p0}, Lt9f;->b()Ls9f;

    move-result-object p0

    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lt9f;

    invoke-direct {p2, p0}, Lt9f;-><init>(Ls9f;)V

    move-object p0, p2

    :cond_1e
    invoke-virtual {p0, p1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0
.end method
