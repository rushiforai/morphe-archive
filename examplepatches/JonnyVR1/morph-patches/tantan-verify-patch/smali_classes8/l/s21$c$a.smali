.class public Ll/s21$c$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s21$c;->g(Lrx/c;)V
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
.field public e:J

.field public final synthetic f:J

.field public final synthetic g:Lrx/internal/operators/BufferUntilSubscriber;

.field public final synthetic h:Ll/s21$c;


# direct methods
.method public constructor <init>(Ll/s21$c;JLrx/internal/operators/BufferUntilSubscriber;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s21$c$a;->h:Ll/s21$c;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/s21$c$a;->f:J

    .line 4
    .line 5
    iput-object p4, p0, Ll/s21$c$a;->g:Lrx/internal/operators/BufferUntilSubscriber;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-wide p2, p0, Ll/s21$c$a;->e:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s21$c$a;->g:Lrx/internal/operators/BufferUntilSubscriber;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/internal/operators/BufferUntilSubscriber;->onCompleted()V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Ll/s21$c$a;->e:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-lez v2, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/s21$c$a;->h:Ll/s21$c;

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Ll/s21$c;->e(J)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s21$c$a;->g:Lrx/internal/operators/BufferUntilSubscriber;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/BufferUntilSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/s21$c$a;->e:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Ll/s21$c$a;->e:J

    .line 7
    .line 8
    iget-object p0, p0, Ll/s21$c$a;->g:Lrx/internal/operators/BufferUntilSubscriber;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lrx/internal/operators/BufferUntilSubscriber;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
