.class public final Ll/n460$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n460;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:Z

.field public final f:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final g:Ll/wqe0;

.field public final h:Ll/xk90;

.field public final i:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;Ll/wqe0;Ll/xk90;Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;",
            "Ll/wqe0;",
            "Ll/xk90;",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/n460$b;->e:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/n460$b;->f:Ll/gcg0;

    .line 8
    .line 9
    iput-object p2, p0, Ll/n460$b;->g:Ll/wqe0;

    .line 10
    .line 11
    iput-object p3, p0, Ll/n460$b;->h:Ll/xk90;

    .line 12
    .line 13
    iput-object p4, p0, Ll/n460$b;->i:Lrx/c;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n460$b;->h:Ll/xk90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    new-instance v0, Ll/n460$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/n460$b;->f:Ll/gcg0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/n460$b;->h:Ll/xk90;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/n460$a;-><init>(Ll/gcg0;Ll/xk90;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/n460$b;->g:Ll/wqe0;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/n460$b;->i:Lrx/c;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/n460$b;->e:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/n460$b;->f:Ll/gcg0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v1}, Ll/bb50;->onCompleted()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {v1}, Ll/gcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/n460$b;->g()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n460$b;->f:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
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
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/n460$b;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/n460$b;->f:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/n460$b;->h:Ll/xk90;

    .line 10
    .line 11
    const-wide/16 v0, 0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/xk90;->b(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
