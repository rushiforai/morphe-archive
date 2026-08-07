.class public Ll/mo50$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mo50;->c(Ll/gcg0;Ll/ft5;)V
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
.field public final synthetic e:Ll/gcg0;

.field public final synthetic f:Ll/ft5;

.field public final synthetic g:Ll/mo50;


# direct methods
.method public constructor <init>(Ll/mo50;Ll/gcg0;Ll/gcg0;Ll/ft5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 2
    .line 3
    iput-object p3, p0, Ll/mo50$b;->e:Ll/gcg0;

    .line 4
    .line 5
    iput-object p4, p0, Ll/mo50$b;->f:Ll/ft5;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 9
    .line 10
    iget-object v0, v0, Ll/mo50;->b:Ll/ft5;

    .line 11
    .line 12
    iget-object v1, p0, Ll/mo50$b;->f:Ll/ft5;

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 17
    .line 18
    iget-object v0, v0, Ll/mo50;->b:Ll/ft5;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ft5;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 24
    .line 25
    new-instance v1, Ll/ft5;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/ft5;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, v0, Ll/mo50;->b:Ll/ft5;

    .line 31
    .line 32
    iget-object v0, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 33
    .line 34
    iget-object v0, v0, Ll/mo50;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 44
    .line 45
    iget-object p0, p0, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :goto_1
    iget-object p0, p0, Ll/mo50$b;->g:Ll/mo50;

    .line 52
    .line 53
    iget-object p0, p0, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 56
    .line 57
    .line 58
    throw v0
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mo50$b;->g()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/mo50$b;->e:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mo50$b;->g()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/mo50$b;->e:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mo50$b;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
