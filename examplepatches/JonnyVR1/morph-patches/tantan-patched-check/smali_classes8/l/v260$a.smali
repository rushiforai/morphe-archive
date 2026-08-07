.class public Ll/v260$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v260;->a(Ll/gcg0;)Ll/gcg0;
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

.field public f:Z

.field public final synthetic g:Lrx/internal/producers/SingleDelayedProducer;

.field public final synthetic h:Ll/gcg0;

.field public final synthetic i:Ll/v260;


# direct methods
.method public constructor <init>(Ll/v260;Lrx/internal/producers/SingleDelayedProducer;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v260$a;->i:Ll/v260;

    .line 2
    .line 3
    iput-object p2, p0, Ll/v260$a;->g:Lrx/internal/producers/SingleDelayedProducer;

    .line 4
    .line 5
    iput-object p3, p0, Ll/v260$a;->h:Ll/gcg0;

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
    iget-boolean v0, p0, Ll/v260$a;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/v260$a;->f:Z

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/v260$a;->e:Z

    .line 9
    .line 10
    iget-object v1, p0, Ll/v260$a;->g:Lrx/internal/producers/SingleDelayedProducer;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Lrx/internal/producers/SingleDelayedProducer;->setValue(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/v260$a;->i:Ll/v260;

    .line 21
    .line 22
    iget-boolean p0, p0, Ll/v260;->b:Z

    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v1, p0}, Lrx/internal/producers/SingleDelayedProducer;->setValue(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v260$a;->h:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
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
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/v260$a;->e:Z

    .line 3
    .line 4
    :try_start_0
    iget-object v1, p0, Ll/v260$a;->i:Ll/v260;

    .line 5
    .line 6
    iget-object v1, v1, Ll/v260;->a:Ll/qcj;

    .line 7
    .line 8
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-boolean p1, p0, Ll/v260$a;->f:Z

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/v260$a;->f:Z

    .line 25
    .line 26
    iget-object p1, p0, Ll/v260$a;->g:Lrx/internal/producers/SingleDelayedProducer;

    .line 27
    .line 28
    iget-object v1, p0, Ll/v260$a;->i:Ll/v260;

    .line 29
    .line 30
    iget-boolean v1, v1, Ll/v260;->b:Z

    .line 31
    .line 32
    xor-int/2addr v0, v1

    .line 33
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Lrx/internal/producers/SingleDelayedProducer;->setValue(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    invoke-static {v0, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
