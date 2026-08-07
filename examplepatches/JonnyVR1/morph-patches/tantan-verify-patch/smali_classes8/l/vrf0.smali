.class public Ll/vrf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final a:Ll/x20;

.field public final b:Ll/f2e0$a;

.field public final c:J


# direct methods
.method public constructor <init>(Ll/x20;Ll/f2e0$a;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vrf0;->a:Ll/x20;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vrf0;->b:Ll/f2e0$a;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/vrf0;->c:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vrf0;->b:Ll/f2e0$a;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-wide v0, p0, Ll/vrf0;->c:J

    .line 11
    .line 12
    iget-object v2, p0, Ll/vrf0;->b:Ll/f2e0$a;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/f2e0$a;->a()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    sub-long/2addr v0, v2

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v2, v0, v2

    .line 22
    .line 23
    if-lez v2, :cond_1

    .line 24
    .line 25
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ll/j6f;->c(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/vrf0;->b:Ll/f2e0$a;

    .line 41
    .line 42
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    :goto_1
    return-void

    .line 49
    :cond_2
    iget-object p0, p0, Ll/vrf0;->a:Ll/x20;

    .line 50
    .line 51
    invoke-interface {p0}, Ll/x20;->call()V

    .line 52
    .line 53
    .line 54
    return-void
.end method
