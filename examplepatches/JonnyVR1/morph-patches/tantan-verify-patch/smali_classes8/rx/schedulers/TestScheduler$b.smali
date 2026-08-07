.class public final Lrx/schedulers/TestScheduler$b;
.super Ll/f2e0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/schedulers/TestScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/k63;

.field public final synthetic b:Lrx/schedulers/TestScheduler;


# direct methods
.method public constructor <init>(Lrx/schedulers/TestScheduler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/schedulers/TestScheduler$b;->b:Lrx/schedulers/TestScheduler;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/f2e0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/k63;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/k63;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lrx/schedulers/TestScheduler$b;->a:Ll/k63;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-object p0, p0, Lrx/schedulers/TestScheduler$b;->b:Lrx/schedulers/TestScheduler;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/schedulers/TestScheduler;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public b(Ll/x20;)Ll/kcg0;
    .locals 3

    .line 1
    new-instance v0, Lrx/schedulers/TestScheduler$c;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, p0, v1, v2, p1}, Lrx/schedulers/TestScheduler$c;-><init>(Ll/f2e0$a;JLl/x20;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lrx/schedulers/TestScheduler$b;->b:Lrx/schedulers/TestScheduler;

    .line 9
    .line 10
    iget-object p1, p1, Lrx/schedulers/TestScheduler;->b:Ljava/util/Queue;

    .line 11
    .line 12
    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    new-instance p1, Lrx/schedulers/TestScheduler$b$b;

    .line 16
    .line 17
    invoke-direct {p1, p0, v0}, Lrx/schedulers/TestScheduler$b$b;-><init>(Lrx/schedulers/TestScheduler$b;Lrx/schedulers/TestScheduler$c;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
    .locals 3

    .line 1
    new-instance v0, Lrx/schedulers/TestScheduler$c;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/schedulers/TestScheduler$b;->b:Lrx/schedulers/TestScheduler;

    .line 4
    .line 5
    iget-wide v1, v1, Lrx/schedulers/TestScheduler;->c:J

    .line 6
    .line 7
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide p2

    .line 11
    add-long/2addr v1, p2

    .line 12
    invoke-direct {v0, p0, v1, v2, p1}, Lrx/schedulers/TestScheduler$c;-><init>(Ll/f2e0$a;JLl/x20;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lrx/schedulers/TestScheduler$b;->b:Lrx/schedulers/TestScheduler;

    .line 16
    .line 17
    iget-object p1, p1, Lrx/schedulers/TestScheduler;->b:Ljava/util/Queue;

    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    new-instance p1, Lrx/schedulers/TestScheduler$b$a;

    .line 23
    .line 24
    invoke-direct {p1, p0, v0}, Lrx/schedulers/TestScheduler$b$a;-><init>(Lrx/schedulers/TestScheduler$b;Lrx/schedulers/TestScheduler$c;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/schedulers/TestScheduler$b;->a:Ll/k63;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k63;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/schedulers/TestScheduler$b;->a:Ll/k63;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k63;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
