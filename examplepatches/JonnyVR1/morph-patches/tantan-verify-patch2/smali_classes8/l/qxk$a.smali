.class public Ll/qxk$a;
.super Ll/f2e0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qxk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/os/Handler;

.field public final b:Ll/ft5;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f2e0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qxk$a;->b:Ll/ft5;

    .line 10
    .line 11
    iput-object p1, p0, Ll/qxk$a;->a:Landroid/os/Handler;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e(Ll/qxk$a;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qxk$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b(Ll/x20;)Ll/kcg0;
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/qxk$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qxk$a;->b:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-static {}, Ll/zqd0;->a()Ll/zqd0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/zqd0;->b()Ll/ard0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Ll/ard0;->c(Ll/x20;)Ll/x20;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Lrx/internal/schedulers/ScheduledAction;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Lrx/internal/schedulers/ScheduledAction;-><init>(Ll/x20;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/qxk$a;->b:Ll/ft5;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lrx/internal/schedulers/ScheduledAction;->addParent(Ll/ft5;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/qxk$a;->b:Ll/ft5;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/qxk$a;->a:Landroid/os/Handler;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    if-ne p1, v1, :cond_1

    .line 52
    .line 53
    const-wide/16 v1, 0x0

    .line 54
    .line 55
    cmp-long p1, p2, v1

    .line 56
    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0}, Lrx/internal/schedulers/ScheduledAction;->run()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object p1, p0, Ll/qxk$a;->a:Landroid/os/Handler;

    .line 64
    .line 65
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 66
    .line 67
    .line 68
    move-result-wide p2

    .line 69
    invoke-virtual {p1, v0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    .line 71
    .line 72
    :goto_0
    new-instance p1, Ll/qxk$a$a;

    .line 73
    .line 74
    invoke-direct {p1, p0, v0}, Ll/qxk$a$a;-><init>(Ll/qxk$a;Lrx/internal/schedulers/ScheduledAction;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Lrx/internal/schedulers/ScheduledAction;->add(Ll/kcg0;)V

    .line 82
    .line 83
    .line 84
    return-object v0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qxk$a;->b:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->isUnsubscribed()Z

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
    iget-object p0, p0, Ll/qxk$a;->b:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
