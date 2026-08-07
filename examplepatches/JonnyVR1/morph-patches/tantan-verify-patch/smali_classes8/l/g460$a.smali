.class public Ll/g460$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g460;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final e:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/g460;


# direct methods
.method public constructor <init>(Ll/g460;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g460$a;->h:Ll/g460;

    .line 2
    .line 3
    iput-object p3, p0, Ll/g460$a;->g:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/g460$a;->e:Lrx/internal/operators/NotificationLite;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayDeque;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/g460$a;->f:Ljava/util/Deque;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g460$a;->g:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g460$a;->g:Ll/gcg0;

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
    iget-object v0, p0, Ll/g460$a;->h:Ll/g460;

    .line 2
    .line 3
    iget v0, v0, Ll/g460;->a:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/g460$a;->g:Ll/gcg0;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/g460$a;->f:Ljava/util/Deque;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Deque;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ll/g460$a;->h:Ll/g460;

    .line 20
    .line 21
    iget v1, v1, Ll/g460;->a:I

    .line 22
    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/g460$a;->g:Ll/gcg0;

    .line 26
    .line 27
    iget-object v1, p0, Ll/g460$a;->e:Lrx/internal/operators/NotificationLite;

    .line 28
    .line 29
    iget-object v2, p0, Ll/g460$a;->f:Ljava/util/Deque;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-wide/16 v0, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v0, p0, Ll/g460$a;->f:Ljava/util/Deque;

    .line 49
    .line 50
    iget-object p0, p0, Ll/g460$a;->e:Lrx/internal/operators/NotificationLite;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {v0, p0}, Ljava/util/Deque;->offerLast(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    return-void
.end method
