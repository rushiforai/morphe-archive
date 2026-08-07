.class public Ll/e360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e360;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final e:Ll/f360$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/f360$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final f:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "*>;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/are0;

.field public final synthetic h:Ll/wqe0;

.field public final synthetic i:Ll/e360;


# direct methods
.method public constructor <init>(Ll/e360;Ll/gcg0;Ll/are0;Ll/wqe0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e360$a;->i:Ll/e360;

    .line 2
    .line 3
    iput-object p3, p0, Ll/e360$a;->g:Ll/are0;

    .line 4
    .line 5
    iput-object p4, p0, Ll/e360$a;->h:Ll/wqe0;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/f360$b;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/f360$b;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/e360$a;->e:Ll/f360$b;

    .line 16
    .line 17
    iput-object p0, p0, Ll/e360$a;->f:Ll/gcg0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e360$a;->e:Ll/f360$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e360$a;->g:Ll/are0;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p0}, Ll/f360$b;->c(Ll/gcg0;Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e360$a;->g:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/e360$a;->e:Ll/f360$b;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/f360$b;->a()V

    .line 12
    .line 13
    .line 14
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
    :try_start_0
    iget-object v0, p0, Ll/e360$a;->i:Ll/e360;

    .line 2
    .line 3
    iget-object v0, v0, Ll/e360;->a:Ll/qcj;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/e360$a;->e:Ll/f360$b;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ll/f360$b;->d(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    new-instance v1, Ll/e360$a$a;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/e360$a$a;-><init>(Ll/e360$a;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/e360$a;->h:Ll/wqe0;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
