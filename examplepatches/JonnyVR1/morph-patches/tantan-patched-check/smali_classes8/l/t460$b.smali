.class public final Ll/t460$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t460;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public f:Z

.field public final synthetic g:Ll/t460;


# direct methods
.method public constructor <init>(Ll/t460;Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t460$b;->g:Ll/t460;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/t460$b;->e:Ll/gcg0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public g(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/t460$b;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/t460$b;->e:Ll/gcg0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/t460$b;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/t460$b;->e:Ll/gcg0;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
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
    iget-object v0, p0, Ll/t460$b;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    :try_start_0
    iget-object v1, p0, Ll/t460$b;->g:Ll/t460;

    .line 8
    .line 9
    iget-object v1, v1, Ll/t460;->a:Ll/qcj;

    .line 10
    .line 11
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/t460$b;->f:Z

    .line 24
    .line 25
    iget-object p1, p0, Ll/t460$b;->e:Ll/gcg0;

    .line 26
    .line 27
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :catchall_0
    move-exception v1

    .line 35
    iput-boolean v0, p0, Ll/t460$b;->f:Z

    .line 36
    .line 37
    iget-object v0, p0, Ll/t460$b;->e:Ll/gcg0;

    .line 38
    .line 39
    invoke-static {v1, v0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 43
    .line 44
    .line 45
    return-void
.end method
