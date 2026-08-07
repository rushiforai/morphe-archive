.class public final Lrx/internal/operators/OperatorMerge$c;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMerge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
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


# static fields
.field public static final j:I


# instance fields
.field public final e:Lrx/internal/operators/OperatorMerge$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorMerge$d<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final f:J

.field public volatile g:Z

.field public volatile h:Ll/urd0;

.field public i:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/urd0;->g:I

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    sput v0, Lrx/internal/operators/OperatorMerge$c;->j:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lrx/internal/operators/OperatorMerge$d;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$d<",
            "TT;>;J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$c;->e:Lrx/internal/operators/OperatorMerge$d;

    .line 5
    .line 6
    iput-wide p2, p0, Lrx/internal/operators/OperatorMerge$c;->f:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    sget v0, Ll/urd0;->g:I

    .line 2
    .line 3
    iput v0, p0, Lrx/internal/operators/OperatorMerge$c;->i:I

    .line 4
    .line 5
    int-to-long v0, v0

    .line 6
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g(J)V
    .locals 1

    .line 1
    iget v0, p0, Lrx/internal/operators/OperatorMerge$c;->i:I

    .line 2
    .line 3
    long-to-int p1, p1

    .line 4
    sub-int/2addr v0, p1

    .line 5
    sget p1, Lrx/internal/operators/OperatorMerge$c;->j:I

    .line 6
    .line 7
    if-le v0, p1, :cond_0

    .line 8
    .line 9
    iput v0, p0, Lrx/internal/operators/OperatorMerge$c;->i:I

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget p1, Ll/urd0;->g:I

    .line 13
    .line 14
    iput p1, p0, Lrx/internal/operators/OperatorMerge$c;->i:I

    .line 15
    .line 16
    sub-int/2addr p1, v0

    .line 17
    if-lez p1, :cond_1

    .line 18
    .line 19
    int-to-long p1, p1

    .line 20
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/internal/operators/OperatorMerge$c;->g:Z

    .line 3
    .line 4
    iget-object p0, p0, Lrx/internal/operators/OperatorMerge$c;->e:Lrx/internal/operators/OperatorMerge$d;

    .line 5
    .line 6
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->i()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/internal/operators/OperatorMerge$c;->g:Z

    .line 3
    .line 4
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$c;->e:Lrx/internal/operators/OperatorMerge$d;

    .line 5
    .line 6
    invoke-virtual {v0}, Lrx/internal/operators/OperatorMerge$d;->o()Ljava/util/Queue;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lrx/internal/operators/OperatorMerge$c;->e:Lrx/internal/operators/OperatorMerge$d;

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->i()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$c;->e:Lrx/internal/operators/OperatorMerge$d;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lrx/internal/operators/OperatorMerge$d;->w(Lrx/internal/operators/OperatorMerge$c;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
