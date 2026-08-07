.class public Ll/o43$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o43;->f(Ll/bb50;)V
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
.field public final synthetic e:Ljava/util/concurrent/BlockingQueue;

.field public final synthetic f:Lrx/internal/operators/NotificationLite;

.field public final synthetic g:Ll/o43;


# direct methods
.method public constructor <init>(Ll/o43;Ljava/util/concurrent/BlockingQueue;Lrx/internal/operators/NotificationLite;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o43$b;->g:Ll/o43;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o43$b;->e:Ljava/util/concurrent/BlockingQueue;

    .line 4
    .line 5
    iput-object p3, p0, Ll/o43$b;->f:Lrx/internal/operators/NotificationLite;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o43$b;->e:Ljava/util/concurrent/BlockingQueue;

    .line 2
    .line 3
    iget-object p0, p0, Ll/o43$b;->f:Lrx/internal/operators/NotificationLite;

    .line 4
    .line 5
    invoke-virtual {p0}, Lrx/internal/operators/NotificationLite;->b()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o43$b;->e:Ljava/util/concurrent/BlockingQueue;

    .line 2
    .line 3
    iget-object p0, p0, Ll/o43$b;->f:Lrx/internal/operators/NotificationLite;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/internal/operators/NotificationLite;->c(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
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
    iget-object v0, p0, Ll/o43$b;->e:Ljava/util/concurrent/BlockingQueue;

    .line 2
    .line 3
    iget-object p0, p0, Ll/o43$b;->f:Lrx/internal/operators/NotificationLite;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method
