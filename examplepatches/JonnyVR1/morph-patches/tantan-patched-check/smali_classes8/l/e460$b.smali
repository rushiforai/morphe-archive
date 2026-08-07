.class public final Ll/e460$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e460;
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
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final f:Z

.field public final g:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ll/gcg0;ZLjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;ZTT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e460$b;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/e460$b;->f:Z

    .line 7
    .line 8
    iput-object p3, p0, Ll/e460$b;->g:Ljava/lang/Object;

    .line 9
    .line 10
    const-wide/16 p1, 0x2

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/e460$b;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Ll/e460$b;->i:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/e460$b;->e:Ll/gcg0;

    .line 11
    .line 12
    new-instance v1, Lrx/internal/producers/SingleProducer;

    .line 13
    .line 14
    iget-object v2, p0, Ll/e460$b;->e:Ll/gcg0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/e460$b;->h:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-direct {v1, v2, p0}, Lrx/internal/producers/SingleProducer;-><init>(Ll/gcg0;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-boolean v0, p0, Ll/e460$b;->f:Z

    .line 26
    .line 27
    iget-object v1, p0, Ll/e460$b;->e:Ll/gcg0;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    new-instance v0, Lrx/internal/producers/SingleProducer;

    .line 32
    .line 33
    iget-object v2, p0, Ll/e460$b;->e:Ll/gcg0;

    .line 34
    .line 35
    iget-object p0, p0, Ll/e460$b;->g:Ljava/lang/Object;

    .line 36
    .line 37
    invoke-direct {v0, v2, p0}, Lrx/internal/producers/SingleProducer;-><init>(Ll/gcg0;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 45
    .line 46
    const-string v0, "Sequence contains no elements"

    .line 47
    .line 48
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v1, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/e460$b;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/e460$b;->e:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

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
    iget-boolean v0, p0, Ll/e460$b;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Ll/e460$b;->i:Z

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iput-boolean v1, p0, Ll/e460$b;->j:Z

    .line 12
    .line 13
    iget-object p1, p0, Ll/e460$b;->e:Ll/gcg0;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 16
    .line 17
    const-string v1, "Sequence contains too many elements"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iput-object p1, p0, Ll/e460$b;->h:Ljava/lang/Object;

    .line 30
    .line 31
    iput-boolean v1, p0, Ll/e460$b;->i:Z

    .line 32
    .line 33
    return-void
.end method
