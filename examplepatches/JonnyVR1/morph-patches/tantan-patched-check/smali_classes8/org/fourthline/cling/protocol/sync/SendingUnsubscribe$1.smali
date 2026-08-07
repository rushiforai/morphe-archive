.class Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;->onUnsubscribe(Lorg/fourthline/cling/model/message/StreamResponseMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;

.field final synthetic val$response:Lorg/fourthline/cling/model/message/StreamResponseMessage;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;Lorg/fourthline/cling/model/message/StreamResponseMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->this$0:Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->val$response:Lorg/fourthline/cling/model/message/StreamResponseMessage;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->val$response:Lorg/fourthline/cling/model/message/StreamResponseMessage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;->access$000()Ljava/util/logging/Logger;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v2, "Unsubscribe failed, no response received"

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->this$0:Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;

    .line 16
    .line 17
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;->subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 18
    .line 19
    sget-object v0, Lorg/fourthline/cling/model/gena/CancelReason;->UNSUBSCRIBE_FAILED:Lorg/fourthline/cling/model/gena/CancelReason;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->end(Lorg/fourthline/cling/model/gena/CancelReason;Lorg/fourthline/cling/model/message/UpnpResponse;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getOperation()Lorg/fourthline/cling/model/message/UpnpOperation;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lorg/fourthline/cling/model/message/UpnpResponse;

    .line 30
    .line 31
    invoke-virtual {v0}, Lorg/fourthline/cling/model/message/UpnpResponse;->isFailed()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;->access$000()Ljava/util/logging/Logger;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "Unsubscribe failed, response was: "

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->val$response:Lorg/fourthline/cling/model/message/StreamResponseMessage;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->this$0:Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;

    .line 61
    .line 62
    iget-object v0, v0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;->subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 63
    .line 64
    sget-object v1, Lorg/fourthline/cling/model/gena/CancelReason;->UNSUBSCRIBE_FAILED:Lorg/fourthline/cling/model/gena/CancelReason;

    .line 65
    .line 66
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->val$response:Lorg/fourthline/cling/model/message/StreamResponseMessage;

    .line 67
    .line 68
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getOperation()Lorg/fourthline/cling/model/message/UpnpOperation;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Lorg/fourthline/cling/model/message/UpnpResponse;

    .line 73
    .line 74
    invoke-virtual {v0, v1, p0}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->end(Lorg/fourthline/cling/model/gena/CancelReason;Lorg/fourthline/cling/model/message/UpnpResponse;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    invoke-static {}, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;->access$000()Ljava/util/logging/Logger;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v2, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v3, "Unsubscribe successful, response was: "

    .line 85
    .line 86
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->val$response:Lorg/fourthline/cling/model/message/StreamResponseMessage;

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->this$0:Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;

    .line 102
    .line 103
    iget-object v0, v0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;->subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 104
    .line 105
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe$1;->val$response:Lorg/fourthline/cling/model/message/StreamResponseMessage;

    .line 106
    .line 107
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getOperation()Lorg/fourthline/cling/model/message/UpnpOperation;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Lorg/fourthline/cling/model/message/UpnpResponse;

    .line 112
    .line 113
    invoke-virtual {v0, v1, p0}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->end(Lorg/fourthline/cling/model/gena/CancelReason;Lorg/fourthline/cling/model/message/UpnpResponse;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method
