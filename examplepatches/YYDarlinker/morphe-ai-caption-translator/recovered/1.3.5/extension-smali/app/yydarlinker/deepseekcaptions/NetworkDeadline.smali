.class final Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;
.super Ljava/lang/Object;
.source "NetworkDeadline.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# static fields
.field private static final TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# instance fields
.field private final task:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 8
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline$$ExternalSyntheticLambda0;-><init>()V

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setRemoveOnCancelPolicy(Z)V

    return-void
.end method

.method constructor <init>(Ljava/net/HttpURLConnection;J)V
    .registers 8

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->TIMER:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline$$ExternalSyntheticLambda1;-><init>(Ljava/net/HttpURLConnection;)V

    .line 15
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr p2, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    sget-object p3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    invoke-virtual {v0, v1, p1, p2, p3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->task:Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method

.method static synthetic lambda$new$1(Ljava/net/HttpURLConnection;)V
    .registers 1

    .line 14
    :try_start_0
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 9
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "CaptionHttpDeadline"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .line 17
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->task:Ljava/util/concurrent/ScheduledFuture;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    return-void
.end method
