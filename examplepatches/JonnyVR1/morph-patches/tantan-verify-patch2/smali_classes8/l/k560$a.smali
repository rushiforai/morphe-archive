.class public Ll/k560$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k560;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final synthetic e:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic f:Ll/are0;

.field public final synthetic g:Ll/k560;


# direct methods
.method public constructor <init>(Ll/k560;Ll/gcg0;ZLjava/util/concurrent/atomic/AtomicReference;Ll/are0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k560$a;->g:Ll/k560;

    .line 2
    .line 3
    iput-object p4, p0, Ll/k560$a;->e:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    iput-object p5, p0, Ll/k560$a;->f:Ll/are0;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Ll/gcg0;-><init>(Ll/gcg0;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k560$a;->f:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/are0;->onCompleted()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/k560$a;->f:Ll/are0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k560$a;->f:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/k560$a;->f:Ll/are0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k560$a;->e:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/k560;->c:Ljava/lang/Object;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    :try_start_0
    iget-object v1, p0, Ll/k560$a;->g:Ll/k560;

    .line 12
    .line 13
    iget-object v1, v1, Ll/k560;->a:Ll/rcj;

    .line 14
    .line 15
    invoke-interface {v1, p1, v0}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/k560$a;->f:Ll/are0;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/are0;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
