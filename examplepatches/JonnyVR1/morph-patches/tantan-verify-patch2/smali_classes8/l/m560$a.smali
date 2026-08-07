.class public Ll/m560$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m560;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT1;>;"
    }
.end annotation


# instance fields
.field public e:Z

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Ljava/util/Iterator;

.field public final synthetic h:Ll/m560;


# direct methods
.method public constructor <init>(Ll/m560;Ll/gcg0;Ll/gcg0;Ljava/util/Iterator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m560$a;->h:Ll/m560;

    .line 2
    .line 3
    iput-object p3, p0, Ll/m560$a;->f:Ll/gcg0;

    .line 4
    .line 5
    iput-object p4, p0, Ll/m560$a;->g:Ljava/util/Iterator;

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
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/m560$a;->e:Z

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
    iput-boolean v0, p0, Ll/m560$a;->e:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/m560$a;->f:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/m560$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/m560$a;->e:Z

    .line 11
    .line 12
    iget-object p0, p0, Ll/m560$a;->f:Ll/gcg0;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT1;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/m560$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/m560$a;->f:Ll/gcg0;

    .line 7
    .line 8
    iget-object v1, p0, Ll/m560$a;->h:Ll/m560;

    .line 9
    .line 10
    iget-object v1, v1, Ll/m560;->b:Ll/rcj;

    .line 11
    .line 12
    iget-object v2, p0, Ll/m560$a;->g:Ljava/util/Iterator;

    .line 13
    .line 14
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v1, p1, v2}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/m560$a;->g:Ljava/util/Iterator;

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/m560$a;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    return-void

    .line 40
    :goto_1
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
