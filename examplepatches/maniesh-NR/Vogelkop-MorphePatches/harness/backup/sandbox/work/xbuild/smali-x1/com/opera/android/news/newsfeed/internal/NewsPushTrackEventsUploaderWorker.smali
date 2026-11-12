.class public final Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;
.super Landroidx/work/Worker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;",
        "Landroidx/work/Worker;",
        "Landroid/content/Context;",
        "context",
        "Landroidx/work/WorkerParameters;",
        "workerParams",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final f:Lesd;

.field public static final g:I


# instance fields
.field public final e:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lesd;->e:Lkotlin/text/Regex;

    const-string v0, "application/json; charset=UTF-8"

    invoke-static {v0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v0

    sput-object v0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->f:Lesd;

    const v0, 0x927c0

    sput v0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/WorkerParameters;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroidx/work/Worker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    new-instance p1, Lvme;

    const/16 p2, 0xb

    invoke-direct {p1, p2}, Lvme;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->e:Lzyk;

    return-void
.end method

.method public static final d(Landroid/content/Context;)V
    .registers 7

    invoke-static {p0}, Lx4o;->c(Landroid/content/Context;)Lx4o;

    move-result-object p0

    new-instance v0, Ltn;

    const-class v1, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;

    invoke-direct {v0, v1}, Ltn;-><init>(Ljava/lang/Class;)V

    sget-object v1, Luih;->a:Ltih;

    sget v2, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->g:I

    int-to-long v2, v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Luih;->b:Lk6;

    const-wide/16 v4, 0x0

    invoke-virtual {v1, v4, v5, v2, v3}, Luih;->o(JJ)J

    move-result-wide v1

    iget-object v3, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v3, Lh5o;

    iput-wide v1, v3, Lh5o;->g:J

    const-wide v1, 0x7fffffffffffffffL

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v1, v3

    iget-object v3, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v3, Lh5o;

    iget-wide v3, v3, Lh5o;->g:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_4f

    new-instance v1, Lxo5;

    const/16 v2, 0xe

    invoke-direct {v1, v2}, Lxo5;-><init>(I)V

    iget-object v2, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, Lh5o;

    iput-object v1, v2, Lh5o;->j:Lxo5;

    invoke-virtual {v0}, Ltn;->G()V

    invoke-virtual {v0}, Ltn;->j()Loff;

    move-result-object v0

    const-string v1, "NPEV"

    invoke-virtual {p0, v1, v0}, Lx4o;->b(Ljava/lang/String;Loff;)V

    return-void

    :cond_4f
    const-string p0, "The given initial delay is too large and will cause an overflow!"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final c()Lzic;
    .registers 8

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-object v0, p0, Lajc;->a:Landroid/content/Context;

    invoke-static {v0}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "npt_unsent_push_track_events"

    const/4 v5, 0x0

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a8

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_a8

    new-instance v1, Lfvh;

    invoke-direct {v1}, Lfvh;-><init>()V

    invoke-static {v0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld3j;

    const/16 v5, 0x9

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Ld3j;->d(IZ)Lc3j;

    move-result-object v0

    new-instance v5, Landroid/net/Uri$Builder;

    invoke-direct {v5}, Landroid/net/Uri$Builder;-><init>()V

    const-string v6, "https"

    invoke-virtual {v5, v6}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    if-eqz v0, :cond_41

    iget-object v0, v0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v0, Ljava/lang/String;

    goto :goto_43

    :cond_41
    const-string v0, "pps-log.op-mobile.opera.com"

    :goto_43
    invoke-virtual {v5, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v5, "log"

    invoke-virtual {v0, v5}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lfvh;->h(Ljava/lang/String;)V

    sget-object v0, Lrvh;->Companion:Lqvh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->f:Lesd;

    invoke-static {v2, v0}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object v0

    invoke-virtual {v1, v0}, Lfvh;->f(Lrvh;)V

    iget-object v0, p0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    invoke-static {v1, v0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    :try_start_72
    invoke-interface {v0}, Lv84;->execute()Lpzh;

    move-result-object v6
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_76} :catch_a1

    :try_start_76
    iget v0, v6, Lpzh;->d:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_8c

    new-instance v0, Lese;
    :try_end_7e
    .catchall {:try_start_76 .. :try_end_7e} :catchall_98

    const/4 v5, 0x1

    move-object v1, p0

    :try_start_80
    invoke-direct/range {v0 .. v5}, Lese;-><init>(Landroidx/work/Worker;Ljava/lang/String;JB)V

    invoke-static {v0}, Lioh;->k(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    new-instance p0, Lyic;

    invoke-direct {p0}, Lyic;-><init>()V

    goto :goto_92

    :cond_8c
    move-object v1, p0

    new-instance p0, Lxic;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    :try_end_92
    .catchall {:try_start_80 .. :try_end_92} :catchall_96

    :goto_92
    :try_start_92
    invoke-virtual {v6}, Lpzh;->close()V
    :try_end_95
    .catch Ljava/io/IOException; {:try_start_92 .. :try_end_95} :catch_a2

    goto :goto_ae

    :catchall_96
    move-exception v0

    goto :goto_9a

    :catchall_98
    move-exception v0

    move-object v1, p0

    :goto_9a
    move-object p0, v0

    :try_start_9b
    throw p0
    :try_end_9c
    .catchall {:try_start_9b .. :try_end_9c} :catchall_9c

    :catchall_9c
    move-exception v0

    :try_start_9d
    invoke-static {v6, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_a1} :catch_a2

    :catch_a1
    move-object v1, p0

    :catch_a2
    new-instance p0, Lxic;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    goto :goto_ae

    :cond_a8
    move-object v1, p0

    new-instance p0, Lyic;

    invoke-direct {p0}, Lyic;-><init>()V

    :goto_ae
    new-instance v0, Lxic;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c5

    iget-object v0, v1, Lajc;->b:Landroidx/work/WorkerParameters;

    iget v0, v0, Landroidx/work/WorkerParameters;->c:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_c5

    new-instance p0, Lwic;

    invoke-direct {p0}, Lwic;-><init>()V

    :cond_c5
    return-object p0
.end method
