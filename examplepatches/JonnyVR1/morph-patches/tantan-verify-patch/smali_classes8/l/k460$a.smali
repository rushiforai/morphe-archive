.class public Ll/k460$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k460;->a(Ll/gcg0;)Ll/gcg0;
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

.field public f:I

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/k460;


# direct methods
.method public constructor <init>(Ll/k460;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k460$a;->h:Ll/k460;

    .line 2
    .line 3
    iput-object p3, p0, Ll/k460$a;->g:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/k460$a;->e:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k460$a;->g:Ll/gcg0;

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
    iget-object p0, p0, Ll/k460$a;->g:Ll/gcg0;

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
    iget-boolean v0, p0, Ll/k460$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/k460$a;->g:Ll/gcg0;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/k460$a;->h:Ll/k460;

    .line 12
    .line 13
    iget-object v0, v0, Ll/k460;->a:Ll/rcj;

    .line 14
    .line 15
    iget v1, p0, Ll/k460$a;->f:I

    .line 16
    .line 17
    add-int/lit8 v2, v1, 0x1

    .line 18
    .line 19
    iput v2, p0, Ll/k460$a;->f:I

    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, p1, v1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Ll/k460$a;->e:Z

    .line 39
    .line 40
    iget-object p0, p0, Ll/k460$a;->g:Ll/gcg0;

    .line 41
    .line 42
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const-wide/16 v0, 0x1

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    iget-object p0, p0, Ll/k460$a;->g:Ll/gcg0;

    .line 54
    .line 55
    invoke-static {v0, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
