.class public Ll/h460$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h460;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ll/k0j0<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Ll/h460;


# direct methods
.method public constructor <init>(Ll/h460;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h460$a;->g:Ll/h460;

    .line 2
    .line 3
    iput-object p3, p0, Ll/h460$a;->f:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayDeque;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/h460$a;->e:Ljava/util/Deque;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final g(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h460$a;->g:Ll/h460;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/h460;->a:J

    .line 4
    .line 5
    sub-long/2addr p1, v0

    .line 6
    :goto_0
    iget-object v0, p0, Ll/h460$a;->e:Ljava/util/Deque;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/h460$a;->e:Ljava/util/Deque;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/k0j0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/k0j0;->a()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    cmp-long v1, v1, p1

    .line 27
    .line 28
    if-gez v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Ll/h460$a;->e:Ljava/util/Deque;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/h460$a;->f:Ll/gcg0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/k0j0;->b()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h460$a;->g:Ll/h460;

    .line 2
    .line 3
    iget-object v0, v0, Ll/h460;->b:Ll/f2e0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/f2e0;->now()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Ll/h460$a;->g(J)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/h460$a;->f:Ll/gcg0;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h460$a;->f:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/h460$a;->g:Ll/h460;

    .line 2
    .line 3
    iget-object v0, v0, Ll/h460;->b:Ll/f2e0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/f2e0;->now()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Ll/h460$a;->g(J)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/h460$a;->e:Ljava/util/Deque;

    .line 13
    .line 14
    new-instance v2, Ll/k0j0;

    .line 15
    .line 16
    invoke-direct {v2, v0, v1, p1}, Ll/k0j0;-><init>(JLjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0, v2}, Ljava/util/Deque;->offerLast(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method
