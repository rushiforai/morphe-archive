.class public Ll/m360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m360;->a(Ll/gcg0;)Ll/gcg0;
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

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Ll/m360;


# direct methods
.method public constructor <init>(Ll/m360;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m360$a;->g:Ll/m360;

    .line 2
    .line 3
    iput-object p3, p0, Ll/m360$a;->f:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/m360$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/m360$a;->g:Ll/m360;

    .line 7
    .line 8
    iget-object v0, v0, Ll/m360;->a:Ll/bb50;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/m360$a;->e:Z

    .line 15
    .line 16
    iget-object p0, p0, Ll/m360$a;->f:Ll/gcg0;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    invoke-static {v0, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/m360$a;->e:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/m360$a;->e:Z

    .line 11
    .line 12
    :try_start_0
    iget-object v0, p0, Ll/m360$a;->g:Ll/m360;

    .line 13
    .line 14
    iget-object v0, v0, Ll/m360;->a:Ll/bb50;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/m360$a;->f:Ll/gcg0;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/m360$a;->f:Ll/gcg0;

    .line 30
    .line 31
    new-instance v1, Lrx/exceptions/CompositeException;

    .line 32
    .line 33
    filled-new-array {p1, v0}, [Ljava/lang/Throwable;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {v1, p1}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p0, v1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/m360$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/m360$a;->g:Ll/m360;

    .line 7
    .line 8
    iget-object v0, v0, Ll/m360;->a:Ll/bb50;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/m360$a;->f:Ll/gcg0;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    invoke-static {v0, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
