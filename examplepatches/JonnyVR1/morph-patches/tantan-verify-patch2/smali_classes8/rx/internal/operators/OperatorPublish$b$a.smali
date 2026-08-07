.class public Lrx/internal/operators/OperatorPublish$b$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorPublish$b;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/gcg0;

.field public final synthetic f:Lrx/internal/operators/OnSubscribePublishMulticast;

.field public final synthetic g:Lrx/internal/operators/OperatorPublish$b;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorPublish$b;Ll/gcg0;Lrx/internal/operators/OnSubscribePublishMulticast;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$b$a;->g:Lrx/internal/operators/OperatorPublish$b;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/operators/OperatorPublish$b$a;->e:Ll/gcg0;

    .line 4
    .line 5
    iput-object p3, p0, Lrx/internal/operators/OperatorPublish$b$a;->f:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorPublish$b$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$b$a;->f:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/internal/operators/OnSubscribePublishMulticast;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/operators/OperatorPublish$b$a;->e:Ll/gcg0;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$b$a;->f:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/internal/operators/OnSubscribePublishMulticast;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/operators/OperatorPublish$b$a;->e:Ll/gcg0;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorPublish$b$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
