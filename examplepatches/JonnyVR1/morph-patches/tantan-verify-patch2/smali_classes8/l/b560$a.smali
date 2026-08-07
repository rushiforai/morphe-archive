.class public Ll/b560$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b560;->a(Ll/gcg0;)Ll/gcg0;
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
.field public e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field public final synthetic f:Ljava/util/Map;

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/b560;


# direct methods
.method public constructor <init>(Ll/b560;Ll/gcg0;Ljava/util/Map;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b560$a;->h:Ll/b560;

    .line 2
    .line 3
    iput-object p3, p0, Ll/b560$a;->f:Ljava/util/Map;

    .line 4
    .line 5
    iput-object p4, p0, Ll/b560$a;->g:Ll/gcg0;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    iput-object p3, p0, Ll/b560$a;->e:Ljava/util/Map;

    .line 11
    .line 12
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
    iget-object v0, p0, Ll/b560$a;->e:Ljava/util/Map;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Ll/b560$a;->e:Ljava/util/Map;

    .line 5
    .line 6
    iget-object v1, p0, Ll/b560$a;->g:Ll/gcg0;

    .line 7
    .line 8
    invoke-interface {v1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/b560$a;->g:Ll/gcg0;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/b560$a;->e:Ljava/util/Map;

    .line 3
    .line 4
    iget-object p0, p0, Ll/b560$a;->g:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
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
    iget-object v0, p0, Ll/b560$a;->h:Ll/b560;

    .line 2
    .line 3
    iget-object v0, v0, Ll/b560;->a:Ll/qcj;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/b560$a;->h:Ll/b560;

    .line 10
    .line 11
    iget-object v1, v1, Ll/b560;->b:Ll/qcj;

    .line 12
    .line 13
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    iget-object p0, p0, Ll/b560$a;->e:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    iget-object p0, p0, Ll/b560$a;->g:Ll/gcg0;

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
