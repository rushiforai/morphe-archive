.class public interface abstract Ll/vwl;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract a()Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;
.end method

.method public abstract b(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Ljava/util/List;Lrx/subjects/a;)V
    .param p2    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;",
            ">;",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract c(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)Z
    .param p3    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method
