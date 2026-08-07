.class public final Lrx/internal/operators/OperatorZip$Zip$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorZip$Zip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final e:Ll/urd0;

.field public final synthetic f:Lrx/internal/operators/OperatorZip$Zip;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorZip$Zip;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorZip$Zip$a;->f:Lrx/internal/operators/OperatorZip$Zip;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/urd0;->a()Ll/urd0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lrx/internal/operators/OperatorZip$Zip$a;->e:Ll/urd0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    sget v0, Ll/urd0;->g:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorZip$Zip$a;->e:Ll/urd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/urd0;->f()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$Zip$a;->f:Lrx/internal/operators/OperatorZip$Zip;

    .line 7
    .line 8
    invoke-virtual {p0}, Lrx/internal/operators/OperatorZip$Zip;->tick()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$Zip$a;->f:Lrx/internal/operators/OperatorZip$Zip;

    .line 2
    .line 3
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$Zip;->child:Ll/bb50;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorZip$Zip$a;->e:Ll/urd0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/urd0;->g(Ljava/lang/Object;)V
    :try_end_0
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :catch_0
    move-exception p1

    .line 8
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorZip$Zip$a;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    :goto_0
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$Zip$a;->f:Lrx/internal/operators/OperatorZip$Zip;

    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/internal/operators/OperatorZip$Zip;->tick()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
