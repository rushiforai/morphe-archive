.class Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher$1;
.super Ljava/lang/ThreadLocal;
.source "Dispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Ljava/util/Queue<",
        "Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher$Event;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher;


# direct methods
.method constructor <init>(Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 81
    iput-object p1, p0, Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher$1;->this$0:Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .registers 1

    .line 81
    invoke-virtual {p0}, Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher$1;->initialValue()Ljava/util/Queue;

    move-result-object p0

    return-object p0
.end method

.method protected initialValue()Ljava/util/Queue;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue<",
            "Lcom/google/common/eventbus/Dispatcher$PerThreadQueuedDispatcher$Event;",
            ">;"
        }
    .end annotation

    .line 84
    new-instance p0, Ljava/util/ArrayDeque;

    invoke-direct {p0}, Ljava/util/ArrayDeque;-><init>()V

    return-object p0
.end method
