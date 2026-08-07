.class public Ll/h360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h360;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final synthetic e:Lrx/subjects/b;

.field public final synthetic f:Ll/are0;

.field public final synthetic g:Ll/h360;


# direct methods
.method public constructor <init>(Ll/h360;Ll/gcg0;Lrx/subjects/b;Ll/are0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h360$a;->g:Ll/h360;

    .line 2
    .line 3
    iput-object p3, p0, Ll/h360$a;->e:Lrx/subjects/b;

    .line 4
    .line 5
    iput-object p4, p0, Ll/h360$a;->f:Ll/are0;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h360$a;->e:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/b;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h360$a;->f:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

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
    :try_start_0
    iget-object v0, p0, Ll/h360$a;->e:Lrx/subjects/b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/h360$a;->g:Ll/h360;

    .line 4
    .line 5
    iget-object v1, v1, Ll/h360;->b:Ll/qcj;

    .line 6
    .line 7
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lrx/c;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v2}, Lrx/c;->defaultIfEmpty(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/h360$a$a;

    .line 24
    .line 25
    invoke-direct {v2, p0, p1}, Ll/h360$a$a;-><init>(Ll/h360$a;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
