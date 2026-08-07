.class public Ll/u460$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u460;->a(Ll/gcg0;)Ll/gcg0;
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
.field public e:I

.field public f:Z

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/u460;


# direct methods
.method public constructor <init>(Ll/u460;Ll/gcg0;ZLl/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u460$b;->h:Ll/u460;

    .line 2
    .line 3
    iput-object p4, p0, Ll/u460$b;->g:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Ll/gcg0;-><init>(Ll/gcg0;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/u460$b;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/u460$b;->g:Ll/gcg0;

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
    iget-boolean v0, p0, Ll/u460$b;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/u460$b;->g:Ll/gcg0;

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
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/u460$b;->h:Ll/u460;

    .line 3
    .line 4
    iget-object v1, v1, Ll/u460;->a:Ll/rcj;

    .line 5
    .line 6
    iget v2, p0, Ll/u460$b;->e:I

    .line 7
    .line 8
    add-int/lit8 v3, v2, 0x1

    .line 9
    .line 10
    iput v3, p0, Ll/u460$b;->e:I

    .line 11
    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v1, p1, v2}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/u460$b;->g:Ll/gcg0;

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iput-boolean v0, p0, Ll/u460$b;->f:Z

    .line 35
    .line 36
    iget-object p1, p0, Ll/u460$b;->g:Ll/gcg0;

    .line 37
    .line 38
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception v1

    .line 46
    iput-boolean v0, p0, Ll/u460$b;->f:Z

    .line 47
    .line 48
    iget-object v0, p0, Ll/u460$b;->g:Ll/gcg0;

    .line 49
    .line 50
    invoke-static {v1, v0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 54
    .line 55
    .line 56
    return-void
.end method
