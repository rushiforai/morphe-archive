.class public abstract Ll/gcg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bb50;
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/bb50<",
        "TT;>;",
        "Ll/kcg0;"
    }
.end annotation


# instance fields
.field public final a:Ll/ocg0;

.field public final b:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "*>;"
        }
    .end annotation
.end field

.field public c:Ll/vk90;

.field public d:J


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 26
    invoke-direct {p0, v0, v1}, Ll/gcg0;-><init>(Ll/gcg0;Z)V

    return-void
.end method

.method public constructor <init>(Ll/gcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "*>;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 25
    invoke-direct {p0, p1, v0}, Ll/gcg0;-><init>(Ll/gcg0;Z)V

    return-void
.end method

.method public constructor <init>(Ll/gcg0;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "*>;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/high16 v0, -0x8000000000000000L

    .line 5
    .line 6
    iput-wide v0, p0, Ll/gcg0;->d:J

    .line 7
    .line 8
    iput-object p1, p0, Ll/gcg0;->b:Ll/gcg0;

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p1, Ll/gcg0;->a:Ll/ocg0;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p1, Ll/ocg0;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/ocg0;-><init>()V

    .line 20
    .line 21
    .line 22
    :goto_0
    iput-object p1, p0, Ll/gcg0;->a:Ll/ocg0;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final b(Ll/kcg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gcg0;->a:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ocg0;->a(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/gcg0;->d:J

    .line 2
    .line 3
    const-wide/high16 v2, -0x8000000000000000L

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iput-wide p1, p0, Ll/gcg0;->d:J

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    add-long/2addr v0, p1

    .line 13
    const-wide/16 p1, 0x0

    .line 14
    .line 15
    cmp-long p1, v0, p1

    .line 16
    .line 17
    if-gez p1, :cond_1

    .line 18
    .line 19
    const-wide p1, 0x7fffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    iput-wide p1, p0, Ll/gcg0;->d:J

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iput-wide v0, p0, Ll/gcg0;->d:J

    .line 28
    .line 29
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/gcg0;->c:Ll/vk90;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    invoke-interface {v0, p1, p2}, Ll/vk90;->request(J)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->c(J)V

    .line 20
    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1

    .line 26
    :cond_1
    const-string p0, "number requested cannot be negative: "

    .line 27
    .line 28
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public f(Ll/vk90;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ll/gcg0;->d:J

    .line 3
    .line 4
    iput-object p1, p0, Ll/gcg0;->c:Ll/vk90;

    .line 5
    .line 6
    iget-object v2, p0, Ll/gcg0;->b:Ll/gcg0;

    .line 7
    .line 8
    const-wide/high16 v3, -0x8000000000000000L

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    cmp-long v5, v0, v3

    .line 13
    .line 14
    if-nez v5, :cond_0

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v5, 0x0

    .line 19
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    if-eqz v5, :cond_1

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    cmp-long p0, v0, v3

    .line 27
    .line 28
    if-nez p0, :cond_2

    .line 29
    .line 30
    const-wide v0, 0x7fffffffffffffffL

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    invoke-interface {p1, v0, v1}, Ll/vk90;->request(J)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-interface {p1, v0, v1}, Ll/vk90;->request(J)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw p1
.end method

.method public final isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gcg0;->a:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gcg0;->a:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
