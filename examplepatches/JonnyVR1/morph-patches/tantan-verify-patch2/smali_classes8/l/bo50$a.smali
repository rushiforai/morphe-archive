.class public Ll/bo50$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bo50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TU;>;"
    }
.end annotation


# instance fields
.field public e:Z

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Ll/wqe0;

.field public final synthetic h:Ll/bo50;


# direct methods
.method public constructor <init>(Ll/bo50;Ll/gcg0;Ll/wqe0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bo50$a;->h:Ll/bo50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bo50$a;->f:Ll/gcg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/bo50$a;->g:Ll/wqe0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bo50$a;->e:Z

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
    iput-boolean v0, p0, Ll/bo50$a;->e:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/bo50$a;->g:Ll/wqe0;

    .line 10
    .line 11
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bo50$a;->h:Ll/bo50;

    .line 19
    .line 20
    iget-object v0, v0, Ll/bo50;->a:Lrx/c;

    .line 21
    .line 22
    iget-object p0, p0, Ll/bo50$a;->f:Ll/gcg0;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/bo50$a;->e:Z

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
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/bo50$a;->e:Z

    .line 11
    .line 12
    iget-object p0, p0, Ll/bo50$a;->f:Ll/gcg0;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bo50$a;->onCompleted()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
