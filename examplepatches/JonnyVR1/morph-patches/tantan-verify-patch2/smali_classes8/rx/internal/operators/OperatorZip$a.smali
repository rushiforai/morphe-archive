.class public final Lrx/internal/operators/OperatorZip$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorZip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "[",
        "Lrx/c;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public final f:Lrx/internal/operators/OperatorZip$Zip;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorZip$Zip<",
            "TR;>;"
        }
    .end annotation
.end field

.field public final g:Lrx/internal/operators/OperatorZip$ZipProducer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorZip$ZipProducer<",
            "TR;>;"
        }
    .end annotation
.end field

.field public h:Z

.field public final synthetic i:Lrx/internal/operators/OperatorZip;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorZip;Ll/gcg0;Lrx/internal/operators/OperatorZip$Zip;Lrx/internal/operators/OperatorZip$ZipProducer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;",
            "Lrx/internal/operators/OperatorZip$Zip<",
            "TR;>;",
            "Lrx/internal/operators/OperatorZip$ZipProducer<",
            "TR;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorZip$a;->i:Lrx/internal/operators/OperatorZip;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/operators/OperatorZip$a;->e:Ll/gcg0;

    .line 7
    .line 8
    iput-object p3, p0, Lrx/internal/operators/OperatorZip$a;->f:Lrx/internal/operators/OperatorZip$Zip;

    .line 9
    .line 10
    iput-object p4, p0, Lrx/internal/operators/OperatorZip$a;->g:Lrx/internal/operators/OperatorZip$ZipProducer;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public g([Lrx/c;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lrx/internal/operators/OperatorZip$a;->h:Z

    .line 9
    .line 10
    iget-object v0, p0, Lrx/internal/operators/OperatorZip$a;->f:Lrx/internal/operators/OperatorZip$Zip;

    .line 11
    .line 12
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$a;->g:Lrx/internal/operators/OperatorZip$ZipProducer;

    .line 13
    .line 14
    invoke-virtual {v0, p1, p0}, Lrx/internal/operators/OperatorZip$Zip;->start([Lrx/c;Ljava/util/concurrent/atomic/AtomicLong;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$a;->e:Ll/gcg0;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorZip$a;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$a;->e:Ll/gcg0;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, [Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorZip$a;->g([Lrx/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
