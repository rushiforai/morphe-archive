.class public Ll/y360$a$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y360$a$a;->call()V
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
.field public e:Z

.field public final synthetic f:Ll/x20;

.field public final synthetic g:Ll/y360$a$a;


# direct methods
.method public constructor <init>(Ll/y360$a$a;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y360$a$a$a;->f:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 4
    .line 5
    iget-object p0, p0, Ll/y360$a;->i:Ll/xk90;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/y360$a$a$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/y360$a$a$a;->e:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 9
    .line 10
    iget-object p0, p0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 11
    .line 12
    iget-object p0, p0, Ll/y360$a;->e:Ll/gcg0;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/y360$a$a$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/y360$a$a$a;->e:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 9
    .line 10
    iget-object v0, v0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 11
    .line 12
    iget-object v1, v0, Ll/y360$a;->f:Ll/rcj;

    .line 13
    .line 14
    iget-object v0, v0, Ll/y360$a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v1, v0, p1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 37
    .line 38
    iget-object v0, v0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 39
    .line 40
    iget-object v0, v0, Ll/y360$a;->g:Ll/f2e0$a;

    .line 41
    .line 42
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    iget-object p1, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 49
    .line 50
    iget-object p1, p1, Ll/y360$a$a;->b:Ll/y360$a;

    .line 51
    .line 52
    iget-object p1, p1, Ll/y360$a;->g:Ll/f2e0$a;

    .line 53
    .line 54
    iget-object p0, p0, Ll/y360$a$a$a;->f:Ll/x20;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget-object p0, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 61
    .line 62
    iget-object p0, p0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 63
    .line 64
    iget-object p0, p0, Ll/y360$a;->e:Ll/gcg0;

    .line 65
    .line 66
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    :cond_1
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
    iget-boolean v0, p0, Ll/y360$a$a$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 6
    .line 7
    iget-object v0, v0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 8
    .line 9
    iget-object v0, v0, Ll/y360$a;->e:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/y360$a$a$a;->g:Ll/y360$a$a;

    .line 15
    .line 16
    iget-object p0, p0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 17
    .line 18
    iget-object p0, p0, Ll/y360$a;->i:Ll/xk90;

    .line 19
    .line 20
    const-wide/16 v0, 0x1

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Ll/xk90;->b(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
