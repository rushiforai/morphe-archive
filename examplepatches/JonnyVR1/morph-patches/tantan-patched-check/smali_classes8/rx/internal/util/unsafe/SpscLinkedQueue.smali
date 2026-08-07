.class public final Lrx/internal/util/unsafe/SpscLinkedQueue;
.super Lrx/internal/util/unsafe/BaseLinkedQueue;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/BaseLinkedQueue<",
        "TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lrx/internal/util/unsafe/BaseLinkedQueue;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lrx/internal/util/atomic/LinkedQueueNode;

    .line 5
    .line 6
    invoke-direct {v0}, Lrx/internal/util/atomic/LinkedQueueNode;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/internal/util/unsafe/BaseLinkedQueueProducerNodeRef;->spProducerNode(Lrx/internal/util/atomic/LinkedQueueNode;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lrx/internal/util/unsafe/BaseLinkedQueueProducerNodeRef;->producerNode:Lrx/internal/util/atomic/LinkedQueueNode;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/internal/util/unsafe/BaseLinkedQueueConsumerNodeRef;->spConsumerNode(Lrx/internal/util/atomic/LinkedQueueNode;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lrx/internal/util/unsafe/BaseLinkedQueueConsumerNodeRef;->consumerNode:Lrx/internal/util/atomic/LinkedQueueNode;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Lrx/internal/util/atomic/LinkedQueueNode;->soNext(Lrx/internal/util/atomic/LinkedQueueNode;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public offer(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Lrx/internal/util/atomic/LinkedQueueNode;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lrx/internal/util/atomic/LinkedQueueNode;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lrx/internal/util/unsafe/BaseLinkedQueueProducerNodeRef;->producerNode:Lrx/internal/util/atomic/LinkedQueueNode;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/internal/util/atomic/LinkedQueueNode;->soNext(Lrx/internal/util/atomic/LinkedQueueNode;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lrx/internal/util/unsafe/BaseLinkedQueueProducerNodeRef;->producerNode:Lrx/internal/util/atomic/LinkedQueueNode;

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const-string p0, "null elements not allowed"

    .line 18
    .line 19
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public peek()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lrx/internal/util/unsafe/BaseLinkedQueueConsumerNodeRef;->consumerNode:Lrx/internal/util/atomic/LinkedQueueNode;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/internal/util/atomic/LinkedQueueNode;->lvNext()Lrx/internal/util/atomic/LinkedQueueNode;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lrx/internal/util/atomic/LinkedQueueNode;->lpValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/unsafe/BaseLinkedQueueConsumerNodeRef;->consumerNode:Lrx/internal/util/atomic/LinkedQueueNode;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/internal/util/atomic/LinkedQueueNode;->lvNext()Lrx/internal/util/atomic/LinkedQueueNode;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lrx/internal/util/atomic/LinkedQueueNode;->getAndNullValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v0, p0, Lrx/internal/util/unsafe/BaseLinkedQueueConsumerNodeRef;->consumerNode:Lrx/internal/util/atomic/LinkedQueueNode;

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method
