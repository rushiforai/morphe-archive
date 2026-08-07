.class public Ll/k360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k360;->b(Ll/gcg0;)Ll/gcg0;
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
.field public e:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TU;"
        }
    .end annotation
.end field

.field public f:Z

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/k360;


# direct methods
.method public constructor <init>(Ll/k360;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k360$a;->h:Ll/k360;

    .line 2
    .line 3
    iput-object p3, p0, Ll/k360$a;->g:Ll/gcg0;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k360$a;->g:Ll/gcg0;

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
    iget-object p0, p0, Ll/k360$a;->g:Ll/gcg0;

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
    :try_start_0
    iget-object v0, p0, Ll/k360$a;->h:Ll/k360;

    .line 2
    .line 3
    iget-object v0, v0, Ll/k360;->a:Ll/qcj;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    iget-object v1, p0, Ll/k360$a;->e:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object v0, p0, Ll/k360$a;->e:Ljava/lang/Object;

    .line 12
    .line 13
    iget-boolean v2, p0, Ll/k360$a;->f:Z

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    :try_start_1
    iget-object v2, p0, Ll/k360$a;->h:Ll/k360;

    .line 18
    .line 19
    iget-object v2, v2, Ll/k360;->b:Ll/rcj;

    .line 20
    .line 21
    invoke-interface {v2, v1, v0}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/k360$a;->g:Ll/gcg0;

    .line 34
    .line 35
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-wide/16 v0, 0x1

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    iget-object p0, p0, Ll/k360$a;->g:Ll/gcg0;

    .line 47
    .line 48
    invoke-static {p1, p0, v0}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    const/4 v0, 0x1

    .line 53
    iput-boolean v0, p0, Ll/k360$a;->f:Z

    .line 54
    .line 55
    iget-object p0, p0, Ll/k360$a;->g:Ll/gcg0;

    .line 56
    .line 57
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catchall_1
    move-exception v0

    .line 62
    iget-object p0, p0, Ll/k360$a;->g:Ll/gcg0;

    .line 63
    .line 64
    invoke-static {v0, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
