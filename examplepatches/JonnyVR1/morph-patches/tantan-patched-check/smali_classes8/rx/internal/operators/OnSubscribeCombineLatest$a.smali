.class public final Lrx/internal/operators/OnSubscribeCombineLatest$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OnSubscribeCombineLatest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator<",
            "TT;TR;>;"
        }
    .end annotation
.end field

.field public final f:I

.field public final g:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public h:Z


# direct methods
.method public constructor <init>(Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator<",
            "TT;TR;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->e:Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->f:I

    .line 7
    .line 8
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iput-object p2, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->g:Lrx/internal/operators/NotificationLite;

    .line 13
    .line 14
    iget p1, p1, Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;->bufferSize:I

    .line 15
    .line 16
    int-to-long p1, p1

    .line 17
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
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
    .locals 2

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->h:Z

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
    iput-boolean v0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->h:Z

    .line 8
    .line 9
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->e:Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iget p0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->f:I

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;->combine(Ljava/lang/Object;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->h:Z

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
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->e:Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;->onError(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->h:Z

    .line 16
    .line 17
    iget-object p1, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->e:Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iget p0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->f:I

    .line 21
    .line 22
    invoke-virtual {p1, v0, p0}, Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;->combine(Ljava/lang/Object;I)V

    .line 23
    .line 24
    .line 25
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
    iget-boolean v0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->e:Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;

    .line 7
    .line 8
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->g:Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget p0, p0, Lrx/internal/operators/OnSubscribeCombineLatest$a;->f:I

    .line 15
    .line 16
    invoke-virtual {v0, p1, p0}, Lrx/internal/operators/OnSubscribeCombineLatest$LatestCoordinator;->combine(Ljava/lang/Object;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
