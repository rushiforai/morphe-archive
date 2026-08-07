.class public Ll/x360$d;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x360;->a(Ll/gcg0;)Ll/gcg0;
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

.field public f:J

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/xk90;

.field public final synthetic i:Ll/wqe0;

.field public final synthetic j:Ll/x360;


# direct methods
.method public constructor <init>(Ll/x360;Ll/gcg0;Ll/xk90;Ll/wqe0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x360$d;->j:Ll/x360;

    .line 2
    .line 3
    iput-object p2, p0, Ll/x360$d;->g:Ll/gcg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/x360$d;->h:Ll/xk90;

    .line 6
    .line 7
    iput-object p4, p0, Ll/x360$d;->i:Ll/wqe0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x360$d;->h:Ll/xk90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/x360$d;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/x360$d;->e:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/x360$d;->g:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/x360$d;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ll/x360$d;->e:Z

    .line 14
    .line 15
    :try_start_0
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/x360$d$a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/x360$d$a;-><init>(Ll/x360$d;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/x360$d;->i:Ll/wqe0;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Ll/x360$d;->f:J

    .line 29
    .line 30
    const-wide/16 v3, 0x0

    .line 31
    .line 32
    cmp-long v3, v1, v3

    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    iget-object v3, p0, Ll/x360$d;->h:Ll/xk90;

    .line 37
    .line 38
    invoke-virtual {v3, v1, v2}, Ll/xk90;->b(J)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/x360$d;->j:Ll/x360;

    .line 45
    .line 46
    iget-object v1, v1, Ll/x360;->a:Ll/qcj;

    .line 47
    .line 48
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lrx/c;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :goto_1
    iget-object p0, p0, Ll/x360$d;->g:Ll/gcg0;

    .line 59
    .line 60
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/x360$d;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v0, p0, Ll/x360$d;->f:J

    .line 7
    .line 8
    const-wide/16 v2, 0x1

    .line 9
    .line 10
    add-long/2addr v0, v2

    .line 11
    iput-wide v0, p0, Ll/x360$d;->f:J

    .line 12
    .line 13
    iget-object p0, p0, Ll/x360$d;->g:Ll/gcg0;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
