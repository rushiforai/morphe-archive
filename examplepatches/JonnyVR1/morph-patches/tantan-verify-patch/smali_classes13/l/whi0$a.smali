.class public Ll/whi0$a;
.super Ll/j610;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/whi0;->h(IIJIZ)Ll/whi0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/whi0;


# direct methods
.method public constructor <init>(Ll/whi0;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/whi0$a;->a:Ll/whi0;

    .line 2
    .line 3
    move p1, p2

    .line 4
    move p2, p3

    .line 5
    move-wide p3, p4

    .line 6
    move-object p5, p6

    .line 7
    move-object p6, p7

    .line 8
    move-object p7, p8

    .line 9
    move-object p8, p9

    .line 10
    invoke-direct/range {p0 .. p8}, Ll/j610;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public h(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/whi0$a;->a:Ll/whi0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/whi0;->d(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/whi0$a;->a:Ll/whi0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/whi0;->e(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicLong;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->getAndAdd(J)J

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public i(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/whi0$a;->a:Ll/whi0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/whi0;->f(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicLong;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/whi0$a;->a:Ll/whi0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/whi0;->g(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicLong;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->getAndAdd(J)J

    .line 17
    .line 18
    .line 19
    return-void
.end method
