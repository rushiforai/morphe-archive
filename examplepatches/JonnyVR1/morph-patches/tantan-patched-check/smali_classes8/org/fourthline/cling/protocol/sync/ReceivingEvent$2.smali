.class Lorg/fourthline/cling/protocol/sync/ReceivingEvent$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/protocol/sync/ReceivingEvent;->executeSync()Lorg/fourthline/cling/model/message/gena/OutgoingEventResponseMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/protocol/sync/ReceivingEvent;

.field final synthetic val$requestMessage:Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;

.field final synthetic val$subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/protocol/sync/ReceivingEvent;Lorg/fourthline/cling/model/gena/RemoteGENASubscription;Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$2;->this$0:Lorg/fourthline/cling/protocol/sync/ReceivingEvent;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$2;->val$subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$2;->val$requestMessage:Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    invoke-static {}, Lorg/fourthline/cling/protocol/sync/ReceivingEvent;->access$000()Ljava/util/logging/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Calling active subscription with event state variable values"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$2;->val$subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 11
    .line 12
    iget-object v1, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$2;->val$requestMessage:Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;

    .line 13
    .line 14
    invoke-virtual {v1}, Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;->getSequence()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$2;->val$requestMessage:Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;

    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/gena/IncomingEventRequestMessage;->getStateVariableValues()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, v1, p0}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->receive(Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/util/Collection;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
