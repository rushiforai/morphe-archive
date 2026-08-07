.class public final Ll/ycw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vcw0;


# instance fields
.field public final a:Ll/vcw0;

.field public final b:Ljava/util/Queue;

.field public final c:I

.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ll/vcw0;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ycw0;->a:Ll/vcw0;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ycw0;->b:Ljava/util/Queue;

    .line 12
    .line 13
    sget-object p1, Ll/sgs0;->C8:Ll/dgs0;

    .line 14
    .line 15
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Ll/ycw0;->c:I

    .line 30
    .line 31
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/ycw0;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 38
    .line 39
    sget-object p1, Ll/sgs0;->B8:Ll/dgs0;

    .line 40
    .line 41
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    int-to-long v2, p1

    .line 56
    sget-object p1, Ll/sgs0;->kb:Ll/dgs0;

    .line 57
    .line 58
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_0

    .line 73
    .line 74
    new-instance v1, Ll/xcw0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/xcw0;-><init>(Ll/ycw0;)V

    .line 77
    .line 78
    .line 79
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 80
    .line 81
    move-wide v4, v2

    .line 82
    move-object v0, p2

    .line 83
    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_0
    move-object v0, p2

    .line 88
    new-instance v1, Ll/xcw0;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/xcw0;-><init>(Ll/ycw0;)V

    .line 91
    .line 92
    .line 93
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 94
    .line 95
    move-wide v4, v2

    .line 96
    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public static synthetic c(Ll/ycw0;)V
    .locals 2

    .line 1
    :goto_0
    iget-object v0, p0, Ll/ycw0;->b:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ycw0;->a:Ll/vcw0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ycw0;->b:Ljava/util/Queue;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/ucw0;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Ll/ucw0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ycw0;->b:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ll/ycw0;->c:I

    .line 8
    .line 9
    if-lt v0, v1, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/ycw0;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/ycw0;->b:Ljava/util/Queue;

    .line 21
    .line 22
    const-string v0, "dropped_event"

    .line 23
    .line 24
    invoke-static {v0}, Ll/ucw0;->b(Ljava/lang/String;)Ll/ucw0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p1}, Ll/ucw0;->j()Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v1, "action"

    .line 33
    .line 34
    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/lang/String;

    .line 45
    .line 46
    const-string v1, "dropped_action"

    .line 47
    .line 48
    invoke-virtual {v0, v1, p1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void

    .line 55
    :cond_2
    iget-object p0, p0, Ll/ycw0;->b:Ljava/util/Queue;

    .line 56
    .line 57
    invoke-interface {p0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final b(Ll/ucw0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ycw0;->a:Ll/vcw0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/vcw0;->b(Ll/ucw0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
