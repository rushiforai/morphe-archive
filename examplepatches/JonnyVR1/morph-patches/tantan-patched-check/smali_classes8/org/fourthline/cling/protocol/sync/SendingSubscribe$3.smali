.class Lorg/fourthline/cling/protocol/sync/SendingSubscribe$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/protocol/sync/SendingSubscribe;->executeSync()Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/protocol/sync/SendingSubscribe;

.field final synthetic val$responseMessage:Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/protocol/sync/SendingSubscribe;Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe$3;->this$0:Lorg/fourthline/cling/protocol/sync/SendingSubscribe;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe$3;->val$responseMessage:Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe$3;->this$0:Lorg/fourthline/cling/protocol/sync/SendingSubscribe;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe;->subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 4
    .line 5
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingSubscribe$3;->val$responseMessage:Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getOperation()Lorg/fourthline/cling/model/message/UpnpOperation;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lorg/fourthline/cling/model/message/UpnpResponse;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->fail(Lorg/fourthline/cling/model/message/UpnpResponse;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
