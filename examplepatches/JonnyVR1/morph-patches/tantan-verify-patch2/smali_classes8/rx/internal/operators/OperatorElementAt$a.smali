.class public Lrx/internal/operators/OperatorElementAt$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorElementAt;->a(Ll/gcg0;)Ll/gcg0;
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

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Lrx/internal/operators/OperatorElementAt;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorElementAt;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorElementAt$a;->g:Lrx/internal/operators/OperatorElementAt;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/operators/OperatorElementAt$a;->f:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorElementAt$a;->f:Ll/gcg0;

    .line 2
    .line 3
    new-instance v0, Lrx/internal/operators/OperatorElementAt$InnerProducer;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorElementAt$InnerProducer;-><init>(Ll/vk90;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget v0, p0, Lrx/internal/operators/OperatorElementAt$a;->e:I

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorElementAt$a;->g:Lrx/internal/operators/OperatorElementAt;

    .line 4
    .line 5
    iget v2, v1, Lrx/internal/operators/OperatorElementAt;->a:I

    .line 6
    .line 7
    if-gt v0, v2, :cond_1

    .line 8
    .line 9
    iget-boolean v0, v1, Lrx/internal/operators/OperatorElementAt;->b:Z

    .line 10
    .line 11
    iget-object v2, p0, Lrx/internal/operators/OperatorElementAt$a;->f:Ll/gcg0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v1, Lrx/internal/operators/OperatorElementAt;->c:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-interface {v2, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lrx/internal/operators/OperatorElementAt$a;->f:Ll/gcg0;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    .line 27
    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lrx/internal/operators/OperatorElementAt$a;->g:Lrx/internal/operators/OperatorElementAt;

    .line 34
    .line 35
    iget p0, p0, Lrx/internal/operators/OperatorElementAt;->a:I

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p0, " is out of bounds"

    .line 41
    .line 42
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v0, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v2, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorElementAt$a;->f:Ll/gcg0;

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
    iget v0, p0, Lrx/internal/operators/OperatorElementAt$a;->e:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lrx/internal/operators/OperatorElementAt$a;->e:I

    .line 6
    .line 7
    iget-object v1, p0, Lrx/internal/operators/OperatorElementAt$a;->g:Lrx/internal/operators/OperatorElementAt;

    .line 8
    .line 9
    iget v1, v1, Lrx/internal/operators/OperatorElementAt;->a:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$a;->f:Ll/gcg0;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lrx/internal/operators/OperatorElementAt$a;->f:Ll/gcg0;

    .line 19
    .line 20
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
