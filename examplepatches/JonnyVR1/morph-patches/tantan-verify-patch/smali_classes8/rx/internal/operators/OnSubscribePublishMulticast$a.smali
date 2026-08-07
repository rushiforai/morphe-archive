.class public final Lrx/internal/operators/OnSubscribePublishMulticast$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OnSubscribePublishMulticast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
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


# instance fields
.field public final e:Lrx/internal/operators/OnSubscribePublishMulticast;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OnSubscribePublishMulticast<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/internal/operators/OnSubscribePublishMulticast;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OnSubscribePublishMulticast<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OnSubscribePublishMulticast$a;->e:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OnSubscribePublishMulticast$a;->e:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OnSubscribePublishMulticast;->setProducer(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OnSubscribePublishMulticast$a;->e:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/internal/operators/OnSubscribePublishMulticast;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OnSubscribePublishMulticast$a;->e:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OnSubscribePublishMulticast;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OnSubscribePublishMulticast$a;->e:Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OnSubscribePublishMulticast;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
