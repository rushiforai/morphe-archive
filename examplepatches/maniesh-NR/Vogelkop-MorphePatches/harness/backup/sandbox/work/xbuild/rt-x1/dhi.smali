.class public final Ldhi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrmi;


# instance fields
.field public final a:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ScheduledExecutorService;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldhi;->a:Ljava/util/concurrent/ScheduledExecutorService;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .registers 4

    new-instance v0, Lgg;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v1}, Lgg;-><init>(Ljava/lang/Runnable;B)V

    iget-object p0, p0, Ldhi;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lqmi;
    .registers 8

    new-instance v0, Lchi;

    new-instance v1, Lgg;

    const/4 v2, 0x2

    invoke-direct {v1, p1, v2}, Lgg;-><init>(Ljava/lang/Runnable;B)V

    iget-object p0, p0, Ldhi;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, v1, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    invoke-direct {v0, p0}, Lchi;-><init>(Ljava/util/concurrent/ScheduledFuture;)V

    return-object v0
.end method
